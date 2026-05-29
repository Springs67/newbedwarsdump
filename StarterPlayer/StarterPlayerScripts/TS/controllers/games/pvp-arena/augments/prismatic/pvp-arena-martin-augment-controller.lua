local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u7 = v1.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "PvPArenaMartinAugmentController"
    end,
    ["__index"] = u7
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
    --]]
    u7.constructor(p12, u5.MARTIN)
    p12.Name = "PvPArenaMartinAugmentController"
end
function u9.onActivated(_) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u8
        [4] = u2
        [5] = u6
    --]]
    u3.Controllers.PvpArenaAugmentAbilityController:registerAbilities({ u4.CACTUS_FIRE })
    local v13 = u3.Controllers.PvpArenaAugmentAbilityController:getAbilityType(u4.CACTUS_FIRE)
    if not v13 then
        return nil
    end
    u3.Controllers.CactusController:initKit(u8.LocalPlayer)
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u4.CACTUS_FIRE)
    local v14 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v15 = u4.CACTUS_FIRE
    local v16 = {
        ["abilityType"] = v13,
        ["abilityButton"] = {
            ["icon"] = u6.CACTUS_BALL
        }
    }
    v14:enableAbility(v15, v16)
end
u3.CreateController(u9.new())
return nil