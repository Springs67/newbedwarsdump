local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, script.Parent, "ui", "queue-app").QueueAppWrapper
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "QueueController"
    end,
    ["__index"] = u8
})
u14.__index = u14
function u14.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p17)
    p17.Name = "QueueController"
    p17.joiningMatch = false
end
function u14.KnitStart(u18) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u3
        [4] = u12
        [5] = u7
        [6] = u4
        [7] = u9
        [8] = u13
    --]]
    u10.changed:connect(function(p19, p20) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u18
            [3] = u3
            [4] = u12
            [5] = u7
            [6] = u4
            [7] = u9
            [8] = u13
        --]]
        if p19.Party.queueState ~= p20.Party.queueState then
            if p19.Party.queueState == u5.MATCH_FOUND then
                u18.joiningMatch = true
                u3:playSound(u12.QUEUE_MATCH_FOUND)
                if u7.LocalPlayer:GetAttribute("GamesPlayed") == 0 then
                    u4.Controllers.AnalyticsController:sendFunnelEvent("Onboarding Funnel", nil, 4, "First Queue Popped")
                    return
                end
            else
                if p19.Party.queueState == u5.IN_QUEUE then
                    u18.joiningMatch = false
                    u18:cleanUpQueueBar()
                    u18.queueBarTree = u9("queue-status", u13, {}, {}, {
                        ["IgnoreGuiInset"] = true
                    })
                    return
                end
                if p19.Party.queueState == u5.NONE and u18.joiningMatch ~= true then
                    u18:cleanUpQueueBar()
                end
            end
        end
    end)
end
function u14.cleanUpQueueBar(p21) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u12
    --]]
    if p21.queueBarTree then
        u6.unmount(p21.queueBarTree)
        p21.queueBarTree = nil
        u3:playSound(u12.UI_CLOSE_2)
    end
end
function u14.joinQueue(_, p22) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u2
        [4] = u10
        [5] = u7
    --]]
    if p22 == u11.CUSTOM_KIT_CREATION then
        u4.Controllers.CustomKitCreationLobbyController:clickQueue()
        return nil
    end
    if p22 == u11.CUSTOM_KIT and not u4.Controllers.CustomKitLobbyController:checkIfCanJoinQueue() then
        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            ["message"] = "You do not have any custom kits set up yet. Click the Custom Kit Creator game card to create one."
        })
        return nil
    end
    local v23 = u10:getState().Party
    if v23.leader.userId == u7.LocalPlayer.UserId then
        u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):joinQueue(p22)
    end
    for v24, v25 in v23.members do
        local _ = v24 - 1
        local v26 = u7:GetPlayerByUserId(v25.userId)
        if v26 ~= nil then
            v26 = v26:GetAttribute("GamesPlayed")
        end
        if v26 == 0 then
            u4.Controllers.AnalyticsController:sendFunnelEvent("Onboarding Funnel", nil, 3, "First Queued")
        end
    end
end
function u14.leaveQueue(_) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):leaveQueue()
end
return {
    ["QueueController"] = u4.CreateController(u14.new())
}