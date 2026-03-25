repeat task.wait() until game:IsLoaded()
local TweenService = game:GetService("TweenService")
local P_Serv = game:GetService("Players")
local LP = P_Serv.LocalPlayer or P_Serv:GetPropertyChangedSignal("LocalPlayer"):Wait()
local SafeGui
pcall(function() if type(gethui) == "function" then SafeGui = gethui() end end)
if not SafeGui then pcall(function() SafeGui = game:GetService("CoreGui") end) end
if not SafeGui then SafeGui = LP:WaitForChild("PlayerGui") end

local LoadGui = Instance.new("ScreenGui")
LoadGui.Name = "SkibidiLoadingUI_" .. tostring(math.random(1000,9999))
LoadGui.ResetOnSpawn = false
LoadGui.Parent = SafeGui
local LoadFrame = Instance.new("Frame")
LoadFrame.Size = UDim2.new(0, 240, 0, 120)
LoadFrame.Position = UDim2.new(0.5, -120, 0.5, -60)
LoadFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadFrame.BorderSizePixel = 0
LoadFrame.Parent = LoadGui
Instance.new("UICorner", LoadFrame).CornerRadius = UDim.new(0, 10)
local ls = Instance.new("UIStroke", LoadFrame)
ls.Thickness = 1.5
ls.Color = Color3.fromRGB(0, 200, 100)

local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Size = UDim2.new(1, 0, 0, 20)
WelcomeLabel.Position = UDim2.new(0, 0, 0, 8)
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Text = "👋 Xin chào, " .. LP.Name .. "!"
WelcomeLabel.TextColor3 = Color3.fromRGB(0, 150, 50)
WelcomeLabel.Font = Enum.Font.GothamBold
WelcomeLabel.TextSize = 12
WelcomeLabel.Parent = LoadFrame

local LoadTitle = Instance.new("TextLabel")
LoadTitle.Size = UDim2.new(1, 0, 0, 24)
LoadTitle.Position = UDim2.new(0, 0, 0, 28)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "tungtungsahur"
LoadTitle.TextColor3 = Color3.fromRGB(0, 200, 100)
LoadTitle.Font = Enum.Font.GothamBold
LoadTitle.TextSize = 14
LoadTitle.Parent = LoadFrame

local SubLabel = Instance.new("TextLabel")
SubLabel.Size = UDim2.new(1, 0, 0, 18)
SubLabel.Position = UDim2.new(0, 0, 0, 52)
SubLabel.BackgroundTransparency = 1
SubLabel.Text = "discord.gg/bFfNwzueg"
SubLabel.TextColor3 = Color3.fromRGB(0, 180, 80)
SubLabel.Font = Enum.Font.Gotham
SubLabel.TextSize = 11
SubLabel.Parent = LoadFrame

local ProgressBg = Instance.new("Frame")
ProgressBg.Size = UDim2.new(0.82, 0, 0, 8)
ProgressBg.Position = UDim2.new(0.09, 0, 0, 78)
ProgressBg.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
ProgressBg.BorderSizePixel = 0
ProgressBg.Parent = LoadFrame
Instance.new("UICorner", ProgressBg).CornerRadius = UDim.new(0, 4)

local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
ProgressBar.BorderSizePixel = 0
ProgressBar.Parent = ProgressBg
Instance.new("UICorner", ProgressBar).CornerRadius = UDim.new(0, 4)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 18)
StatusLabel.Position = UDim2.new(0, 0, 0, 95)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Loading..."
StatusLabel.TextColor3 = Color3.fromRGB(100, 150, 100)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 10
StatusLabel.Parent = LoadFrame

local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local tween = TweenService:Create(ProgressBar, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})
tween:Play()
tween.Completed:Wait()

StatusLabel.Text = "✅ Loaded!"
StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 100)
pcall(function() setclipboard("https://discord.gg/bFfNwzueg") end)
SubLabel.Text = "✅ Đã sao chép Server Discord!"
SubLabel.TextColor3 = Color3.fromRGB(0, 200, 100)
task.wait(0.2)
LoadGui:Destroy()

