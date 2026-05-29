local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.ColorUtil
local u6 = v4.ComponentUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "components", "out")
local u9 = v8.BaseComponent
local v10 = v8.Component
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-meta")
local u13 = v12.QueueGroupMeta
local u14 = v12.getQueueGroupMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-type").QueueGroupType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "npc-spawn-component").NpcSpawnComponent
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "QueueComponent"
    end,
    ["__index"] = u9
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25, ...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p25, ...)
end
function u22.onStart(p26) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    if not p26.instance:IsA("BasePart") then
        error("Any instance with BedwarsQueue tag must be a BasePart")
    end
    if u11:IsClient() then
        p26:setupClient(p26.instance)
    elseif u11:IsServer() then
        p26:setupServer(p26.instance)
    end
end
function u22.setupClient(_, p27) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u16
        [3] = u20
        [4] = u17
        [5] = u7
        [6] = u5
        [7] = u19
        [8] = u18
        [9] = u6
        [10] = u21
    --]]
    local v28 = p27:GetAttribute("QueueSelectionMenu")
    local v29, v30
    if v28 == 0 or (v28 ~= v28 or (v28 == "" or not v28)) then
        local v31 = u16(p27.Name)
        if u20.isStaging() and p27.Name == u17.BEDWARS_TO4 then
            p27.Name = u17.BEDWARS_TEST
            v31 = u16(p27.Name)
        end
        if not v31 then
            error("\"" .. p27.Name .. "\" is not a valid queue type (" .. p27:GetFullName() .. ")")
        end
        local v32
        if v31.disabled == nil then
            v32 = false
        else
            v32 = v31.disabled
        end
        local v33 = v31.disabledMessage
        v29 = (v33 == "" or not v33) and "QUEUE DISABLED" or v33
        local v34 = u7.Controllers.PlayerLevelController:isBeginner()
        local v35 = v31.beginnerQueue ~= true and v34 and true or false
        v30 = v31.title
        if not v32 then
            local v36 = v31.queueSize.max
            v29 = "Teams of " .. tostring(v36)
        end
        local v37 = v31.eventText
        if v37 ~= "" and v37 then
            v29 = v31.eventText
        end
        if v35 then
            local v38 = u5.richTextColor(u19.mcRed)
            local v39 = u18.BEGINNER_LEVEL
            v29 = "<font color=\"" .. v38 .. "\">LOCKED (LVL " .. tostring(v39) .. " REQUIRED)</font>"
        end
    else
        local v40 = u13[p27.Name]
        if not v40 then
            return nil
        end
        v30 = v40.npcDisplay
        if v30 ~= nil then
            v30 = v30.title
        end
        if v30 == nil then
            v30 = v40.title
        end
        local v41 = v40.npcDisplay
        if v41 ~= nil then
            v41 = v41.subtitle
        end
        v29 = v41 == nil and "" or v41
    end
    local v42 = u6:getComponent(p27, u21)
    if v42 ~= nil then
        v42:setNametag(v30, v29)
    end
end
function u22.setupServer(_, p43) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u14
        [4] = u6
        [5] = u21
    --]]
    local v44 = u16(p43.Name)
    if not v44 then
        if u15[p43.Name] == nil then
            return nil
        end
        v44 = u16(u14(p43.Name).queues[1])
    end
    local v45 = u6
    local v46 = {}
    local v47 = v44.npcConfig
    if type(v47) == "table" then
        for v48, v49 in v47 do
            v46[v48] = v49
        end
    end
    v45:addComponent(p43, u21, v46)
end
v2.defineMetadata(u22, "identifier", "shared/components/queue-component@QueueComponent")
v2.defineMetadata(u22, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u22, "$c:init@Component", v10, {
    {
        ["tag"] = "BedwarsQueue",
        ["attributes"] = {},
        ["instanceGuard"] = v3.instanceIsA("BasePart")
    }
})
return {
    ["default"] = u22
}