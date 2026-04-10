local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LectroCFrameTracker"

local success, err = pcall(function()
    screenGui.Parent = game:GetService("CoreGui")
end)
if not success then
    screenGui.Parent = player:WaitForChild("PlayerGui")
end


local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 400, 0, 40)
textLabel.Position = UDim2.new(0.5, -200, 0, 20)  
textLabel.BackgroundTransparency = 0.3
textLabel.BackgroundColor3 = Color3.fromRGB(16, 16, 16) 
textLabel.TextColor3 = Color3.fromRGB(255, 140, 0) 
textLabel.Font = Enum.Font.Code
textLabel.TextSize = 20
textLabel.TextStrokeTransparency = 0.5 
textLabel.Parent = screenGui


local connection
connection = RunService.RenderStepped:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local cf = character.HumanoidRootPart.CFrame
        
   
        textLabel.Text = string.format("CFrame Pos: X: %.1f | Y: %.1f | Z: %.1f", cf.X, cf.Y, cf.Z)
    else
        textLabel.Text = "CFrame: Ожидание персонажа..."
    end
end)

print("Трассер CFrame запущен!")
