local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-balance").TeamBuffBalance
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "AgilityTeamBuffController"
    end,
    ["__index"] = u6
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
    --]]
    u6.constructor(p12)
    p12.Name = "AgilityTeamBuffController"
    p12.speedMaid = u3.new()
end
function u9.KnitStart(u13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u8
        [4] = u4
        [5] = u2
        [6] = u7
    --]]
    u6.KnitStart(u13)
    u5.StatusEffectAdded:connect(function(p14) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u13
            [4] = u2
            [5] = u7
        --]]
        if p14.statusEffect ~= u8.SNAKE_AGILITY_INVISIBLE then
            return nil
        end
        local v15 = u4:GetPlayerFromCharacter(p14.entityInstance)
        if v15 and v15 == u4.LocalPlayer then
            u13.speedMaid:GiveTask(u2.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["blockSprint"] = false,
                ["moveSpeedMultiplier"] = u7.SNAKE_AGILITY_SPEED_MULTIPLIER
            }))
        end
    end)
    u5.StatusEffectRemoved:connect(function(p16) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u13
        --]]
        if p16.statusEffect ~= u8.SNAKE_AGILITY_INVISIBLE then
            return nil
        end
        local v17 = u4:GetPlayerFromCharacter(p16.entityInstance)
        if v17 and v17 == u4.LocalPlayer then
            u13.speedMaid:DoCleaning()
        end
    end)
end
u2.CreateController(u9.new())
return nil