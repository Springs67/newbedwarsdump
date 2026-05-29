local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "PirateTreasureEmoteController"
    end,
    ["__index"] = u9
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p18)
    p18.Name = "PirateTreasureEmoteController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u12
        [4] = u14
        [5] = u7
        [6] = u8
        [7] = u3
        [8] = u11
        [9] = u10
        [10] = u4
        [11] = u13
    --]]
    u9.KnitStart(p19)
    local v20 = u5.Controllers.EmoteHandlerController
    local v21 = u12.PIRATE_TREASURE
    local u22 = u14
    local u23 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
            return "Anonymous"
        end,
        ["__index"] = u22
    })
    u23.__index = u23
    function u23.new(...) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v24 = u23
        local v25 = setmetatable({}, v24)
        return v25:constructor(...) or v25
    end
    function u23.constructor(p26, ...) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22.constructor(p26, ...)
    end
    function u23.onEnable(_, _, u27, _, u28) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
            [3] = u3
            [4] = u11
            [5] = u10
            [6] = u4
            [7] = u13
        --]]
        local u29 = true
        local v30 = u7.Assets.Effects.TreasurePile:Clone()
        local u31 = u7.Assets.Effects.TreasureParts:Clone()
        local u32 = u27.PrimaryPart
        if not u32 then
            return nil
        end
        local v33 = u32.CFrame - Vector3.new(0, 1.5, 0)
        local v34 = (u32.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit
        if v34 ~= nil then
            v34 = v34 * 3
        end
        v30:PivotTo(v33 - v34)
        v30.Parent = u8
        local u35 = u3:playAnimation(u27, u11:getAssetId(u10.PIRATE_TREASURE_EMOTE_SITTING))
        if not u35 then
            return nil
        end
        task.delay(1.2, function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u4
                [3] = u13
                [4] = u32
                [5] = u31
                [6] = u8
                [7] = u28
                [8] = u3
                [9] = u27
                [10] = u11
                [11] = u10
                [12] = u35
            --]]
            if not u29 then
                return nil
            end
            u4:playSound(u13.TREASURE_PILE_EMOTE, {
                ["rollOffMaxDistance"] = 220,
                ["position"] = u32.Position
            })
            u31:PivotTo(CFrame.new(u32.Position))
            u31.Parent = u8
            local v36 = u31:GetChildren()
            local function v42(p37) --[[ Line: 94 ]]
                if p37:IsA("MeshPart") then
                    local v38 = math.random(-20, 20)
                    local v39 = math.random(30, 40)
                    local v40 = math.random
                    local v41 = Vector3.new(v38, v39, v40(-20, 20)) * p37.Mass
                    p37.Anchored = false
                    p37:ApplyImpulse(v41)
                end
            end
            for v43, v44 in v36 do
                v42(v44, v43 - 1, v36)
            end
            u28:GiveTask(u31)
            local u45 = u3:playAnimation(u27, u11:getAssetId(u10.PIRATE_TREASURE_EMOTE_LOOPED), {
                ["looped"] = true
            })
            if u45 then
                u28:GiveTask(u45)
                u28:GiveTask(function() --[[ Line: 113 ]]
                    --[[
                    Upvalues:
                        [1] = u45
                    --]]
                    local v46 = u45
                    if v46 ~= nil then
                        v46:Stop()
                    end
                    local v47 = u45
                    if v47 ~= nil then
                        v47:Destroy()
                    end
                end)
            end
            local v48 = u35
            if v48 ~= nil then
                v48:Stop()
            end
            local v49 = u35
            if v49 ~= nil then
                v49:Destroy()
            end
        end)
        u28:GiveTask(function() --[[ Line: 134 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            u29 = false
            return u29
        end)
        u28:GiveTask(function() --[[ Line: 138 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            local v50 = u35
            if v50 ~= nil then
                v50:Stop()
            end
            local v51 = u35
            if v51 ~= nil then
                v51:Destroy()
            end
        end)
        u28:GiveTask(u35)
        u28:GiveTask(v30)
    end
    function u23.onDisable(_, _, _, _) --[[ Line: 151 ]] end
    v20:registerHandler(v21, u23)
end
u5.CreateController(u15.new())
return nil