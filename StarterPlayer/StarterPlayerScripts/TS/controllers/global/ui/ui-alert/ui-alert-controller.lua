local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "UiAlertController"
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
    --]]
    u5.constructor(p11)
    p11.Name = "UiAlertController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u6
        [4] = u3
        [5] = u4
    --]]
    u5.KnitStart(p12)
    u7.Client:Get("SendPlayerUIAlerts"):Connect(function(p13) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u4
        --]]
        u6:dispatch({
            ["type"] = "AddUIAlerts",
            ["uiAlerts"] = p13
        })
        for v14, v15 in u3.entries(p13) do
            local _ = v14 - 1
            local v16 = v15[1]
            local v17 = v15[2]
            u4.NewUIAlert:fire(v16, v17)
        end
    end)
end
function u8.confirmUIAlert(_, p18, p19) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    u6:dispatch({
        ["type"] = "ConfirmUIAlert",
        ["uiAlert"] = p18,
        ["amount"] = p19
    })
    u7.Client:Get("ConfirmUIAlert"):SendToServer(p18, p19)
end
v2.CreateController(u8.new())
return nil