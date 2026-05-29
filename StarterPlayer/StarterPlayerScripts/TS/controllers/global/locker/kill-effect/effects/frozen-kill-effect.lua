local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "FrozenKillEffect"
    end,
    ["__index"] = u10
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14, p15) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p14, p15)
    u10.setPlayDefaultKillEffect(p14, false)
end
function u11.onKill(u16, _, p17, p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u10
        [4] = u2
        [5] = u9
        [6] = u6
    --]]
    local u19 = u4.new()
    p17.Archivable = true
    local u20 = p17:Clone()
    u20.HumanoidRootPart.Anchored = true
    u20:PivotTo(p18)
    u20.Parent = u7
    u10.hideCharacter(u16, p17)
    u19:GiveTask(u20)
    local v21 = u20:FindFirstChild("_DamageHighlight_")
    if v21 then
        v21:Destroy()
    end
    for v22, v23 in u20:GetDescendants() do
        local _ = v22 - 1
        if v23:IsA("GuiObject") then
            v23.Transparency = 1
        elseif v23:IsA("UIStroke") then
            v23.Transparency = 1
        elseif v23:IsA("Decal") then
            v23.Transparency = 1
        end
    end
    u2:playSound(u9.SEAHORSE_FREEZE, {
        ["position"] = p18.Position
    })
    local u24 = u6.Assets.Effects.FrostKillEffect:Clone()
    for v25, v26 in u24.Root["ice shards"]:GetChildren() do
        local _ = v25 - 1
        if v26:IsA("Model") then
            u16:fade(v26:GetChildren(), "out")
        end
    end
    u16:fade(u24.Root.ice:GetChildren(), "out")
    u24:PivotTo(p18)
    u24.Parent = u7
    u19:GiveTask(u24)
    local v27 = 0
    local v28 = v27
    for v29, u30 in u24.Root["ice shards"]:GetChildren() do
        local _ = v29 - 1
        if u30:IsA("Model") then
            task.delay(v28 * 0.5, function() --[[ Line: 80 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u30
                --]]
                u16:fade(u30:GetChildren(), "in", 1)
            end)
            v27 = v28 + 1
            v28 = v27
        end
    end
    u16:fade(u24.Root.ice:GetChildren(), "in", 1.5)
    task.delay(4, function() --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u20
            [3] = u24
        --]]
        u16:fade(u20:GetDescendants(), "out", 1.5)
        for v31, v32 in u24.Root["ice shards"]:GetChildren() do
            local _ = v31 - 1
            if v32:IsA("Model") then
                u16:fade(v32:GetChildren(), "out", 1.5)
            end
        end
        u16:fade(u24.Root.ice:GetChildren(), "out", 1.5)
    end)
    task.delay(5.5, function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:DoCleaning()
    end)
    return u19
end
function u11.fade(_, p33, u34, u35) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
    --]]
    local function v38(u36) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u8
            [3] = u3
            [4] = u34
        --]]
        if u36:IsA("BasePart") then
            if u35 ~= 0 and (u35 == u35 and u35) then
                u8(u35, u3, function(p37) --[[ Line: 113 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                    --]]
                    u36.LocalTransparencyModifier = p37
                end, u34 == "in" and 1 or 0, u34 == "in" and 0 or 1):Play()
                return
            end
            u36.LocalTransparencyModifier = u34 == "in" and 0 or 1
        end
    end
    for v39, v40 in p33 do
        v38(v40, v39 - 1, p33)
    end
end
return u11