repeat task.wait() until game:IsLoaded()

local P_Serv = game:GetService("Players")
local LP = P_Serv.LocalPlayer or P_Serv:GetPropertyChangedSignal("LocalPlayer"):Wait()

local S = {
    P = game:GetService("Players"), W = game:GetService("Workspace"),
    RS = game:GetService("RunService"), V = game:GetService("VirtualInputManager"),
    L = game:GetService("Lighting"), ST = game:GetService("Stats"),
    GS = game:GetService("GuiService"), TS = game:GetService("TeleportService"),
    HTTP = game:GetService("HttpService"), CG = game:GetService("CoreGui")
}

local t_wait, t_spawn = task.wait, task.spawn
local m_random, m_floor = math.random, math.floor
local v3_new, cf_new = Vector3.new, CFrame.new

getgenv().Setting = getgenv().Setting or {
    Hitbox = { Enabled = true, Size = 60, Transparency = 0.7 },
    DeleteMap = true,
    AntiSusKill = true,
    DodgeSkill = true,
    SpamDash = true,
    AutoHaki = true,
    AutoAwakening = true,
    AutoSkills = true,
    HideOthers = true
}

getgenv().LockedTarget = nil
getgenv().Retreating = false
getgenv().RetreatTracker = getgenv().RetreatTracker or {}
getgenv().LastTargetName = nil
local Blacklist = {}
local bLabel = nil
local lastUISearch = 0
local IsWaitingSus = false
local trackedHums = setmetatable({}, {__mode = "k"})

local function SyncBananaTarget()
    if bLabel and bLabel.Parent and bLabel.Text then
        local n = string.match(bLabel.Text, "Target %([%s]*([%w_]+)")
        if n then local p = S.P:FindFirstChild(n)
            return p and p.Character or nil 
        end
        return nil
    end
    if tick() - lastUISearch > 2 then
        lastUISearch = tick()
        for _, v in ipairs(S.CG:GetDescendants()) do 
            if v:IsA("TextLabel") and v.Text and string.find(v.Text, "Target %(") then bLabel = v; break end 
        end
        if not bLabel then
            local pGui = LP:FindFirstChild("PlayerGui")
            if pGui then
                for _, v in ipairs(pGui:GetDescendants()) do 
                    if v:IsA("TextLabel") and v.Text and string.find(v.Text, "Target %(") then bLabel = v; break end 
                end
            end
        end
    end
    return nil
end

local function SmartEquipFruit()
    if not LP.Character then return nil end
    local tip = "Blox Fruit"
    for _, v in ipairs(LP.Backpack:GetChildren()) do 
        if v:IsA("Tool") and (v.ToolTip == tip or v.Name:match(tip)) then return v end 
    end
    for _, v in ipairs(LP.Character:GetChildren()) do 
        if v:IsA("Tool") and (v.ToolTip == tip or v.Name:match(tip)) then return v end 
    end
    return nil
end

