-- GhostReap990 Hub | Created by ReapsReality990 & Project Partner | 2025
-- Unauthorized distribution or leaks will result in immediate deauthorization. Private-use only.

local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local key = "reapsreality990key8"
local hubLoaded = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GhostReap990Hub"
ScreenGui.Parent = game.CoreGui
ScreenGui.Enabled = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 500, 0, 350)
Frame.Position = UDim2.new(0.5, -250, 0.5, -175)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui
Frame.Visible = false

local function earRape()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9118828565"
    sound.Volume = 10
    sound.Parent = game.SoundService
    sound:Play()
    task.wait(3)
    sound:Destroy()
end

local function unlockHub()
    ScreenGui.Enabled = true
    Frame.Visible = true
    earRape()
end

local function checkKey(input)
    if input.KeyCode == Enum.KeyCode.BackSlash then
        local inputKey = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("KeyBox") or Instance.new("TextBox")
        inputKey.Name = "KeyBox"
        inputKey.Parent = player.PlayerGui
        inputKey.PlaceholderText = "Enter Key"
        inputKey.Size = UDim2.new(0, 200, 0, 50)
        inputKey.Position = UDim2.new(0.5, -100, 0.5, -25)
        inputKey.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        inputKey.TextColor3 = Color3.fromRGB(255, 255, 255)
        inputKey.FocusLost:Connect(function()
            if inputKey.Text == key then
                unlockHub()
                inputKey:Destroy()
            else
                inputKey.Text = "Invalid Key"
                task.wait(1)
                inputKey:Destroy()
            end
        end)
        inputKey:CaptureFocus()
    end
end

UserInputService.InputBegan:Connect(checkKey)

local function createPillToggle(name, posY)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 250, 0, 40)
    button.Position = UDim2.new(0, 125, 0, posY)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 24
    button.Parent = Frame

    local enabled = false
    button.MouseButton1Click:Connect(function()
        enabled = not enabled
        button.BackgroundColor3 = enabled and Color3.fromRGB(30, 200, 30) or Color3.fromRGB(200, 30, 30)
    end)
    return button
end

local function killAura()
    local players = game:GetService("Players")
    while task.wait(0.1) do
        for _, v in pairs(players:GetPlayers()) do
            if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local args = { v }
                game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(unpack(args))
            end
        end
    end
end

local function lagSpike()
    while task.wait(0.01) do
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(math.random(), math.random())
    end
end

local function godmode()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.Name = "Bypass"
    end
end

local phantom = false
local blocker = false

local function togglePhantom()
    phantom = not phantom
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.Anchored = phantom
    end
end

local function toggleBlocker()
    blocker = not blocker
    if blocker then
        game:GetService("ReplicatedStorage").ChildAdded:Connect(function(child)
            if child:IsA("RemoteEvent") then
                child:Destroy()
            end
        end)
    end
end

local cmdBar = Instance.new("TextBox")
cmdBar.Size = UDim2.new(0, 400, 0, 40)
cmdBar.Position = UDim2.new(0, 50, 0, 300)
cmdBar.Parent = Frame
cmdBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
cmdBar.TextColor3 = Color3.fromRGB(255, 255, 255)
cmdBar.Font = Enum.Font.SourceSansBold
cmdBar.TextSize = 20
cmdBar.PlaceholderText = ";command here"

cmdBar.FocusLost:Connect(function()
    local text = cmdBar.Text
    if text:sub(1,7) == ";bring " then
        local targetName = text:sub(8)
        local target = game.Players:FindFirstChild(targetName)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") 
            and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            target.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
        end
    end
    cmdBar.Text = ""
end)

local log = {}

local function logError(msg)
    table.insert(log, "[ERROR] "..msg)
    warn("[ERROR] "..msg)
end

local function printLogs()
    for _, v in pairs(log) do
        print(v)
    end
end

print("GhostReap990 Hub | Created by ReapsReality990 & Project Partner | 2025")
print("Unauthorized distribution or leaks will result in immediate deauthorization. Private-use only.")
