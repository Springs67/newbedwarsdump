local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.RunService
local u16 = v11.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-util").BedTeamUpgradeUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "BedAlarmController"
    end,
    ["__index"] = u17
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p24)
    p24.Name = "BedAlarmController"
    p24.bedAlarmModelMap = {}
    p24.highlightMap = {}
end
function u21.KnitStart(u25) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u8
        [3] = u20
        [4] = u19
        [5] = u12
    --]]
    u17.KnitStart(u25)
    u8.Controllers.PreloadController:runPreload({
        ["sounds"] = { u20.BED_ALARM_ACTIVATE, u20.BED_ALARM_TRIGGERED_FAR, u20.BED_ALARM_TRIGGERED }
    })
    u19.Client:OnEvent("BedAlarmActivated", function(p26) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25:handleBedAlarmActivated(p26)
    end)
    u19.Client:OnEvent("BedAlarmTriggered", function(p27) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25:handleBedAlarmTriggered(p27)
    end)
    u19.Client:OnEvent("BedBroken", function(p28) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        local v29 = u25.bedAlarmModelMap[p28]
        if v29 ~= nil then
            v29:Destroy()
        end
        u25.bedAlarmModelMap[p28] = nil
    end)
    for v30, v31 in u12:GetTagged("IntruderPlayer") do
        local _ = v30 - 1
        u25:addIntruderPlayerHighlight(v31)
    end
    u12:GetInstanceAddedSignal("IntruderPlayer"):Connect(function(p32) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        if u25:isSameTeamAsLocalPlayer(p32) then
            return nil
        end
        u25:addIntruderPlayerHighlight(p32)
    end)
    u12:GetInstanceRemovedSignal("IntruderPlayer"):Connect(function(p33) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        if u25:isSameTeamAsLocalPlayer(p33) then
            return nil
        end
        local v34 = u25.highlightMap[p33.UserId]
        if v34 ~= nil then
            v34:DoCleaning()
        end
    end)
end
function u21.isSameTeamAsLocalPlayer(_, p35) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u8
    --]]
    return p35 == u13.LocalPlayer and true or u8.Controllers.TeamController:getPlayerTeam(u13.LocalPlayer) == u8.Controllers.TeamController:getPlayerTeam(p35)
end
function u21.addIntruderPlayerHighlight(u36, u37) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u19
        [4] = u13
    --]]
    local u38 = u9.new()
    u36.highlightMap[u37.UserId] = u38
    u38:GiveTask((u10("Highlight", {
        ["FillTransparency"] = 0.7,
        ["OutlineTransparency"] = 0,
        ["Parent"] = u37.Character,
        ["FillColor"] = Color3.fromRGB(204, 28, 28),
        ["OutlineColor"] = Color3.fromRGB(194, 33, 33),
        ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
    })))
    u38:GiveTask(function() --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u37
        --]]
        u36.highlightMap[u37.UserId] = nil
    end)
    u38:GiveTask(u19.Client:Get("EntityDeathEvent"):Connect(function(p39) --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u37
            [3] = u38
        --]]
        if u13:GetPlayerFromCharacter(p39.entityInstance) == u37 then
            u38:DoCleaning()
        end
    end))
end
function u21.handleBedAlarmActivated(p40, p41) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u5
        [3] = u20
    --]]
    p40:getOrCreateBedAlarmModel(p41.teamId, p41.bedPosition)
    local v42 = u13.LocalPlayer.Character
    if not v42 then
        return nil
    end
    if (v42:GetPivot().Position - p41.bedPosition).Magnitude >= 100 then
        return nil
    end
    u5:playSound(u20.BED_ALARM_ACTIVATE, {
        ["rollOffMaxDistance"] = 70,
        ["position"] = p41.bedPosition
    })
end
function u21.getOrCreateBedAlarmModel(p43, p44, p45) --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u16
        [3] = u12
        [4] = u4
    --]]
    local v46 = p43.bedAlarmModelMap[p44]
    if not v46 then
        v46 = u14.Assets.Effects.BedAlarm:Clone()
        v46.Parent = u16
        v46:PivotTo(CFrame.new(p45 + Vector3.new(0, 15, 0)))
        v46:SetAttribute("RotationSpeed", 90)
        u12:AddTag(v46, "RotatingObject")
        for v47, v48 in v46:GetDescendants() do
            local _ = v47 - 1
            u4:setQueryIgnored(v48, true)
        end
        p43.bedAlarmModelMap[p44] = v46
    end
    return v46
end
function u21.handleBedAlarmTriggered(p49, p50) --[[ Line: 171 ]]
    p49:playBedAlarmSound(p50)
    p49:notifyTeamOfIntruder(p50)
    p49:triggerBedAlarmModel(p50)