t_spawn(function()
    local tmr, last = {}, tick()
    while t_wait(0.1) do
        local now, dt = tick(), tick() - last
        last = now
        pcall(function()
            local hp = LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health or 0
            local t = SyncBananaTarget()
            
            if t then getgenv().LastTargetName = t.Name end

            if t and t:FindFirstChild("Humanoid") and getgenv().Setting.AntiSusKill then
                local eHum = t.Humanoid
                if eHum.Health > 0 and eHum.Health <= (eHum.MaxHealth * 0.15) and not IsWaitingSus then
                    IsWaitingSus = true
                    if LP.Character and LP.Character:FindFirstChild("Humanoid") then
                        LP.Character.Humanoid:UnequipTools()
                    end
                    task.delay(2.5, function()
                        IsWaitingSus = false
                    end)
                end
            end

            if hp >= 7000 and getgenv().Retreating then getgenv().Retreating = false end

            if hp > 0 and hp < 4000 and not getgenv().Retreating then
                getgenv().Retreating = true
                local eName = getgenv().LastTargetName
                if eName then
                    getgenv().RetreatTracker[eName] = (getgenv().RetreatTracker[eName] or 0) + 1
                    if getgenv().RetreatTracker[eName] >= 3 then
                        Blacklist[eName] = tick()
                        local bGuy = S.P:FindFirstChild(eName)
                        if bGuy and bGuy.Character and bGuy.Character:FindFirstChild("HumanoidRootPart") then
                            pcall(function() bGuy.Character.HumanoidRootPart.CFrame = cf_new(0, 50000, 0) end)
                        end
                        getgenv().LockedTarget = nil
                        return
                    end
                end
            end

            if t and t:FindFirstChild("HumanoidRootPart") and t:FindFirstChild("Humanoid") and t.Humanoid.Health > 0 and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                if Blacklist[t.Name] and tick() - Blacklist[t.Name] < 300 then
                    getgenv().LockedTarget = nil
                    return
                end

                local d = (LP.Character.HumanoidRootPart.Position - t.HumanoidRootPart.Position).Magnitude
                getgenv().LockedTarget = (d <= 300 and not getgenv().Retreating) and t or nil
                
                if getgenv().LockedTarget == t then
                    tmr[t.Name] = (tmr[t.Name] or 0) + dt
                    
                    if getgenv().Setting and getgenv().Setting.Hitbox and getgenv().Setting.Hitbox.Enabled then
                        local sz = getgenv().Setting.Hitbox.Size or 60
                        if t.HumanoidRootPart.Size.X ~= sz then
                            t.HumanoidRootPart.Size = v3_new(sz, sz, sz)
                            t.HumanoidRootPart.Transparency = getgenv().Setting.Hitbox.Transparency or 0.7
                            t.HumanoidRootPart.CanCollide = false
                        end
                    end
                    
                    if tmr[t.Name] >= 25 then
                        Blacklist[t.Name] = tick()
                        pcall(function() t.HumanoidRootPart.CFrame = cf_new(0, 50000, 0) end)
                        getgenv().LockedTarget, tmr[t.Name] = nil, nil
                    end
                elseif not getgenv().Retreating then
                    tmr[t.Name] = 0
                end
            else
                getgenv().LockedTarget = nil
            end
        end)
        
        pcall(function()
            if getgenv().LockedTarget and LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health > 0 then
                if not IsWaitingSus then
                    local eT = SmartEquipFruit()
                    if eT and eT.Parent ~= LP.Character then LP.Character.Humanoid:EquipTool(eT) end
                end
            end
        end)
    end
end)

local BaseSpeed = (game.PlaceId == 4442272000 or game.PlaceId == 7449423635) and 350 or 300

local function FastClick()
    pcall(function()
        if getgenv().LockedTarget and LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health > 0 then
            local tool = LP.Character:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate()
            end
            for _ = 1, 5 do
                S.V:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                S.V:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            end
        end
    end)
end

S.RS.RenderStepped:Connect(FastClick)
S.RS.Heartbeat:Connect(FastClick)

local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = Vector3.new(0, 0, 0)

