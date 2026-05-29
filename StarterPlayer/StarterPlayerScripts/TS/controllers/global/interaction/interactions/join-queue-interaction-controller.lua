local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v3.Signal
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-meta").QueueGroupMeta
local u13 = v1.import(script, script.Parent.Parent, "interaction-registry-controller").InteractionCategory
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "JoinQueueInteraction"
    end,
    ["__index"] = u9
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
function u14.constructor(p17, ...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p17, ...)
    p17.Name = "JoinQueueInteraction"
end
function u14.KnitStart(u18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u4
        [4] = u13
        [5] = u12
        [6] = u2
        [7] = u10
        [8] = u7
    --]]
    local u19 = u6.new()
    local u20 = u5.Controllers.PlayerLevelController:isBeginner()
    u4.Controllers.InteractionRegistryController:RegisterInteraction({
        ["maxActivationDistance"] = 17,
        ["interactionLabel"] = "Join Queue",
        ["instantActivation"] = true,
        ["interactionTag"] = "InteractionJoinQueue",
        ["category"] = u13.OTHER,
        ["interactionObjectText"] = function(p21) --[[ Name: interactionObjectText, Line 43 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u2
            --]]
            local v22 = p21:GetAttribute("QueueSelectionMenu")
            if v22 ~= 0 and (v22 == v22 and (v22 ~= "" and v22)) then
                return u12[p21.Name].title
            end
            local v23 = p21.Name
            return u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(v23).title
        end,
        ["onInteracted"] = function(_, p24) --[[ Name: onInteracted, Line 56 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            if p24:GetAttribute("QueueSelectionMenu") == true then
                u18:openQueueSelectionMenu(p24.Name)
            else
                print("[Queue Client]: Attempting to join queue: " .. p24.Name)
                u18:joinQueue(p24.Name)
            end
        end,
        ["shouldMakeInteraction"] = function(p25) --[[ Name: shouldMakeInteraction, Line 66 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u20
            --]]
            local v26 = p25:GetAttribute("QueueSelectionMenu")
            if v26 == 0 or (v26 ~= v26 or (v26 == "" or not v26)) then
                local v27 = p25.Name
                local v28 = u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(v27)
                if v28 then
                    if v28.beginnerQueue == true or not u20 then
                        return v28.disabled == nil and true or not v28.disabled
                    else
                        return false
                    end
                else
                    return false
                end
            else
                return true
            end
        end,
        ["onVisibilityStateChanged"] = u19
    })
    u10.changed:connect(function(p29, p30) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u19
        --]]
        local v31 = p29.Party.queueState
        if v31 == p30.Party.queueState then
            return nil
        end
        print("[Queue Client]: Queue state updated, updating interactions")
        u19:Fire(v31 == u7.NONE)
    end)
end
function u14.joinQueue(_, p32) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
        [3] = u4
    --]]
    u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):joinQueue(p32)
    if u8.LocalPlayer:GetAttribute("GamesPlayed") == 0 then
        u4.Controllers.AnalyticsController:sendFunnelEvent("Onboarding Funnel", nil, 3, "First Queued")
    end
end
function u14.openQueueSelectionMenu(_, p33) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
        [3] = u8
        [4] = u4
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.QUEUE_SELECTION, {
        ["QueueSelectionType"] = p33
    })
    if u8.LocalPlayer:GetAttribute("GamesPlayed") == 0 then
        u4.Controllers.AnalyticsController:sendFunnelEvent("Onboarding Funnel", nil, 2, "First Opened Play Menu")
    end
end
return {
    ["JoinQueueInteraction"] = u4.CreateController(u14.new())
}