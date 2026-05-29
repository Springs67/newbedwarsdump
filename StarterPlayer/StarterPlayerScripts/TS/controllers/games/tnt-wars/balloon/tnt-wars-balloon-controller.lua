local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v6.RunService
local u10 = v6.TweenService
local u11 = v6.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "TntWarsBalloonController"
    end,
    ["__index"] = u12
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u5
        [3] = u11
    --]]
    u12.constructor(p20)
    p20.Name = "TntWarsBalloonController"
    p20.TNTBalloonModelFolder = u5("Folder", {
        ["Name"] = "TNTBalloons",
        ["Parent"] = u11
    })
end
function u17.KnitStart(_) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u4
        [3] = u8
        [4] = u11
        [5] = u10
        [6] = u13
        [7] = u9
        [8] = u7
        [9] = u2
        [10] = u15
        [11] = u16
    --]]
    u14.Client:OnEvent("CreatedTNTWarsBalloon", function(p21) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u8
            [3] = u11
            [4] = u10
            [5] = u13
            [6] = u9
        --]]
        local u22 = u4.new()
        local u23 = u8.Assets.Misc.TNTWarsBalloon:Clone()
        u23.Parent = u11
        local v24 = p21.hitbox
        local u25 = p21.originVector3
        local u26 = p21.targetVector3
        u23:PivotTo(CFrame.new(u25))
        for _, u27 in u23:GetDescendants() do
            task.spawn(function() --[[ Line: 50 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u10
                --]]
                if u27:IsA("BasePart") then
                    u27.Transparency = 1
                    u10:Create(u27, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        ["Transparency"] = 0
                    }):Play()
                end
            end)
        end
        local u28 = 0
        local u29 = u13.TNT_WARS_BALLOON_TRAVEL_TIME
        u22:GiveTask(function() --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            if u23 then
                u23:Destroy()
            end
        end)
        u22:GiveTask(u9.Heartbeat:Connect(function(p30) --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u22
                [3] = u28
                [4] = u29
                [5] = u25
                [6] = u26
                [7] = u13
            --]]
            if u23.Parent == nil then
                u22:DoCleaning()
                return nil
            end
            if u23.PrimaryPart == nil then
                u22:DoCleaning()
                return nil
            end
            u28 = u28 + p30
            local v31 = u28 / u29
            local v32 = math.clamp(v31, 0, 1)
            local v33 = u25:Lerp(u26, v32)
            local v34 = CFrame.Angles(0, 6.283185307179586 * u13.TNT_WARS_BALLOON_NUMBER_ROTATIONS * v32, 0)
            u23:PivotTo(CFrame.new(v33) * v34)
            if u29 <= u28 then
                u22:DoCleaning()
                return nil
            end
        end))
        v24.AncestryChanged:Connect(function() --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22:DoCleaning()
            return nil
        end)
    end)
    u14.Client:OnEvent("PoppedTNTWarsBalloon", function(p35) --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u15
            [4] = u8
            [5] = u16
        --]]
        local v36 = p35.poppedVector3
        if p35.shooter.Character == u7.LocalPlayer.Character then
            u2:playSound(u15.ARROW_HIT, {
                ["volumeMultiplier"] = 0.7,
                ["position"] = v36
            })
        end
        u2:playSound(u15.BALLOON_POP, {
            ["position"] = nil,
            ["volumeMultiplier"] = 3,
            ["playbackSpeedMultiplier"] = 0.9
        })
        local v37 = v36 + Vector3.new(0, 10, 0)
        local u38 = u8.Assets.Effects.PopEffectRed:Clone()
        u38:PivotTo(CFrame.new(v37))
        u16:playEffects({ u38 }, nil, {
            ["particleMultiplier"] = 2
        })
        task.delay(2, function() --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u38
            --]]
            u38:Destroy()
        end)
    end)
end
v3.CreateController(u17.new())
return nil