local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.WatchCollectionTag
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Acceleration
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.ReplicatedStorage
local u12 = v9.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants").GOLEM_HEAL_TOTEM_SPAWN_DELAY
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "SpiritGolemBossController"
    end,
    ["__index"] = u15
})
u22.__index = u22
function u22.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p25)
    p25.Name = "SpiritGolemBossController"
end
function u22.KnitStart(u26) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u5
        [3] = u21
        [4] = u8
        [5] = u10
        [6] = u2
        [7] = u19
        [8] = u4
        [9] = u20
        [10] = u16
        [11] = u11
        [12] = u17
        [13] = u12
        [14] = u13
        [15] = u18
        [16] = u7
    --]]
    u15.KnitStart(u26)
    u5(u21.GOLEM_BOSS, function(p27) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u26
        --]]
        u26.golemBossBeamAttachment = u8("Attachment", {
            ["Parent"] = p27:WaitForChild("Titan")
        })
    end)
    u5("titanHealBeam", function(p28) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        p28.Attachment1 = u26.golemBossBeamAttachment
    end)
    u5("entity", function(p29) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        if p29.Name ~= "TitanHealTotem" then
            return nil
        end
        u26:createEntityHealthbar(p29)
    end)
    u10:GetInstanceRemovedSignal("entity"):Connect(function(p30) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        if p30.Name ~= "TitanHealTotem" then
            return nil
        end
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. tostring(p30:GetAttribute("UUID")))
    end)
    u19.Client:Get("TitanHealTotemSpawn"):Connect(function(p31) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u20
            [3] = u16
            [4] = u26
            [5] = u11
            [6] = u17
            [7] = u12
            [8] = u13
            [9] = u18
            [10] = u7
        --]]
        u4:playSound(u20.FALLING_ROCKS, {
            ["playbackSpeedMultiplier"] = 0.5,
            ["fadeOutTime"] = 0.25,
            ["position"] = p31.position
        })
        local v32 = p31.position.X
        local v33 = p31.position.Y - 0.5 * u16
        local v34 = p31.position.Z
        u26:playStoneCrumbleEffect((Vector3.new(v32, v33, v34)))
        local u35 = u11.Assets.Blocks:FindFirstChild(u17.TITAN_HEAL_TOTEM)
        if u35 ~= nil then
            u35 = u35:Clone()
        end
        u35.Parent = u12
        u35:SetAttribute("NoNametag", true)
        local v36 = p31.position.X
        local v37 = p31.position.Y - 2 * u16
        local v38 = p31.position.Z
        local v39 = Vector3.new(v36, v37, v38)
        u35:PivotTo(CFrame.new(v39))
        local v40 = u35:GetPivot().Position
        local u41 = u35:GetPivot().Rotation
        u13(u18, u7, function(p42) --[[ Line: 88 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u41
            --]]
            local v43 = u35
            local v44 = CFrame.new
            local v45 = p42.X
            local v46 = p42.Y
            local v47 = p42.Z
            v43:PivotTo(v44((Vector3.new(v45, v46, v47))) * u41)
        end, v40, p31.position):Wait()
        task.delay(u18, function() --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            u35:Destroy()
        end)
    end)
end
function u22.createEntityHealthbar(_, p48) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u14
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["app"] = u14,
        ["appId"] = "StatefulEntityHpBarBillboard_" .. tostring(p48:GetAttribute("UUID"))
    }, {
        ["hpBarOffset"] = Vector3.new(0, 4.25, 0),
        ["gameEntity"] = p48,
        ["serverInstance"] = p48
    }, nil, p48)
end
function u22.playStoneCrumbleEffect(_, p49) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
        [3] = u18
    --]]
    local u50 = u11.Assets.Effects.HealTotemSummonEffect:Clone()
    u50.Parent = u12
    u50:PivotTo(CFrame.new(p49))
    task.delay(u18, function() --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        for v51, v52 in u50:GetDescendants() do
            local _ = v51 - 1
            if v52:IsA("ParticleEmitter") then
                v52.Enabled = false
            end
        end
    end)
    task.delay(u18 + 1, function() --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        u50:Destroy()
    end)
end
v6.CreateController(u22.new())
return nil