end
function u21.triggerBedAlarmModel(u51, u52) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u15
        [3] = u18
    --]]
    local u53 = u9.new()
    local u54 = u51:getOrCreateBedAlarmModel(u52.teamId, u52.bedPosition)
    u53:GiveTask(function() --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u51
            [2] = u52
            [3] = u54
        --]]
        u51.bedAlarmModelMap[u52.teamId] = nil
        u54:Destroy()
    end)
    u54:SetAttribute("RotationSpeed", 270)
    local function u68(p55) --[[ Line: 187 ]]
        --[[
        Upvalues:
            [1] = u54
        --]]
        for v56, v57 in u54.Sides:GetChildren() do
            local _ = v56 - 1
            if v57:IsA("BasePart") then
                local v58
                if p55 then
                    v58 = Color3.fromRGB(226, 88, 88)
                else
                    v58 = Color3.fromRGB(82, 124, 174)
                end
                v57.Color = v58
            end
        end
        local v59 = u54.Recolor.Inner
        local v60
        if p55 then
            v60 = Color3.fromRGB(195, 70, 70)
        else
            v60 = Color3.fromRGB(33, 84, 185)
        end
        v59.Color = v60
        local v61 = u54.Recolor.Outer
        local v62
        if p55 then
            v62 = Color3.fromRGB(188, 74, 74)
        else
            v62 = Color3.fromRGB(82, 124, 174)
        end
        v61.Color = v62
        local v63 = u54.Recolor.Bulb
        local v64
        if p55 then
            v64 = Color3.fromRGB(195, 70, 70)
        else
            v64 = Color3.fromRGB(0, 16, 176)
        end
        v63.Color = v64
        local v65 = u54.Recolor.Bulb.GlowAttachment.Glow
        local v66 = ColorSequence.new
        local v67
        if p55 then
            v67 = Color3.fromRGB(255, 0, 0)
        else
            v67 = Color3.fromRGB(0, 60, 255)
        end
        v65.Color = v66(v67)
    end
    local u69 = true
    local u70 = 0
    u53:GiveTask(u15.Heartbeat:Connect(function(p71) --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u70
            [2] = u69
            [3] = u68
        --]]
        u70 = u70 + p71
        if u70 < 0.5 then
            return nil
        end
        u70 = 0
        u69 = not u69
        u68(u69)
    end))
    task.delay(u18.BedAlarmTriggeredDuration, function() --[[ Line: 214 ]]
        --[[
        Upvalues:
            [1] = u53
        --]]
        u53:DoCleaning()
    end)
end
function u21.notifyTeamOfIntruder(_, p72) --[[ Line: 218 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u2
    --]]
    local v73 = p72.teamId
    local v74 = u8.Controllers.TeamController:getPlayerTeam(u13.LocalPlayer)
    if v74 ~= nil then
        v74 = v74.id
    end
    if v73 == v74 then
        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
            ["message"] = "[Bed Alarm]: An intruder is near your bed!"
        })
    end
end
function u21.playBedAlarmSound(_, p75) --[[ Line: 231 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u5
        [4] = u20
        [5] = u18
    --]]
    local v76 = p75.teamId
    local v77 = u8.Controllers.TeamController:getPlayerTeam(u13.LocalPlayer)
    if v77 ~= nil then
        v77 = v77.id
    end
    local v78 = v76 == v77
    local v79 = u13.LocalPlayer.Character
    if v79 ~= nil then
        v79 = v79:GetPivot().Position
    end
    local v80
    if v79 then
        v80 = (v79 - p75.bedPosition).Magnitude < 30
    else
        v80 = false
    end
    local v81 = u5
    local v82
    if v80 or not v78 then
        v82 = u20.BED_ALARM
    else
        v82 = u20.BED_ALARM_TRIGGERED_FAR
    end
    local v83 = {
        ["rollOffMaxDistance"] = 100,
        ["looped"] = true,
        ["volumeMultiplier"] = 0.75
    }
    local v84
    if v80 or not v78 then
        v84 = p75.bedPosition
    else
        v84 = nil
    end
    v83.position = v84
    local u85 = v81:playSound(v82, v83)
    if u85 then
        task.delay(u18.BedAlarmTriggeredDuration, function() --[[ Line: 255 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u85
            --]]
            u5:tweenSoundVolume(u85, 0, 0.2)
            task.delay(0.2, function() --[[ Line: 257 ]]
                --[[
                Upvalues:
                    [1] = u85
                --]]
                u85:Stop()
            end)
        end)
    end
end
v7.CreateController(u21.new())
return nil