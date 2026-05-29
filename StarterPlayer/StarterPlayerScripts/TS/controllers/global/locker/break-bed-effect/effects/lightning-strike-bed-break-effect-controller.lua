local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.ReplicatedStorage
local u5 = v3.Workspace
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u7 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "LightningStrikeBedBreakController"
    end,
    ["__index"] = u7
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
        [1] = u7
        [2] = u6
    --]]
    u7.constructor(p11, u6.LIGHTNING_STRIKE)
    p11.Name = "LightningStrikeBedBreakController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.KnitStart(p12)
end
function u8.onBedBreak(u13, _, u14, p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u4
    --]]
    local u16 = u2.Controllers.BreakBedEffectUtilController:createBedClone(p15)
    u16:PivotTo(u14)
    u16.Parent = u5
    u13.maid:GiveTask(u16)
    local u17 = u4.Assets.Effects.LightningCloud:Clone()
    u13.maid:GiveTask(u17)
    u17:PivotTo(u14 + Vector3.new(0, 23.5, 0))
    u17.Parent = u5
    u13.maid:GiveTask(task.delay(1.5, function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        for v18, v19 in u17:GetDescendants() do
            local _ = v18 - 1
            if v19:IsA("ParticleEmitter") then
                v19.Enabled = false
            end
        end
    end))
    u13.maid:GiveTask(task.delay(2.5, function() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:Destroy()
        u17.Parent = nil
    end))
    u13.maid:GiveTask(task.delay(0.8, function() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u2
            [3] = u14
            [4] = u16
        --]]
        local v20 = false
        local v21 = 0
        while true do
            if v20 then
                v21 = v21 + 1
            else
                v20 = true
            end
            if v21 >= 3 then
                u16:Destroy()
                return
            end
            local v22 = u13.maid
            local v23 = u2.Controllers.WizardLightningStrikeController
            local v24 = u14.Position
            local v25 = math.random(-3, 3)
            local v26 = math.random
            v22:GiveTask(v23:playLightningEffects(v24 + Vector3.new(v25, -1.5, v26(-3, 3)), true))
        end
    end))
end
u2.CreateController(u8.new())
return nil