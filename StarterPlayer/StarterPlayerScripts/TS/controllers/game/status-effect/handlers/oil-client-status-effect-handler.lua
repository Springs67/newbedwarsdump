local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent, "client-status-effect-handler").ClientStatusEffectHandler
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "OilClientStatusEffectHandler"
    end,
    ["__index"] = u5
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9, ...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    u5.constructor(p9, ...)
    p9.movementModifier = {
        ["blockSprint"] = true
    }
    p9.jumpHeightModifier = {
        ["jumpHeightMultiplier"] = 0,
        ["airJumps"] = 0
    }
    p9.jumpMaid = u3.new()
end
function u6.onApply(p10, p11, _) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    if not u4.LocalPlayer.Character or p11 ~= u4.LocalPlayer.Character then
        return nil
    end
    p10.jumpMaid:GiveTask(u2.Controllers.JumpHeightController:getJumpModifier():addModifier(p10.jumpHeightModifier))
    p10.jumpMaid:GiveTask(u2.Controllers.SprintController:getMovementStatusModifier():addModifier(p10.movementModifier))
end
function u6.onRemove(p12, p13, _) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    if not u4.LocalPlayer.Character or p13 ~= u4.LocalPlayer.Character then
        return nil
    end
    u2.Controllers.SprintController:getMovementStatusModifier():removeModifier(p12.movementModifier)
    u2.Controllers.JumpHeightController:getJumpModifier():removeModifier(p12.jumpHeightModifier)
    p12.jumpMaid:DoCleaning()
end
return {
    ["OilClientStatusEffectHandler"] = u6
}