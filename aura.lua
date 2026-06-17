-- V14 AURA AVEC ORION LIBRARY
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "AURA SYSTEM V14",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "AuraV14"
})

local Tab = Window:MakeTab({
    Name = "Aura",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- VARIABLES
local active = false
local currentElement = "Fire"
local character, rootPart, particleEmitter, pointLight

-- CONFIG ELEMENTS
local elements = {
    Fire = {color = ColorSequence.new(Color3.fromRGB(255, 50, 0), Color3.fromRGB(255, 200, 0)), lightColor = Color3.fromRGB(255, 100, 0), rate = 200},
    Ice = {color = ColorSequence.new(Color3.fromRGB(100, 200, 255), Color3.fromRGB(255, 255, 255)), lightColor = Color3.fromRGB(100, 200, 255), rate = 150},
    Void = {color = ColorSequence.new(Color3.fromRGB(100, 0, 200), Color3.fromRGB(200, 0, 255)), lightColor = Color3.fromRGB(150, 0, 255), rate = 180},
    Gold = {color = ColorSequence.new(Color3.fromRGB(255, 215, 0), Color3.fromRGB(255, 255, 200)), lightColor = Color3.fromRGB(255, 200, 50), rate = 160}
}

-- ATTACHER EFFETS
local function attachEffects()
    character = game.Players.LocalPlayer.Character
    if not character then return end
    
    rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    if particleEmitter then particleEmitter:Destroy() end
    if pointLight then pointLight:Destroy() end
    
    pointLight = Instance.new("PointLight")
    pointLight.Range = 30
    pointLight.Brightness = 3
    pointLight.Parent = rootPart
    
    local attachment = Instance.new("Attachment")
    attachment.Parent = rootPart
    
    particleEmitter = Instance.new("ParticleEmitter")
    particleEmitter.Texture = "rbxassetid://241876428"    particleEmitter.Rate = 0
    particleEmitter.Lifetime = NumberRange.new(1, 2)
    particleEmitter.Speed = NumberRange.new(5, 10)
    particleEmitter.SpreadAngle = Vector2.new(180, 180)
    particleEmitter.Size = NumberSequence.new(3, 5)
    particleEmitter.Transparency = NumberSequence.new(0, 1)
    particleEmitter.Color = elements[currentElement].color
    particleEmitter.Rotation = NumberRange.new(0, 360)
    particleEmitter.RotSpeed = NumberRange.new(-50, 50)
    particleEmitter.Parent = attachment
    
    pointLight.Color = elements[currentElement].lightColor
end

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    attachEffects()
end)

if game.Players.LocalPlayer.Character then
    task.wait(0.5)
    attachEffects()
end

-- TOGGLE
Tab:AddToggle("ToggleAura", {
    Name = "Activer l'Aura",
    Current = false,
    Callback = function(Value)
        active = Value
        if not particleEmitter or not pointLight then
            attachEffects()
        end
        
        if active then
            particleEmitter.Rate = elements[currentElement].rate
            pointLight.Enabled = true
        else
            particleEmitter.Rate = 0
            pointLight.Enabled = false
        end
    end
})

-- SELECTEUR ELEMENT
Tab:AddDropdown("ElementDropdown", {
    Name = "Élément",
    Current = "Fire",
    Options = {"Fire", "Ice", "Void", "Gold"},
    Callback = function(Value)        currentElement = Value
        
        if particleEmitter then
            particleEmitter.Color = elements[Value].color
            if active then
                particleEmitter.Rate = elements[Value].rate
            end
        end
        
        if pointLight then
            pointLight.Color = elements[Value].lightColor
        end
    end
})

-- LABEL INFO
Tab:AddLabel("Aura visible par tous les joueurs")

OrionLib:Init()
print("=== V14 ORION READY ===")
