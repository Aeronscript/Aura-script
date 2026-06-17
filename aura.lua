-- V11 PREMIUM ELEMENTAL AURA
print("=== V11 PREMIUM START ===")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

print("Personnage chargé")

local isAuraActive = false
local currentElement = "Fire"
local isMinimized = false

local effectsFolder = Instance.new("Folder")
effectsFolder.Name = "AuraEffects"
effectsFolder.Parent = rootPart

local function createParticle(texture, rate, speed, size, color, parent)
    local p = Instance.new("ParticleEmitter")
    p.Texture = texture
    p.Rate = rate
    p.Lifetime = NumberRange.new(1, 2)
    p.Speed = speed
    p.SpreadAngle = Vector2.new(180, 180)
    p.Size = size
    p.Transparency = NumberSequence.new(0, 0.5, 1)
    p.Rotation = NumberRange.new(0, 360)
    p.RotSpeed = NumberRange.new(-100, 100)
    p.Color = color
    p.Parent = parent
    return p
end

local att1 = Instance.new("Attachment")
att1.Position = Vector3.new(0, 1, 0)
att1.Parent = rootPart

local att2 = Instance.new("Attachment")
att2.Position = Vector3.new(0, 0, 0)
att2.Parent = rootPart

local att3 = Instance.new("Attachment")
att3.Position = Vector3.new(0, -1, 0)
att3.Parent = rootPart
local particles = {}
local light = Instance.new("PointLight")
light.Range = 30
light.Brightness = 3
light.Parent = rootPart

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.Sphere
mesh.Parent = rootPart
mesh.Scale = Vector3.new(0, 0, 0)

local elements = {
    Fire = {
        name = "FEU",
        color1 = ColorSequence.new(Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 100, 0)),
        color2 = ColorSequence.new(Color3.fromRGB(255, 200, 0), Color3.fromRGB(255, 50, 0)),
        lightColor = Color3.fromRGB(255, 80, 0),
        rate = 200,
        speed = NumberRange.new(10, 20)
    },
    Ice = {
        name = "GLACE",
        color1 = ColorSequence.new(Color3.fromRGB(0, 150, 255), Color3.fromRGB(200, 240, 255)),
        color2 = ColorSequence.new(Color3.fromRGB(100, 220, 255), Color3.fromRGB(255, 255, 255)),
        lightColor = Color3.fromRGB(100, 200, 255),
        rate = 150,
        speed = NumberRange.new(3, 8)
    },
    Void = {
        name = "VIDE",
        color1 = ColorSequence.new(Color3.fromRGB(100, 0, 200), Color3.fromRGB(50, 0, 100)),
        color2 = ColorSequence.new(Color3.fromRGB(200, 0, 255), Color3.fromRGB(100, 0, 200)),
        lightColor = Color3.fromRGB(150, 0, 255),
        rate = 180,
        speed = NumberRange.new(5, 15)
    },
    Gold = {
        name = "OR",
        color1 = ColorSequence.new(Color3.fromRGB(255, 215, 0), Color3.fromRGB(255, 255, 200)),
        color2 = ColorSequence.new(Color3.fromRGB(255, 200, 100), Color3.fromRGB(255, 255, 150)),
        lightColor = Color3.fromRGB(255, 200, 50),
        rate = 160,
        speed = NumberRange.new(6, 12)
    }
}

local ui = Instance.new("ScreenGui")
ui.Name = "PremiumAuraV11"
ui.ResetOnSpawn = false
ui.ZIndexBehavior = Enum.ZIndexBehavior.Siblingui.IgnoreGuiInset = true
ui.DisplayOrder = 999999
ui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 250, 0, 200)
main.Position = UDim2.new(1, -270, 0, 20)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
main.BackgroundTransparency = 0.1
main.BorderSizePixel = 0
main.Parent = ui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(0, 255, 200)
mainStroke.Thickness = 2
mainStroke.Transparency = 0.5
mainStroke.Parent = main

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 35)
header.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
header.BorderSizePixel = 0
header.Parent = main

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 12, 0, 0)
title.BackgroundTransparency = 1
title.Text = "PREMIUM AURA"
title.TextColor3 = Color3.fromRGB(0, 255, 200)
title.Font = Enum.Font.GothamBold
title.TextSize = 13
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 35, 0, 35)
minimizeBtn.Position = UDim2.new(1, -35, 0, 0)
minimizeBtn.BackgroundTransparency = 1
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
minimizeBtn.Font = Enum.Font.GothamBoldminimizeBtn.TextSize = 18
minimizeBtn.Parent = header

local content = Instance.new("Frame")
content.Size = UDim2.new(1, 0, 1, -35)
content.Position = UDim2.new(0, 0, 0, 35)
content.BackgroundTransparency = 1
content.Parent = main

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.9, 0, 0, 40)
toggleBtn.Position = UDim2.new(0.05, 0, 0, 10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
toggleBtn.Text = "ACTIVER L'AURA"
toggleBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 13
toggleBtn.Parent = content

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 8)
toggleCorner.Parent = toggleBtn

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = Color3.fromRGB(60, 60, 70)
toggleStroke.Thickness = 1
toggleStroke.Parent = toggleBtn

