local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "DisarmController"
    end,
    ["__index"] = u7
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(u14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u5
    --]]
    u7.constructor(u14)
    u14.Name = "DisarmController"
    u14.endTime = -1
    u6.NewHandItem:connect(function(p15) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u5
        --]]
        if u14.endTime > u5:GetServerTimeNow() then
            p15:setCancelled(true)
        end
    end)
end
function u11.KnitStart(u16) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u4
        [4] = u8
    --]]
    u7.KnitStart(u16)
    u10.Client:Get("Disarm"):Connect(function(p17) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u4
            [3] = u8
        --]]
        u16:removeHandItem(p17.player)
        if p17.player ~= u4.LocalPlayer then
            return nil
        end
        u16.endTime = p17.endTime
        u8:dispatch({
            ["type"] = "UnequipItemInHand",
            ["equip"] = false
        })
    end)
end
function u11.removeHandItem(_, p18) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v19 = u9.getInventory(p18).hand
    if v19 ~= nil then
        v19 = v19.itemType
    end
    if v19 then
        local v20 = p18.Character
        if v20 ~= nil then
            local v21 = v20:WaitForChild(v19, 3)
            if v21 ~= nil then
                v21:Destroy()
            end
        end
    end
end
v2.CreateController(u11.new())
return nil