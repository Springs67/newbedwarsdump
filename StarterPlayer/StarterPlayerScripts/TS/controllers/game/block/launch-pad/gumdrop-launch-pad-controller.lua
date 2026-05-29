local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.AnimationUtil
local u6 = v4.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "blocks", "gumdrop-launch-pad-constants").GumdropLaunchPadConstants
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "GumdropLaunchPadController"
    end,
    ["__index"] = u10
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p19)
    p19.Name = "GumdropLaunchPadController"
end
function u16.KnitStart(p20) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
        [3] = u14
        [4] = u8
        [5] = u7
        [6] = u3
        [7] = u13
        [8] = u9
        [9] = u6
        [10] = u15
        [11] = u5
        [12] = u12
        [13] = u11
    --]]
    u10.KnitStart(p20)
    u2:getBlockDamageHook():connect(function(p21) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
            [3] = u8
            [4] = u7
            [5] = u3
            [6] = u13
        --]]
        local v22 = u2:getStore():getBlockAt(p21.blockRef.blockPosition)
        local v23
        if v22 == nil then
            v23 = v22
        else
            v23 = v22.Name
        end
        if v23 ~= u14.GUMDROP_BOUNCE_PAD then
            return nil
        end
        local v24 = v22:GetAttribute("PlacedByUserId")
        if v24 == nil then
            return nil
        end
        local v25 = u8:GetPlayerByUserId(v24)
        if not v25 then
            return nil
        end
        local v26 = u7.Controllers.TeamController:getPlayerTeam(v25)
        if not v26 then
            return nil
        end
        local v27 = false
        for v28, v29 in u3.values(v26.members) do
            local _ = v28 - 1
            if v29.userId == u8.LocalPlayer.UserId then
                v27 = true
                break
            end
        end
        if not v27 then
            p21.damage = p21.damage * u13.NON_FRIENDLY_BREAK_SPEED
        end
    end)
    u9.LaunchPadUsed:connect(function(p30) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u6
            [3] = u15
            [4] = u5
            [5] = u12
            [6] = u11
        --]]
        if p30.launchpad.Name == u14.GUMDROP_BOUNCE_PAD then
            local v31 = p30.launchpad
            u6:playSound(u15.SLIME_SQUISH_2, {
                ["position"] = p30.launchpad.Position
            })
            u5:playAnimation(v31.Jelly.Rig.AnimationController.Animator, u12:getAssetId(u11.JELLY_SQUISH), {
                ["looped"] = false
            })
        end
    end)
end
u7.CreateController(u16.new())
return nil