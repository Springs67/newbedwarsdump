local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, script.Parent, "ui", "consumable-boost-list").ConsumableBoostList
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "ConsumableController"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p15)
    p15.Name = "ConsumableController"
    p15.displayBoostList = true
    p15.inventory = {}
    p15.record = {}
end
function u12.KnitStart(u16) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u7
        [4] = u2
        [5] = u11
    --]]
    u6.KnitStart(u16)
    u9.Client:Get("ConsumableUpdate"):Connect(function(p17) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u7
        --]]
        u16.inventory = p17.inventory
        u16.record = p17.record
        local v18 = u7
        local v19 = {
            ["type"] = "ConsumableSetSome",
            ["data"] = {
                ["inventory"] = p17.inventory,
                ["record"] = p17.record
            }
        }
        v18:dispatch(v19)
    end)
    local v20 = {
        ["appId"] = "ConsumableBoostList",
        ["app"] = u11
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v20, {})
end
function u12.setDisplayBoostList(p21, p22) --[[ Line: 52 ]]
    p21.displayBoostList = p22
end
function u12.getConsumablesOfTypeFromInv(p23, p24) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v25 = 0
    local v26 = {}
    for v27, v28 in u5.entries(p23.inventory) do
        local _ = v27 - 1
        local _ = v28[1]
        if v28[2].consumable == p24 == true then
            v25 = v25 + 1
            v26[v25] = v28
        end
    end
    return v26
end
function u12.getConsumablesOfCategoryFromInv(p29, p30) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
    --]]
    local v31 = 0
    local v32 = {}
    for v33, v34 in u5.entries(p29.inventory) do
        local _ = v33 - 1
        local _ = v34[1]
        if u8(v34[2].consumable).category == p30 == true then
            v31 = v31 + 1
            v32[v31] = v34
        end
    end
    return v32
end
function u12.getConsumablesOfCategoryFromRecord(p35, p36) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
    --]]
    local v37 = 0
    local v38 = {}
    for v39, v40 in u5.entries(p35.record) do
        local _ = v39 - 1
        local _ = v40[1]
        if u8(v40[2].consumable).category == p36 == true then
            v37 = v37 + 1
            v38[v37] = v40
        end
    end
    return v38
end
function u12.useConsumableFromLocker(_, p41) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
        [3] = u10
    --]]
    local v42 = u9.Client:Get("LockerUseConsumabler"):CallServer(p41)
    if v42 then
        u3:playSound(u10.FLETCHERY_UPGRADE_BOARD_PLACE)
    end
    return v42
end
v4.CreateController(u12.new())
return nil