task.spawn(function()
    local PopGui = Instance.new("ScreenGui")
    PopGui.Name = "WelcomePopup_" .. tostring(math.random(1000,9999))
    PopGui.ResetOnSpawn = false
    PopGui.Parent = SafeGui
    local Pop = Instance.new("Frame")
    Pop.Size = UDim2.new(0, 280, 0, 50)
    Pop.Position = UDim2.new(0.5, -140, 0, -60)
    Pop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Pop.BackgroundTransparency = 1
    Pop.BorderSizePixel = 0
    Pop.Parent = PopGui
    Instance.new("UICorner", Pop).CornerRadius = UDim.new(0, 8)
    local ps = Instance.new("UIStroke", Pop)
    ps.Thickness = 2; ps.Color = Color3.fromRGB(0, 200, 100)
    
    local PopText = Instance.new("TextLabel")
    PopText.Size = UDim2.new(1, 0, 0.52, 0)
    PopText.Position = UDim2.new(0, 0, 0.04, 0)
    PopText.BackgroundTransparency = 1
    PopText.Text = "👋 Chào mừng, " .. LP.Name .. "!"
    PopText.TextColor3 = Color3.fromRGB(0, 200, 100)
    PopText.Font = Enum.Font.GothamBold
    PopText.TextSize = 13
    PopText.TextTransparency = 1
    PopText.Parent = Pop
    
    local PopSub = Instance.new("TextLabel")
    PopSub.Size = UDim2.new(1, 0, 0.38, 0)
    PopSub.Position = UDim2.new(0, 0, 0.58, 0)
    PopSub.BackgroundTransparency = 1
    PopSub.Text = "✅ tungtungsahur đã sẵn sàng!"
    PopSub.TextColor3 = Color3.fromRGB(0, 200, 100)
    PopSub.Font = Enum.Font.GothamBold
    PopSub.TextSize = 11
    PopSub.TextTransparency = 1
    PopSub.Parent = Pop
    
    TweenService:Create(Pop, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -140, 0, -45), BackgroundTransparency = 0}):Play()
    TweenService:Create(PopText, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    TweenService:Create(PopSub, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    task.wait(2.5)
    TweenService:Create(Pop, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -140, 0, -60), BackgroundTransparency = 1}):Play()
    TweenService:Create(PopText, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    TweenService:Create(PopSub, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    task.wait(0.35)
    PopGui:Destroy()
end)

local S = {
    P = game:GetService("Players"), W = game:GetService("Workspace"),
    RS = game:GetService("RunService"), V = game:GetService("VirtualInputManager"),
    L = game:GetService("Lighting"), ST = game:GetService("Stats"),
    GS = game:GetService("GuiService"), TS = game:GetService("TeleportService"),
    HTTP = game:GetService("HttpService"), CG = game:GetService("CoreGui")
}
local t_wait, t_spawn, m_random, m_floor, v3_new, cf_new = task.wait, task.spawn, math.random, math.floor, Vector3.new, CFrame.new

getgenv().Setting = getgenv().Setting or {Hitbox = {Enabled = true, Size = 60, Transparency = 0.7}, DeleteMap = false, AntiSusKill = false, DodgeSkill = true, SpamDash = true}
getgenv().LockedTarget = nil
getgenv().Retreating = false
getgenv().RetreatTracker = {}
getgenv().LastTargetName = nil
local Blacklist, IsWaitingSus = {}, false

local function getRealBounty()
    local ls = LP:FindFirstChild("leaderstats")
    if ls then
        local b = ls:FindFirstChild("Bounty/Honor") or ls:FindFirstChild("Bounty")
        if b then 
            local valStr = tostring(b.Value):upper():gsub(",", ""):gsub("%$", "")
            if valStr:match("M") then return (tonumber(valStr:gsub("M", "")) or 0) * 1000000
            elseif valStr:match("K") then return (tonumber(valStr:gsub("K", "")) or 0) * 1000 end
            return tonumber(valStr) or 0
        end
    end
    return 0
end

local EarnedFileName, KillFileName, TimeFileName = "SkibidiEarned_"..LP.UserId..".txt", "SkibidiKills_"..LP.UserId..".txt", "SkibidiTime_"..LP.UserId..".txt"
local function SaveEarned(val) pcall(function() if writefile then writefile(EarnedFileName, tostring(val)) end end) end
local function LoadEarned() local val = 0; pcall(function() if isfile and readfile and isfile(EarnedFileName) then val = tonumber(readfile(EarnedFileName)) or 0 end end); return val end
local function SaveKills(val) pcall(function() if writefile then writefile(KillFileName, tostring(val)) end end) end
local function LoadKills() local val = 0; pcall(function() if isfile and readfile and isfile(KillFileName) then val = tonumber(readfile(KillFileName)) or 0 end end); return val end
local function SaveTime(val) pcall(function() if writefile then writefile(TimeFileName, tostring(val)) end end) end
local function LoadTime() local val = 0; pcall(function() if isfile and readfile and isfile(TimeFileName) then val = tonumber(readfile(TimeFileName)) or 0 end end); return val end

local TotalEarned, LastBounty, TotalKills, SavedTime, StartTime, CurrentFPS, FrameCount, LastFPSTick = LoadEarned(), -1, LoadKills(), LoadTime(), tick(), 0, 0, tick()
local trackedHums = setmetatable({}, {__mode = "k"})

local ScreenGui = Instance.new("ScreenGui")
local MainFrame, UIStroke, UICorner, Title = Instance.new("Frame"), Instance.new("UIStroke"), Instance.new("UICorner"), Instance.new("TextLabel")
local AvatarImage, AvatarCorner, NameLabel = Instance.new("ImageLabel"), Instance.new("UICorner"), Instance.new("TextLabel")
local TotalLabel, EarnLabel, KillsLabel, TimeLabel = Instance.new("TextLabel"), Instance.new("TextLabel"), Instance.new("TextLabel"), Instance.new("TextLabel")
local WeaponLabel, RaceLabel, FactionLabel, StatLabel = Instance.new("TextLabel"), Instance.new("TextLabel"), Instance.new("TextLabel"), Instance.new("TextLabel")
local ResetBtn, ResetCorner, DiscordBtn, DiscordCorner = Instance.new("TextButton"), Instance.new("UICorner"), Instance.new("TextButton"), Instance.new("UICorner")
local ToggleBtn, ToggleCorner, ToggleStroke = Instance.new("TextButton"), Instance.new("UICorner"), Instance.new("UIStroke")

ScreenGui.Name = "SkibidiProUI_" .. tostring(math.random(1000,9999))
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = SafeGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 420, 0, 120) 
MainFrame.Active, MainFrame.Draggable = true, true
UICorner.CornerRadius = UDim.new(0, 8); UICorner.Parent = MainFrame
UIStroke.Parent = MainFrame; UIStroke.Thickness = 2; UIStroke.Color = Color3.fromRGB(0, 200, 100); UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

