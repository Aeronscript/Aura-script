-- effects.lua - VERSION CORRIGEE
print("=== EFFECTS LOADING ===")

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Attendre le GUI
repeat task.wait() until _G.AuraGUI
local GUI = _G.AuraGUI

print("GUI trouvé")

-- Variables
local Active = false
local CurrentElement = "Fire"
local ParticleEmitter = nil
local PointLight = nil

-- Config
local Elements = {
    Fire = {
        Color = ColorSequence.new(Color3.fromRGB(255, 50, 0), Color3.fromRGB(255, 200, 0)),
        LightColor = Color3.fromRGB(255, 100, 0),
        BtnColor = Color3.fromRGB(220, 53, 69)
    },
    Ice = {
        Color = ColorSequence.new(Color3.fromRGB(100, 200, 255), Color3.fromRGB(255, 255, 255)),
        LightColor = Color3.fromRGB(100, 200, 255),
        BtnColor = Color3.fromRGB(23, 162, 184)
    },
    Void = {
        Color = ColorSequence.new(Color3.fromRGB(100, 0, 200), Color3.fromRGB(200, 0, 255)),
        LightColor = Color3.fromRGB(150, 0, 255),
        BtnColor = Color3.fromRGB(138, 43, 226)
    },
    Gold = {
        Color = ColorSequence.new(Color3.fromRGB(255, 215, 0), Color3.fromRGB(255, 255, 200)),
        LightColor = Color3.fromRGB(255, 200, 50),
        BtnColor = Color3.fromRGB(255, 193, 7)
    }
}

-- Attach Effects
local function AttachEffects()
    local char = player.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    -- Cleanup
    if ParticleEmitter then ParticleEmitter:Destroy() end
    if PointLight then PointLight:Destroy() end
    
    -- Light
    PointLight = Instance.new("PointLight")
    PointLight.Range = 30
    PointLight.Brightness = 3
    PointLight.Color = Elements[CurrentElement].LightColor
    PointLight.Enabled = Active
    PointLight.Parent = hrp
    
    -- Particles
    local att = Instance.new("Attachment")
    att.Parent = hrp
    
    ParticleEmitter = Instance.new("ParticleEmitter")
    ParticleEmitter.Texture = "rbxassetid://241876428"
    ParticleEmitter.Rate = Active and 200 or 0
    ParticleEmitter.Lifetime = NumberRange.new(1, 2)
    ParticleEmitter.Speed = NumberRange.new(5, 10)
    ParticleEmitter.SpreadAngle = Vector2.new(180, 180)
    ParticleEmitter.Size = NumberSequence.new(3, 5)
    ParticleEmitter.Transparency = NumberSequence.new(0, 1)
    ParticleEmitter.Color = Elements[CurrentElement].Color
    ParticleEmitter.Rotation = NumberRange.new(0, 360)
    ParticleEmitter.RotSpeed = NumberRange.new(-50, 50)
    ParticleEmitter.Parent = att
    
    GUI.StatusLabel.Text = "PRET - " .. CurrentElement
    print("Effets attachés")
end

-- Character events
player.CharacterAdded:Connect(function()
    task.wait(1)
    AttachEffects()
end)

if player.Character then
    task.wait(0.5)
    AttachEffects()
end

-- Toggle
GUI.ToggleBtn.MouseButton1Click:Connect(function()
    if not player.Character:FindFirstChild("HumanoidRootPart") then
        AttachEffects()
    end
    
    Active = not Active
    
    if Active then
        GUI.ToggleBtn.Text = "DESACTIVER"
        GUI.ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 167, 69)
        GUI.StatusLabel.Text = "ACTIVE"
        
        if ParticleEmitter then
            ParticleEmitter.Rate = 200
        end
        if PointLight then
            PointLight.Enabled = true
        end
    else
        GUI.ToggleBtn.Text = "ACTIVER"
        GUI.ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        GUI.StatusLabel.Text = "INACTIVE"
        
        if ParticleEmitter then
            ParticleEmitter.Rate = 0
        end
        if PointLight then
            PointLight.Enabled = false
        end
    end
end)

-- Change Element
local function ChangeElement(name, btn)
    CurrentElement = name
    
    -- Reset buttons
    GUI.FireBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    GUI.IceBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    GUI.VoidBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    GUI.GoldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    
    -- Highlight selected
    btn.BackgroundColor3 = Elements[name].BtnColor
    
    -- Update effects
    if ParticleEmitter then
        ParticleEmitter.Color = Elements[name].Color
        if Active then ParticleEmitter.Rate = 200 end
    end
    if PointLight then
        PointLight.Color = Elements[name].LightColor
    end
    
    GUI.StatusLabel.Text = name
end

GUI.FireBtn.MouseButton1Click:Connect(function() ChangeElement("Fire", GUI.FireBtn) end)
GUI.IceBtn.MouseButton1Click:Connect(function() ChangeElement("Ice", GUI.IceBtn) end)
GUI.VoidBtn.MouseButton1Click:Connect(function() ChangeElement("Void", GUI.VoidBtn) end)
GUI.GoldBtn.MouseButton1Click:Connect(function() ChangeElement("Gold", GUI.GoldBtn) end)

print("=== EFFECTS LOADED ===")
