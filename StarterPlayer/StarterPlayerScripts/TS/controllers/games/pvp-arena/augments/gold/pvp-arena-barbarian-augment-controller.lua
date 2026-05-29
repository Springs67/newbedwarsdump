local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "bedwars", "kit", "kits", "barbarian", "ui", "barbarian-rage-bar").BarbarianRageBarWrapper
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "PvPArenaBarbarianAugmentController"
    end,
    ["__index"] = u11
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
    --]]
    u11.constructor(p15, u9.BARBARIAN)
    p15.Name = "PvPArenaBarbarianAugmentController"
end
function u12.onGameInit(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.onGameInit(p16)
end
function u12.onActivated(_) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u8
        [4] = u2
        [5] = u10
        [6] = u6
        [7] = u5
    --]]
    u4.LocalPlayer:GetAttributeChangedSignal("BarbarianRageLevel"):Connect(function() --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
        --]]
        u7:dispatch({
            ["type"] = "KitBarbarianSetRage",
            ["rage"] = u4.LocalPlayer:GetAttribute("BarbarianRageLevel")
        })
    end)
    local u17 = u8.SwordProgression[1]
    u7.changed:connect(function(p18, p19) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u17
            [4] = u2
            [5] = u10
        --]]
        if p18.Kit.barbarianRage ~= p19.Kit.barbarianRage then
            local v20 = u8.getSwordProgress(u4.LocalPlayer)
            if v20.prev ~= u17 then
                u17 = v20.prev
                if p18.Kit.barbarianRage > p19.Kit.barbarianRage then
                    u2:playSound(u10.BEDWARS_PURCHASE_ITEM)
                end
            end
        end
    end)
    u6("BarbarianRageBar", u5, {})
end
v3.CreateController(u12.new())
return nil