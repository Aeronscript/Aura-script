
-- V12 AURA COMPLETE - 4 ELEMENTS + MINIMIZE
print("=== START V12 ===")

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
if not player then return end
print("1. Player OK")

-- GUI
local ui = Instance.new("ScreenGui")
ui.Name = "AuraV12"
ui.ResetOnSpawn = false
ui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 250, 0, 220)
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
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "AURA V12"
title.TextColor3 = Color3.fromRGB(0, 255, 200)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.Parent = header

-- BOUTON MINIMIZE
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 35, 0, 35)
minBtn.Position = UDim2.new(1, -40, 0, 0)
minBtn.BackgroundTransparency = 1
minBtn.Text = "-"
minBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 18
minBtn.Parent = header

print("2. GUI OK")
-- BOUTON TOGGLE
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.9, 0, 0, 40)
toggleBtn.Position = UDim2.new(0.05, 0, 0, 45)
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
toggleBtn.Text = "ACTIVER"
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 14
toggleBtn.Parent = main
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)

-- BOUTONS ELEMENTS
local fireBtn = Instance.new("TextButton")
fireBtn.Size = UDim2.new(0.22, 0, 0, 35)
fireBtn.Position = UDim2.new(0.05, 0, 0, 95)
fireBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 0)
fireBtn.Text = "FEU"
fireBtn.TextColor3 = Color3.new(1, 1, 1)
fireBtn.Font = Enum.Font.GothamBold
fireBtn.TextSize = 11
fireBtn.Parent = main
Instance.new("UICorner", fireBtn).CornerRadius = UDim.new(0, 6)

local iceBtn = Instance.new("TextButton")
iceBtn.Size = UDim2.new(0.22, 0, 0, 35)
iceBtn.Position = UDim2.new(0.29, 0, 0, 95)
iceBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
iceBtn.Text = "GLACE"
iceBtn.TextColor3 = Color3.new(1, 1, 1)
iceBtn.Font = Enum.Font.GothamBold
iceBtn.TextSize = 11
iceBtn.Parent = main
Instance.new("UICorner", iceBtn).CornerRadius = UDim.new(0, 6)

local voidBtn = Instance.new("TextButton")
voidBtn.Size = UDim2.new(0.22, 0, 0, 35)
voidBtn.Position = UDim2.new(0.53, 0, 0, 95)
voidBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
voidBtn.Text = "VIDE"
voidBtn.TextColor3 = Color3.new(1, 1, 1)
voidBtn.Font = Enum.Font.GothamBold
voidBtn.TextSize = 11
voidBtn.Parent = main
Instance.new("UICorner", voidBtn).CornerRadius = UDim.new(0, 6)

local goldBtn = Instance.new("TextButton")
goldBtn.Size = UDim2.new(0.22, 0, 0, 35)
goldBtn.Position = UDim2.new(0.77, 0, 0, 95)goldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
goldBtn.Text = "OR"
goldBtn.TextColor3 = Color3.new(1, 1, 1)
goldBtn.Font = Enum.Font.GothamBold
goldBtn.TextSize = 11
goldBtn.Parent = main
Instance.new("UICorner", goldBtn).CornerRadius = UDim.new(0, 6)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 1, -20)
status.BackgroundTransparency = 1
status.Text = "CHARGEMENT..."
status.TextColor3 = Color3.fromRGB(255, 200, 0)
status.Font = Enum.Font.GothamBold
status.TextSize = 10
status.Parent = main

print("3. Interface complète")

-- VARIABLES
local active = false
local currentElement = "Fire"
local minimized = false
local character, rootPart
local particleEmitter, pointLight

