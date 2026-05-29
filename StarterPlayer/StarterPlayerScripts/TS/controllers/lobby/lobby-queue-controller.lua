local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState
local u7 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, script.Parent.Parent.Parent, "ui", "store").ClientStore
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "LobbyQueueController"
    end,
    ["__index"] = u7
})
u11.__index = u11
function u11.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p14)
    p14.Name = "LobbyQueueController"
end
function u11.KnitStart(_) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u10
        [4] = u8
        [5] = u6
        [6] = u2
    --]]
    u9("lobby-queue-npc", function(p15) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u10
            [3] = u8
            [4] = u6
            [5] = u2
        --]]
        local u16 = p15.Name
        local u17 = p15:GetAttribute("QueueTitle")
        u5.Controllers.ProximityPromptController:createProximityPrompt({
            ["ObjectText"] = "Join Queue",
            ["ActionText"] = u17 == nil and "Missing Title" or u17,
            ["MaxActivationDistance"] = 20,
            ["HoldDuration"] = u10.promptHoldDuration,
            ["RequiresLineOfSight"] = false,
            ["Parent"] = p15
        }).Triggered:Connect(function(_) --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u6
                [3] = u2
                [4] = u17
                [5] = u5
                [6] = u16
            --]]
            if u8:getState().Party.queueState ~= u6.NONE then
                local v18 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                local v19 = {}
                local v20 = u17
                v19.message = "You are already in another queue. Leave to join " .. tostring(v20) .. "."
                v18:sendErrorNotification(v19)
                return nil
            end
            u5.Controllers.QueueController:joinQueue(u16)
        end)
    end)
end
return {
    ["LobbyQueueController"] = v4.CreateController(u11.new())
}