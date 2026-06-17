    
-- V16 AURA COMPLETE - DRAG + CLOSE + MINIMIZE + 4 ELEMENTS
print("=== V16 START ===")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
print("Player: " .. player.Name)

-- GUI IMMEDIATEMENT
local ui = Instance.new("ScreenGui")
ui.Name = "AuraV16"
ui.ResetOnSpawn = false
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ui.IgnoreGuiInset = true
ui.DisplayOrder = 999999
ui.Parent = player:WaitForChild("PlayerGui")
print("UI créée")

-- BOUTON REOPEN (caché au début)
local reopenBtn = Instance.new("TextButton")
reopenBtn.Size = UDim2.new(0, 50, 0, 50)
reopenBtn.Position = UDim2.new(0, 20, 0, 20)
reopenBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
reopenBtn.Text = "⚡"
reopenBtn.TextColor3 = Color3.new(0, 0, 0)
reopenBtn.Font = Enum.Font.GothamBold
reopenBtn.TextSize = 24
reopenBtn.Visible = false
reopenBtn.Parent = ui
Instance.new("UICorner", reopenBtn).CornerRadius = UDim.new(1, 0)

-- MENU PRINCIPAL
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 280, 0, 250)
main.Position = UDim2.new(0, 20, 0, 80)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
main.BackgroundTransparency = 0.1
main.BorderSizePixel = 0
main.Parent = ui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(0, 255, 200)
mainStroke.Thickness = 2
mainStroke.Transparency = 0.3
mainStroke.Parent = main
print("Menu créé")
-- HEADER
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
header.BorderSizePixel = 0
header.Parent = main
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -90, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = " AURA V16"
title.TextColor3 = Color3.fromRGB(0, 255, 200)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- BOUTON CLOSE (X)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -40, 0, 2)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.Text = ""
closeBtn.Parent = header
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)

local xLabel = Instance.new("TextLabel")
xLabel.Size = UDim2.new(1, 0, 1, 0)
xLabel.BackgroundTransparency = 1
xLabel.Text = "X"
xLabel.TextColor3 = Color3.new(1, 1, 1)
xLabel.Font = Enum.Font.GothamBold
xLabel.TextSize = 18
xLabel.Parent = closeBtn

-- BOUTON MINIMIZE
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 35, 0, 35)
minBtn.Position = UDim2.new(1, -80, 0, 2)
minBtn.BackgroundTransparency = 1
minBtn.Text = "−"
minBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 20
minBtn.Parent = header

print("Header créé")
-- CONTENU
local content = Instance.new("Frame")
content.Size = UDim2.new(1, 0, 1, -40)
content.Position = UDim2.new(0, 0, 0, 40)
content.BackgroundTransparency = 1
content.Parent = main

-- BOUTON TOGGLE
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.9, 0, 0, 45)
toggleBtn.Position = UDim2.new(0.05, 0, 0, 10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
toggleBtn.Text = "ACTIVER L'AURA"
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 14
toggleBtn.Parent = content
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)

-- BOUTONS ELEMENTS
local fireBtn = Instance.new("TextButton")
fireBtn.Size = UDim2.new(0.22, 0, 0, 40)
fireBtn.Position = UDim2.new(0.05, 0, 0, 65)
fireBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 0)
fireBtn.Text = "FEU"
fireBtn.TextColor3 = Color3.new(1, 1, 1)
fireBtn.Font = Enum.Font.GothamBold
fireBtn.TextSize = 12
fireBtn.Parent = content
Instance.new("UICorner", fireBtn).CornerRadius = UDim.new(0, 6)

local iceBtn = Instance.new("TextButton")
iceBtn.Size = UDim2.new(0.22, 0, 0, 40)
iceBtn.Position = UDim2.new(0.29, 0, 0, 65)
iceBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
iceBtn.Text = "GLACE"
iceBtn.TextColor3 = Color3.new(1, 1, 1)
iceBtn.Font = Enum.Font.GothamBold
iceBtn.TextSize = 12
iceBtn.Parent = content
Instance.new("UICorner", iceBtn).CornerRadius = UDim.new(0, 6)

local voidBtn = Instance.new("TextButton")
voidBtn.Size = UDim2.new(0.22, 0, 0, 40)
voidBtn.Position = UDim2.new(0.53, 0, 0, 65)
voidBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
voidBtn.Text = "VIDE"
voidBtn.TextColor3 = Color3.new(1, 1, 1)
voidBtn.Font = Enum.Font.GothamBoldvoidBtn.TextSize = 12
voidBtn.Parent = content
Instance.new("UICorner", voidBtn).CornerRadius = UDim.new(0, 6)

local goldBtn = Instance.new("TextButton")
goldBtn.Size = UDim2.new(0.22, 0, 0, 40)
goldBtn.Position = UDim2.new(0.77, 0, 0, 65)
goldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
goldBtn.Text = "OR"
goldBtn.TextColor3 = Color3.new(1, 1, 1)
goldBtn.Font = Enum.Font.GothamBold
goldBtn.TextSize = 12
goldBtn.Parent = content
Instance.new("UICorner", goldBtn).CornerRadius = UDim.new(0, 6)

