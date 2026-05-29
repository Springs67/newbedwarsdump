local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.TweenService
local u9 = v6.Workspace
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "PillowKillEffect"
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
function u12.onKill(p17, _, p18, _) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
        [3] = u11
        [4] = u7
        [5] = u1
        [6] = u8
        [7] = u4
        [8] = u3
        [9] = u10
    --]]
    local u19 = u5.new()
    p18.Archivable = true
    local v20 = p18:Clone()
    v20.HumanoidRootPart.Anchored = true
    v20.Parent = u9
    local u21 = v20.PrimaryPart
    if u21 ~= nil then
        u21 = u21.CFrame
    end
    if not u21 then
        v20:Destroy()
        return u19
    end
    u11.hideCharacter(p17, p18)
    local u22 = u7.Assets.Effects.PillowKillEffect:Clone()
    u22:PivotTo(u21)
    u22.Parent = u9
    u19:GiveTask(u22)
    u19:GiveTask(v20)
    local u50 = u1.Promise.new(function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u19
            [3] = u7
            [4] = u9
            [5] = u8
            [6] = u4
            [7] = u3
            [8] = u10
            [9] = u21
            [10] = u1
        --]]
        local v23 = u22:WaitForChild("Main", 3)
        if not v23 then
            return u19
        end
        local u24 = u7.Assets.Effects.WhiteFeatherEffect:Clone()
        u24.Parent = u9
        local u25 = u7.Assets.Effects.SmallWhiteFeatherEffect:Clone()
        u25.Parent = u9
        u19:GiveTask(u25)
        u19:GiveTask(u24)
        local v26 = v23:GetChildren()
        table.sort(v26, function(p27, p28) --[[ Line: 64 ]]
            return p27.Name < p28.Name
        end)
        local function v44(p29) --[[ Line: 68 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u25
                [3] = u19
                [4] = u4
                [5] = u3
                [6] = u10
            --]]
            if p29:IsA("Model") then
                local v30 = p29.PrimaryPart
                local v31 = p29:WaitForChild("PIllow", 1)
                if not (v30 and v31) then
                    return nil
                end
                local v32 = u8
                local v33 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential)
                local v34 = {}
                local v35 = p29.PrimaryPart
                if v35 ~= nil then
                    v35 = v35.CFrame
                end
                v34.CFrame = v35
                local v36 = v32:Create(v31, v33, v34)
                u25:PivotTo(CFrame.new(v30.Position))
                v36:Play()
                task.wait(0.2)
                for v37, v38 in u25:GetChildren() do
                    local _ = v37 - 1
                    if v38:IsA("ParticleEmitter") then
                        v38:Emit(3)
                    end
                end
                local v39 = u19
                local v40 = u4
                local v41 = u3.fromList(u10.PILLOW_HIT_1, u10.PILLOW_HIT_2, u10.PILLOW_HIT_3)
                local v42 = {}
                local v43 = p29.PrimaryPart
                if v43 ~= nil then
                    v43 = v43.Position
                end
                v42.position = v43
                v42.rollOffMaxDistance = 220
                v39:GiveTask(v40:playSound(v41, v42))
            end
        end
        for v45, v46 in v26 do
            v44(v46, v45 - 1, v26)
        end
        u24:PivotTo(u21)
        local u49 = u1.Promise.delay(0.75):andThen(function() --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u24
                [3] = u19
                [4] = u4
                [5] = u10
                [6] = u1
            --]]
            if u21 then
                for v47, v48 in u24:GetChildren() do
                    local _ = v47 - 1
                    if v48:IsA("ParticleEmitter") then
                        v48:Emit(30)
                    end
                end
                u19:DoCleaning()
                u19:GiveTask(u4:playSound(u10.PILLOW_HIT_3, {
                    ["rollOffMaxDistance"] = 220,
                    ["volumeMultiplier"] = 1.5,
                    ["position"] = u21.Position
                }))
                u1.Promise.delay(1):andThen(function() --[[ Line: 134 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                    --]]
                    u24:Destroy()
                end)
            end
        end)
        u19:GiveTask(function() --[[ Line: 141 ]]
            --[[
            Upvalues:
                [1] = u49
            --]]
            return u49:cancel()
        end)
    end)
    u19:GiveTask(function() --[[ Line: 145 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        return u50:cancel()
    end)
    return u19
end
return u12