local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, script.Parent, "knit-controller").KnitController
local v8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "HandKnitController"
    end,
    ["__index"] = u7
})
v8.__index = v8
function v8.constructor(p9) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
    --]]
    u7.constructor(p9)
    p9.Name = "Controller"
    p9.enabled = false
    p9.enableSession = math.random()
    p9.sessionMaid = u3.new()
end
function v8.KnitStart(u10) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u4
    --]]
    local function u17(p11, p12) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        if p11.Inventory.observedInventory.inventory.hand and u10:isRelevantItem(p11.Inventory.observedInventory.inventory.hand) then
            local v13 = {}
            for v14, v15 in p11.Inventory.observedInventory.inventory.hand do
                v13[v14] = v15
            end
            if u10.enabled then
                u10.sessionMaid:DoCleaning()
                u10.enabled = false
                u10.handItem = nil
                u10.enableSession = -1
                u10:onDisable()
            end
            local u16 = os.clock()
            u10.enableSession = u16
            u10.handItem = v13
            u10.enabled = true
            u10:onEnable(v13, function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u16
                --]]
                return u10.enableSession == u16
            end)
            return nil
        end
        if u10.enabled and (p12 and u10:isRelevantItem(p12)) then
            u10.sessionMaid:DoCleaning()
            u10.enabled = false
            u10.handItem = nil
            u10.enableSession = -1
            u10:onDisable()
        end
    end
    u6.changed:connect(function(p18, p19) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        local v20 = p19.Inventory.observedInventory.inventory.hand
        if p18.Inventory.observedInventory.inventory.hand ~= v20 then
            u17(p18, v20)
        end
    end)
    u5.KitEquip:connect(function(p21) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u10
            [3] = u17
            [4] = u6
        --]]
        if p21.player == u4.LocalPlayer then
            u10:onDisable()
            u17(u6:getState(), nil)
        end
    end)
    u17(u6:getState(), nil)
end
function v8.isInputAttackEquivalent(_, p22) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v23 = false
    local v24 = u2.Controllers.KeybindLoadController:getKeybinds()
    local v25
    if v24 == nil then
        v25 = v24
    else
        v25 = v24.keyboard
        if v25 ~= nil then
            v25 = v25.controlActions.Attack
        end
    end
    local v26 = v25 or Enum.UserInputType.MouseButton1
    if v24 ~= nil then
        v24 = v24.gamepad
        if v24 ~= nil then
            v24 = v24.controlActions.Attack
        end
    end
    local v27 = v24 or Enum.KeyCode.ButtonR2
    return v23 or (p22.UserInputType == v26 and true or p22.KeyCode == v26) or p22.UserInputType == Enum.UserInputType.Touch or p22.KeyCode == v27
end
function v8.setupYield(u28, u29) --[[ Line: 118 ]]
    local u30 = u28.enableSession
    task.spawn(function() --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u28
            [3] = u30
        --]]
        local u31 = u29()
        if u28.enableSession == u30 then
            u28.sessionMaid:GiveTask(function() --[[ Line: 123 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                task.spawn(function() --[[ Line: 124 ]]
                    --[[
                    Upvalues:
                        [1] = u31
                    --]]
                    u31()
                end)
            end)
        else
            u31()
        end
    end)
end
function v8.setupDestroyableYield(u32, u33) --[[ Line: 133 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local u34 = u32.enableSession
    task.spawn(function() --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u32
            [3] = u34
            [4] = u3
        --]]
        local u35 = u33()
        if u32.enableSession == u34 then
            u32.sessionMaid:GiveTask(function() --[[ Line: 145 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u3
                --]]
                local u36 = u35
                task.spawn(function() --[[ Line: 136 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u36
                    --]]
                    local v37 = u3.new()
                    v37:GiveTask(u36)
                    v37:DoCleaning()
                end)
            end)
        else
            task.spawn(function() --[[ Line: 136 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u35
                --]]
                local v38 = u3.new()
                v38:GiveTask(u35)
                v38:DoCleaning()
            end)
        end
    end)
end
function v8.isEnabled(p39) --[[ Line: 153 ]]
    return p39.enabled
end
function v8.getHandItem(p40) --[[ Line: 156 ]]
    return p40.handItem
end
return {
    ["HandKnitController"] = v8
}