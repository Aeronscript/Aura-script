-- effects.lua
print("Chargement des effets...")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Attendre que l'interface soit prête
while not _G.AuraUI do
    task.wait(0.1)
end

local UI = _G.AuraUI
print("Interface trouvée")

-- Variables
local Active = false
local CurrentElement = "Fire"
local ParticleEmitter = nil
local PointLight = nil
local Character = nil
local RootPart = nil

-- Configuration des éléments
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

-- Fonction pour attacher les effets
local function AttachEffects()
    Character = player.Character    if not Character then 
        UI.StatusLabel.Text = "ERREUR: Character"
        UI.StatusLabel.TextColor3 = Color3.fromRGB(220, 53, 69)
        return 
    end
    
    RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not RootPart then 
        UI.StatusLabel.Text = "ERREUR: HRP"
        UI.StatusLabel.TextColor3 = Color3.fromRGB(220, 53, 69)
        return 
    end

    -- Nettoyer anciens effets
    if ParticleEmitter then 
        ParticleEmitter:Destroy()
        ParticleEmitter = nil
    end
    if PointLight then 
        PointLight:Destroy()
        PointLight = nil
    end

    -- Créer PointLight
    PointLight = Instance.new("PointLight")
    PointLight.Range = 30
    PointLight.Brightness = 3
    PointLight.Color = Elements[CurrentElement].LightColor
    PointLight.Enabled = Active
    PointLight.Parent = RootPart

    -- Créer Attachment
    local Attachment = Instance.new("Attachment")
    Attachment.Name = "AuraAttachment"
    Attachment.Parent = RootPart

    -- Créer ParticleEmitter
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
    ParticleEmitter.Parent = Attachment
    UI.StatusLabel.Text = "PRET - " .. CurrentElement
    UI.StatusLabel.TextColor3 = Color3.fromRGB(40, 167, 69)
    print("Effets attachés")
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

-- Fonction pour mettre à jour l'aura
local function UpdateAura()
    if not ParticleEmitter or not PointLight then return end
    
    local config = Elements[CurrentElement]
    ParticleEmitter.Color = config.Color
    PointLight.Color = config.LightColor
    
    if Active then
        ParticleEmitter.Rate = 200
    else
        ParticleEmitter.Rate = 0
    end
end

-- Bouton Toggle
UI.ToggleBtn.MouseButton1Click:Connect(function()
    if not RootPart then
        AttachEffects()
        if not RootPart then 
            UI.StatusLabel.Text = "ERREUR: Impossible d'attacher"
            UI.StatusLabel.TextColor3 = Color3.fromRGB(220, 53, 69)
            return 
        end
    end

    Active = not Active
    
    if Active then
        UI.ToggleBtn.Text = "DÉSACTIVER"
        UI.ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 167, 69) -- Vert
        UI.ToggleStroke.Color = Color3.fromRGB(40, 167, 69)
        UI.ToggleStroke.Thickness = 2        
        UpdateAura()
        PointLight.Enabled = true
        
        UI.StatusLabel.Text = "⚡ AURA ACTIVE"
        UI.StatusLabel.TextColor3 = Color3.fromRGB(40, 167, 69)
        print("Aura activée")
    else
        UI.ToggleBtn.Text = "ACTIVER L'AURA"
        UI.ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        UI.ToggleStroke.Color = Color3.fromRGB(80, 80, 90)
        UI.ToggleStroke.Thickness = 1
        
        UpdateAura()
        PointLight.Enabled = false
        
        UI.StatusLabel.Text = "AURA INACTIVE"
        UI.StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
        print("Aura désactivée")
    end
end)

-- Fonction pour changer d'élément
local function ChangeElement(Name, Btn, Stroke)
    CurrentElement = Name
    
    -- Reset tous les boutons
    UI.FireBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    UI.FireStroke.Color = Color3.fromRGB(255, 255, 255)
    UI.IceBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    UI.IceStroke.Color = Color3.fromRGB(255, 255, 255)
    UI.VoidBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    UI.VoidStroke.Color = Color3.fromRGB(255, 255, 255)
    UI.GoldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    UI.GoldStroke.Color = Color3.fromRGB(255, 255, 255)
    
    -- Activer le bouton sélectionné
    Btn.BackgroundColor3 = Elements[Name].BtnColor
    Stroke.Color = Elements[Name].BtnColor
    Stroke.Thickness = 2

    -- Mettre à jour l'aura
    UpdateAura()
    
    UI.StatusLabel.Text = "ÉLÉMENT: " .. Name
    UI.StatusLabel.TextColor3 = Elements[Name].LightColor
    print("Élément changé: " .. Name)
end

-- Connexions des boutonsUI.FireBtn.MouseButton1Click:Connect(function()
    ChangeElement("Fire", UI.FireBtn, UI.FireStroke)
end)

UI.IceBtn.MouseButton1Click:Connect(function()
    ChangeElement("Ice", UI.IceBtn, UI.IceStroke)
end)

UI.VoidBtn.MouseButton1Click:Connect(function()
    ChangeElement("Void", UI.VoidBtn, UI.VoidStroke)
end)

UI.GoldBtn.MouseButton1Click:Connect(function()
    ChangeElement("Gold", UI.GoldBtn, UI.GoldStroke)
end)

print("Système d'effets prêt !")
