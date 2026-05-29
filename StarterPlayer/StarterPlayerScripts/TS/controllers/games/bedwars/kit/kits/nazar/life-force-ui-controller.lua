local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayerCharacter
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u12 = v1.import(script, script.Parent, "life-force-ui").LifeForceUi
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "LifeForceUiController"
    end,
    ["__index"] = u9
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
        [1] = u9
        [2] = u5
    --]]
    u9.constructor(p16)
    p16.Name = "LifeForceUiController"
    p16.lifeForceUiKey = "LifeForceUI"
    p16.lifeForceUiMaid = u5.new()
    p16.lifeForceUiMaid = u5.new()
end
function u13.KnitStart(u17) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
        [3] = u7
        [4] = u11
        [5] = u10
        [6] = u8
    --]]
    u9.KnitStart(u17)
    u3(u7.LocalPlayer, function() --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
            [3] = u10
            [4] = u17
        --]]
        if u11(u7.LocalPlayer, u10.NAZAR) then
            u17:mountLifeForceUi()
        else
            u17.lifeForceUiMaid:DoCleaning()
        end
    end)
    u8.KitUnequip:connect(function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
            [3] = u10
            [4] = u17
        --]]
        if not u11(u7.LocalPlayer, u10.NAZAR) then
            u17.lifeForceUiMaid:DoCleaning()
        end
    end)
end
function u13.mountLifeForceUi(p18) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
        [3] = u12
    --]]
    p18.lifeForceUiMaid:DoCleaning()
    p18.lifeForceUiMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u6.createFragment({
        [p18.lifeForceUiKey] = u6.createElement(u12)
    })))
end
v4.CreateController(u13.new())
return nil