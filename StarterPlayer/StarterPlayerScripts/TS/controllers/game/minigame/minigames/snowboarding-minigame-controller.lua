local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.MathExtras
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.ReplicatedStorage
local u13 = v9.RunService
local u14 = v9.Workspace
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta").MinigameType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, script.Parent, "snowboarding-minigame-countdown-gui").SnowboardingMinigameCountdownGUI
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "SnowboardingMinigameController"
    end,
    ["__index"] = u16
})
u21.__index = u21
function u21.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
    --]]
    u16.constructor(p24)
    p24.Name = "SnowboardingMinigameController"
    p24.avalancheMaid = u8.new()
end
function u21.KnitStart(u25) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u18
        [3] = u17
        [4] = u14
        [5] = u11
        [6] = u15
        [7] = u7
        [8] = u5
        [9] = u19
        [10] = u10
        [11] = u12
    --]]
    u16.KnitStart(u25)
    u18.Client:WaitFor("MinigameStarted"):expect():Connect(function(p26) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u25
        --]]
        if p26.minigame.type == u17.SNOWBOARDING then
            u25:onMinigameStart()
        end
    end)
    u18.Client:WaitFor("MinigameEnded"):expect():Connect(function(p27) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u25
        --]]
        if p27.minigame.type == u17.SNOWBOARDING then
            u25:onMinigameEnded()
        end
    end)
    u18.Client:WaitFor("SnowboardingMinigameCountdown"):expect():Connect(function(u28) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u11
            [3] = u15
            [4] = u7
            [5] = u25
            [6] = u5
            [7] = u19
        --]]
        task.spawn(function() --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u11
                [3] = u15
                [4] = u7
                [5] = u28
                [6] = u25
                [7] = u5
                [8] = u19
            --]]
            local u29 = u14.CurrentCamera.CameraType
            u14.CurrentCamera.CameraType = Enum.CameraType.Scriptable
            task.delay(5, function() --[[ Line: 65 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u29
                --]]
                u14.CurrentCamera.CameraType = u29
            end)
            local v30 = u11.LocalPlayer
            if v30 ~= nil then
                v30 = v30.Character
            end
            if v30 ~= nil then
                v30 = v30:GetPivot().Position + Vector3.new(0, 1, -12)
            end
            if v30 == nil then
                v30 = u14.CurrentCamera:GetPivot().Position
            end
            local u31 = CFrame.new(Vector3.new(0, 5020, 100)) * CFrame.Angles(0, 0, 0)
            u14.CurrentCamera:PivotTo(u31)
            local u32 = CFrame.new(v30) * CFrame.Angles(0.3490658503988659, 3.141592653589793, 0)
            task.delay(2, function() --[[ Line: 95 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u7
                    [3] = u14
                    [4] = u31
                    [5] = u32
                --]]
                u15(3, u7, function(p33) --[[ Line: 96 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u31
                        [3] = u32
                    --]]
                    u14.CurrentCamera:PivotTo(u31:Lerp(u32, p33))
                end, 0, 1)
            end)
            local v34 = u28.endTime - u14:GetServerTimeNow()
            local v35 = os.time() + v34
            if v35 < os.time() then
                return nil
            end
            u25:showCountdownUI(v35)
            while os.time() < v35 do
                task.wait(0.1)
            end
            u25:hideCountdownUI()
            u5:playSound(u19.BRIDGE_DUEL_WHISTLE)
        end)
    end)
    u10:GetInstanceAddedSignal("SnowboardingAvalanche"):Connect(function(p36) --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25.avalanche = p36
    end)
    u18.Client:Get("SnowboardingMinigamePlayerFinishedRace"):Connect(function(p37) --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u5
            [3] = u19
            [4] = u12
            [5] = u14
        --]]
        local _ = p37.player == u11.LocalPlayer
        u5:playSound(u19.CONFETTI)
        local u38 = u12.Assets.Effects.ConfettiBedBreakParticle:Clone()
        local v39 = p37.player.Character
        if v39 ~= nil then
            v39 = v39.PrimaryPart
        end
        if v39 then
            local v40 = v39.Position + Vector3.new(0, 3, 0)
            u38:PivotTo(CFrame.new(v40))
            u38.Parent = u14
            u38.ConfettiParticle:Emit(80)
            task.delay(5, function() --[[ Line: 142 ]]
                --[[
                Upvalues:
                    [1] = u38
                --]]
                u38:Destroy()
            end)
        end
    end)
