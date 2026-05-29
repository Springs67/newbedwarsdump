local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.MathExtras
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutExpo
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Debris
local u11 = v9.ReplicatedStorage
local u12 = v9.TweenService
local u13 = v9.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u17 = { v15.COOKIE_BITE_01, v15.COOKIE_BITE_02, v15.COOKIE_BITE_03 }
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "GingerbreaddedKillEffect"
    end,
    ["__index"] = u16
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21, p22) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p21, p22)
    u16.setPlayDefaultKillEffect(p21, false)
end
function u18.onKill(u23, _, u24, p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u13
        [4] = u14
        [5] = u6
        [6] = u3
        [7] = u16
        [8] = u5
        [9] = u4
        [10] = u17
    --]]
    local u26 = u7.new()
    local u27 = u11.Assets.Misc.GingerbreadKillEffect:Clone()
    u27:PivotTo(p25)
    u27.Parent = u13
    u27:ScaleTo(0.01)
    u26:GiveTask(u27)
    local u28 = u24:GetScale()
    local u30 = u14(2, u6, function(p29) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u3
            [3] = u28
            [4] = u27
        --]]
        u24:ScaleTo(u3:lerp(u28, 0.01, p29))
        u27:ScaleTo(u3:lerp(0.01, 1, p29))
    end)
    u26:GiveTask(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        return u30:Cancel()
    end)
    u26:GiveTask(task.delay(2, function() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u23
            [3] = u24
            [4] = u27
            [5] = u26
            [6] = u5
            [7] = u4
            [8] = u17
        --]]
        u16.hideCharacter(u23, u24)
        local v31 = 0
        local u32 = {}
        for v33, v34 in u27:GetDescendants() do
            local _ = v33 - 1
            local v35
            if v34:IsA("BasePart") then
                v35 = true
            else
                v34:Destroy()
                v35 = false
            end
            if v35 == true then
                v31 = v31 + 1
                u32[v31] = v34
            end
        end
        table.sort(u32, function(p36, p37) --[[ Line: 73 ]]
            return p36.Name < p37.Name
        end)
        u26:GiveTask(task.spawn(function() --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u23
                [3] = u5
                [4] = u4
                [5] = u17
                [6] = u27
            --]]
            for _, v38 in u32 do
                task.wait(math.random() + 0.5)
                u23:spawnCrumbs(math.random(8, 12), math.random() * 0.25 + 0.25, v38.Position, 2, 1)
                v38:Destroy()
                local v39 = u17
                u5:playSound(u4.fromList(unpack(v39)), {
                    ["position"] = v38.Position
                })
            end
            u27:Destroy()
        end))
    end))
    return u26
end
function u18.spawnCrumbs(_, p40, p41, p42, p43, p44) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u13
        [3] = u8
        [4] = u12
        [5] = u10
    --]]
    local v45 = { Color3.fromRGB(237, 189, 135), Color3.fromRGB(171, 140, 105), Color3.fromRGB(199, 135, 64) }
    local v46 = false
    local v47 = 0
    while true do
        if v46 then
            v47 = v47 + 1
        else
            v46 = true
        end
        if v47 >= p40 then
            return
        end
        local v48 = u8("Part", {
            ["Anchored"] = false,
            ["Size"] = Vector3.new(p41, p41, p41),
            ["CFrame"] = CFrame.new(p42) * CFrame.Angles(math.random() * 2 * 3.141592653589793, math.random() * 2 * 3.141592653589793, math.random() * 2 * 3.141592653589793),
            ["CanCollide"] = false,
            ["Color"] = u4.fromList(unpack(v45)),
            ["Parent"] = u13
        })
        local v49 = (math.random() - 0.5) * p43
        local v50 = (math.random() - 0.5) * p43
        local v51 = (math.random() - 0.5) * p43
        v48:ApplyImpulse((Vector3.new(v49, v50, v51)))
        u12:Create(v48, TweenInfo.new(p44, Enum.EasingStyle.Linear), {
            ["Transparency"] = 1
        }):Play()
        u10:AddItem(v48, p44)
    end
end
return u18