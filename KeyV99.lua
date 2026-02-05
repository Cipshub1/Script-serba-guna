--====================================================
-- 🌊 CIPHUB V99 | KEY SYSTEM INTERFACE 🌊
-- LINK: WhatsApp Group
-- KEY: v99
--====================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LP = Players.LocalPlayer

-- KONFIGURASI KEY
local CorrectKey = "v99"
local KeyLink = "https://chat.whatsapp.com/C9lws7uXig62tX1xcVnhfS?mode=gi_t"

-- Cleanup UI Lama
pcall(function() 
    if LP.PlayerGui:FindFirstChild("CiphubKeySystem") then LP.PlayerGui.CiphubKeySystem:Destroy() end
end)

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "CiphubKeySystem"
KeyGui.Parent = LP:WaitForChild("PlayerGui")

local Theme = {
    Main = Color3.fromRGB(15, 15, 15),
    Accent = Color3.fromRGB(0, 200, 255),
    Text = Color3.fromRGB(255, 255, 255),
    SubText = Color3.fromRGB(180, 180, 180),
    Stroke = Color3.fromRGB(60, 60, 60),
    Button = Color3.fromRGB(30, 30, 30)
}

local function Round(obj, rad)
    local c = Instance.new("UICorner", obj)
    c.CornerRadius = UDim.new(0, rad)
end

-- MAIN FRAME
local MainKey = Instance.new("Frame", KeyGui)
MainKey.Size = UDim2.fromOffset(400, 250)
MainKey.Position = UDim2.new(0.5, -200, 0.5, -125)
MainKey.BackgroundColor3 = Theme.Main
MainKey.BorderSizePixel = 0
Round(MainKey, 8)

local Stroke = Instance.new("UIStroke", MainKey)
Stroke.Color = Theme.Accent
Stroke.Thickness = 1.5

-- TITLE
local Title = Instance.new("TextLabel", MainKey)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.RichText = true
Title.Text = 'CIPHUB <font color="rgb(0, 200, 255)">V99</font> - KEY SYSTEM'
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Theme.Text
Title.TextSize = 20

-- SUBTITLE / INFO
local Info = Instance.new("TextLabel", MainKey)
Info.Size = UDim2.new(1, -40, 0, 40)
Info.Position = UDim2.new(0, 20, 0, 50)
Info.BackgroundTransparency = 1
Info.Text = "Please join our WhatsApp group to get the activation key."
Info.Font = Enum.Font.Gotham
Info.TextColor3 = Theme.SubText
Info.TextSize = 13
Info.TextWrapped = true

-- KEY INPUT BOX
local InputBox = Instance.new("TextBox", MainKey)
InputBox.Size = UDim2.new(0.8, 0, 0, 40)
InputBox.Position = UDim2.new(0.1, 0, 0.45, 0)
InputBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
InputBox.Text = ""
InputBox.PlaceholderText = "Enter Key Here..."
InputBox.Font = Enum.Font.GothamMedium
InputBox.TextColor3 = Theme.Accent
InputBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
InputBox.TextSize = 14
Round(InputBox, 6)

local BoxStroke = Instance.new("UIStroke", InputBox)
BoxStroke.Color = Theme.Stroke
BoxStroke.Thickness = 1

-- BUTTON CONTAINER
local BtnContainer = Instance.new("Frame", MainKey)
BtnContainer.Size = UDim2.new(0.8, 0, 0, 40)
BtnContainer.Position = UDim2.new(0.1, 0, 0.7, 0)
BtnContainer.BackgroundTransparency = 1

local Layout = Instance.new("UIListLayout", BtnContainer)
Layout.FillDirection = "Horizontal"
Layout.Padding = UDim.new(0, 10)
Layout.HorizontalAlignment = "Center"

-- GET KEY BUTTON
local GetBtn = Instance.new("TextButton", BtnContainer)
GetBtn.Size = UDim2.new(0.48, 0, 1, 0)
GetBtn.BackgroundColor3 = Theme.Button
GetBtn.Text = "Get Key"
GetBtn.Font = Enum.Font.GothamBold
GetBtn.TextColor3 = Theme.Text
GetBtn.TextSize = 13
Round(GetBtn, 6)

-- CHECK KEY BUTTON
local CheckBtn = Instance.new("TextButton", BtnContainer)
CheckBtn.Size = UDim2.new(0.48, 0, 1, 0)
CheckBtn.BackgroundColor3 = Theme.Accent
CheckBtn.Text = "Check Key"
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.TextColor3 = Theme.Main
CheckBtn.TextSize = 13
Round(CheckBtn, 6)

-- LOGIC: GET KEY (COPY LINK)
GetBtn.MouseButton1Click:Connect(function()
    setclipboard(KeyLink)
    GetBtn.Text = "Link Copied!"
    task.wait(2)
    GetBtn.Text = "Get Key"
end)

-- LOGIC: CHECK KEY
CheckBtn.MouseButton1Click:Connect(function()
    if InputBox.Text == CorrectKey then
        CheckBtn.Text = "Access Granted!"
        CheckBtn.TextColor3 = Color3.fromRGB(0, 255, 100)
        task.wait(1)
        KeyGui:Destroy()
        -- JALANKAN SCRIPT UTAMA
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cipshub1/KeyCipshubV99/refs/heads/main/Sontolloyo.lua", true))()
    else
        CheckBtn.Text = "Invalid Key!"
        CheckBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
        task.wait(1.5)
        CheckBtn.Text = "Check Key"
        CheckBtn.TextColor3 = Theme.Main
    end
end)

-- ANIMASI MASUK
MainKey.Position = UDim2.new(0.5, -200, 1, 0)
TweenService:Create(MainKey, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {Position = UDim2.new(0.5, -200, 0.5, -125)}):Play()

print("Ciphub V99: Key System Loaded! 🌊")
