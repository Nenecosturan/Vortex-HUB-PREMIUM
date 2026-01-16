--[[
    VORTEX ELITE v2.1 - ERROR-FREE SUPREMACY
    Optimized for: Arceus X Neo (Mobile-First)
    Key: VORTEX-2026-PREMIUM-BETA
]]

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- [VORTEX CONFIG]
local Vortex = {
    Color = Color3.fromRGB(170, 0, 255),
    BG = Color3.fromRGB(5, 5, 8),
    Sidebar = Color3.fromRGB(10, 10, 15),
    FlySpeed = 50,
    Flying = false,
    InfJump = false,
    NoClip = false,
    ESP = false,
    InstantInter = false,
    AutoClick = false
}

-- [CLEANUP]
if player.PlayerGui:FindFirstChild("VortexEliteV2") then player.PlayerGui.VortexEliteV2:Destroy() end

-- [GUI BASE]
local MainGui = Instance.new("ScreenGui", player.PlayerGui); MainGui.Name = "VortexEliteV2"; MainGui.IgnoreGuiInset = true

-- [KEY SYSTEM]
local KeyFrame = Instance.new("Frame", MainGui)
KeyFrame.Size = UDim2.new(0, 400, 0, 250); KeyFrame.Position = UDim2.new(0.5, -200, 0.5, -125); KeyFrame.BackgroundColor3 = Vortex.BG
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 15)
Instance.new("UIStroke", KeyFrame).Color = Vortex.Color

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.Text = "VORTEX ELITE"; KeyTitle.Size = UDim2.new(1, 0, 0, 60); KeyTitle.TextColor3 = Vortex.Color; KeyTitle.Font = "GothamBold"; KeyTitle.BackgroundTransparency = 1; KeyTitle.TextSize = 20

local KeyInput = Instance.new("TextBox", KeyFrame)
KeyInput.PlaceholderText = "Enter Key..."; KeyInput.Size = UDim2.new(0.8, 0, 0, 45); KeyInput.Position = UDim2.new(0.1, 0, 0.4, 0); KeyInput.BackgroundColor3 = Color3.fromRGB(20, 20, 25); KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255); Instance.new("UICorner", KeyInput)

local KeyBtn = Instance.new("TextButton", KeyFrame)
KeyBtn.Text = "VERIFY ACCESS"; KeyBtn.Size = UDim2.new(0.8, 0, 0, 45); KeyBtn.Position = UDim2.new(0.1, 0, 0.7, 0); KeyBtn.BackgroundColor3 = Vortex.Color; KeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255); KeyBtn.Font = "GothamBold"; Instance.new("UICorner", KeyBtn)

-- [MAIN FRAME]
local MainFrame = Instance.new("Frame", MainGui)
MainFrame.Size = UDim2.new(0, 680, 0, 440); MainFrame.Position = UDim2.new(0.5, -340, 0.5, -220); MainFrame.BackgroundColor3 = Vortex.BG; MainFrame.Visible = false; MainFrame.ClipsDescendants = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 15)
Instance.new("UIStroke", MainFrame).Color = Vortex.Color

-- [SIDEBAR & CONTENT]
local Sidebar = Instance.new("Frame", MainFrame); Sidebar.Size = UDim2.new(0, 170, 1, 0); Sidebar.BackgroundColor3 = Vortex.Sidebar; Instance.new("UICorner", Sidebar)
local TabScroller = Instance.new("ScrollingFrame", Sidebar); TabScroller.Size = UDim2.new(1, 0, 1, -80); TabScroller.Position = UDim2.new(0, 0, 0, 70); TabScroller.BackgroundTransparency = 1; TabScroller.ScrollBarThickness = 0
Instance.new("UIListLayout", TabScroller).Padding = UDim.new(0, 5); Instance.new("UIPadding", TabScroller).PaddingLeft = UDim.new(0, 10)

local Content = Instance.new("Frame", MainFrame); Content.Size = UDim2.new(1, -190, 1, -60); Content.Position = UDim2.new(0, 180, 0, 50); Content.BackgroundTransparency = 1

