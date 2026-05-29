local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, script.Parent, "ui", "item-on-cooldown-timer").GiveItemOnCooldownApp
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "GiveItemOnCooldownController"
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
        [2] = u6
    --]]
    u5.constructor(p11)
    p11.Name = "GiveItemOnCooldownController"
    p11.createItemOnCdRemote = u6.Client:Get("CreateItemOnCd")
    p11.destroyItemOnCdRemote = u6.Client:Get("DestroyItemOnCd")
    p11.itemMaidMap = {}
end
function u8.KnitStart(u12) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u2
        [4] = u4
        [5] = u7
    --]]
    u5.KnitStart(u12)
    u12.createItemOnCdRemote:Connect(function(p13) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u4
            [4] = u7
            [5] = u12
        --]]
        local v14 = u3.new()
        local u15 = u2.Controllers.StatusInfoListController:waitForSetupAddElement(u4.createElement(u7, {
            ["itemType"] = p13.itemType,
            ["interval"] = p13.interval,
            ["maxAmount"] = p13.maxAmount
        }))
        v14:GiveTask(function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u15
            --]]
            u4.unmount(u15)
        end)
        u12.itemMaidMap[p13.itemType] = v14
    end)
    u12.destroyItemOnCdRemote:Connect(function(p16) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v17 = u12.itemMaidMap[p16.itemType]
        if v17 ~= nil then
            v17:DoCleaning()
        end
        u12.itemMaidMap[p16.itemType] = nil
    end)
end
u2.CreateController(u8.new())
return nil