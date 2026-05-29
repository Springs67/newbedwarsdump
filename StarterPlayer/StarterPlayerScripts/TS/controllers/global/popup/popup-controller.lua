local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, script.Parent, "ui", "popup").Popup
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "PopupController"
    end,
    ["__index"] = u5
})
u8.__index = u8
function u8.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p11)
    p11.Name = "PopupController"
end
function u8.KnitStart(p12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u4
        [4] = u7
    --]]
    u5.KnitStart(p12)
    u6.Client:Get("ShowPopup"):Connect(function(p13) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
        --]]
        local v14 = u4.Controllers.UiQueueManagerController
        local v15 = {
            ["app"] = {
                ["appId"] = "Popup",
                ["app"] = u7
            }
        }
        local v16 = {}
        for v17, v18 in p13 do
            v16[v17] = v18
        end
        v15.props = v16
        v15.priority = p13.priority
        v14:queueApp(v15)
    end)
end
v3.CreateController(u8.new())
return nil