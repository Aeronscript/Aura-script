-- effects.lua
print("Chargement des effets...")

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- On attend que l'interface soit prête
while not _G.AuraUI do
    task.wait(0.1)
end

local UI = _G.AuraUI

-- Variables
local Active = false
local CurrentElement = "Fire"
local ParticleEmitter, PointLight = nil, nil

-- Configuration des éléments
local Elements = {
    Fire = {Color = ColorSequence.new(Color3.fromRGB(255, 50, 0), Color3.fromRGB(255, 200, 0)), LightColor = Color3.fromRGB(255, 100, 0), Rate = 200},
    Ice = {Color = ColorSequence.new(Color3.fromRGB(100, 200, 255), Color3.fromRGB(255, 255, 255)), LightColor = Color3.fromRGB(100, 200, 255), Rate = 150},
    Void = {Color = ColorSequence.new(Color3.fromRGB(100, 0, 200), Color3.fromRGB(200, 0, 255)), LightColor = Color3.fromRGB(150, 0, 255), Rate = 180},
    Gold = {Color = ColorSequence.new(Color3.fromRGB(255, 215, 0), Color3.fromRGB(255, 255, 200)), LightColor = Color3.fromRGB(255, 200, 50), Rate = 160}
}

-- Fonction pour attacher les effets au personnage
local function AttachEffects()
    local Character = player.Character
    if not Character then return end
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not RootPart then return end

    -- Nettoyer les anciens effets
    if ParticleEmitter then ParticleEmitter:Destroy() end
    if PointLight then PointLight:Destroy() end

    -- Créer la lumière
    PointLight = Instance.new("PointLight")
    PointLight.Range = 30
    PointLight.Brightness = 3
    PointLight.Color = Elements[CurrentElement].LightColor
    PointLight.Enabled = Active
    PointLight.Parent = RootPart

    -- Créer les particules
    local Attachment = Instance.new("Attachment")
    Attachment.Parent = RootPart

    ParticleEmitter = Instance.new("ParticleEmitter")    ParticleEmitter.Texture = "rbxassetid://241876428"
    ParticleEmitter.Rate = Active and Elements[CurrentElement].Rate or 0
    ParticleEmitter.Lifetime = NumberRange.new(1, 2)
    ParticleEmitter.Speed = NumberRange.new(5, 10)
    ParticleEmitter.SpreadAngle = Vector2.new(180, 180)
    ParticleEmitter.Size = NumberSequence.new(3, 5)
    ParticleEmitter.Transparency = NumberSequence.new(0, 1)
    ParticleEmitter.Color = Elements[CurrentElement].Color
    ParticleEmitter.Rotation = NumberRange.new(0, 360)
    ParticleEmitter.RotSpeed = NumberRange.new(-50, 50)
    ParticleEmitter.Parent = Attachment

    UI.StatusLabel.Text = "PRET - " .. CurrentElement
end

-- Gérer le respawn
player.CharacterAdded:Connect(function()
    task.wait(1)
    AttachEffects()
end)

-- Attacher au personnage actuel
if player.Character then
    task.wait(0.5)
    AttachEffects()
end

-- Logique du bouton Toggle
UI.ToggleBtn.MouseButton1Click:Connect(function()
    if not ParticleEmitter then
        AttachEffects()
        if not ParticleEmitter then return end
    end

    Active = not Active
    if Active then
        UI.ToggleBtn.Text = "DÉSACTIVER"
        UI.ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
        UI.ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        ParticleEmitter.Rate = Elements[CurrentElement].Rate
        PointLight.Enabled = true
        UI.StatusLabel.Text = "⚡ ACTIVE - " .. CurrentElement
    else
        UI.ToggleBtn.Text = "ACTIVER"
        UI.ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        UI.ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
        ParticleEmitter.Rate = 0
        PointLight.Enabled = false
        UI.StatusLabel.Text = "INACTIVE"
    endend)

-- Logique pour changer d'élément
local function ChangeElement(Name, Btn)
    CurrentElement = Name
    
    -- Reset couleurs
    UI.FireBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    UI.IceBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    UI.VoidBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    UI.GoldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    
    -- Activer la couleur du bouton choisi
    Btn.BackgroundColor3 = Elements[Name].LightColor

    if ParticleEmitter then
        ParticleEmitter.Color = Elements[Name].Color
        if Active then ParticleEmitter.Rate = Elements[Name].Rate end
    end
    if PointLight then PointLight.Color = Elements[Name].LightColor end
    
    UI.StatusLabel.Text = (Active and " ACTIVE" or "INACTIVE") .. " - " .. Name
end

UI.FireBtn.MouseButton1Click:Connect(function() ChangeElement("Fire", UI.FireBtn) end)
UI.IceBtn.MouseButton1Click:Connect(function() ChangeElement("Ice", UI.IceBtn) end)
UI.VoidBtn.MouseButton1Click:Connect(function() ChangeElement("Void", UI.VoidBtn) end)
UI.GoldBtn.MouseButton1Click:Connect(function() ChangeElement("Gold", UI.GoldBtn) end)

print("Effets chargés avec succès !")
