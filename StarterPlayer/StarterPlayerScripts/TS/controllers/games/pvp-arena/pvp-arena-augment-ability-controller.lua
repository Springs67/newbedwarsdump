local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "PvpArenaAugmentAbilityKeybindController"
    end,
    ["__index"] = u4
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    u4.constructor(p9, { u5.PVP_ARENA })
    p9.Name = "PvpArenaAugmentAbilityController"
    p9.abilityKeybindMap = {}
end
function u6.KnitStart(p10) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.KnitStart(p10)
end
function u6.registerAbilities(p11, p12) --[[ Line: 29 ]]
    for v13, v14 in p12 do
        local _ = v13 - 1
        local v15 = p11:getNextAvailableKeybind()
        if v15 then
            p11.abilityKeybindMap[v14] = v15
        end
    end
end
function u6.getAbilityType(p16, p17) --[[ Line: 44 ]]
    return p16.abilityKeybindMap[p17]
end
function u6.getNextAvailableKeybind(p18) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    for _, v19 in {
        "KitPrimary",
        "KitSecondary",
        "KitTertiary",
        "MiscPrimary",
        "MiscSecondary"
    } do
        if table.find(u3.values(p18.abilityKeybindMap), v19) == nil then
            return v19
        end
    end
    return nil
end
v2.CreateController(u6.new())
return nil