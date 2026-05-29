local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "ShipBarController"
    end,
    ["__index"] = u5
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    u5.constructor(p11)
    p11.Name = "ShipBarController"
    p11.maid = u4.new()
end
function u8.KnitStart(p12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.KnitStart(p12)
end
function u8.mountEntityBossBar(u13, u14, p15) --[[ Line: 31 ]]
    u13:mountBossBar(u14:getHealth(), u14:getMaxHealth(), p15)
    u13.maid:GiveTask(u14:getInstance():GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u14
        --]]
        u13:updateHealth(u14:getHealth())
    end))
    u13.maid:GiveTask(u14:getInstance():GetAttributeChangedSignal("MaxHealth"):Connect(function() --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u14
        --]]
        u13:updateHealth(u14:getHealth(), u14:getMaxHealth())
    end))
    u13.maid:GiveTask(u14:getInstance().AncestryChanged:Connect(function() --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:updateHealth(0)
    end))
end
function u8.mountBossBar(p16, p17, p18, p19) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
    --]]
    p16:unmountBar()
    p16:updateHealth(p17, p18)
    local v20 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v21 = u7.BOSS_BAR
    local v22 = {}
    if type(p19) == "table" then
        for v23, v24 in p19 do
            v22[v23] = v24
        end
    end
    v20:openApp(v21, v22)
end
function u8.updateHealth(p25, p26, p27) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v28 = p26 < 0 and 0 or p26
    if v28 == 0 then
        p25:unmountBar()
    end
    if p27 == 0 or (p27 ~= p27 or not p27) then
        u6:dispatch({
            ["type"] = "BedwarsUpdateBossBar",
            ["health"] = v28
        })
        return nil
    end
    u6:dispatch({
        ["type"] = "BedwarsUpdateBossBar",
        ["health"] = v28,
        ["maxHealth"] = p27
    })
end
function u8.unmountBar(p29) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
    --]]
    p29.maid:DoCleaning()
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u7.BOSS_BAR)
end
v3.CreateController(u8.new())
return nil