local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "spider-queen-balance").SpiderQueenBalance
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "SpiderQueenWebbedController"
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
        [2] = u3
    --]]
    u6.constructor(p13)
    p13.Name = "SpiderQueenWebbedController"
    p13.slowMaid = u3.new()
end
function u10.KnitStart(u14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u8
        [4] = u4
        [5] = u9
    --]]
    u6.KnitStart(u14)
    u5.StatusEffectAdded:connect(function(p15) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u9
            [4] = u14
        --]]
        if p15.statusEffect ~= u8.SPIDER_WEB_SLOW then
            return nil
        end
        local v16 = u4:GetPlayerFromCharacter(p15.entityInstance)
        if not v16 then
            return nil
        end
        if v16 ~= u4.LocalPlayer then
            return nil
        end
        u14:applySlow(v16, (u9:getStacks(p15.entityInstance, p15.statusEffect)))
    end)
    u5.StatusEffectChanged:connect(function(p17) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u9
            [4] = u14
        --]]
        if p17.statusEffect ~= u8.SPIDER_WEB_SLOW then
            return nil
        end
        local v18 = u4:GetPlayerFromCharacter(p17.entityInstance)
        if not v18 then
            return nil
        end
        if v18 ~= u4.LocalPlayer then
            return nil
        end
        u14:applySlow(v18, (u9:getStacks(p17.entityInstance, p17.statusEffect)))
    end)
    u5.StatusEffectRemoved:connect(function(p19) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u14
        --]]
        if p19.statusEffect ~= u8.SPIDER_WEB_SLOW then
            return nil
        end
        local v20 = u4:GetPlayerFromCharacter(p19.entityInstance)
        if not v20 then
            return nil
        end
        if v20 ~= u4.LocalPlayer then
            return nil
        end
        u14.slowMaid:DoCleaning()
    end)
end
function u10.applySlow(p21, _, p22) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u7
        [4] = u5
    --]]
    p21.slowMaid:DoCleaning()
    local u23 = u3.new()
    p21.slowMaid = u23
    local v24 = u2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = 1 - u7.SPIDER_WEB_SLOW_PER_STACK * p22
    })
    print("CLIENT Applying slow to player of ", 1 - u7.SPIDER_WEB_SLOW_PER_STACK * p22)
    u23:GiveTask(v24)
    local v25 = u5.DebuffDurationModifierCheck:fire(u7.SPIDER_WEB_SLOW_DURATION).duration
    task.delay(v25, function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:DoCleaning()
    end)
end
u2.CreateController(u10.new())
return nil