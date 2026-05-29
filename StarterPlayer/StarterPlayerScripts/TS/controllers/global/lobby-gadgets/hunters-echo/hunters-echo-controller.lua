local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u5 = v4.Linear
local u6 = v4.OutQuad
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "HuntersEchoController"
    end,
    ["__index"] = u14
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
        [1] = u14
    --]]
    u14.constructor(p24)
    p24.Name = "HuntersEchoController"
end
function u21.KnitStart(u25) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u3
        [3] = u18
        [4] = u19
        [5] = u15
        [6] = u13
        [7] = u9
        [8] = u1
        [9] = u16
        [10] = u20
    --]]
    u14.KnitStart(u25)
    u3.Controllers.PreloadController:preloadForItemType(u18.HUNTERS_ECHO, {
        ["sounds"] = { u19.MIDNIGHT_ACTIVATE },
        ["animations"] = { u15.ZEN_HOVER }
    })
    u13.ItemConsumed:connect(function(p26) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u9
            [3] = u3
            [4] = u1
            [5] = u16
            [6] = u20
            [7] = u25
        --]]
        if p26.itemType ~= u18.HUNTERS_ECHO then
            return nil
        end
        local v27 = p26.entity:getInstance() == u9.LocalPlayer.Character
        if v27 and u9.LocalPlayer.Character then
            local v28 = u9.LocalPlayer.Character:GetPivot().Position or Vector3.new(0, 0, 0)
            u3.Controllers.ScreenShakeController:shake(v28, v28 + Vector3.new(0, -1, 0), {
                ["cycles"] = 2,
                ["zMagnitude"] = 1,
                ["duration"] = 0.08
            })
        end
        local v29 = p26.entity:getInstance():GetPivot().Position
        if u1.instanceof(p26.entity, u16) then
            if u20.isGameServer() then
                local v30 = u3.Controllers.TeamController:getPlayerTeam(p26.entity:getPlayer())
                local v31 = u25
                local v32 = {}
                if v30 ~= nil then
                    v30 = v30.id
                end
                v32.myTeamId = v30
                v31:playHawkeyeEffect(v29, v32)
                return
            end
            if u20.isLobbyServer() and v27 then
                u25:playHawkeyeEffect(v29)
            end
        end
    end)
