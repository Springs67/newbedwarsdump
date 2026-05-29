local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, script.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, script.Parent, "knit-controller").KnitController
local v6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "BackpackKnitController"
    end,
    ["__index"] = u5
})
v6.__index = v6
function v6.constructor(p7) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    u5.constructor(p7)
    p7.Name = "Controller"
    p7.enabled = false
    p7.enableSession = math.random()
    p7.sessionMaid = u3.new()
end
function v6.KnitStart(u8) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local function u14(p9) --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        if p9.Inventory.observedInventory.inventory.backpack and u8:isRelevantItem(p9.Inventory.observedInventory.inventory.backpack) then
            local v10 = {}
            for v11, v12 in p9.Inventory.observedInventory.inventory.backpack do
                v10[v11] = v12
            end
            if u8.enabled then
                u8.sessionMaid:DoCleaning()
                u8.enabled = false
                u8.backpack = nil
                u8.enableSession = -1
                u8:onDisable()
            end
            local u13 = os.clock()
            u8.enableSession = u13
            u8.backpack = v10
            u8.enabled = true
            u8:onEnable(v10, function() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u13
                --]]
                return u8.enableSession == u13
            end)
            return nil
        end
        u8.sessionMaid:DoCleaning()
        u8.enabled = false
        u8.backpack = nil
        u8.enableSession = -1
        u8:onDisable()
    end
    u4.changed:connect(function(p15, p16) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        if p15.Inventory.observedInventory.inventory.backpack ~= p16.Inventory.observedInventory.inventory.backpack then
            u14(p15)
        end
    end)
    u14(u4:getState())
end
function v6.isInputAttackEquivalent(_, p17) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v18 = false
    local v19 = u2.Controllers.KeybindLoadController:getKeybinds()
    local v20
    if v19 == nil then
        v20 = v19
    else
        v20 = v19.keyboard
        if v20 ~= nil then
            v20 = v20.controlActions.Attack
        end
    end
    local v21 = v20 or Enum.UserInputType.MouseButton1
    if v19 ~= nil then
        v19 = v19.gamepad
        if v19 ~= nil then
            v19 = v19.controlActions.Attack
        end
    end
    local v22 = v19 or Enum.KeyCode.ButtonR2
    return v18 or (p17.UserInputType == v21 and true or p17.KeyCode == v21) or p17.UserInputType == Enum.UserInputType.Touch or p17.KeyCode == v22
end
function v6.setupYield(u23, u24) --[[ Line: 107 ]]
    local u25 = u23.enableSession
    task.spawn(function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u23
            [3] = u25
        --]]
        local u26 = u24()
        if u23.enableSession == u25 then
            u23.sessionMaid:GiveTask(function() --[[ Line: 112 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                task.spawn(function() --[[ Line: 113 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    u26()
                end)
            end)
        else
            u26()
        end
    end)
end
function v6.isEnabled(p27) --[[ Line: 122 ]]
    return p27.enabled
end
function v6.getBackpack(p28) --[[ Line: 125 ]]
    return p28.backpack
end
return {
    ["BackpackKnitController"] = v6
}