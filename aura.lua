-- V11.2 ULTRA STABLE
print("START V11.2")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
if not player then return end

print("Player OK")

-- INTERFACE IMMEDIATE
local ui = Instance.new("ScreenGui")
ui.Name = "AuraV11"
ui.ResetOnSpawn = false
ui.Parent = player:WaitForChild("PlayerGui")

print("GUI OK")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 250, 0, 200)
main.Position = UDim2.new(1, -270, 0, 20)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
main.Parent = ui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

print("Frame OK")

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 35)
header.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
header.Parent = main

Instance.new("UICorner", header).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "AURA V11"
title.TextColor3 = Color3.fromRGB(0, 255, 200)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.Parent = header

print("Header OK")
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.9, 0, 0, 40)
toggleBtn.Position = UDim2.new(0.05, 0, 0, 50)
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
toggleBtn.Text = "ACTIVER"
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 14
toggleBtn.Parent = main

Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)

print("Button OK")

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 1, -20)
status.BackgroundTransparency = 1
status.Text = "PRET"
status.TextColor3 = Color3.fromRGB(0, 255, 100)
status.Font = Enum.Font.GothamBold
status.TextSize = 10
status.Parent = main

print("Status OK")

-- VARIABLES
local active = false
local character, rootPart

-- EFFETS
local light, particles = {}, {}

local function attachEffects(char)
    if not char then return end
    rootPart = char:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    character = char
    print("Character OK")
    
    -- Nettoyer
    for _, p in pairs(particles) do p:Destroy() end
    particles = {}
    if light then light:Destroy() end
    
    -- Créer
    light = Instance.new("PointLight")
    light.Range = 25
    light.Brightness = 2    light.Color = Color3.fromRGB(255, 100, 0)
    light.Parent = rootPart
    
    local att = Instance.new("Attachment")
    att.Parent = rootPart
    
    local pe = Instance.new("ParticleEmitter")
    pe.Texture = "rbxassetid://241876428"
    pe.Rate = 0
    pe.Lifetime = NumberRange.new(1, 2)
    pe.Speed = NumberRange.new(5, 10)
    pe.SpreadAngle = Vector2.new(180, 180)
    pe.Size = NumberSequence.new(3, 5)
    pe.Transparency = NumberSequence.new(0, 1)
    pe.Color = ColorSequence.new(Color3.fromRGB(255, 50, 0), Color3.fromRGB(255, 200, 0))
    pe.Parent = att
    
    table.insert(particles, pe)
    
    status.Text = "EFFETS PRETS"
    print("Effects OK")
end

-- CONNEXION
local function onChar(char)
    task.wait(0.5)
    attachEffects(char)
end

player.CharacterAdded:Connect(onChar)
if player.Character then onChar(player.Character) end

-- TOGGLE
toggleBtn.MouseButton1Click:Connect(function()
    active = not active
    
    if active then
        toggleBtn.Text = "DESACTIVER"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        for _, p in pairs(particles) do p.Rate = 150 end
        if light then light.Enabled = true end
        status.Text = "ACTIVE"
    else
        toggleBtn.Text = "ACTIVER"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        for _, p in pairs(particles) do p.Rate = 0 end
        if light then light.Enabled = false end
        status.Text = "INACTIVE"
    end
end)
print("V11.2 READY")