local buttonGrid = Instance.new("Frame")
buttonGrid.Size = UDim2.new(0.9, 0, 0, 110)
buttonGrid.Position = UDim2.new(0.05, 0, 0, 60)
buttonGrid.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
buttonGrid.BorderSizePixel = 0
buttonGrid.Parent = content

local gridCorner = Instance.new("UICorner")
gridCorner.CornerRadius = UDim.new(0, 8)
gridCorner.Parent = buttonGrid

local gridLayout = Instance.new("UIGridLayout")
gridLayout.Size = UDim2.new(1, -10, 1, -10)
gridLayout.Position = UDim2.new(0, 5, 0, 5)
gridLayout.CellSize = UDim2.new(0, 105, 0, 45)
gridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout.Parent = buttonGrid

local function createElementButton(name, color, order)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.LayoutOrder = order
    btn.Parent = buttonGrid
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = color
    btnStroke.Thickness = 1
    btnStroke.Transparency = 0.7
    btnStroke.Parent = btn
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        }):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        if currentElement ~= name then
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            }):Play()
        end
    end)
    
    return btn
end

local fireBtn = createElementButton("FEU", Color3.fromRGB(255, 50, 50), 1)
local iceBtn = createElementButton("GLACE", Color3.fromRGB(100, 200, 255), 2)
local voidBtn = createElementButton("VIDE", Color3.fromRGB(150, 0, 255), 3)
local goldBtn = createElementButton("OR", Color3.fromRGB(255, 215, 0), 4)

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 25)
statusLabel.Position = UDim2.new(0, 0, 1, -25)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "PRET"
statusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 10
statusLabel.Parent = main
print("Interface premium créée")

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

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 250, 0, 35)
        }):Play()
        minimizeBtn.Text = "+"
    else
        TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 250, 0, 200)
        }):Play()
        minimizeBtn.Text = "-"
    end
end)

local function applyElement(name)
    currentElement = name
    local config = elements[name]
    
    for _, p in pairs(particles) do
        p:Destroy()
    end
    particles = {}
        particles[1] = createParticle("rbxassetid://241876428", config.rate/2, config.speed, NumberSequence.new(3, 5), config.color1, att1)
    particles[2] = createParticle("rbxassetid://241876428", config.rate/3, NumberRange.new(config.speed.Min/2, config.speed.Max/2), NumberSequence.new(2, 4), config.color2, att2)
    particles[3] = createParticle("rbxassetid://241876428", config.rate/4, config.speed, NumberSequence.new(4, 6), config.color1, att3)
    
    light.Color = config.lightColor
    
    if isAuraActive then
        for _, p in pairs(particles) do
            p.Enabled = true
        end
        light.Enabled = true
    end
    
    for _, btn in pairs({fireBtn, iceBtn, voidBtn, goldBtn}) do
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    end
    
    if name == "Fire" then
        fireBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        fireBtn.TextColor3 = Color3.new(1,1,1)
    elseif name == "Ice" then
        iceBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
        iceBtn.TextColor3 = Color3.new(0,0,0)
    elseif name == "Void" then
        voidBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
        voidBtn.TextColor3 = Color3.new(1,1,1)
    elseif name == "Gold" then
        goldBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        goldBtn.TextColor3 = Color3.new(0,0,0)
    end
    
    statusLabel.Text = config.name
end

toggleBtn.MouseButton1Click:Connect(function()
    isAuraActive = not isAuraActive
    
    if isAuraActive then
        toggleBtn.Text = "DESACTIVER L'AURA"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
        toggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        toggleStroke.Color = Color3.fromRGB(0, 255, 150)
        
        for _, p in pairs(particles) do
            p.Enabled = true
        end
        light.Enabled = true
        
        TweenService:Create(mesh, TweenInfo.new(1, Enum.EasingStyle.Elastic), {            Scale = Vector3.new(3, 3, 3)
        }):Play()
        
        statusLabel.Text = "ACTIVE - " .. elements[currentElement].name
    else
        toggleBtn.Text = "ACTIVER L'AURA"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        toggleBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
        toggleStroke.Color = Color3.fromRGB(60, 60, 70)
        
        for _, p in pairs(particles) do
            p.Enabled = false
        end
        light.Enabled = false
        
        TweenService:Create(mesh, TweenInfo.new(0.5), {
            Scale = Vector3.new(0, 0, 0)
        }):Play()
        
        statusLabel.Text = "INACTIVE"
    end
end)

fireBtn.MouseButton1Click:Connect(function() applyElement("Fire") end)
iceBtn.MouseButton1Click:Connect(function() applyElement("Ice") end)
voidBtn.MouseButton1Click:Connect(function() applyElement("Void") end)
goldBtn.MouseButton1Click:Connect(function() applyElement("Gold") end)

RunService.RenderStepped:Connect(function()
    if isAuraActive then
        mesh.Rotation = mesh.Rotation + Vector3.new(0, 2, 0)
    end
end)

applyElement("Fire")

print("=== V11 PREMIUM READY ===")
