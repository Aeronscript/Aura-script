
-- V11.3 DEBUG COMPLET
print("=== START V11.3 ===")

local Players = game:GetService("Players")
local player = Players.LocalPlayer
if not player then print("ERREUR: Pas de player"); return end
print("1. Player OK: " .. player.Name)

-- GUI
local ui = Instance.new("ScreenGui")
ui.Name = "AuraV11"
ui.ResetOnSpawn = false
ui.Parent = player:WaitForChild("PlayerGui")
print("2. GUI créé")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 250, 0, 150)
main.Position = UDim2.new(1, -270, 0, 20)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
main.Parent = ui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 35)
header.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
header.Parent = main
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "AURA V11.3"
title.TextColor3 = Color3.fromRGB(0, 255, 200)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.Parent = header

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

local status = Instance.new("TextLabel")status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 1, -20)
status.BackgroundTransparency = 1
status.Text = "ATTENTE PERSONNAGE..."
status.TextColor3 = Color3.fromRGB(255, 200, 0)
status.Font = Enum.Font.GothamBold
status.TextSize = 10
status.Parent = main

print("3. Interface complète")

-- VARIABLES
local active = false
local character, rootPart
local particleEmitter, pointLight

-- FONCTION CRITIQUE: ATTACHER LES EFFETS
local function attachEffects()
    print("4. Tentative d'attachement...")
    
    character = player.Character
    if not character then
        status.Text = "ERREUR: Pas de character"
        status.TextColor3 = Color3.fromRGB(255, 0, 0)
        print("ERREUR: character = nil")
        return false
    end
    print("4.1 Character trouvé")
    
    rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        status.Text = "ERREUR: Pas de HumanoidRootPart"
        status.TextColor3 = Color3.fromRGB(255, 0, 0)
        print("ERREUR: HumanoidRootPart = nil")
        return false
    end
    print("4.2 HumanoidRootPart trouvé: " .. rootPart.Name)
    
    -- Nettoyer anciens effets
    if particleEmitter then particleEmitter:Destroy() end
    if pointLight then pointLight:Destroy() end
    
    -- CRÉER LA LUMIÈRE
    pointLight = Instance.new("PointLight")
    pointLight.Range = 30
    pointLight.Brightness = 3
    pointLight.Color = Color3.fromRGB(255, 100, 0)
    pointLight.Enabled = false
    pointLight.Parent = rootPart
    print("4.3 PointLight créé et attaché à " .. rootPart.Name)    
    -- CRÉER L'ATTACHMENT
    local attachment = Instance.new("Attachment")
    attachment.Name = "AuraAttachment"
    attachment.Parent = rootPart
    print("4.4 Attachment créé")
    
    -- CRÉER LES PARTICULES
    particleEmitter = Instance.new("ParticleEmitter")
    particleEmitter.Texture = "rbxassetid://241876428"
    particleEmitter.Rate = 0 -- Désactivé au début
    particleEmitter.Lifetime = NumberRange.new(1, 2)
    particleEmitter.Speed = NumberRange.new(5, 10)
    particleEmitter.SpreadAngle = Vector2.new(180, 180)
    particleEmitter.Size = NumberSequence.new(3, 5)
    particleEmitter.Transparency = NumberSequence.new(0, 1)
    particleEmitter.Color = ColorSequence.new(Color3.fromRGB(255, 50, 0), Color3.fromRGB(255, 200, 0))
    particleEmitter.Rotation = NumberRange.new(0, 360)
    particleEmitter.RotSpeed = NumberRange.new(-50, 50)
    particleEmitter.Parent = attachment
    print("4.5 ParticleEmitter créé")
    
    status.Text = "EFFETS ATTACHES ✓"
    status.TextColor3 = Color3.fromRGB(0, 255, 100)
    print("5. EFFETS ATTACHÉS AVEC SUCCÈS!")
    return true
end

-- CONNEXION AU PERSONNAGE
local function onCharacterAdded(char)
    print("Personnage détecté, attente...")
    task.wait(1) -- Attendre que tout soit chargé
    attachEffects()
end

player.CharacterAdded:Connect(onCharacterAdded)

-- Si le personnage est déjà là
if player.Character then
    print("Personnage déjà présent")
    task.wait(0.5)
    attachEffects()
else
    print("En attente du personnage...")
end

-- BOUTON ACTIVER
toggleBtn.MouseButton1Click:Connect(function()
    print("Bouton cliqué!")
        if not particleEmitter or not pointLight then
        status.Text = "ERREUR: Effets non attachés"
        status.TextColor3 = Color3.fromRGB(255, 0, 0)
        print("ERREUR: particleEmitter ou pointLight = nil")
        return
    end
    
    active = not active
    
    if active then
        print("Activation...")
        toggleBtn.Text = "DESACTIVER"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        
        particleEmitter.Rate = 200
        pointLight.Enabled = true
        
        status.Text = "ACTIVE ✓"
        status.TextColor3 = Color3.fromRGB(0, 255, 100)
        print("AURA ACTIVÉE!")
    else
        print("Désactivation...")
        toggleBtn.Text = "ACTIVER"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        
        particleEmitter.Rate = 0
        pointLight.Enabled = false
        
        status.Text = "INACTIVE"
        status.TextColor3 = Color3.fromRGB(255, 200, 0)
        print("AURA DÉSACTIVÉE")
    end
end)

print("=== V11.3 READY ===")