local Pages = {}
local function CreateTab(name)
    local btn = Instance.new("TextButton", TabScroller); btn.Size = UDim2.new(0.9, 0, 0, 40); btn.BackgroundColor3 = Color3.fromRGB(20, 20, 25); btn.Text = name; btn.TextColor3 = Color3.fromRGB(150, 150, 150); btn.Font = "GothamBold"; Instance.new("UICorner", btn)
    local page = Instance.new("ScrollingFrame", Content); page.Size = UDim2.new(1, 0, 1, 0); page.Visible = false; page.BackgroundTransparency = 1; page.CanvasSize = UDim2.new(0,0,0,0); page.AutomaticCanvasSize = "Y"; page.ScrollBarThickness = 2
    Instance.new("UIListLayout", page).Padding = UDim.new(0, 10)
    Pages[name] = page
    btn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end page.Visible = true
        for _, b in pairs(TabScroller:GetChildren()) do if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(20, 20, 25) end end
        btn.BackgroundColor3 = Vortex.Color
    end)
    return page
end

-- [UI BUILDERS]
local function NewToggle(parent, txt, cb)
    local t = Instance.new("TextButton", parent); t.Size = UDim2.new(0.95, 0, 0, 45); t.BackgroundColor3 = Color3.fromRGB(15, 15, 20); t.Text = "  " .. txt; t.TextColor3 = Color3.fromRGB(255, 255, 255); t.TextXAlignment = "Left"; t.Font = "GothamSemibold"; Instance.new("UICorner", t)
    local s = Instance.new("Frame", t); s.Size = UDim2.new(0, 35, 0, 18); s.Position = UDim2.new(1, -45, 0.5, -9); s.BackgroundColor3 = Color3.fromRGB(40, 40, 45); Instance.new("UICorner", s).CornerRadius = UDim.new(1, 0)
    local d = Instance.new("Frame", s); d.Size = UDim2.new(0, 14, 0, 14); d.Position = UDim2.new(0, 2, 0.5, -7); d.BackgroundColor3 = Color3.fromRGB(255, 255, 255); Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)
    local act = false
    t.MouseButton1Click:Connect(function()
        act = not act
        TweenService:Create(s, TweenInfo.new(0.3), {BackgroundColor3 = act and Vortex.Color or Color3.fromRGB(40, 40, 45)}):Play()
        TweenService:Create(d, TweenInfo.new(0.3), {Position = act and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)}):Play()
        task.spawn(cb, act)
    end)
end

-- [PAGES]
local CombatPage = CreateTab("Combat")
local MovePage = CreateTab("Movement")
local VisualPage = CreateTab("Visuals")
local UtilityPage = CreateTab("Utility")

-- [FEATURES IMPLEMENTATION]
NewToggle(MovePage, "Fly Mode (E)", function(s)
    Vortex.Flying = s
    local char = player.Character
    if s and char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        local bv = Instance.new("BodyVelocity", hrp); bv.Name = "VortexFly"; bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        task.spawn(function()
            while Vortex.Flying and hrp.Parent do
                bv.Velocity = mouse.Hit.lookVector * Vortex.FlySpeed
                task.wait()
            end
            if bv then bv:Destroy() end
        end)
    end
end)

NewToggle(MovePage, "Noclip", function(s)
    Vortex.NoClip = s
    RunService.Stepped:Connect(function()
        if Vortex.NoClip and player.Character then
            for _, v in pairs(player.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end)
end)

NewToggle(UtilityPage, "Instant Interact", function(s)
    Vortex.InstantInter = s
    RunService.Heartbeat:Connect(function()
        if Vortex.InstantInter then
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("ProximityPrompt") then v.HoldDuration = 0 end
            end
        end
    end)
end)

-- [VERIFICATION]
KeyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "VORTEX-2026-PREMIUM-BETA" then
        KeyFrame:Destroy()
        MainFrame.Visible = true
        StarterGui:SetCore("SendNotification", {Title = "VORTEX ELITE", Text = "System Authenticated!", Duration = 3})
    else
        KeyInput.Text = ""; KeyInput.PlaceholderText = "INVALID KEY"; task.wait(1); KeyInput.PlaceholderText = "Enter Key..."
    end
end)

-- [DRAG SYSTEM]
local d, ds, sp
local TopBar = Instance.new("Frame", MainFrame); TopBar.Size = UDim2.new(1, 0, 0, 40); TopBar.BackgroundTransparency = 1
TopBar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then d = true ds = i.Position sp = MainFrame.Position end end)
UserInputService.InputChanged:Connect(function(i) if d and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local delta = i.Position - ds MainFrame.Position = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y) end end)
UserInputService.InputEnded:Connect(function() d = false end)

Pages["Movement"].Visible = true
