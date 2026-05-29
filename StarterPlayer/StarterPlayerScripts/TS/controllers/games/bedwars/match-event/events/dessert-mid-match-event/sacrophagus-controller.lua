local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCharacter
local u5 = v2.WatchCollectionTag
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.RunService
local u12 = v8.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "team", "team-controller").TeamController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "SacrophagusController"
    end,
    ["__index"] = u16
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p25)
    p25.Name = "SacrophagusController"
    p25.modelMap = {}
    p25.armorMap = {}
    p25.effectMap = {}
end
function u22.KnitStart(u26) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u5
        [3] = u10
        [4] = u7
        [5] = u12
        [6] = u11
        [7] = u4
        [8] = u20
        [9] = u19
        [10] = u13
        [11] = u9
        [12] = u17
        [13] = u15
        [14] = u3
        [15] = u18
        [16] = u6
        [17] = u14
    --]]
    u16.KnitStart(u26)
    u5("sacrophagus", function(p27) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u26
            [3] = u7
            [4] = u12
            [5] = u11
        --]]
        local u28 = u10.Assets.Effects.sacrophagus:Clone()
        u28.Parent = p27
        local v29 = p27:GetAttribute("OwnerTeamID")
        u26.modelMap[v29] = u28
        local u30 = u7.new()
        local u31 = p27.Position + Vector3.new(0, 1, 0)
        local u32 = u12:GetServerTimeNow()
        u30:GiveTask(u11.Heartbeat:Connect(function(p33) --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u31
                [3] = u28
            --]]
            u32 = u32 + p33
            local v34 = u32 / 2
            local v35 = math.sin(v34) * 1 + 0.3
            local v36 = Vector3.new(0, v35, 0)
            u28:PivotTo((CFrame.new(u31 + v36)))
        end))
        p27.AncestryChanged:Connect(function(_, p37) --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            if p37 == nil then
                u30:DoCleaning()
            end
        end)
    end)
    u4(function(p38, p39) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u19
            [3] = u26
        --]]
        if u20:isActive(p39, u19.BHAA_BUFF) then
            u26:equipEgyptionArmor(p38, p39)
        end
        local v40 = u26.effectMap[p38]
        if v40 ~= nil then
            v40:DoCleaning()
        end
    end)
    u13.StatusEffectAdded:connect(function(p41) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u9
            [3] = u26
        --]]
        local v42 = p41.statusEffect == u19.BHAA_BUFF and u9:GetPlayerFromCharacter(p41.entityInstance)
        if v42 then
            u26:equipEgyptionArmor(v42, p41.entityInstance)
        end
    end)
    u13.StatusEffectRemoved:connect(function(p43) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u9
            [3] = u26
        --]]
        local v44 = p43.statusEffect == u19.BHAA_BUFF and u9:GetPlayerFromCharacter(p43.entityInstance)
        if v44 then
            u26:removeEgyptionArmor(v44, p43.entityInstance)
        end
    end)
    u17.Client:Get("SacrophagusRevive"):Connect(function(u45) --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u26
            [3] = u10
            [4] = u12
            [5] = u7
            [6] = u11
            [7] = u9
            [8] = u3
            [9] = u18
            [10] = u6
            [11] = u14
        --]]
        local v46 = u15:getPlayerTeam(u45.player)
        if v46 ~= nil then
            v46 = v46.id
        end
        if v46 == "" or not v46 then
            return nil
        end
        local u47 = u26.modelMap[v46]
        if not u47 then
            return nil
        end
        local v48 = u47.PrimaryPart
        if v48 ~= nil then
            v48 = v48.Position
        end
        if not v48 then
            return nil
        end
        local u49 = u10.Assets.Misc.ReviveDummy:Clone()
        local u50 = {}
        for v51, v52 in u49:GetDescendants() do
            local _ = v51 - 1
            if v52:IsA("MeshPart") then
                table.insert(u50, v52)
            end
        end
        u49:PivotTo(u45.spawnPosition - Vector3.new(0, 3, 0))
        local v53 = u10.Assets.Effects.ReviveString:Clone()
        local v54 = v53:WaitForChild("Part1", 1)
        local v55 = v53:WaitForChild("Part2", 1)
        v53.Parent = u12
        local v56 = u26.effectMap[u45.player]
        if v56 == nil then
            v56 = u7.new()
        end
        v56:DoCleaning()
        v56:GiveTask(v53)
        v56:GiveTask(u49)
        u26.effectMap[u45.player] = v56
        local u57 = u45.respawnTime
        local u58 = nil
        u58 = u11.Heartbeat:Connect(function(p59) --[[ Line: 160 ]]
            --[[
            Upvalues:
                [1] = u57
                [2] = u49
                [3] = u12
                [4] = u58
                [5] = u45
                [6] = u50
            --]]
            u57 = u57 - p59 / 2
            if u57 < 0 or u49.Parent ~= u12 then
                u58:Disconnect()
                return nil
            end
            for v60, v61 in u50 do
                local _ = v60 - 1
                v61.Transparency = u57 / u45.respawnTime
            end
        end)
        u49.Parent = u12
        if v54 ~= nil then
            v54:PivotTo(u47.PrimaryPart.CFrame)
        end
        if v55 ~= nil then
            v55:PivotTo(u45.spawnPosition)
        end
        if u45.player == u9.LocalPlayer then
            v56:GiveTask(u3:playSound(u18.WARLOCK_ALTAR_LOOP))
            v56:GiveTask(function() --[[ Line: 184 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u18
                --]]
                u3:playSound(u18.SACROPHAGUS_REVIVE)
            end)
            u6.Controllers.VignetteController:createVignette(u14.REVIVE)
            v56:GiveTask(function() --[[ Line: 188 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u14
                --]]
                u6.Controllers.VignetteController:destroyVignette(u14.REVIVE)
            end)
            task.delay(0.2, function() --[[ Line: 191 ]]
                --[[
                Upvalues:
                    [1] = u47
                    [2] = u12
                    [3] = u49
                --]]
                if u47 then
                    local v62 = u12.CurrentCamera
                    if not v62 then
                        return nil
                    end
                    v62.CameraSubject = u49.PrimaryPart
                end
            end)
        end
        local v63 = u47.PrimaryPart
        if v63 ~= nil then
            v63:WaitForChild("holy", 1)
        end
        local v64 = u47.PrimaryPart
        if v64 ~= nil then
            for v65, v66 in v64:GetChildren() do
                local _ = v65 - 1
                if v66:IsA("ParticleEmitter") then
                    v66.Enabled = true
                end
            end
        end
        local v67 = u26.soundTrack
        if v67 ~= nil then
            v67:Stop()
        end
        local v68 = u26.soundTrack
        if v68 ~= nil then
            v68:Destroy()
        end
        u26.soundTrack = u3:playSound(u18.WARLOCK_ALTAR_LOOP, {
            ["position"] = v48
        })
        task.delay(5, function() --[[ Line: 228 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u47
            --]]
            local v69 = u26.soundTrack
            if v69 ~= nil then
                v69:Stop()
            end
            local v70 = u26.soundTrack
            if v70 ~= nil then
                v70:Destroy()
            end
            local v71 = u47.PrimaryPart
            if v71 ~= nil then
                for v72, v73 in v71:GetChildren() do
                    local _ = v72 - 1
                    if v73:IsA("ParticleEmitter") then
                        v73.Enabled = false
                    end
                end
            end
        end)
    end)
end
function u22.equipEgyptionArmor(p74, p75, p76) --[[ Line: 258 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u21
    --]]
    local v77 = p74.armorMap[p75]
    if v77 == nil then
        v77 = u7.new()
    end
    v77:DoCleaning()
    for v78, v79 in u10.Assets.Effects.EgyptionArmorEffect:Clone():GetChildren() do
        local _ = v78 - 1
        v77:GiveTask(v79)
        v79.Parent = p76
    end
    p74.armorMap[p75] = v77
    u21:weldCharacterAccessories(p76)
end
function u22.removeEgyptionArmor(p80, p81, _) --[[ Line: 281 ]]
    local v82 = p80.armorMap[p81]
    if v82 then
        v82:DoCleaning()
    end
end
u6.CreateController(u22.new())
return nil