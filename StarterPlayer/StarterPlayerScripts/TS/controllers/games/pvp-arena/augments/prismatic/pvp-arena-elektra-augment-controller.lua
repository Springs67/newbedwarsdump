local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "PvpArenaElektraAugmentController"
    end,
    ["__index"] = u8
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
        [1] = u8
        [2] = u6
    --]]
    u8.constructor(p12, u6.ELEKTRA_DASH)
    p12.Name = "PvpArenaElektraAugmentController"
end
function u9.onActivated(_) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u4
        [4] = u2
        [5] = u7
    --]]
    u3.Controllers.PvpArenaAugmentAbilityController:registerAbilities({ u5.ELECTRIC_DASH })
    local v13 = u3.Controllers.PvpArenaAugmentAbilityController:getAbilityType(u5.ELECTRIC_DASH)
    if not v13 then
        return nil
    end
    u3.Controllers.ElektraController:add(u4.LocalPlayer)
    u3.Controllers.ElektraController:initKit(u4.LocalPlayer)
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u5.ELECTRIC_DASH)
    local v14 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v15 = u5.ELECTRIC_DASH
    local v16 = {
        ["abilityType"] = v13,
        ["abilityButton"] = {
            ["icon"] = u7.ELECTRIC_DASH_ICON
        }
    }
    v14:enableAbility(v15, v16)
end
u3.CreateController(u9.new())
return nil