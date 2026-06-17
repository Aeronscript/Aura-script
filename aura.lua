-- V17 AURA COMPLETE - VERSION CORRIGEE
print("=== START ===")

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AuraV17"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999999
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Reopen Button
local ReopenBtn = Instance.new("TextButton")
ReopenBtn.Size = UDim2.new(0, 50, 0, 50)
ReopenBtn.Position = UDim2.new(0, 20, 0, 20)
ReopenBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
ReopenBtn.Text = "⚡"
ReopenBtn.TextColor3 = Color3.new(0, 0, 0)
ReopenBtn.Font = Enum.Font.GothamBold
ReopenBtn.TextSize = 24
ReopenBtn.Visible = false
ReopenBtn.Parent = ScreenGui
local ReopenCorner = Instance.new("UICorner")
ReopenCorner.CornerRadius = UDim.new(1, 0)
ReopenCorner.Parent = ReopenBtn

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 250)
MainFrame.Position = UDim2.new(0, 20, 0, 80)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 255, 200)
MainStroke.Thickness = 2
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame
-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
Header.BorderSizePixel = 0
Header.Parent = MainFrame
local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -90, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = " AURA V17"
Title.TextColor3 = Color3.fromRGB(0, 255, 200)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0, 2)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = ""
CloseBtn.Parent = Header
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn
local CloseLabel = Instance.new("TextLabel")
CloseLabel.Size = UDim2.new(1, 0, 1, 0)
CloseLabel.BackgroundTransparency = 1
CloseLabel.Text = "X"
CloseLabel.TextColor3 = Color3.new(1, 1, 1)
CloseLabel.Font = Enum.Font.GothamBold
CloseLabel.TextSize = 18
CloseLabel.Parent = CloseBtn

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 35, 0, 35)
MinBtn.Position = UDim2.new(1, -80, 0, 2)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 20MinBtn.Parent = Header

-- Content Frame
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -40)
Content.Position = UDim2.new(0, 0, 0, 40)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

-- Toggle Button
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0.9, 0, 0, 45)
ToggleBtn.Position = UDim2.new(0.05, 0, 0, 10)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
ToggleBtn.Text = "ACTIVER L'AURA"
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 14
ToggleBtn.Parent = Content
local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleBtn

-- Element Buttons
local FireBtn = Instance.new("TextButton")
FireBtn.Size = UDim2.new(0.22, 0, 0, 40)
FireBtn.Position = UDim2.new(0.05, 0, 0, 65)
FireBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 0)
FireBtn.Text = "FEU"
FireBtn.TextColor3 = Color3.new(1, 1, 1)
FireBtn.Font = Enum.Font.GothamBold
FireBtn.TextSize = 12
FireBtn.Parent = Content
local FireCorner = Instance.new("UICorner")
FireCorner.CornerRadius = UDim.new(0, 6)
FireCorner.Parent = FireBtn

local IceBtn = Instance.new("TextButton")
IceBtn.Size = UDim2.new(0.22, 0, 0, 40)
IceBtn.Position = UDim2.new(0.29, 0, 0, 65)
IceBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
IceBtn.Text = "GLACE"
IceBtn.TextColor3 = Color3.new(1, 1, 1)
IceBtn.Font = Enum.Font.GothamBold
IceBtn.TextSize = 12
IceBtn.Parent = Content
local IceCorner = Instance.new("UICorner")
IceCorner.CornerRadius = UDim.new(0, 6)
IceCorner.Parent = IceBtn
local VoidBtn = Instance.new("TextButton")
VoidBtn.Size = UDim2.new(0.22, 0, 0, 40)
VoidBtn.Position = UDim2.new(0.53, 0, 0, 65)
VoidBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
VoidBtn.Text = "VIDE"
VoidBtn.TextColor3 = Color3.new(1, 1, 1)
VoidBtn.Font = Enum.Font.GothamBold
VoidBtn.TextSize = 12
VoidBtn.Parent = Content
local VoidCorner = Instance.new("UICorner")
VoidCorner.CornerRadius = UDim.new(0, 6)
VoidCorner.Parent = VoidBtn

local GoldBtn = Instance.new("TextButton")
GoldBtn.Size = UDim2.new(0.22, 0, 0, 40)
GoldBtn.Position = UDim2.new(0.77, 0, 0, 65)
GoldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
GoldBtn.Text = "OR"
GoldBtn.TextColor3 = Color3.new(1, 1, 1)
GoldBtn.Font = Enum.Font.GothamBold
GoldBtn.TextSize = 12
GoldBtn.Parent = Content
local GoldCorner = Instance.new("UICorner")
GoldCorner.CornerRadius = UDim.new(0, 6)
GoldCorner.Parent = GoldBtn

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 25)
StatusLabel.Position = UDim2.new(0, 0, 1, -25)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "CHARGEMENT..."
StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextSize = 11
StatusLabel.Parent = MainFrame

print("GUI créé")

-- Variables
local Active = false
local CurrentElement = "Fire"
local Minimized = false
local Character = nil
local RootPart = nil
local ParticleEmitter = nil
local PointLight = nil