AvatarImage.Parent = MainFrame; AvatarImage.Size = UDim2.new(0, 35, 0, 35); AvatarImage.Position = UDim2.new(0, 10, 0, 30)
AvatarImage.BackgroundTransparency = 1; AvatarImage.Image = S.P:GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
AvatarCorner.CornerRadius = UDim.new(1, 0); AvatarCorner.Parent = AvatarImage

NameLabel.Parent = MainFrame; NameLabel.Size = UDim2.new(0, 100, 0, 20); NameLabel.Position = UDim2.new(0, 55, 0, 37)
NameLabel.BackgroundTransparency = 1; NameLabel.Font = Enum.Font.GothamBold; NameLabel.TextColor3 = Color3.fromRGB(0, 150, 50); NameLabel.TextSize = 12; NameLabel.TextXAlignment = Enum.TextXAlignment.Left; NameLabel.Text = LP.DisplayName

local function CreateLabel(obj, pos, size, color, text, textSize)
    obj.Parent = MainFrame; obj.BackgroundTransparency = 1; obj.Position = pos; obj.Size = size
    obj.Font = Enum.Font.GothamBold; obj.TextColor3 = color; obj.TextSize = textSize or 11
    obj.Text = text; obj.TextXAlignment = Enum.TextXAlignment.Left
end

