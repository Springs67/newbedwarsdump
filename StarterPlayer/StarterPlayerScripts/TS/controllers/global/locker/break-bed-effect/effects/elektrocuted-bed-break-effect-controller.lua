local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u12 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "ElectrocutedBedBreakEffectController"
    end,
    ["__index"] = u12
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
    --]]
    u12.constructor(p16, u9.ELECTROCUTED)
    p16.Name = "ElectrocutedBedBreakEffectController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.KnitStart(p17)
end
function u13.onBedBreak(u18, _, u19, u20, u21) --[[ Line: 35 ]]
    task.spawn(function() --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u19
            [3] = u21
            [4] = u20
        --]]
        u18:createEffect(u19, u21, u20)
    end)
end
function u13.createEffect(u22, p23, _, p24) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u8
        [4] = u4
        [5] = u6
        [6] = u11
        [7] = u2
        [8] = u10
    --]]
    local v25 = u3.Controllers.BreakBedEffectUtilController:createBedClone(p24)
    if not v25 then
        return nil
    end
    u22.maid:GiveTask(v25)
    v25.Name = "BedBreakEffectBedClone"
    v25:PivotTo(p23)
    local v26 = v25:FindFirstChild("Root")
    if v26 ~= nil then
        for v27, v28 in v26:GetDescendants() do
            local _ = v27 - 1
            if v28:IsA("BasePart") then
                v28.Transparency = 0.55
            end
        end
    end
    v25.Parent = u7
    if v26 ~= nil then
        for v29, u30 in v26:GetDescendants() do
            local _ = v29 - 1
            if u30:IsA("BasePart") then
                u8(0.5, u4, function(p31) --[[ Line: 67 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                    --]]
                    u30.Transparency = p31
                end, 0, 1)
            end
        end
    end
    u22.maid:GiveTask(v25)
    local u32 = u6.Assets.Effects.ElektraBedEffect:Clone()
    u32:PivotTo(p23)
    u32.Parent = u7
    u22.maid:GiveTask(u32)
    u11:playInstanceEffects({ u32 }, {
        ["destroyAfterSec"] = 5
    })
    u22.maid:GiveTask(u2:playSound(u10.WIZARD_LIGHTNING_STRIKE, {
        ["position"] = p23.Position
    }))
    u22.maid:GiveTask(task.delay(2, function() --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u8
            [3] = u4
        --]]
        local v33 = u32:FindFirstChild("Root")
        if v33 ~= nil then
            for v34, u35 in v33:GetDescendants() do
                local _ = v34 - 1
                if u35:IsA("BasePart") and u35.Name ~= "bedbreakElektra" then
                    u8(0.5, u4, function(p36) --[[ Line: 93 ]]
                        --[[
                        Upvalues:
                            [1] = u35
                        --]]
                        u35.Transparency = p36
                    end, 0, 1)
                end
            end
        end
    end))
    u22.maid:GiveTask(task.delay(5, function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22.maid:DoCleaning()
    end))
end
u3.CreateController(u13.new())
return nil