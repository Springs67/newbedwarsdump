local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u11 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "ButterflyExplosionKillEffect"
    end,
    ["__index"] = u11
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15, p16) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p15, p16)
    u11.setPlayDefaultKillEffect(p15, false)
end
function u12.onKill(p17, _, p18, p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u11
        [4] = u2
        [5] = u9
        [6] = u6
        [7] = u10
    --]]
    local u20 = u4.new()
    p18.Archivable = true
    local v21 = p18:Clone()
    v21.HumanoidRootPart.Anchored = true
    v21:PivotTo(p19)
    v21.Parent = u7
    u11.hideCharacter(p17, p18)
    u20:GiveTask(v21)
    local v22 = v21:FindFirstChild("_DamageHighlight_")
    if v22 then
        v22:Destroy()
    end
    for v23, v24 in v21:GetDescendants() do
        local _ = v23 - 1
        if v24:IsA("GuiObject") then
            v24.Transparency = 1
        elseif v24:IsA("UIStroke") then
            v24.Transparency = 1
        elseif v24:IsA("Decal") then
            v24.Transparency = 1
        end
    end
    u2:playSound(u9.BREAK_FROZEN_BLOCK, {
        ["position"] = p19.Position
    })
    local v25 = u6.Assets.Effects.AeryKillEffect:Clone()
    v25:PivotTo(p19)
    v25.Parent = u7
    u20:GiveTask(v25)
    u10:playInstanceEffects({ v25 }, {
        ["destroyAfterSec"] = 5
    })
    p17:fade(v21:GetDescendants(), "out", 1.5)
    u20:GiveTask((u2:playSound(u9.AERY_BUTTERFLY_SOUND_EFFECT, {
        ["position"] = p19.Position
    })))
    task.delay(5, function() --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20:DoCleaning()
    end)
    return u20
end
function u12.fade(_, p26, u27, u28) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
    --]]
    local function v31(u29) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u8
            [3] = u3
            [4] = u27
        --]]
        if u29:IsA("BasePart") then
            if u28 ~= 0 and (u28 == u28 and u28) then
                u8(u28, u3, function(p30) --[[ Line: 85 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29.LocalTransparencyModifier = p30
                end, u27 == "in" and 1 or 0, u27 == "in" and 0 or 1):Play()
                return
            end
            u29.LocalTransparencyModifier = u27 == "in" and 0 or 1
        end
    end
    for v32, v33 in p26 do
        v31(v33, v32 - 1, p26)
    end
end
return u12