CreateLabel(Title, UDim2.new(0, 10, 0, 8), UDim2.new(0, 200, 0, 20), Color3.fromRGB(0, 200, 100), "👑 tungtungsahur by khánh", 13)
CreateLabel(TotalLabel, UDim2.new(0, 150, 0, 30), UDim2.new(0, 130, 0, 18), Color3.fromRGB(0, 100, 50), "💰 TOTAL: --", 11)
CreateLabel(EarnLabel, UDim2.new(0, 150, 0, 48), UDim2.new(0, 130, 0, 18), Color3.fromRGB(0, 180, 80), "💵 EARNED: 0", 11)
CreateLabel(KillsLabel, UDim2.new(0, 150, 0, 66), UDim2.new(0, 130, 0, 18), Color3.fromRGB(0, 120, 60), "⚔️ KILLS: " .. tostring(TotalKills), 11) 
CreateLabel(TimeLabel, UDim2.new(0, 150, 0, 84), UDim2.new(0, 130, 0, 18), Color3.fromRGB(0, 140, 70), "⏳ TIME: 00:00:00", 11)
CreateLabel(WeaponLabel, UDim2.new(0, 280, 0, 30), UDim2.new(0, 140, 0, 18), Color3.fromRGB(0, 160, 80), "🗡️ WEAPON: None", 11)
CreateLabel(RaceLabel, UDim2.new(0, 280, 0, 48), UDim2.new(0, 140, 0, 18), Color3.fromRGB(0, 180, 90), "🧬 RACE: --", 11)
CreateLabel(FactionLabel, UDim2.new(0, 280, 0, 66), UDim2.new(0, 140, 0, 18), Color3.fromRGB(0, 200, 100), "🏴‍☠️ FACTION: --", 11)
CreateLabel(StatLabel, UDim2.new(0, 10, 1, -8), UDim2.new(0, 200, 0, 20), Color3.fromRGB(50, 150, 50), "⚡ FPS: -- |📶 PING: --", 10)
StatLabel.AnchorPoint = Vector2.new(0, 1)

ResetBtn.Parent = MainFrame; ResetBtn.Size = UDim2.new(0, 80, 0, 22); ResetBtn.AnchorPoint = Vector2.new(1, 1); ResetBtn.Position = UDim2.new(1, -8, 1, -8)
ResetBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100); ResetBtn.Text = "Reset"; ResetBtn.TextColor3 = Color3.new(1,1,1); ResetBtn.Font = Enum.Font.GothamBold; ResetBtn.TextSize = 10
ResetCorner.CornerRadius = UDim.new(0, 6); ResetCorner.Parent = ResetBtn

DiscordBtn.Parent = MainFrame; DiscordBtn.Size = UDim2.new(0, 80, 0, 22); DiscordBtn.AnchorPoint = Vector2.new(1, 1); DiscordBtn.Position = UDim2.new(1, -95, 1, -8)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 50); DiscordBtn.Text = "Discord"; DiscordBtn.TextColor3 = Color3.new(1, 1, 1); DiscordBtn.Font = Enum.Font.GothamBold; DiscordBtn.TextSize = 10
DiscordCorner.CornerRadius = UDim.new(0, 6); DiscordCorner.Parent = DiscordBtn

DiscordBtn.MouseButton1Click:Connect(function()
    pcall(function() setclipboard("https://discord.gg/bFfNwzueg") end)
    local oldText, oldColor = DiscordBtn.Text, DiscordBtn.BackgroundColor3
    DiscordBtn.Text = "Copied!"; DiscordBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    task.wait(1.5); DiscordBtn.Text = oldText; DiscordBtn.BackgroundColor3 = oldColor
end)

ToggleBtn.Parent = ScreenGui; ToggleBtn.Size = UDim2.new(0, 30, 0, 30); ToggleBtn.Position = UDim2.new(0.05, 0, 0.95, -160)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255); ToggleBtn.Text = "KHÁNH"; ToggleBtn.TextColor3 = Color3.fromRGB(0, 200, 100)
ToggleBtn.Font = Enum.Font.GothamBold; ToggleBtn.TextSize = 10; ToggleBtn.Active = true; ToggleBtn.Draggable = true
ToggleCorner.CornerRadius = UDim.new(0, 8); ToggleCorner.Parent = ToggleBtn
ToggleStroke.Parent = ToggleBtn; ToggleStroke.Thickness = 2; ToggleStroke.Color = Color3.fromRGB(0, 200, 100); ToggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

local function formatNumber(n)
    local f, k = tostring(m_floor(math.abs(n))), nil
    while true do f, k = string.gsub(f, "^(-?%d+)(%d%d%d)", '%1,%2'); if k==0 then break end end
    return (n < 0 and "-" or "") .. f
