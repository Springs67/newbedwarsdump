local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.InOutExpo
local u8 = v6.OutExpo
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.RunService
local u15 = v11.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent, "status-effect", "handlers", "client-status-effect-handler").ClientStatusEffectHandler
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "NoKnockbackStatusEffectHandler"
    end,
    ["__index"] = u16
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23, ...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p23, ...)
end
function u20.onApply(u24, u25, _) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
        [3] = u18
        [4] = u13
        [5] = u10
        [6] = u15
        [7] = u19
        [8] = u7
        [9] = u3
        [10] = u5
        [11] = u17
        [12] = u14
        [13] = u9
        [14] = u8
    --]]
    local v26
    if u25 == u12.LocalPlayer.Character then
        v26 = u12.LocalPlayer.Character
    else
        v26 = false
    end
    local v27 = u4
    local v28 = u18.USE_SMOKE_CHARGE
    local v29 = {}
    local v30
    if v26 then
        v30 = nil
    else
        v30 = u25.PrimaryPart
        if v30 ~= nil then
            v30 = v30.Position
        end
    end
    v29.position = v30
    v27:playSound(v28, v29)
    local u31 = u13.Assets.Effects.AntiKnockbackBubble:Clone()
    u31:PivotTo(u25.HumanoidRootPart.CFrame)
    u10(u31, 0.1)
    u31.Parent = u15
    u19.tweenModelSize(u31, 0.2, u7, 10)
    for _, v32 in u31:GetChildren() do
        if v32:IsA("BasePart") then
            u3:setQueryIgnored(v32, true)
        end
    end
    if v26 then
        u24:updateShieldTransparency(u31, u5.Controllers.CameraPerspectiveController:getCameraPerspective())
        u24.maid:GiveTask(u5.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p33) --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u31
            --]]
            u24:updateShieldTransparency(u31, p33)
        end))
        u5.Controllers.VignetteController:createVignette(u17.ANTI_KNOCKBACK)
        u24.maid:GiveTask(function() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u17
            --]]
            u5.Controllers.VignetteController:destroyVignette(u17.ANTI_KNOCKBACK)
        end)
    end
    local u34 = 0
    u24.maid:GiveTask(u14.Heartbeat:Connect(function(p35) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u25
            [3] = u31
            [4] = u9
        --]]
        u34 = u34 + p35
        local v36 = u25.HumanoidRootPart
        if v36 == nil then
            return nil
        end
        if u31.PrimaryPart == nil then
            u9.Error("Shield effect has no primary part")
            return nil
        end
        u31:PivotTo(CFrame.new(v36.Position) * CFrame.Angles(u34 * -0.6, u34 * 1.5, u34 * -0.6))
        local v37 = CFrame.new(u31.Shields.Position)
        local v38 = CFrame.Angles(0, u34 * 2, 0)
        u31.Shields.CFrame = v37 * v38
    end))
    u24.maid:GiveTask(function() --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u31
            [3] = u8
        --]]
        u19.tweenModelSize(u31, 0.15, u8, 0):andThen(function() --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            u31:Destroy()
        end)
    end)
end
function u20.onRemove(_, _, _) --[[ Line: 105 ]] end
function u20.updateShieldTransparency(_, p39, p40) --[[ Line: 107 ]]
    local v41 = p40 == 0 and 1 or 0
    for _, v42 in p39:GetChildren() do
        if v42:IsA("BasePart") then
            v42.LocalTransparencyModifier = v41
        end
    end
end
return {
    ["NoKnockbackStatusEffectHandler"] = u20
}