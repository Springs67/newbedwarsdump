local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "StarCallerStaffController"
    end,
    ["__index"] = u8
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
    --]]
    u8.constructor(p17)
    p17.Name = "StarCallerStaffController"
    p17.maid = u5.new()
end
function u14.KnitStart(p18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u6
        [4] = u9
        [5] = u3
        [6] = u11
        [7] = u10
    --]]
    u8.KnitStart(p18)
    u7.AbilityUsed:connect(function(p19) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u9
            [3] = u3
            [4] = u11
            [5] = u10
        --]]
        if p19.userCharacter == u6.LocalPlayer.Character and p19.ability == u9.METEOR_SUMMON then
            local v20 = u3:playAnimation(u6.LocalPlayer, u11:getAssetId(u10.HALLOWEEN_BOSS_CAST))
            if v20 ~= nil then
                v20:AdjustSpeed(0.5)
            end
        end
    end)
end
function u14.isRelevantItem(_, p21) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    return p21.itemType == u13.METEOR_CALLER
end
function u14.onEnable(u22, _, _) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u9
        [3] = u12
    --]]
    u22:setupYield(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u2
            [3] = u9
            [4] = u12
        --]]
        local v23 = u22.maid
        local v24 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v25 = u9.METEOR_SUMMON
        local v26 = {
            ["abilityType"] = "ItemPrimary",
            ["abilityButton"] = {
                ["icon"] = u12.METEOR
            }
        }
        v23:GiveTask(v24:enableAbility(v25, v26):expect())
        return function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22.maid:DoCleaning()
        end
    end)
end
function u14.onDisable(p27) --[[ Line: 62 ]]
    p27.maid:DoCleaning()
end
v4.CreateController(u14.new())
return nil