-- STATUS
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 25)
status.Position = UDim2.new(0, 0, 1, -25)
status.BackgroundTransparency = 1
status.Text = "CHARGEMENT..."
status.TextColor3 = Color3.fromRGB(255, 200, 0)
status.Font = Enum.Font.GothamBold
status.TextSize = 11
status.Parent = main

print("Boutons créés")

-- VARIABLES
local active = false
local currentElement = "Fire"
local minimized = false
local character, rootPart
local particleEmitter, pointLight

-- CONFIG ELEMENTS
local elements = {
    Fire = {color = ColorSequence.new(Color3.fromRGB(255, 50, 0), Color3.fromRGB(255, 200, 0)), lightColor = Color3.fromRGB(255, 100, 0), rate = 200},
    Ice = {color = ColorSequence.new(Color3.fromRGB(100, 200, 255), Color3.fromRGB(255, 255, 255)), lightColor = Color3.fromRGB(100, 200, 255), rate = 150},
    Void = {color = ColorSequence.new(Color3.fromRGB(100, 0, 200), Color3.fromRGB(200, 0, 255)), lightColor = Color3.fromRGB(150, 0, 255), rate = 180},
    Gold = {color = ColorSequence.new(Color3.fromRGB(255, 215, 0), Color3.fromRGB(255, 255, 200)), lightColor = Color3.fromRGB(255, 200, 50), rate = 160}
}

-- ATTACHER EFFETS
local function attachEffects()
    character = player.Character
    if not character then 
        status.Text = "ERREUR: Character"
        return false 
    end    
    rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then 
        status.Text = "ERREUR: HRP"
        return false 
    end
    
    if particleEmitter then particleEmitter:Destroy() end
    if pointLight then pointLight:Destroy() end
    
    pointLight = Instance.new("PointLight")
    pointLight.Range = 30
    pointLight.Brightness = 3
    pointLight.Color = elements[currentElement].lightColor
    pointLight.Enabled = active
    pointLight.Parent = rootPart
    
    local attachment = Instance.new("Attachment")
    attachment.Name = "AuraAttachment"
    attachment.Parent = rootPart
    
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
    status.TextColor3 = Color3.fromRGB(0, 255, 100)
    print("Effets attachés")
    return true
end

-- RESPAWN
player.CharacterAdded:Connect(function()
    task.wait(1)
    attachEffects()
end)

if player.Character then
    task.wait(0.5)
    attachEffects()
end
print("Système prêt")

-- DRAG SYSTEM
local dragging = false
local dragStart, startPos

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

header.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- CLOSE
closeBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    reopenBtn.Visible = true
end)

-- REOPEN
reopenBtn.MouseButton1Click:Connect(function()
    main.Visible = true
    reopenBtn.Visible = false
end)

-- MINIMIZE
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 280, 0, 40)}):Play()
        minBtn.Text = "+"
    else        TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 280, 0, 250)}):Play()
        minBtn.Text = "−"
    end
end)

-- TOGGLE
toggleBtn.MouseButton1Click:Connect(function()
    if not particleEmitter or not pointLight then
        if not attachEffects() then return end
    end
    
    active = not active
    
    if active then
        toggleBtn.Text = "DÉSACTIVER"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
        toggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        particleEmitter.Rate = elements[currentElement].rate
        pointLight.Enabled = true
        status.Text = "⚡ ACTIVE - " .. currentElement
    else
        toggleBtn.Text = "ACTIVER"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        toggleBtn.TextColor3 = Color3.new(1, 1, 1)
        particleEmitter.Rate = 0
        pointLight.Enabled = false
        status.Text = "INACTIVE"
    end
end)

-- CHANGE ELEMENT
local function changeElement(name)
    currentElement = name
    
    fireBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    iceBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    voidBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    goldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    
    if name == "Fire" then
        fireBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 0)
    elseif name == "Ice" then
        iceBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    elseif name == "Void" then
        voidBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
    elseif name == "Gold" then
        goldBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    end
    
    if particleEmitter then        particleEmitter.Color = elements[name].color
        if active then particleEmitter.Rate = elements[name].rate end
    end
    
    if pointLight then
        pointLight.Color = elements[name].lightColor
    end
    
    status.Text = (active and "⚡ ACTIVE" or "INACTIVE") .. " - " .. name
end

fireBtn.MouseButton1Click:Connect(function() changeElement("Fire") end)
iceBtn.MouseButton1Click:Connect(function() changeElement("Ice") end)
voidBtn.MouseButton1Click:Connect(function() changeElement("Void") end)
goldBtn.MouseButton1Click:Connect(function() changeElement("Gold") end)

print("=== V16 READY ===")
