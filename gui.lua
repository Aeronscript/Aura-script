-- gui.lua
print("Chargement de l'interface...")

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Création du ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AuraV17"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999999
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Bouton pour rouvrir (caché au début)
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
Instance.new("UICorner", ReopenBtn).CornerRadius = UDim.new(1, 0)

-- Menu Principal
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 250)
MainFrame.Position = UDim2.new(0, 20, 0, 80)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(0, 255, 200)
MainStroke.Thickness = 2
MainStroke.Transparency = 0.3

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
Header.BorderSizePixel = 0
Header.Parent = MainFrame
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 12)
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

-- Bouton Close (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0, 2)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = ""
CloseBtn.Parent = Header
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)
local XLabel = Instance.new("TextLabel")
XLabel.Size = UDim2.new(1, 0, 1, 0)
XLabel.BackgroundTransparency = 1
XLabel.Text = "X"
XLabel.TextColor3 = Color3.new(1, 1, 1)
XLabel.Font = Enum.Font.GothamBold
XLabel.TextSize = 18
XLabel.Parent = CloseBtn

-- Bouton Minimize (-)
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 35, 0, 35)
MinBtn.Position = UDim2.new(1, -80, 0, 2)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 20
MinBtn.Parent = Header

-- Contenu
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -40)
Content.Position = UDim2.new(0, 0, 0, 40)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

-- Bouton Toggle
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0.9, 0, 0, 45)ToggleBtn.Position = UDim2.new(0.05, 0, 0, 10)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
ToggleBtn.Text = "ACTIVER L'AURA"
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 14
ToggleBtn.Parent = Content
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 8)

-- Boutons Éléments
local function CreateElementBtn(text, pos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.22, 0, 0, 40)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.Parent = Content
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

local FireBtn = CreateElementBtn("FEU", UDim2.new(0.05, 0, 0, 65), Color3.fromRGB(255, 50, 0))
local IceBtn = CreateElementBtn("GLACE", UDim2.new(0.29, 0, 0, 65), Color3.fromRGB(50, 50, 70))
local VoidBtn = CreateElementBtn("VIDE", UDim2.new(0.53, 0, 0, 65), Color3.fromRGB(50, 50, 70))
local GoldBtn = CreateElementBtn("OR", UDim2.new(0.77, 0, 0, 65), Color3.fromRGB(50, 50, 70))

-- Label Statut
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 25)
StatusLabel.Position = UDim2.new(0, 0, 1, -25)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "INTERFACE PRETE"
StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextSize = 11
StatusLabel.Parent = MainFrame

-- Logique Drag
local Dragging, DragStart, StartPos = false, nil, nil
Header.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStart = Input.Position
        StartPos = MainFrame.Position
    end
end)
Header.InputEnded:Connect(function(Input)    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Dragging = false
    end
end)
UserInputService.InputChanged:Connect(function(Input)
    if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
        local Delta = Input.Position - DragStart
        MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end)

-- Logique Close / Reopen
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ReopenBtn.Visible = true
end)
ReopenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    ReopenBtn.Visible = false
end)

-- Logique Minimize
local Minimized = false
MinBtn.MouseButton1Click:Connect(function()
    Minimized = not Minimized
    local targetSize = Minimized and UDim2.new(0, 280, 0, 40) or UDim2.new(0, 280, 0, 250)
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = targetSize}):Play()
    MinBtn.Text = Minimized and "+" or "-"
end)

-- On envoie tout ça dans la mémoire globale (_G) pour que effects.lua puisse l'utiliser
_G.AuraUI = {
    MainFrame = MainFrame,
    ToggleBtn = ToggleBtn,
    FireBtn = FireBtn,
    IceBtn = IceBtn,
    VoidBtn = VoidBtn,
    GoldBtn = GoldBtn,
    StatusLabel = StatusLabel
}

print("Interface chargée avec succès !")
