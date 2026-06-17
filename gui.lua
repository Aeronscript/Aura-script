-- gui.lua - VERSION CORRIGEE
print("=== GUI LOADING ===")

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AuraGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999999
ScreenGui.Parent = player:WaitForChild("PlayerGui")

print("ScreenGui créé")

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 280)
MainFrame.Position = UDim2.new(0, 100, 0, 100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(138, 43, 226)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

print("MainFrame créé")

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "AURA SYSTEM"
Title.TextColor3 = Color3.fromRGB(138, 43, 226)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -45, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 53, 69)
CloseBtn.Text = ""
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

local XLabel = Instance.new("TextLabel")
XLabel.Size = UDim2.new(1, 0, 1, 0)
XLabel.BackgroundTransparency = 1
XLabel.Text = "X"
XLabel.TextColor3 = Color3.new(1, 1, 1)
XLabel.Font = Enum.Font.GothamBold
XLabel.TextSize = 20
XLabel.Parent = CloseBtn

-- Content
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -50)
Content.Position = UDim2.new(0, 0, 0, 50)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

-- Toggle Button
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0.9, 0, 0, 50)
ToggleBtn.Position = UDim2.new(0.05, 0, 0, 15)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
ToggleBtn.Text = "ACTIVER"
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 16
ToggleBtn.Parent = Content

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleBtn

-- Element Buttons
local FireBtn = Instance.new("TextButton")
FireBtn.Size = UDim2.new(0.22, 0, 0, 45)
FireBtn.Position = UDim2.new(0.05, 0, 0, 110)
FireBtn.BackgroundColor3 = Color3.fromRGB(220, 53, 69)
FireBtn.Text = "FEU"
FireBtn.TextColor3 = Color3.new(1, 1, 1)
FireBtn.Font = Enum.Font.GothamBold
FireBtn.TextSize = 13
FireBtn.Parent = Content
Instance.new("UICorner", FireBtn).CornerRadius = UDim.new(0, 8)

local IceBtn = Instance.new("TextButton")
IceBtn.Size = UDim2.new(0.22, 0, 0, 45)
IceBtn.Position = UDim2.new(0.29, 0, 0, 110)
IceBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
IceBtn.Text = "GLACE"
IceBtn.TextColor3 = Color3.new(1, 1, 1)
IceBtn.Font = Enum.Font.GothamBold
IceBtn.TextSize = 13
IceBtn.Parent = Content
Instance.new("UICorner", IceBtn).CornerRadius = UDim.new(0, 8)

local VoidBtn = Instance.new("TextButton")
VoidBtn.Size = UDim2.new(0.22, 0, 0, 45)
VoidBtn.Position = UDim2.new(0.53, 0, 0, 110)
VoidBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
VoidBtn.Text = "VIDE"
VoidBtn.TextColor3 = Color3.new(1, 1, 1)
VoidBtn.Font = Enum.Font.GothamBold
VoidBtn.TextSize = 13
VoidBtn.Parent = Content
Instance.new("UICorner", VoidBtn).CornerRadius = UDim.new(0, 8)

local GoldBtn = Instance.new("TextButton")
GoldBtn.Size = UDim2.new(0.22, 0, 0, 45)
GoldBtn.Position = UDim2.new(0.77, 0, 0, 110)
GoldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
GoldBtn.Text = "OR"
GoldBtn.TextColor3 = Color3.new(1, 1, 1)
GoldBtn.Font = Enum.Font.GothamBold
GoldBtn.TextSize = 13
GoldBtn.Parent = Content
Instance.new("UICorner", GoldBtn).CornerRadius = UDim.new(0, 8)

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 1, -30)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "GUI PRET"
StatusLabel.TextColor3 = Color3.fromRGB(40, 167, 69)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextSize = 12
StatusLabel.Parent = MainFrame

print("GUI elements créés")

-- Drag System
local dragging = false
local dragStart, startPos

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

Header.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- Close/Reopen
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

print("=== GUI LOADED ===")

-- Export pour effects.lua
_G.AuraGUI = {
    MainFrame = MainFrame,
    ToggleBtn = ToggleBtn,
    FireBtn = FireBtn,
    IceBtn = IceBtn,
    VoidBtn = VoidBtn,
    GoldBtn = GoldBtn,
    StatusLabel = StatusLabel
}
