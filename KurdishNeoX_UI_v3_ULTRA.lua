-- Kurdish Neo X UI v3 ULTRA (SAFE DEMO)
-- UI-only mockup (NO exploits, NO executor)
-- Made by a7uliiix

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "KurdishNeoX_ULTRA"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Main Window
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.55, 0.65)
main.Position = UDim2.fromScale(0.225, 0.18)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,20)

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0.1,0)
title.BackgroundColor3 = Color3.fromRGB(180,0,0)
title.Text = "Kurdish Neo X ULTRA • by a7uliiix"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
Instance.new("UICorner", title).CornerRadius = UDim.new(0,20)

-- Sidebar
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0.26,0,0.9,0)
side.Position = UDim2.new(0,0,0.1,0)
side.BackgroundColor3 = Color3.fromRGB(28,28,28)

-- Content
local content = Instance.new("Frame", main)
content.Size = UDim2.new(0.74,0,0.9,0)
content.Position = UDim2.new(0.26,0,0.1,0)
content.BackgroundColor3 = Color3.fromRGB(16,16,16)

-- Search Bar
local search = Instance.new("TextBox", content)
search.Size = UDim2.new(0.9,0,0.08,0)
search.Position = UDim2.new(0.05,0,0.03,0)
search.PlaceholderText = "Search features (Demo)"
search.Text = ""
search.Font = Enum.Font.Gotham
search.TextScaled = true
search.BackgroundColor3 = Color3.fromRGB(40,40,40)
search.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", search)

-- Notification
local function notify(txt)
	local n = Instance.new("TextLabel", gui)
	n.Size = UDim2.fromScale(0.35,0.08)
	n.Position = UDim2.fromScale(0.325,0.05)
	n.BackgroundColor3 = Color3.fromRGB(0,140,0)
	n.Text = txt
	n.TextColor3 = Color3.new(1,1,1)
	n.Font = Enum.Font.GothamBold
	n.TextScaled = true
	Instance.new("UICorner", n)
	task.delay(2, function() n:Destroy() end)
end

-- Utilities
local function clear()
	for _,v in ipairs(content:GetChildren()) do
		if v:IsA("TextButton") then v:Destroy() end
	end
end

local function addButton(text)
	local b = Instance.new("TextButton", content)
	b.Size = UDim2.new(0.9,0,0.1,0)
	b.Position = UDim2.new(0.05,0,0,0)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextScaled = true
	b.BackgroundColor3 = Color3.fromRGB(0,140,0)
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b)
	b.MouseButton1Click:Connect(function()
		notify(text .. " (Demo)")
	end)
	return b
end

-- Tabs Data
local tabs = {
	{"🏠 Home", function()
		clear()
		addButton("Welcome to Kurdish Neo X ULTRA")
		addButton("UI Version v3")
	end},
	{"🧰 Tools", function()
		clear()
		addButton("Infinite Yield (UI Demo)")
		addButton("Fly (UI Demo)")
		addButton("Speed (UI Demo)")
		addButton("Jump Power (UI Demo)")
		addButton("Shiftlock (UI Demo)")
	end},
	{"🎯 Combat", function()
		clear()
		addButton("Aimbot (UI Demo)")
		addButton("Silent Aim (UI Demo)")
		addButton("Hitbox Expander (UI Demo)")
	end},
	{"👁 Visuals", function()
		clear()
		addButton("ESP (UI Demo)")
		addButton("Box ESP (UI Demo)")
		addButton("Tracers (UI Demo)")
		addButton("FOV Circle (UI Demo)")
	end},
	{"🌌 World", function()
		clear()
		addButton("RTX Mode (UI Demo)")
		addButton("Shaders (UI Demo)")
		addButton("Skybox Changer (UI Demo)")
	end},
	{"⚙️ Settings", function()
		clear()
		addButton("Dark / Light Mode (Demo)")
		addButton("UI Scale (Demo)")
		addButton("Keybinds (Demo)")
	end},
	{"ℹ️ About", function()
		clear()
		addButton("Made by a7uliiix")
		addButton("Kurdish Neo X • Safe UI")
	end},
}

-- Sidebar buttons
local y = 0.04
for _,t in ipairs(tabs) do
	local btn = Instance.new("TextButton", side)
	btn.Size = UDim2.new(0.9,0,0.1,0)
	btn.Position = UDim2.new(0.05,0,y,0)
	y += 0.11
	btn.Text = t[1]
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
	btn.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", btn)
	btn.MouseButton1Click:Connect(t[2])
end

-- Search filter
search:GetPropertyChangedSignal("Text"):Connect(function()
	for _,b in ipairs(content:GetChildren()) do
		if b:IsA("TextButton") then
			b.Visible = search.Text == "" or string.find(string.lower(b.Text), string.lower(search.Text)) ~= nil
		end
	end
end)

-- Toggle UI with RightShift
UIS.InputBegan:Connect(function(i,g)
	if not g and i.KeyCode == Enum.KeyCode.RightShift then
		main.Visible = not main.Visible
	end
end)

-- Load Home
tabs[1][2]()
