local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u12 = v1.import(script, script.Parent, "ui", "barbarian-rage-bar").BarbarianRageBarWrapper
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "BarbarianKitController"
    end,
    ["__index"] = u11
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u8
    --]]
    u11.constructor(p16, u8.BARBARIAN)
    p16.Name = "BarbarianKitController"
end
function u13.onKitLocalActivated(p17, p18) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u9
        [4] = u2
        [5] = u10
        [6] = u6
        [7] = u12
    --]]
    p18:GiveTask(u5.LocalPlayer:GetAttributeChangedSignal("BarbarianRageLevel"):Connect(function() --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
        --]]
        u7:dispatch({
            ["type"] = "KitBarbarianSetRage",
            ["rage"] = u5.LocalPlayer:GetAttribute("BarbarianRageLevel")
        })
    end))
    local u19 = u9.SwordProgression[1]
    local u23 = u7.changed:connect(function(p20, p21) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u5
            [3] = u19
            [4] = u2
            [5] = u10
        --]]
        if p20.Kit.barbarianRage ~= p21.Kit.barbarianRage then
            local v22 = u9.getSwordProgress(u5.LocalPlayer)
            if v22.prev ~= u19 then
                u19 = v22.prev
                if p20.Kit.barbarianRage > p21.Kit.barbarianRage then
                    u2:playSound(u10.BEDWARS_PURCHASE_ITEM)
                end
            end
        end
    end)
    p18:GiveTask(function() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:disconnect()
    end)
    p17:unmountRageBar()
    p17.rageBarTree = u6("BarbarianRageBar", u12, {})
end
function u13.onKitLocalDeactivated(p24) --[[ Line: 57 ]]
    p24:unmountRageBar()
end
function u13.onKitReplicationActivated(_, _) --[[ Line: 60 ]] end
function u13.onKitReplicationDeactivated(_) --[[ Line: 62 ]] end
function u13.onInnateAbilityEnabled(_, _, _) --[[ Line: 64 ]] end
function u13.onAbilityUsed(_, _, _) --[[ Line: 66 ]] end
function u13.unmountRageBar(p25) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p25.rageBarTree then
        u4.unmount(p25.rageBarTree)
        p25.rageBarTree = nil
    end
end
v3.CreateController(u13.new())
return nil