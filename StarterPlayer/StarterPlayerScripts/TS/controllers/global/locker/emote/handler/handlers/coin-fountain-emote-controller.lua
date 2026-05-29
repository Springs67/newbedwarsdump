local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.ReplicatedStorage
local u5 = v3.RunService
local u6 = v3.TweenService
local u7 = v3.Workspace
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = u1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "CoinFountainEmoteController"
    end,
    ["__index"] = u8
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p17)
    p17.Name = "CoinFountainEmoteController"
end
function u14.KnitStart(p18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u11
        [4] = u13
        [5] = u10
        [6] = u9
        [7] = u4
        [8] = u7
        [9] = u6
        [10] = u12
        [11] = u1
        [12] = u5
    --]]
    u8.KnitStart(p18)
    local v19 = u2.Controllers.EmoteHandlerController
    local v20 = u11.COIN_FOUNTAIN
    local u21 = u13
    local u22 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 41 ]]
            return "Anonymous"
        end,
        ["__index"] = u21
    })
    u22.__index = u22
    function u22.new(...) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        local v23 = u22
        local v24 = setmetatable({}, v23)
        return v24:constructor(...) or v24
    end
    function u22.constructor(p25, ...) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21.constructor(p25, ...)
    end
    function u22.onEnable(u26, u27, u28, _, u29) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u9
            [3] = u4
            [4] = u7
            [5] = u6
            [6] = u12
            [7] = u1
            [8] = u5
        --]]
        local u30 = 0
        local u31 = {}
        local u32 = u28:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u10:getAnimation(u9.ENVELOPE_THROW))
        u32:Play()
        u29:GiveTask(function() --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u32
            --]]
            u32:Stop()
            u32:Destroy()
        end)
        u32:GetMarkerReachedSignal("queue"):Connect(function() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u7
                [3] = u28
                [4] = u29
                [5] = u6
                [6] = u26
                [7] = u12
                [8] = u27
                [9] = u1
                [10] = u5
                [11] = u31
                [12] = u30
                [13] = u10
                [14] = u9
            --]]
            local u33 = u4.Assets.Misc.RedEnvelope:Clone()
            u33.Parent = u7
            u33.Anchored = true
            u33.CanCollide = false
            for v34, v35 in u33:GetDescendants() do
                local _ = v34 - 1
                if v35:IsA("BasePart") then
                    u33.CanCollide = false
                end
            end
            local v36 = u28.PrimaryPart.CFrame
            u33:PivotTo(v36 + Vector3.new(0, 0.25, 0))
            u29:GiveTask(u33)
            local u37 = v36 + v36.LookVector.Unit * 5
            local u38 = u6:Create(u33, TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
                ["CFrame"] = u37
            })
            local u39 = u26:playSound(u12.WIND_HIT_SHOUD_1, u27, {
                ["rollOffMaxDistance"] = 50,
                ["position"] = u28:GetPivot().Position
            })
            u29:GiveTask(function() --[[ Line: 98 ]]
                --[[
                Upvalues:
                    [1] = u38
                    [2] = u39
                --]]
                u38:Cancel()
                u38:Destroy()
                u39:Stop()
                u39:Destroy()
            end)
            u38:Play()
            local u67 = u1.Promise.new(function(p40) --[[ Line: 105 ]]
                --[[
                Upvalues:
                    [1] = u38
                --]]
                u38.Completed:Wait()
                p40(true)
            end):andThen(function() --[[ Line: 108 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u33
                    [3] = u37
                    [4] = u31
                    [5] = u30
                    [6] = u4
                    [7] = u7
                    [8] = u28
                    [9] = u10
                    [10] = u9
                    [11] = u26
                    [12] = u12
                    [13] = u27
                    [14] = u29
                --]]
                local u41 = 0
                local u53 = u5.Heartbeat:Connect(function(p42) --[[ Line: 111 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                        [2] = u33
                        [3] = u37
                    --]]
                    if u41 >= 1 then
                        u41 = 0
                    end
                    local v43 = u33
                    local v44 = u37:Lerp(u37, p42)
                    local v45 = CFrame.new(math.noise(-u41 * 80) * 0.7, 0, math.noise(-u41 * 80, -8888, -u41 * 80) * 0.7)
                    local v46 = CFrame.Angles
                    local v47 = math.noise(-u41 * 80) * 4
                    local v48 = math.rad(v47)
                    local v49 = math.noise(0, 0, (-u41 + -u41) * 80) * 4
                    local v50 = math.rad(v49)
                    local v51 = math.noise(-u41 * 80, -8888, -u41 * 80) * 4
                    local v52 = v46(v48, v50, (math.rad(v51)))
                    v43:PivotTo(v44 * v45 * v52)
                    u41 = u41 + p42
                end)
                if #u31 > 0 then
                    for v54, v55 in u31 do
                        local _ = v54 - 1
                        v55:Destroy()
                    end
                    table.clear(u31)
                end
                local u56 = 0
                local u62 = u5.Heartbeat:Connect(function(p57) --[[ Line: 135 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u31
                        [3] = u56
                        [4] = u4
                        [5] = u7
                        [6] = u37
                    --]]
                    u30 = u30 + p57
                    if u30 <= 0.2 then
                        return nil
                    end
                    u30 = 0
                    if not u31 then
                        return nil
                    end
                    local v58
                    if #u31 >= 6 then
                        u56 = u56 + 1
                        if u56 >= #u31 then
                            u56 = 0
                        end
                        v58 = u31[u56 + 1]
                        if not v58 then
                            v58 = u4.Assets.Misc.GoldCoin:Clone()
                            u31[u56 + 1] = v58
                            v58.Parent = u7
                        end
                    else
                        v58 = u4.Assets.Misc.GoldCoin:Clone()
                        local v59 = u31
                        table.insert(v59, v58)
                        v58.Parent = u7
                    end
                    local v60 = math.random(2, 4)
                    local v61 = math.random(-4, 4) / 10
                    v58:PivotTo(u37)
                    v58.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    v58:ApplyAngularImpulse((Vector3.new(v60, v60, v60)))
                    v58:ApplyImpulse(Vector3.new(v61, 1, v61) * 18)
                end)
                local u63 = u28:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u10:getAnimation(u9.CELEBRATION))
                u63:Play()
                local u64 = u26:playSound(u12.COIN_FOUNTAIN_LOOP, u27, {
                    ["rollOffMaxDistance"] = 25,
                    ["looped"] = true,
                    ["position"] = u28:GetPivot().Position
                })
                u29:GiveTask(function() --[[ Line: 187 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                        [2] = u31
                        [3] = u63
                        [4] = u64
                        [5] = u53
                        [6] = u62
                    --]]
                    u33:Destroy()
                    if u31 and #u31 > 0 then
                        for v65, v66 in u31 do
                            local _ = v65 - 1
                            v66:Destroy()
                        end
                        table.clear(u31)
                    end
                    u63:Stop()
                    u63:Destroy()
                    u64:Stop()
                    u64:Destroy()
                    u53:Disconnect()
                    u62:Disconnect()
                end)
            end)
            u29:GiveTask(function() --[[ Line: 210 ]]
                --[[
                Upvalues:
                    [1] = u67
                --]]
                return u67:cancel()
            end)
        end)
    end
    function u22.onDisable(_, _, _, _) --[[ Line: 215 ]] end
    v19:registerHandler(v20, u22)
end
u2.CreateController(u14.new())
return nil