end

local function formatTime(sec) return string.format("%02d:%02d:%02d", m_floor(sec/3600), m_floor((sec%3600)/60), m_floor(sec%60)) end

ResetBtn.MouseButton1Click:Connect(function()
    TotalEarned, LastBounty = 0, getRealBounty(); SaveEarned(TotalEarned)
    TotalKills = 0; SaveKills(TotalKills); SavedTime = 0; SaveTime(0)
    StartTime = tick(); EarnLabel.Text = "💵 EARNED: 0"; KillsLabel.Text = "⚔️ KILLS: 0"; TimeLabel.Text = "⏳ TIME: 00:00:00"
end)

S.RS.RenderStepped:Connect(function()
    FrameCount = FrameCount + 1; local now = tick()
    if now - LastFPSTick >= 1 then CurrentFPS = FrameCount; FrameCount = 0; LastFPSTick = now end
end)

t_spawn(function()
    while t_wait(0.5) do
        local c = getRealBounty()
        if c > 0 then
            if LastBounty == -1 then LastBounty = c end
            if LastBounty ~= -1 and c < 30000000 then
                local d = c - LastBounty;
                if d > 0 and d < 50000 then TotalEarned = TotalEarned + d; SaveEarned(TotalEarned) end
            end
            LastBounty = c
        end
        pcall(function()
            TotalLabel.Text = "💰 TOTAL: " .. formatNumber((c > 0) and c or (LastBounty ~= -1 and LastBounty or 0))
            EarnLabel.Text = "💵 EARNED: " .. (TotalEarned > 0 and "+" or "") .. formatNumber(TotalEarned)
            local tElapsed = SavedTime + (tick() - StartTime)
            TimeLabel.Text = "⏳ TIME: " .. formatTime(tElapsed); SaveTime(tElapsed)
            
            local ping = 0
            pcall(function()
                local net = S.ST:FindFirstChild("Network")
                if net and net:FindFirstChild("ServerStatsItem") and net.ServerStatsItem:FindFirstChild("Data Ping") then ping = m_floor(net.ServerStatsItem["Data Ping"]:GetValue()) else ping = m_floor(LP:GetNetworkPing() * 1000) end
            end)
            StatLabel.Text = string.format("⚡ FPS: %d |📶 PING: %d ms", CurrentFPS, ping)
            
            local tool = LP.Character and LP.Character:FindFirstChildOfClass("Tool")
            WeaponLabel.Text = "🗡️ WEAPON: " .. (tool and tool.Name or "None")
            RaceLabel.Text = "🧬 RACE: " .. tostring((LP:FindFirstChild("Data") and LP.Data:FindFirstChild("Race")) and LP.Data.Race.Value or "--")
            FactionLabel.Text = "🏴‍☠️ FACTION: " .. tostring(LP.Team and LP.Team.Name or "--")
        end)
    end
end)

t_spawn(function() S.RS.RenderStepped:Connect(function() pcall(function() if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid:Move(v3_new(0, 0, -1), true) end end) end) end)

t_spawn(function() pcall(function() LP:WaitForChild("PlayerGui").DescendantAdded:Connect(function(obj) if obj:IsA("TextLabel") or obj:IsA("TextButton") then task.delay(0.2, function() local c = getRealBounty() if c >= 30000000 then local txt = string.lower(obj.Text or "") if (string.find(txt, "bounty") or string.find(txt, "honor")) and string.find(obj.Text, "%+") then local n = string.match(obj.Text:gsub(",", ""), "%d+") if n then local v = tonumber(n) if v and v > 0 and v < 50000 then TotalEarned = TotalEarned + v; SaveEarned(TotalEarned) end end end end end) end end) end) end)

pcall(function() local old old = hookmetamethod(game, "__namecall", function(self, ...) local m = getnamecallmethod() if m == "Kick" or m == "kick" then return end return old(self, ...) end) end)
t_spawn(function() pcall(function() S.GS.ErrorMessageChanged:Connect(function() t_wait(2); S.TS:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP) end) end) end)

