local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, script.Parent, "custom-kit-creation-queue-hud").CustomKitCreationQueueHud
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "CustomKitCreationLobbyController"
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
    p11.Name = "CustomKitCreationLobbyController"
end
function u8.KnitStart(u12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    u5.KnitStart(u12)
    u6.Client:Get("CustomKitCreationShowQueuePopupOnClient"):Connect(function(p13) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:showQueuePopup(p13.message)
    end)
end
function u8.showQueuePopup(p14, p15) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u4
    --]]
    if p14.customKitHudTree then
        u3.unmount(p14.customKitHudTree)
    end
    p14.customKitHudTree = u3.mount(u3.createElement(u7, {
        ["message"] = p15
    }), u4.LocalPlayer:WaitForChild("PlayerGui"))
end
function u8.clickQueue(_) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.Client:Get("CustomKitCreationQueue"):SendToServer({})
end
v2.CreateController(u8.new())
return nil