S.RS.Heartbeat:Connect(function()
    pcall(function()
        local t = getgenv().LockedTarget
        if t and t:FindFirstChild("HumanoidRootPart") and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LP.Character.HumanoidRootPart
            local tHrp = t.HumanoidRootPart
            
            if not hrp:FindFirstChild("BodyVelocity") then
                local newBv = bv:Clone()
                newBv.Parent = hrp
            end

            local d = (hrp.Position - tHrp.Position).Magnitude
            local targetCFrame = tHrp.CFrame * CFrame.new(0, 1.5, 2.5) 

            if d > 200 then
                hrp.CFrame = CFrame.new(hrp.Position, tHrp.Position)
                hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * (BaseSpeed / 10)
            else
                hrp.CFrame = targetCFrame
                hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                tHrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end
            
            for _, v in pairs(LP.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end
        else
            if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                local currentHrp = LP.Character.HumanoidRootPart
                local activeBv = currentHrp:FindFirstChild("BodyVelocity")
                if activeBv then activeBv:Destroy() end
            end
        end
    end)
end)

local function preventSitting(character)
    local humanoid = character:WaitForChild("Humanoid", 5)
    if humanoid then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    end
end

if LP.Character then
    preventSitting(LP.Character)
end

LP.CharacterAdded:Connect(preventSitting)

for _, v in pairs(S.W:GetDescendants()) do
    if v:IsA("Seat") or v:IsA("VehicleSeat") then
        v.Disabled = true
    end
end

S.W.DescendantAdded:Connect(function(v)
    if v:IsA("Seat") or v:IsA("VehicleSeat") then
        v.Disabled = true
    end
end)

t_spawn(function()
    while t_wait(0.3) do
        pcall(function()
            if getgenv().Setting.SpamDash and getgenv().LockedTarget and LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health > 0 then
                S.V:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
                task.wait(0.05)
                S.V:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
            end
        end)
    end
end)

t_spawn(function()
    while t_wait(2) do
        pcall(function()
            if LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health > 0 then
                if getgenv().Setting.AutoHaki then
                    S.V:SendKeyEvent(true, Enum.KeyCode.J, false, game)
                    task.wait(0.1)
                    S.V:SendKeyEvent(false, Enum.KeyCode.J, false, game)
                end
                if getgenv().Setting.AutoAwakening and getgenv().LockedTarget then
                    local dist = (LP.Character.HumanoidRootPart.Position - getgenv().LockedTarget.HumanoidRootPart.Position).Magnitude
                    if dist <= 80 then
                        S.V:SendKeyEvent(true, Enum.KeyCode.Y, false, game)
                        task.wait(0.1)
                        S.V:SendKeyEvent(false, Enum.KeyCode.Y, false, game)
                    end
                end
            end
        end)
    end
end)

t_spawn(function()
    local keys = {Enum.KeyCode.Z, Enum.KeyCode.X, Enum.KeyCode.C, Enum.KeyCode.V}
    while t_wait(0.2) do
        pcall(function()
            if getgenv().Setting.AutoSkills and getgenv().LockedTarget and LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health > 0 then
                local dist = (LP.Character.HumanoidRootPart.Position - getgenv().LockedTarget.HumanoidRootPart.Position).Magnitude
                if dist <= 60 then
                    for _, key in ipairs(keys) do
                        if not getgenv().LockedTarget then break end
                        S.V:SendKeyEvent(true, key, false, game)
                        task.wait(0.05)
                        S.V:SendKeyEvent(false, key, false, game)
                        task.wait(0.15)
                    end
                end
            end
        end)
    end
end)

t_spawn(function()
    while t_wait(1) do
        pcall(function()
            if getgenv().Setting.HideOthers then
                for _, player in ipairs(S.P:GetPlayers()) do
                    if player ~= LP and player.Character then
                        local isTarget = (getgenv().LockedTarget and getgenv().LockedTarget == player.Character)
                        if not isTarget then
                            for _, v in ipairs(player.Character:GetDescendants()) do
                                if v:IsA("BasePart") or v:IsA("Decal") then
                                    v.Transparency = 1
                                elseif v:IsA("Accessory") or v:IsA("Clothing") or v:IsA("Shirt") or v:IsA("Pants") then
                                    v:Destroy()
                                end
                            end
                        else
                            for _, v in ipairs(player.Character:GetDescendants()) do
                                if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                                    v.Transparency = getgenv().Setting.Hitbox.Enabled and getgenv().Setting.Hitbox.Transparency or 0
                                elseif v:IsA("Decal") and v.Name == "face" then
                                    v.Transparency = 0
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