-- CONFIGURATIONS ELEMENTS
local elements = {
    Fire = {
        color = ColorSequence.new(Color3.fromRGB(255, 50, 0), Color3.fromRGB(255, 200, 0)),
        lightColor = Color3.fromRGB(255, 100, 0),
        rate = 200
    },
    Ice = {
        color = ColorSequence.new(Color3.fromRGB(100, 200, 255), Color3.fromRGB(255, 255, 255)),
        lightColor = Color3.fromRGB(100, 200, 255),
        rate = 150
    },
    Void = {
        color = ColorSequence.new(Color3.fromRGB(100, 0, 200), Color3.fromRGB(200, 0, 255)),
        lightColor = Color3.fromRGB(150, 0, 255),
        rate = 180
    },
    Gold = {
        color = ColorSequence.new(Color3.fromRGB(255, 215, 0), Color3.fromRGB(255, 255, 200)),
        lightColor = Color3.fromRGB(255, 200, 50),
        rate = 160
    }
}
-- FONCTION ATTACHER EFFETS
local function attachEffects()
    character = player.Character
    if not character then
        status.Text = "ERREUR: Pas de character"
        status.TextColor3 = Color3.fromRGB(255, 0, 0)
        return false
    end
    
    rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        status.Text = "ERREUR: Pas de HumanoidRootPart"
        status.TextColor3 = Color3.fromRGB(255, 0, 0)
        return false
    end
    
    -- Nettoyer
    if particleEmitter then particleEmitter:Destroy() end
    if pointLight then pointLight:Destroy() end
    
    -- Lumière
    pointLight = Instance.new("PointLight")
    pointLight.Range = 30
    pointLight.Brightness = 3
    pointLight.Color = elements[currentElement].lightColor
    pointLight.Enabled = active
    pointLight.Parent = rootPart
    
    -- Attachment
    local attachment = Instance.new("Attachment")
    attachment.Name = "AuraAttachment"
    attachment.Parent = rootPart
    
    -- Particules
    particleEmitter = Instance.new("ParticleEmitter")
    particleEmitter.Texture = "rbxassetid://241876428"
    particleEmitter.Rate = active and elements[currentElement].rate or 0
    particleEmitter.Lifetime = NumberRange.new(1, 2)
    particleEmitter.Speed = NumberRange.new(5, 10)
    particleEmitter.SpreadAngle = Vector2.new(180, 180)
    particleEmitter.Size = NumberSequence.new(3, 5)
    particleEmitter.Transparency = NumberSequence.new(0, 1)
    particleEmitter.Color = elements[currentElement].color
    particleEmitter.Rotation = NumberRange.new(0, 360)
    particleEmitter.RotSpeed = NumberRange.new(-50, 50)
    particleEmitter.Parent = attachment
    
    status.Text = "PRET - " .. currentElement
    status.TextColor3 = Color3.fromRGB(0, 255, 100)    print("Effets attachés à " .. rootPart.Name)
    return true
end

-- RESPAWN HANDLER
local function onCharacterAdded(char)
    task.wait(1)
    attachEffects()
end

player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
    task.wait(0.5)
    attachEffects()
end

-- MINIMIZE
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(main, TweenInfo.new(0.3), {Size = UDim2.new(0, 250, 0, 35)}):Play()
        minBtn.Text = "+"
    else
        TweenService:Create(main, TweenInfo.new(0.3), {Size = UDim2.new(0, 250, 0, 220)}):Play()
        minBtn.Text = "-"
    end
end)

-- TOGGLE
toggleBtn.MouseButton1Click:Connect(function()
    if not particleEmitter or not pointLight then
        status.Text = "ERREUR: Effets non attachés"
        status.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end
    
    active = not active
    
    if active then
        toggleBtn.Text = "DESACTIVER"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        particleEmitter.Rate = elements[currentElement].rate
        pointLight.Enabled = true
        status.Text = "ACTIVE - " .. currentElement
    else
        toggleBtn.Text = "ACTIVER"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        particleEmitter.Rate = 0
        pointLight.Enabled = false
        status.Text = "INACTIVE"    end
end)

-- FONCTION CHANGER ELEMENT
local function changeElement(elementName)
    currentElement = elementName
    
    -- Reset couleurs boutons
    fireBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    iceBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    voidBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    goldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    
    -- Activer bouton sélectionné
    if elementName == "Fire" then
        fireBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 0)
    elseif elementName == "Ice" then
        iceBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    elseif elementName == "Void" then
        voidBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
    elseif elementName == "Gold" then
        goldBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    end
    
    -- Appliquer aux effets
    if particleEmitter then
        particleEmitter.Color = elements[elementName].color
        if active then
            particleEmitter.Rate = elements[elementName].rate
        end
    end
    
    if pointLight then
        pointLight.Color = elements[elementName].lightColor
    end
    
    status.Text = (active and "ACTIVE" or "INACTIVE") .. " - " .. elementName
end

-- CONNEXIONS BOUTONS
fireBtn.MouseButton1Click:Connect(function() changeElement("Fire") end)
iceBtn.MouseButton1Click:Connect(function() changeElement("Ice") end)
voidBtn.MouseButton1Click:Connect(function() changeElement("Void") end)
goldBtn.MouseButton1Click:Connect(function() changeElement("Gold") end)

print("=== V12 READY ===")