end
function u21.onMinigameStart(u41) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u5
        [4] = u19
        [5] = u13
        [6] = u4
    --]]
    u6.Controllers.WinterEventController:setStaticWinterEffectStrength(0.35)
    task.delay(6, function() --[[ Line: 151 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u41
            [3] = u5
            [4] = u19
            [5] = u13
            [6] = u4
        --]]
        local u42 = u11.LocalPlayer
        if u42 ~= nil then
            u42 = u42.Character
        end
        if u42 and u41.avalanche then
            local u43 = u5:playModifiableSound(u19.SNOWBOARD_AVALANCHE_LOOP, {
                ["looped"] = true
            })
            u41.avalancheMaid:GiveTask(function() --[[ Line: 162 ]]
                --[[
                Upvalues:
                    [1] = u43
                --]]
                u43:Stop()
                u43:Destroy()
            end)
            local u44 = (1 / 0)
            local v45 = u41.avalanche:FindFirstChild("Pivot")
            if v45 ~= nil then
                v45 = v45:FindFirstChild("DistancePart1")
            end
            local v46 = u41.avalanche:FindFirstChild("Pivot")
            if v46 ~= nil then
                v46 = v46:FindFirstChild("DistancePart2")
            end
            local v47 = u41.avalanche:FindFirstChild("Pivot")
            if v47 ~= nil then
                v47 = v47:FindFirstChild("DistancePart3")
            end
            local v48 = u41.avalanche:FindFirstChild("Pivot")
            if v48 ~= nil then
                v48 = v48:FindFirstChild("DistancePart4")
            end
            local v49 = u41.avalanche:FindFirstChild("Pivot")
            if v49 ~= nil then
                v49 = v49:FindFirstChild("DistancePart5")
            end
            local u50 = {
                v45,
                v46,
                v47,
                v48,
                v49
            }
            if u42 then
                local u51 = nil
                u51 = u13.Heartbeat:Connect(function() --[[ Line: 190 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                        [2] = u42
                        [3] = u51
                        [4] = u44
                        [5] = u50
                        [6] = u4
                        [7] = u43
                    --]]
                    if not (u41.avalanche and u42) then
                        u51:Disconnect()
                        return nil
                    end
                    u44 = (1 / 0)
                    for _, v52 in u50 do
                        local v53 = (u42:GetPivot().Position - v52.Position).Magnitude
                        if v53 < u44 then
                            u44 = v53
                        end
                    end
                    local v54 = u4:rangeMap(u44, { 500, 20 }, { 0, 1 })
                    u43.Volume = u4:rangeMap(math.clamp(v54, 0, 1), { 0, 1 }, { 0.3, 1 })
                end)
                u41.avalancheMaid:GiveTask(function() --[[ Line: 209 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                    --]]
                    u51:Disconnect()
                end)
            end
        end
    end)
end
function u21.onMinigameEnded(p55) --[[ Line: 216 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    p55.avalancheMaid:DoCleaning()
    u6.Controllers.WinterEventController:disableStaticWinterEffectStrength()
end
function u21.showCountdownUI(_, p56, p57) --[[ Line: 220 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u20
    --]]
    local v58 = {
        ["appId"] = "SnowboardingMinigameCountdownGui",
        ["app"] = u20
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v58, {
        ["DisableSounds"] = false,
        ["EndTime"] = p56,
        ["FrameProps"] = {},
        ["AnnouncementText"] = p57
    })
end
function u21.hideCountdownUI(_) --[[ Line: 231 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("SnowboardingMinigameCountdownGui") then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("SnowboardingMinigameCountdownGui")
    end
end
u6.CreateController(u21.new())
return nil