local function applyAllSmoothGraphics(v)
    if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic; v.Reflectance = 0; v.CastShadow = false; for _, d in ipairs(v:GetDescendants()) do if d:IsA("Decal") or d:IsA("Texture") then d.Transparency = 1 end end
    elseif v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1 
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Lifetime = NumberRange.new(0) 
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("PostEffect") or v:IsA("BlurEffect") or v:IsA("BloomEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") then v.Enabled = false 
    elseif v:IsA("Explosion") then v.BlastPressure = 1; v.BlastRadius = 1 end
end

t_spawn(function() pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01; S.L.GlobalShadows = false; S.L.FogEnd = 9e9; S.L.Brightness = 2; local t = S.W:FindFirstChildOfClass("Terrain") if t then t.WaterWaveSize=0; t.WaterWaveSpeed=0; t.WaterReflectance=0; t.WaterTransparency=0 end for _, v in ipairs(S.W:GetDescendants()) do pcall(applyAllSmoothGraphics, v) end; S.W.DescendantAdded:Connect(function(v) pcall(applyAllSmoothGraphics, v) end) end) end)

local function GetValidBountyTarget()
    local bestTarget, bestName, minDist = nil, nil, math.huge
    local myPos = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") and LP.Character.HumanoidRootPart.Position
    
    for _, p in ipairs(S.P:GetPlayers()) do
        if p ~= LP then
            local char = p.Character
            if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                local hasFF = char:FindFirstChildOfClass("ForceField")
                local myLevel = LP:FindFirstChild("Data") and LP.Data:FindFirstChild("Level") and LP.Data.Level.Value or 1
                local tLevel = p:FindFirstChild("Data") and p.Data:FindFirstChild("Level") and p.Data.Level.Value or 1
                local validLevel = (tLevel >= myLevel - 300)
                
                local isAlly = false
                if LP.Team and p.Team and LP.Team == p.Team and LP.Team.Name ~= "Pirates" then isAlly = true end
                
                local notBlacklisted = not (Blacklist[p.Name] and tick() - Blacklist[p.Name] < 300)
                
                if not hasFF and not isAlly and validLevel and notBlacklisted then
                    if myPos then
                        local dist = (myPos - char.HumanoidRootPart.Position).Magnitude
                        if dist < minDist then
                            minDist = dist
                            bestTarget = char
                            bestName = p.Name
                        end
                    else
                        return char, p.Name
                    end
                end
            end
        end
    end
    return bestTarget, bestName
end

local function SmartEquipFruit()
    if not LP.Character then return nil end
    local m1Priority = {"Dragon", "Control", "Kitsune", "T-Rex", "Pain", "Gas", "Chop"}
    for _, v in ipairs(LP.Character:GetChildren()) do if v:IsA("Tool") then for _, f in ipairs(m1Priority) do if v.ToolTip == "Blox Fruit" or v.Name:match(f) then return v end end end end 
    for _, v in ipairs(LP.Backpack:GetChildren()) do if v:IsA("Tool") then for _, f in ipairs(m1Priority) do if v.ToolTip == "Blox Fruit" or v.Name:match(f) then return v end end end end 
    return nil
end

