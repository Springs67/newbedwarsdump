local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "SpeedBoostController"
    end,
    ["__index"] = u6
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p13)
    p13.Name = "SpeedBoostController"
    p13.playerSpeedMaids = {}
end
function u10.KnitStart(u14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u8
        [4] = u7
        [5] = u4
        [6] = u3
        [7] = u9
        [8] = u2
    --]]
    u6.KnitStart(u14)
    u5.StatusEffectAdded:connect(function(p15) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u7
            [3] = u4
            [4] = u14
            [5] = u3
            [6] = u9
            [7] = u2
        --]]
        if p15.statusEffect ~= u8.GENERIC_SPEED_BOOST then
            return nil
        end
        local v16 = p15.entityInstance
        local v17 = u7:getEntity(u4.LocalPlayer)
        if v17 ~= nil then
            v17 = v17:getInstance()
        end
        if v16 ~= v17 then
            return nil
        end
        local v18 = u14.playerSpeedMaids[u4.LocalPlayer]
        if v18 then
            v18:DoCleaning()
        end
        local v19 = u3.new()
        u14.playerSpeedMaids[u4.LocalPlayer] = v19
        local v20 = u9:getActive(p15.entityInstance, u8.GENERIC_SPEED_BOOST)
        if v20 ~= nil then
            v20 = v20.extraNumbers
        end
        local v21 = (v20 == nil or #v20 < 1) and 1 or v20[1]
        v19:GiveTask((u2.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["moveSpeedMultiplier"] = v21
        })))
    end)
    u5.StatusEffectRemoved:connect(function(p22) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u7
            [3] = u4
            [4] = u14
        --]]
        if p22.statusEffect ~= u8.GENERIC_SPEED_BOOST then
            return nil
        end
        local v23 = p22.entityInstance
        local v24 = u7:getEntity(u4.LocalPlayer)
        if v24 ~= nil then
            v24 = v24:getInstance()
        end
        if v23 ~= v24 then
            return nil
        end
        local v25 = u14.playerSpeedMaids[u4.LocalPlayer]
        if v25 then
            v25:DoCleaning()
            u14.playerSpeedMaids[u4.LocalPlayer] = nil
        end
    end)
end
u2.CreateController(u10.new())
return nil