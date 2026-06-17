-- TEST GITHUB
print("TEST 1: Script chargé")
local p = game:GetService("Players").LocalPlayer
print("TEST 2: Player = " .. p.Name)
local gui = Instance.new("ScreenGui")
gui.Name = "Test"
gui.Parent = p:WaitForChild("PlayerGui")
print("TEST 3: GUI créé")
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 100)
frame.Position = UDim2.new(0.5, -150, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
frame.Parent = gui
print("TEST 4: Frame créé")
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = "GITHUB MARCHE !"
label.TextColor3 = Color3.new(0, 0, 0)
label.Font = Enum.Font.GothamBold
label.TextSize = 24
label.Parent = frame
print("TEST 5: FIN")