t_spawn(function()
    local tmr, last = {}, tick()
    while t_wait(0.1) do
        local now, dt = tick(), tick() - last; last = now
        pcall(function()
            local hp = LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health or 0
           
            local tChar, tName = GetValidBountyTarget()
            local t = tChar
            if t then getgenv().LastTargetName = tName end

            if t and t:FindFirstChild("Humanoid") and getgenv().Setting.AntiSusKill then
                local eHum = t.Humanoid
                if eHum.Health > 0 and eHum.Health <= (eHum.MaxHealth * 0.15) and not IsWaitingSus then
                    IsWaitingSus = true; if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid:UnequipTools() end; task.delay(2.5, function() IsWaitingSus = false end)
                end
            end
            
            if hp >= 7000 and getgenv().Retreating then getgenv().Retreating = false end
            if hp > 0 and hp < 4000 and not getgenv().Retreating then
                getgenv().Retreating = true; local eName = getgenv().LastTargetName
                if eName then
                    getgenv().RetreatTracker[eName] = (getgenv().RetreatTracker[eName] or 0) + 1
                    if getgenv().RetreatTracker[eName] >= 3 then
                        Blacklist[eName] = tick(); getgenv().LockedTarget = nil; return
                    end
                end
            end
            
            if t and t:FindFirstChild("HumanoidRootPart") and t:FindFirstChild("Humanoid") and t.Humanoid.Health > 0 and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                if Blacklist[t.Name] and tick() - Blacklist[t.Name] < 300 then getgenv().LockedTarget = nil; return end
                getgenv().LockedTarget = (not getgenv().Retreating) and t or nil
                
                if getgenv().LockedTarget then
                    local hum = t.Humanoid; if not trackedHums[hum] then trackedHums[hum] = true; hum.Died:Connect(function() TotalKills = TotalKills + 1; SaveKills(TotalKills); pcall(function() KillsLabel.Text = "⚔️ KILLS: " .. tostring(TotalKills) end) end) end
                end
                
                if getgenv().LockedTarget == t then
                    local dist = (LP.Character.HumanoidRootPart.Position - t.HumanoidRootPart.Position).Magnitude
                    if dist <= 40 then
                        tmr[t.Name] = (tmr[t.Name] or 0) + dt
                        local currentHp = t.Humanoid.Health
                        if not getgenv().LastHp then getgenv().LastHp = currentHp end
                        
                        if currentHp < getgenv().LastHp then
                            getgenv().LastHp = currentHp
                            tmr[t.Name] = 0 
                        elseif currentHp > getgenv().LastHp then
                            getgenv().LastHp = currentHp
                        end
                        
                        if tmr[t.Name] >= 4.5 then 
                            Blacklist[t.Name] = tick()
                            getgenv().LockedTarget = nil
                            tmr[t.Name] = nil
                            getgenv().LastHp = nil
                        end
                    else
                        tmr[t.Name] = 0
                    end

                    if getgenv().Setting and getgenv().Setting.Hitbox and getgenv().Setting.Hitbox.Enabled then
                        local sz = getgenv().Setting.Hitbox.Size or 60; if t.HumanoidRootPart.Size.X ~= sz then t.HumanoidRootPart.Size = v3_new(sz, sz, sz); t.HumanoidRootPart.Transparency = getgenv().Setting.Hitbox.Transparency or 0.7; t.HumanoidRootPart.CanCollide = false end
                    end
                elseif not getgenv().Retreating then 
                    tmr[t.Name] = 0 
                    getgenv().LastHp = nil
                end
            else 
                getgenv().LockedTarget = nil 
            end
        end)
        pcall(function() if getgenv().LockedTarget and LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health > 0 and not IsWaitingSus then local eT = SmartEquipFruit() if eT and eT.Parent ~= LP.Character then LP.Character.Humanoid:EquipTool(eT) end end end)
    end
end)

_G.AttackNoAnimation = true
local BaseSpeed = (game.PlaceId == 4442272000 or game.PlaceId == 7449423635) and 350 or 300
local function GetCurrentBlade() local s, r = pcall(require, LP.PlayerScripts:FindFirstChild("CombatFramework")); if s and r then return r.activeController end return nil end
local RigEvent; pcall(function() RigEvent = game:GetService("ReplicatedStorage"):WaitForChild("RigControllerEvent", 1) end)

S.RS.Stepped:Connect(function()
    pcall(function()
        if getgenv().LockedTarget and LP.Character and LP.Character:FindFirstChild("Humanoid") then
            local animator = LP.Character.Humanoid:FindFirstChildOfClass("Animator")
            if animator then for _, t in pairs(animator:GetPlayingAnimationTracks()) do t:Stop() end end
            if _G.AttackNoAnimation then
                local b = GetCurrentBlade()
                if b and b.equipped then
                    if b.animator and b.animator.ani then b.animator.ani:Stop() end
                    b.timeToNextAttack, b.hitboxMagnitude, b.active, b.blocking, b.focusStart, b.increment = 0, 80, false, false, 0, 3; b:attack()
                end
            end
        end
    end)
end)

task.spawn(function()
    while task.wait() do
        if _G.AttackNoAnimation and getgenv().LockedTarget then
            pcall(function() local b = GetCurrentBlade(); if b and b.equipped and b.currentWeaponModel and RigEvent then RigEvent:FireServer("hit", b.hitboxMagnitude, b.currentWeaponModel, b.currentWeaponModel.CFrame) end end)
        end
    end
end)

