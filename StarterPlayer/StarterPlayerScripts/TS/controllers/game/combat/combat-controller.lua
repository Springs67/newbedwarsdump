local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "multi-kill-constants").MultiKillConstants
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "encoding", "sound-encoding").getAssetIdFromEncoding
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "CombatController"
    end,
    ["__index"] = u10
})
u19.__index = u19
function u19.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u18
    --]]
    u10.constructor(p22)
    p22.Name = "CombatController"
    p22.killSounds = {
        u18.PLAYER_KILL_1,
        u18.PLAYER_KILL_2,
        u18.PLAYER_KILL_3,
        u18.PLAYER_KILL_4,
        u18.PLAYER_KILL_5,
        u18.PLAYER_KILL_6
    }
    p22.multiKillLoops = {
        u18.PLAYER_MULTIKILL_LOOP_2,
        u18.PLAYER_MULTIKILL_LOOP_3,
        u18.PLAYER_MULTIKILL_LOOP_4,
        u18.PLAYER_MULTIKILL_LOOP_5,
        u18.PLAYER_MULTIKILL_LOOP_6
    }
    p22.attackIndicatorSounds = { u18.ATTACK_INDICATOR_1, u18.ATTACK_INDICATOR_2, u18.ATTACK_INDICATOR_3 }
    p22.damageSounds = { u18.DAMAGE_1, u18.DAMAGE_2, u18.DAMAGE_3 }
end
function u19.KnitStart(u23) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
        [3] = u16
        [4] = u15
        [5] = u9
        [6] = u6
        [7] = u8
        [8] = u4
        [9] = u3
        [10] = u14
        [11] = u18
        [12] = u17
        [13] = u13
    --]]
    u11.On(function(p24, _, _, _, _, _, _, _, _, _, _, _, p25, _) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u16
            [3] = u15
            [4] = u9
            [5] = u6
        --]]
        local v26 = u12:getState().Game.queueType
        if v26 and u16[v26].disableDamageHighlight then
            return nil
        end
        if p25 then
            return nil
        end
        debug.profilebegin("damage-highlight")
        local v27 = u15:getEntity(p24)
        if v27 then
            local v28 = v27:getInstance()
            if v28.PrimaryPart and (v28:GetPrimaryPartCFrame().Position - u9.CurrentCamera.CFrame.Position).Magnitude <= 200 then
                local u29 = v28:FindFirstChild("_DamageHighlight_") or u6("Highlight", {
                    ["Name"] = "_DamageHighlight_",
                    ["OutlineTransparency"] = 1,
                    ["FillTransparency"] = 0.4,
                    ["Parent"] = v28,
                    ["FillColor"] = Color3.fromRGB(255, 0, 0),
                    ["DepthMode"] = Enum.HighlightDepthMode.Occluded
                })
                u29.Enabled = true
                task.delay(0.2, function() --[[ Line: 73 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    local v30 = u29
                    if v30 ~= nil then
                        v30 = v30.Parent
                    end
                    if v30 then
                        u29.Enabled = false
                    end
                end)
            end
        end
        debug.profileend()
    end)
    u11.On(function(p31, _, _, _, p32, _, _, p33, _, p34, p35, _, _, _) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u3
            [4] = u23
            [5] = u14
            [6] = u18
        --]]
        if p32 == u8.LocalPlayer.Character then
            local v36 = u4
            local v37 = u3.fromList
            local v38 = u23.attackIndicatorSounds
            v36:playSound(v37(unpack(v38)))
        end
        local v39 = p31 == u8.LocalPlayer.Character
        if not (p31.PrimaryPart or v39) then
            return nil
        end
        local v40 = nil
        if p34 == 0 or (p34 ~= p34 or not p34) then
            local v41 = u3.fromList
            local v42 = u23.damageSounds
            v40 = v41(unpack(v42))
        else
            local v43 = u14(p34)
            if v43 ~= "" then
                v40 = v43 or v40
            end
        end
        if p33 ~= nil then
            p33 = p33.swingTimeRatio
        end
        if p33 ~= nil and p33 >= 0.9 then
            v40 = u18.DAMAGE_HIT_HARD
        end
        if p35 ~= nil then
            local v44 = 0
            p35 = {}
            for v45, v46 in p35 do
                local _ = v45 - 1
                local v47 = u14(v46)
                if v47 ~= nil then
                    v44 = v44 + 1
                    p35[v44] = v47
                end
            end
        end
        local v48 = p35 == nil and {} or p35
        local v49 = { v40 }
        local v50 = #v49
        table.move(v48, 1, #v48, v50 + 1, v49)
        for _, v51 in v49 do
            if v51 ~= "" and v51 then
                local v52 = u4
                local v53 = {}
                local v54
                if v39 then
                    v54 = nil
                else
                    v54 = p31.PrimaryPart
                    if v54 ~= nil then
                        v54 = v54.Position
                    end
                end
                v53.position = v54
                v52:playSound(v51, v53)
            end
        end
    end)
    u17.Client:WaitFor("EntityDeathEvent"):andThen(function(p55) --[[ Line: 159 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u8
            [3] = u4
            [4] = u13
        --]]
        p55:Connect(function(p56) --[[ Line: 160 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u8
                [3] = u4
                [4] = u13
            --]]
            if not u23.killSounds or p56.noKillSound then
                return nil
            end
            if p56.fromEntity and p56.fromEntity == u8.LocalPlayer.Character then
                local v57 = p56.multiKillCount
                local v58 = v57 == nil and 1 or v57
                local v59 = v58 - 1
                local v60 = #u23.killSounds - 1
                local v61 = math.min(v59, v60)
                u4:playSound(u23.killSounds[v61 + 1])
                local v62 = v58 - 2
                local v63 = #u23.multiKillLoops - 1
                local v64 = math.min(v62, v63)
                if v64 >= 0 then
                    local u65 = u4:playSound(u23.multiKillLoops[v64 + 1], {
                        ["looped"] = true
                    })
                    if u23.activeMultiKillLoop then
                        u23.activeMultiKillLoop:Stop()
                        u23.activeMultiKillLoop:Destroy()
                    end
                    u23.activeMultiKillLoop = u65
                    task.delay(u13.MULTI_KILL_EXPIRATION_TIME_SEC, function() --[[ Line: 182 ]]
                        --[[
                        Upvalues:
                            [1] = u65
                            [2] = u23
                            [3] = u4
                        --]]
                        if not u65 then
                            return nil
                        end
                        if u23.activeMultiKillLoop == u65 then
                            u4:tweenSoundVolume(u65, 0, 1)
                            task.delay(1.5, function() --[[ Line: 188 ]]
                                --[[
                                Upvalues:
                                    [1] = u65
                                --]]
                                u65:Stop()
                                u65:Destroy()
                            end)
                            u23.activeMultiKillLoop = nil
                        end
                    end)
                end
            end
        end)
    end)
end
function u19.setKillSounds(p66, p67) --[[ Line: 201 ]]
    p66.killSounds = p67
end
return {
    ["CombatController"] = v5.CreateController(u19.new())
}