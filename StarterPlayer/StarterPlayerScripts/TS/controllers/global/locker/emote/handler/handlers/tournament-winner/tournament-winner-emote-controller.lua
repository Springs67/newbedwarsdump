local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.WatchCharacterAnimation
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.TweenService
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u15 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler
local u16 = v1.import(script, script.Parent, "tournament-winner-arrow-billboard").TournamentWinnerArrowBillboard
local u17 = v1.import(script, script.Parent, "tournament-winner-billboard").TournamentWinnerBillboard
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "TournamentWinnerEmoteController"
    end,
    ["__index"] = u11
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
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p21)
    p21.Name = "TournamentWinnerEmoteController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u14
        [4] = u15
        [5] = u6
        [6] = u17
        [7] = u16
        [8] = u8
        [9] = u10
        [10] = u3
        [11] = u9
        [12] = u4
        [13] = u13
        [14] = u12
    --]]
    u11.KnitStart(p22)
    local v23 = u5.Controllers.EmoteHandlerController
    local v24 = u14.TOURNAMENT_WINNER
    local u25 = u15
    local u26 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 45 ]]
            return "Anonymous"
        end,
        ["__index"] = u25
    })
    u26.__index = u26
    function u26.new(...) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        local v27 = u26
        local v28 = setmetatable({}, v27)
        return v28:constructor(...) or v28
    end
    function u26.constructor(p29, ...) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25.constructor(p29, ...)
    end
    function u26.onEnable(_, u30, p31, _, u32) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u17
            [3] = u16
            [4] = u8
            [5] = u10
            [6] = u3
            [7] = u9
            [8] = u4
            [9] = u13
            [10] = u12
        --]]
        local u33 = u6.mount(u6.createElement(u17, {
            ["Character"] = p31
        }), p31, "TournamentWinnerBillboard")
        local u34 = u6.mount(u6.createElement(u16, {
            ["Character"] = p31
        }), p31, "TournamentWinnerArrow")
        local u35 = u8.Assets.Misc.TourneyPodium:Clone()
        local u36 = u35:FindFirstChild("3rdPlace")
        local u37 = u35:FindFirstChild("2ndPlace")
        local u38 = u35:FindFirstChild("1stPlace")
        u35.Parent = u10
        for v39, v40 in u35:GetDescendants() do
            local _ = v39 - 1
            if v40:IsA("BasePart") then
                u3:setQueryIgnored(v40, true)
                v40.CanCollide = false
                v40.Anchored = true
            end
        end
        u35:PivotTo(p31.LowerTorso.CFrame + Vector3.new(0, -6.2, 0))
        u9:Create(u36, TweenInfo.new(1.9, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            ["Position"] = u36.Position + Vector3.new(0, 6, 0)
        }):Play()
        u9:Create(u37, TweenInfo.new(1.9, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            ["Position"] = u37.Position + Vector3.new(0, 6, 0)
        }):Play()
        u9:Create(u38, TweenInfo.new(1.9, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            ["Position"] = u38.Position + Vector3.new(0, 6, 0)
        }):Play()
        local v41 = u38:GetDescendants()
        local function v43(p42) --[[ Line: 110 ]]
            --[[
            Upvalues:
                [1] = u9
            --]]
            if p42:IsA("BasePart") then
                u9:Create(p42, TweenInfo.new(1.9, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["Position"] = p42.Position + Vector3.new(0, 6, 0)
                }):Play()
            end
        end
        for v44, v45 in v41 do
            v43(v45, v44 - 1, v41)
        end
        u32:GiveTask((u4({ u13:getAssetId(u12.TOURNAMENT_WINNER) }, function(p46, p47) --[[ Line: 126 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u32
                [3] = u9
                [4] = u36
                [5] = u37
                [6] = u38
            --]]
            if p46.UserId ~= u30 then
                return nil
            end
            local v48 = u32
            if p47 ~= nil then
                p47 = p47:GetMarkerReachedSignal("Falling"):Connect(function() --[[ Line: 133 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u36
                        [3] = u37
                        [4] = u38
                    --]]
                    u9:Create(u36, TweenInfo.new(0.52, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Position"] = u36.Position + Vector3.new(0, -6, 0)
                    }):Play()
                    u9:Create(u37, TweenInfo.new(0.52, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Position"] = u37.Position + Vector3.new(0, -6, 0)
                    }):Play()
                    u9:Create(u38, TweenInfo.new(0.52, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Position"] = u38.Position + Vector3.new(0, -6, 0)
                    }):Play()
                    local v49 = u38:GetDescendants()
                    local function v51(p50) --[[ Line: 159 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                        --]]
                        if p50:IsA("BasePart") then
                            u9:Create(p50, TweenInfo.new(0.52, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                ["Position"] = p50.Position + Vector3.new(0, -6, 0)
                            }):Play()
                        end
                    end
                    for v52, v53 in v49 do
                        v51(v53, v52 - 1, v49)
                    end
                end)
            end
            v48:GiveTask(p47)
        end)))
        u32:GiveTask(function() --[[ Line: 180 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u6
                [3] = u33
                [4] = u34
            --]]
            u35:Destroy()
            u6.unmount(u33)
            u6.unmount(u34)
        end)
    end
    function u26.onDisable(_, _, _, _) --[[ Line: 186 ]] end
    v23:registerHandler(v24, u26)
end
u5.CreateController(u18.new())
return nil