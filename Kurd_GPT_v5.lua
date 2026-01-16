
--====================================================
-- 💜 KURD GPT v5 | SUPER COOL OFFLINE ROBLOX AI
--====================================================
-- WHAT IS THIS?
-- Kurd GPT v5 is an OFFLINE, CLIENT-SIDE Roblox AI UI
-- It acts like ChatGPT but ONLY for Roblox things.
--
-- FEATURES:
-- • Neon Kurdish animated UI (draggable, mobile friendly)
-- • Button + text commands
-- • Explains each command in TEXT, then runs it
-- • Saves chat history between game joins
-- • Fun Kurdish facts
-- • 99 Nights in the Forest HUB (buttons)
-- • NO KEY SYSTEM
--====================================================

---------------- SERVICES ----------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

---------------- SAVE HISTORY ----------------
local FILE = "KurdGPT_v5_History.json"
local History = {}

if writefile and isfile and isfile(FILE) then
	pcall(function()
		History = HttpService:JSONDecode(readfile(FILE))
	end)
end

local function SaveHistory(q,a)
	table.insert(History,{q=q,a=a})
	if writefile then
		writefile(FILE,HttpService:JSONEncode(History))
	end
end

---------------- GUI BASE ----------------
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "KurdGPTv5"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,500,0,400)
main.Position = UDim2.new(0.5,-250,0.5,-200)
main.BackgroundColor3 = Color3.fromRGB(20,20,40)
main.Active = true
main.Draggable = true
Instance.new("UICorner",main).CornerRadius = UDim.new(0,18)

local glow = Instance.new("UIStroke",main)
glow.Thickness = 3
glow.Color = Color3.fromRGB(180,80,255)

TweenService:Create(glow,TweenInfo.new(2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),
	{Color = Color3.fromRGB(80,200,255)}):Play()

---------------- TITLE ----------------
local title = Instance.new("TextLabel",main)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundColor3 = Color3.fromRGB(120,0,200)
title.Text = "💜 Kurd GPT v5 | Roblox AI"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)

---------------- TABS ----------------
local tabs = {"GPT","History","Facts","99Nights"}
local pages = {}

for i,name in ipairs(tabs) do
	local btn = Instance.new("TextButton",main)
	btn.Size = UDim2.new(0,110,0,28)
	btn.Position = UDim2.new(0,10+(i-1)*120,0,45)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.BackgroundColor3 = Color3.fromRGB(60,0,120)
	btn.TextColor3 = Color3.new(1,1,1)

	local page = Instance.new("Frame",main)
	page.Position = UDim2.new(0,10,0,80)
	page.Size = UDim2.new(1,-20,1,-90)
	page.BackgroundColor3 = Color3.fromRGB(30,30,55)
	page.Visible = false
	Instance.new("UICorner",page)
	pages[name]=page

	btn.MouseButton1Click:Connect(function()
		for _,p in pairs(pages) do p.Visible=false end
		page.Visible=true
	end)
end
pages.GPT.Visible=true

---------------- GPT PAGE ----------------
local output = Instance.new("TextBox",pages.GPT)
output.Size = UDim2.new(1,-10,0.65)
output.Position = UDim2.new(0,5,0,5)
output.MultiLine=true
output.TextWrapped=true
output.ClearTextOnFocus=false
output.Text="پرسیارێک بنووسە..."
output.Font=Enum.Font.Code
output.TextSize=14
output.TextColor3=Color3.new(1,1,1)
output.BackgroundColor3=Color3.fromRGB(40,40,70)

local input = Instance.new("TextBox",pages.GPT)
input.Size = UDim2.new(1,-10,0,36)
input.Position = UDim2.new(0,5,1,-41)
input.PlaceholderText="مثال: هاکی سەریحی 80"
input.Font=Enum.Font.Gotham
input.TextSize=14
input.TextColor3=Color3.new(1,1,1)
input.BackgroundColor3=Color3.fromRGB(80,0,160)

---------------- HISTORY PAGE ----------------
local hist = Instance.new("TextBox",pages.History)
hist.Size = UDim2.new(1,-10,1,-10)
hist.Position = UDim2.new(0,5,0,5)
hist.MultiLine=true
hist.TextWrapped=true
hist.ClearTextOnFocus=false
hist.Font=Enum.Font.Code
hist.TextSize=13
hist.TextColor3=Color3.new(1,1,1)
hist.BackgroundColor3=Color3.fromRGB(35,35,65)

---------------- FACTS PAGE ----------------
local facts = {
	"کورد یەکێکە لە کۆنترین نەتەوەکان",
	"نەورۆز جەژنی ئازادیە",
	"زمانی کوردی چەند لهجەی هەیە",
	"گۆرانی کوردی ناسراوە",
	"کوردستان خاکی شاخ و دڵی ئازادە"
}