end
function u21.playHawkeyeEffect(p33, u34, u35) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u19
        [3] = u9
        [4] = u20
        [5] = u17
        [6] = u3
        [7] = u7
        [8] = u11
        [9] = u12
        [10] = u6
    --]]
    u2:playSound(u19.MIDNIGHT_ACTIVATE)
    local v36
    if u35 == nil then
        v36 = u35
    else
        v36 = u35.maxSize
    end
    local u37 = v36 == nil and 500 or v36
    local v38
    if u35 == nil then
        v38 = u35
    else
        v38 = u35.expansionDurationSec
    end
    local u39 = v38 == nil and 3 or v38
    local u40 = os.clock()
    p33:playBubbleEffect(u34, u37, u39)
    task.spawn(function() --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u20
            [3] = u17
            [4] = u35
            [5] = u3
            [6] = u7
            [7] = u11
            [8] = u2
            [9] = u19
            [10] = u12
            [11] = u6
            [12] = u40
            [13] = u39
            [14] = u37
            [15] = u34
        --]]
        local u41 = {}
        for _, v42 in u9:GetPlayers() do
            if u20.isLobbyServer() then
                local v43 = u17:getEntity(v42)
                local v44
                if v43 == nil then
                    v44 = v43
                else
                    v44 = v43:getInstance()
                end
                if v44 and v43:isAlive() then
                    if v43 ~= nil then
                        v43 = v43:getInstance()
                    end
                    u41[v43] = true
                end
            else
                local v45 = u35
                if v45 ~= nil then
                    v45 = v45.myTeamId
                end
                if v45 == "" or not v45 then
                    ::l15::
                    local v46 = u17:getEntity(v42)
                    local v47
                    if v46 == nil then
                        v47 = v46
                    else
                        v47 = v46:getInstance()
                    end
                    if v47 and v46:isAlive() then
                        u41[v46:getInstance()] = true
                    end
                else
                    local v48 = u3.Controllers.TeamController:getPlayerTeam(v42)
                    if v48 ~= nil then
                        v48 = v48.id
                    end
                    local v49 = u35
                    if v49 ~= nil then
                        v49 = v49.myTeamId
                    end
                    if v48 ~= v49 then
                        goto l15
                    end
                end
            end
        end
        local u50 = {}
        local function v68(p51) --[[ Line: 162 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u50
                [3] = u7
                [4] = u9
                [5] = u11
                [6] = u2
                [7] = u19
                [8] = u35
                [9] = u12
                [10] = u6
            --]]
            u41[p51] = nil
            u50[p51] = true
            local u52 = u7("Highlight", {
                ["FillTransparency"] = 0.8,
                ["OutlineTransparency"] = 0,
                ["FillColor"] = Color3.fromRGB(248, 71, 0),
                ["OutlineColor"] = Color3.fromRGB(248, 71, 0),
                ["Parent"] = p51
            })
            local v53 = u9:GetPlayerFromCharacter(p51)
            local v54 = u11
            if v53 ~= nil then
                v53 = v53.UserId
            end
            local v55 = v54:FindFirstChild("DisguisedPlayerBlock_" .. tostring(v53))
            local u56
            if v55 then
                u56 = u52:Clone()
                u56.Parent = v55
            else
                u56 = nil
            end
            local v57 = u2
            local v58 = u19.BEEPING
            local v59 = 0
            local v60 = {}
            for _ in u50 do
                v59 = v59 + 1
            end
            v60.playbackSpeedMultiplier = v59 / 10 + 0.95
            v57:playSound(v58, v60)
            local u61 = { u52 }
            if u56 then
                table.insert(u61, u56)
            end
            local v62 = task
            local v63 = u35
            if v63 ~= nil then
                v63 = v63.revealDuration
            end
            local v64 = v63 == nil and 3 or v63
            v62.delay(v64, function() --[[ Line: 214 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u6
                    [3] = u61
                    [4] = u52
                    [5] = u56
                --]]
                u12(5, u6, function(p65) --[[ Line: 215 ]]
                    --[[
                    Upvalues:
                        [1] = u61
                    --]]
                    for _, v66 in u61 do
                        v66.FillTransparency = (1 - p65) * 0.8 + p65 * 1
                        v66.OutlineTransparency = p65
                    end
                end):Wait()
                u52:Destroy()
                local v67 = u56
                if v67 ~= nil then
                    v67:Destroy()
                end
            end)
        end
        while true do
            local v69 = task.wait(0.05)
            if v69 == 0 or (v69 ~= v69 or (not v69 or os.clock() - u40 > u39 + 0.05)) then
                break
            end
            local v70 = os.clock() - u40
            local v71 = u39
            local v72 = u37 * (math.clamp(v70, 0, v71) / u39)
            for v73 in u41 do
                if (v73:GetPivot().Position - u34).Magnitude < v72 then
                    v68(v73)
                    task.wait(0)
                end
            end
        end
        for v74 in u41 do
            v68(v74)
            task.wait(0)
        end
    end)
end
function u21.playBubbleEffect(_, p75, p76, p77) --[[ Line: 259 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u20
        [4] = u12
        [5] = u5
    --]]
    local u78 = Vector3.new(1, 1, 1) * p76
    local u79 = u10.Assets.Misc.HawkeyeSphere:Clone()
    u79.Size = Vector3.new(0, 0, 0)
    u79.Position = p75
    u79.Parent = u11
    if u20.isLobbyServer() then
        u79.Color = Color3.new(0.6, 0.8, 0.95)
        u79.Transparency = 0.75
    end
    local u81 = u12(p77, u5, function(p80) --[[ Line: 271 ]]
        --[[
        Upvalues:
            [1] = u79
            [2] = u78
        --]]
        u79.Size = (Vector3.new(0, 0, 0)):Lerp(u78, p80)
    end)
    task.spawn(function() --[[ Line: 274 ]]
        --[[
        Upvalues:
            [1] = u81
            [2] = u79
        --]]
        u81:Wait()
        u79:Destroy()
    end)
end
u3.CreateController(u21.new())
return nil