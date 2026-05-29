local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = u1.import(script, script.Parent, "reconnect-lobby-menu").ReconnectingMenu
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "ReconnectLobbyController"
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
    p11.Name = "ReconnectLobbyController"
end
function u8.KnitStart(u12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u2
    --]]
    u5.KnitStart(u12)
    u6.Client:OnEvent("NotifyReconnectToMatch", function(p13) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u2
        --]]
        u12:openReconnectNotificationMenu(p13.queueType, p13.endTime)
        u2.Controllers.QueueController:leaveQueue()
    end)
end
function u8.openReconnectNotificationMenu(p14, p15, p16) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u4
    --]]
    p14.menuTree = u3.mount(u3.createElement(u7, {
        ["QueueType"] = p15,
        ["ResponseEndTime"] = p16
    }), u4.LocalPlayer:WaitForChild("PlayerGui"), "ReconnectMenu")
end
function u8.cancelReconnectToMatch(p17) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
    --]]
    local v18 = u6.Client:Get("CancelReconnectToMatch"):CallServer()
    if v18 and p17.menuTree then
        u3.unmount(p17.menuTree)
        p17.menuTree = nil
    end
    return v18
end
function u8.confirmReconnectToMatch(u19) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u6
        [3] = u3
    --]]
    task.spawn(u1.async(function() --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u6
            [3] = u19
            [4] = u3
        --]]
        if u1.await(u6.Client:Get("ConfirmReconnectToMatch"):CallServerAsync()) and u19.menuTree then
            u3.unmount(u19.menuTree)
            u19.menuTree = nil
        end
    end))
end
u2.CreateController(u8.new())
return nil