-- Element Configs
local Elements = {    Fire = {
        Color = ColorSequence.new(Color3.fromRGB(255, 50, 0), Color3.fromRGB(255, 200, 0)),
        LightColor = Color3.fromRGB(255, 100, 0),
        Rate = 200
    },
    Ice = {
        Color = ColorSequence.new(Color3.fromRGB(100, 200, 255), Color3.fromRGB(255, 255, 255)),
        LightColor = Color3.fromRGB(100, 200, 255),
        Rate = 150
    },
    Void = {
        Color = ColorSequence.new(Color3.fromRGB(100, 0, 200), Color3.fromRGB(200, 0, 255)),
        LightColor = Color3.fromRGB(150, 0, 255),
        Rate = 180
    },
    Gold = {
        Color = ColorSequence.new(Color3.fromRGB(255, 215, 0), Color3.fromRGB(255, 255, 200)),
        LightColor = Color3.fromRGB(255, 200, 50),
        Rate = 160
    }
}

-- Attach Effects Function
local function AttachEffects()
    Character = player.Character
    if not Character then
        StatusLabel.Text = "ERREUR: Character"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        return false
    end
    
    RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not RootPart then
        StatusLabel.Text = "ERREUR: HRP"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        return false
    end
    
    -- Cleanup old effects
    if ParticleEmitter then
        ParticleEmitter:Destroy()
        ParticleEmitter = nil
    end
    if PointLight then
        PointLight:Destroy()
        PointLight = nil
    end
    
    -- Create PointLight
    PointLight = Instance.new("PointLight")    PointLight.Range = 30
    PointLight.Brightness = 3
    PointLight.Color = Elements[CurrentElement].LightColor
    PointLight.Enabled = Active
    PointLight.Parent = RootPart
    
    -- Create Attachment
    local Attachment = Instance.new("Attachment")
    Attachment.Name = "AuraAttachment"
    Attachment.Parent = RootPart
    
    -- Create ParticleEmitter
    ParticleEmitter = Instance.new("ParticleEmitter")
    ParticleEmitter.Texture = "rbxassetid://241876428"
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
    
    StatusLabel.Text = "PRET - " .. CurrentElement
    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
    print("Effets attachés avec succès")
    return true
end

-- Character Added Event
player.CharacterAdded:Connect(function()
    task.wait(1)
    AttachEffects()
end)

-- Initial Attach
if player.Character then
    task.wait(0.5)
    AttachEffects()
end

print("Système prêt")

-- Drag System
local Dragging = false
local DragStart = nil
local StartPos = nil
Header.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStart = Input.Position
        StartPos = MainFrame.Position
    end
end)

Header.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(Input)
    if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
        local Delta = Input.Position - DragStart
        MainFrame.Position = UDim2.new(
            StartPos.X.Scale,
            StartPos.X.Offset + Delta.X,
            StartPos.Y.Scale,
            StartPos.Y.Offset + Delta.Y
        )
    end
end)

-- Close Button
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ReopenBtn.Visible = true
end)

-- Reopen Button
ReopenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    ReopenBtn.Visible = false
end)

-- Minimize Button
MinBtn.MouseButton1Click:Connect(function()
    Minimized = not Minimized
    if Minimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 280, 0, 40)
        }):Play()
        MinBtn.Text = "+"
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 280, 0, 250)
        }):Play()        MinBtn.Text = "-"
    end
end)

-- Toggle Button
ToggleBtn.MouseButton1Click:Connect(function()
    if not ParticleEmitter or not PointLight then
        if not AttachEffects() then
            return
        end
    end
    
    Active = not Active
    
    if Active then
        ToggleBtn.Text = "DÉSACTIVER"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
        ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        ParticleEmitter.Rate = Elements[CurrentElement].Rate
        PointLight.Enabled = true
        StatusLabel.Text = "⚡ ACTIVE - " .. CurrentElement
    else
        ToggleBtn.Text = "ACTIVER"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
        ParticleEmitter.Rate = 0
        PointLight.Enabled = false
        StatusLabel.Text = "INACTIVE"
    end
end)

-- Change Element Function
local function ChangeElement(ElementName)
    CurrentElement = ElementName
    
    -- Reset all buttons
    FireBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    IceBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    VoidBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    GoldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    
    -- Highlight selected
    if ElementName == "Fire" then
        FireBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 0)
    elseif ElementName == "Ice" then
        IceBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    elseif ElementName == "Void" then
        VoidBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
    elseif ElementName == "Gold" then
        GoldBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)    end
    
    -- Update effects
    if ParticleEmitter then
        ParticleEmitter.Color = Elements[ElementName].Color
        if Active then
            ParticleEmitter.Rate = Elements[ElementName].Rate
        end
    end
    
    if PointLight then
        PointLight.Color = Elements[ElementName].LightColor
    end
    
    StatusLabel.Text = (Active and "⚡ ACTIVE" or "INACTIVE") .. " - " .. ElementName
end

-- Element Buttons
FireBtn.MouseButton1Click:Connect(function()
    ChangeElement("Fire")
end)

IceBtn.MouseButton1Click:Connect(function()
    ChangeElement("Ice")
end)

VoidBtn.MouseButton1Click:Connect(function()
    ChangeElement("Void")
end)

GoldBtn.MouseButton1Click:Connect(function()
    ChangeElement("Gold")
end)

print("=== V17 READY ===")
