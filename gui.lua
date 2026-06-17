-- gui.lua
print("Chargement de l'interface...")

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Création du ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AuraV18"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999999
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Bouton pour rouvrir (caché au début)
local ReopenBtn = Instance.new("TextButton")
ReopenBtn.Size = UDim2.new(0, 50, 0, 50)
ReopenBtn.Position = UDim2.new(0, 20, 0, 20)
ReopenBtn.BackgroundColor3 = Color3.fromRGB(138, 43, 226) -- Violet
ReopenBtn.Text = "⚡"
ReopenBtn.TextColor3 = Color3.new(1, 1, 1)
ReopenBtn.Font = Enum.Font.GothamBold
ReopenBtn.TextSize = 24
ReopenBtn.Visible = false
ReopenBtn.Parent = ScreenGui
local ReopenCorner = Instance.new("UICorner", ReopenBtn)
ReopenCorner.CornerRadius = UDim.new(0, 10)

-- Menu Principal (Style moderne)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 280)
MainFrame.Position = UDim2.new(0, 20, 0, 80)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35) -- Fond sombre
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(60, 60, 70)
MainStroke.Thickness = 1

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
Header.BorderSizePixel = 0
Header.Parent = MainFrame
local HeaderCorner = Instance.new("UICorner", Header)HeaderCorner.CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "AURA SYSTEM"
Title.TextColor3 = Color3.fromRGB(138, 43, 226) -- Violet
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Bouton Close (X) - Rouge moderne
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -45, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 53, 69) -- Rouge
CloseBtn.Text = ""
CloseBtn.Parent = Header
local CloseCorner = Instance.new("UICorner", CloseBtn)
CloseCorner.CornerRadius = UDim.new(0, 8)
local XLabel = Instance.new("TextLabel")
XLabel.Size = UDim2.new(1, 0, 1, 0)
XLabel.BackgroundTransparency = 1
XLabel.Text = "X"
XLabel.TextColor3 = Color3.new(1, 1, 1)
XLabel.Font = Enum.Font.GothamBold
XLabel.TextSize = 20
XLabel.Parent = CloseBtn

-- Contenu
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -50)
Content.Position = UDim2.new(0, 0, 0, 50)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

-- Bouton Toggle (Style moderne avec dégradé)
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0.9, 0, 0, 50)
ToggleBtn.Position = UDim2.new(0.05, 0, 0, 15)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
ToggleBtn.Text = "ACTIVER L'AURA"
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 16
ToggleBtn.Parent = Content
local ToggleCorner = Instance.new("UICorner", ToggleBtn)
ToggleCorner.CornerRadius = UDim.new(0, 8)local ToggleStroke = Instance.new("UIStroke", ToggleBtn)
ToggleStroke.Color = Color3.fromRGB(80, 80, 90)
ToggleStroke.Thickness = 1

-- Titre pour les éléments
local ElementTitle = Instance.new("TextLabel")
ElementTitle.Size = UDim2.new(0.9, 0, 0, 25)
ElementTitle.Position = UDim2.new(0.05, 0, 0, 75)
ElementTitle.BackgroundTransparency = 1
ElementTitle.Text = "CHOISIS TON ÉLÉMENT"
ElementTitle.TextColor3 = Color3.fromRGB(150, 150, 160)
ElementTitle.Font = Enum.Font.Gotham
ElementTitle.TextSize = 11
ElementTitle.TextXAlignment = Enum.TextXAlignment.Center
ElementTitle.Parent = Content

-- Grille de boutons d'éléments
local function CreateElementBtn(text, pos, color, order)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.22, 0, 0, 45)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.LayoutOrder = order
    btn.Parent = Content
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 8)
    local btnStroke = Instance.new("UIStroke", btn)
    btnStroke.Color = Color3.fromRGB(255, 255, 255)
    btnStroke.Thickness = 0
    btnStroke.Transparency = 0.7
    return btn, btnStroke
end

local FireBtn, FireStroke = CreateElementBtn("🔥 FEU", UDim2.new(0.05, 0, 0, 110), Color3.fromRGB(220, 53, 69), 1)
local IceBtn, IceStroke = CreateElementBtn("❄️ GLACE", UDim2.new(0.29, 0, 0, 110), Color3.fromRGB(50, 50, 60), 2)
local VoidBtn, VoidStroke = CreateElementBtn("🌌 VIDE", UDim2.new(0.53, 0, 0, 110), Color3.fromRGB(50, 50, 60), 3)
local GoldBtn, GoldStroke = CreateElementBtn("💎 OR", UDim2.new(0.77, 0, 0, 110), Color3.fromRGB(50, 50, 60), 4)

-- Label Statut (Style moderne)
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 1, -30)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "INTERFACE PRETE"
StatusLabel.TextColor3 = Color3.fromRGB(40, 167, 69) -- Vert
StatusLabel.Font = Enum.Font.GothamBoldStatusLabel.TextSize = 12
StatusLabel.Parent = MainFrame

print("Interface chargée")

-- Système Drag
local Dragging, DragStart, StartPos = false, nil, nil
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

-- On envoie l'interface dans _G
_G.AuraUI = {
    MainFrame = MainFrame,
    ToggleBtn = ToggleBtn,
    ToggleStroke = ToggleStroke,
    FireBtn = FireBtn,
    FireStroke = FireStroke,
    IceBtn = IceBtn,
    IceStroke = IceStroke,
    VoidBtn = VoidBtn,
    VoidStroke = VoidStroke,
    GoldBtn = GoldBtn,
    GoldStroke = GoldStroke,
    StatusLabel = StatusLabel}

print("Interface prête !")