local factLabel = Instance.new("TextLabel",pages.Facts)
factLabel.Size = UDim2.new(1,-10,1,-10)
factLabel.Position = UDim2.new(0,5,0,5)
factLabel.TextWrapped=true
factLabel.Font=Enum.Font.GothamBold
factLabel.TextSize=20
factLabel.TextColor3=Color3.new(1,1,1)
factLabel.BackgroundTransparency=1
factLabel.Text="وتەیەکی خۆش"

---------------- BASIC HACKS ----------------
local function Noclip()
	RunService.Stepped:Connect(function()
		for _,v in pairs(player.Character:GetDescendants()) do
			if v:IsA("BasePart") then v.CanCollide=false end
		end
	end)
end

local function Fly()
	local hrp = player.Character:WaitForChild("HumanoidRootPart")
	local bv = Instance.new("BodyVelocity",hrp)
	bv.MaxForce = Vector3.new(1e6,1e6,1e6)
	bv.Velocity = Vector3.new(0,60,0)
end

local function ESP()
	for _,p in pairs(Players:GetPlayers()) do
		if p~=player and p.Character then
			if not p.Character:FindFirstChild("ESP") then
				local h = Instance.new("Highlight",p.Character)
				h.FillColor = Color3.fromRGB(255,0,0)
				h.OutlineColor = Color3.fromRGB(255,255,255)
			end
		end
	end
end

---------------- 99 NIGHTS PAGE ----------------
local function makeBtn(text,y,cb)
	local b=Instance.new("TextButton",pages["99Nights"])
	b.Size=UDim2.new(1,-20,0,32)
	b.Position=UDim2.new(0,10,0,y)
	b.Text=text
	b.Font=Enum.Font.GothamBold
	b.TextSize=14
	b.BackgroundColor3=Color3.fromRGB(100,0,180)
	b.TextColor3=Color3.new(1,1,1)
	Instance.new("UICorner",b)
	b.MouseButton1Click:Connect(cb)
end

makeBtn("⚔ Kill Aura",10,function()
	RunService.Stepped:Connect(function()
		for _,h in pairs(workspace:GetDescendants()) do
			if h:IsA("Humanoid") and h.Health>0 and h.Parent~=player.Character then
				h:TakeDamage(25)
			end
		end
	end)
end)

makeBtn("🎒 Auto Loot",50,function()
	for _,p in pairs(workspace:GetDescendants()) do
		if p:IsA("ProximityPrompt") then
			fireproximityprompt(p)
		end
	end
end)

makeBtn("👻 Jumpscare",90,function()
	local s=Instance.new("Sound",workspace)
	s.SoundId="rbxassetid://9125713501"
	s.Volume=8
	s:Play()
	Lighting.Brightness=5
end)

---------------- AI TEXT LOGIC ----------------
local function Reply(text)
	local t=text:lower()

	if t:find("سەریحی") then
		local n=t:match("%d+")
		if n then player.Character.Humanoid.WalkSpeed=tonumber(n) end
		return "💡 WalkSpeed: خێرای ڕۆشتن گۆڕدرا بۆ "..(n or "?")
	end

	if t:find("باز هەڵدان") then
		local n=t:match("%d+")
		if n then player.Character.Humanoid.JumpPower=tonumber(n) end
		return "💡 JumpPower: بەرزی بازدان گۆڕدرا"
	end

	if t:find("بەناو دیوار") then
		Noclip()
		return "💡 Noclip: دەتوانیت بەناو دیواردا بچیت"
	end

	if t:find("فڕین") then
		Fly()
		return "💡 Fly: فڕین چالاک کرا"
	end

	if t:find("ئی ئێس پی") then
		ESP()
		return "💡 ESP: یاریزانەکان دیار دەکرێن"
	end

	if t:find("وتەیەکی خۆش") then
		local f=facts[math.random(#facts)]
		factLabel.Text=f
		return f
	end

	if t:find("نەوەو شەو") then
		pages["99Nights"].Visible=true
		return "🌲 99 Nights HUB کرا"
	end

	return "❌ فرمان نەناسرا"
end

---------------- INPUT ----------------
input.FocusLost:Connect(function(enter)
	if enter then
		local ans=Reply(input.Text)
		output.Text=ans
		SaveHistory(input.Text,ans)
		hist.Text = hist.Text.."\nQ: "..input.Text.."\nA: "..ans.."\n---"
		input.Text=""
	end
end)

print("💜 Kurd GPT v5 Loaded")
