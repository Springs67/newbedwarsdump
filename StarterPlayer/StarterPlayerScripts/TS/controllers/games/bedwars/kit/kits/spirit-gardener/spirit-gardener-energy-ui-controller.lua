local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u11 = v1.import(script, script.Parent, "spirit-gardener-energy-ui").SpiritGardenerEnergyUi
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "SpiritGardenerEnergyUiController"
    end,
    ["__index"] = u8
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
        [1] = u8
        [2] = u4
    --]]
    u8.constructor(p15)
    p15.Name = "SpiritGardenerEnergyUiController"
    p15.spiritEnergyUiKey = "LifeForceUI"
    p15.spiritEnergyUiMaid = u4.new()
    p15.spiritEnergyUiMaid = u4.new()
end
function u12.KnitStart(u16) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u10
        [4] = u6
        [5] = u9
    --]]
    u8.KnitStart(u16)
    u7.KitUnequip:connect(function() --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u6
            [3] = u9
            [4] = u16
        --]]
        if not u10(u6.LocalPlayer, u9.SPIRIT_GARDENER) then
            u16.spiritEnergyUiMaid:DoCleaning()
        end
    end)
end
function u12.mountSpiritEnergyUi(p17) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u11
    --]]
    p17.spiritEnergyUiMaid:DoCleaning()
    p17.spiritEnergyUiMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u5.createFragment({
        [p17.spiritEnergyUiKey] = u5.createElement(u11)
    })))
end
function u12.unmountSpiritEnergyUi(p18) --[[ Line: 48 ]]
    p18.spiritEnergyUiMaid:DoCleaning()
end
v3.CreateController(u12.new())
return nil