S.RS.Heartbeat:Connect(function()
    pcall(function()
        local t = getgenv().LockedTarget
        if t and t:FindFirstChild("HumanoidRootPart") and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            local hrp, tHrp = LP.Character.HumanoidRootPart, t.HumanoidRootPart
            local bvOld = hrp:FindFirstChild("BodyVelocity")
            if bvOld then bvOld:Destroy() end

            local tVel = tHrp.AssemblyLinearVelocity
            local predictedPos = tHrp.Position + Vector3.new(tVel.X, 0, tVel.Z) * 0.25
            local dist = (hrp.Position - tHrp.Position).Magnitude

            hrp.AssemblyLinearVelocity = v3_new(0, 0, 0)
            hrp.AssemblyAngularVelocity = v3_new(0, 0, 0)
            if dist > 200 then
                hrp.CFrame = cf_new(hrp.Position, tHrp.Position)
                hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * (BaseSpeed / 10)
            else
                hrp.CFrame = CFrame.new(predictedPos + Vector3.new(0, 2, 0), tHrp.Position)
            end
            hrp.AssemblyLinearVelocity = v3_new(0, 0, 0)
            hrp.AssemblyAngularVelocity = v3_new(0, 0, 0)
            for _, v in pairs(LP.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then v.CanCollide = false end
            end
        end
    end)
end)

local function applyUnderwater(char)
    local h = char:WaitForChild("Humanoid", 5)
    if h then
        h:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
        h:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
    end
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    if hrp then hrp.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5, 0.1, 0.1) end
end
if LP.Character then t_spawn(function() applyUnderwater(LP.Character) end) end
LP.CharacterAdded:Connect(function(c) t_spawn(function() applyUnderwater(c) end) end)

t_spawn(function()
    while t_wait(0.1) do
        pcall(function()
            local char = LP.Character
            if not char then return end
            local h = char:FindFirstChild("Humanoid")
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not h or not hrp then return end
            local state = h:GetState()
            if state == Enum.HumanoidStateType.Swimming or state == Enum.HumanoidStateType.Freefall then
                h:ChangeState(Enum.HumanoidStateType.Running)
                hrp.AssemblyLinearVelocity = v3_new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
            end
        end)
    end
end)

local function preventSitting(char) local h = char:WaitForChild("Humanoid", 5); if h then h:SetStateEnabled(Enum.HumanoidStateType.Seated, false) end end
if LP.Character then preventSitting(LP.Character) end; LP.CharacterAdded:Connect(preventSitting)
for _, v in pairs(S.W:GetDescendants()) do if v:IsA("Seat") or v:IsA("VehicleSeat") then v.Disabled = true end end
S.W.DescendantAdded:Connect(function(v) if v:IsA("Seat") or v:IsA("VehicleSeat") then v.Disabled = true end end)

t_spawn(function() while t_wait(0.3) do pcall(function() if getgenv().Setting.SpamDash and getgenv().LockedTarget and LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health > 0 then S.V:SendKeyEvent(true, Enum.KeyCode.Q, false, game); task.wait(0.05); S.V:SendKeyEvent(false, Enum.KeyCode.Q, false, game) end end) end end)

local IdleHopTime, LastCombatTick = 45, tick()
local function SmartServerHop()
    pcall(function()
        local req = S.HTTP:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100")); local srv = {}
        if req and req.data then for _, v in ipairs(req.data) do if type(v) == "table" and v.playing and v.maxPlayers and v.playing < (v.maxPlayers - 2) and v.id ~= game.JobId then table.insert(srv, v.id) end end end
        if #srv > 0 then S.TS:TeleportToPlaceInstance(game.PlaceId, srv[m_random(1, #srv)], LP) end
    end)
end

task.spawn(function()
    while task.wait(1) do
        if getgenv().LockedTarget then LastCombatTick = tick()
        else
            local inCombat = false; pcall(function() local m = LP.PlayerGui:FindFirstChild("Main"); if m and m:FindFirstChild("Combat") and m.Combat.Visible then inCombat = true end end)
            if inCombat then LastCombatTick = tick() elseif tick() - LastCombatTick >= IdleHopTime then SmartServerHop(); LastCombatTick = tick() + 9999 end
        end
    end
end)

