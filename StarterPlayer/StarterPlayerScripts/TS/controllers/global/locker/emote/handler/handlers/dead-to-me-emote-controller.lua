local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v2.WorldUtil
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.TableUtil
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u10 = v9.Linear
local u11 = v9.OutCirc
local u12 = v9.OutExpo
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.RunService
local u17 = v13.Workspace
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u26 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "DeadToMeEmoteController"
    end,
    ["__index"] = u19
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.constructor(p30)
    p30.Name = "DeadToMeEmoteController"
end
function u27.KnitStart(p31) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u7
        [3] = u22
        [4] = u26
        [5] = u15
        [6] = u3
        [7] = u25
        [8] = u20
        [9] = u4
        [10] = u24
        [11] = u18
        [12] = u10
        [13] = u12
        [14] = u21
        [15] = u8
        [16] = u5
        [17] = u14
        [18] = u23
        [19] = u17
        [20] = u16
        [21] = u11
    --]]
    u19.KnitStart(p31)
    local v32 = u7.Controllers.EmoteHandlerController
    local v33 = u22.DEAD_TO_ME
    local u34 = u26
    local u35 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 54 ]]
            return "Anonymous"
        end,
        ["__index"] = u34
    })
    u35.__index = u35
    function u35.new(...) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        local v36 = u35
        local v37 = setmetatable({}, v36)
        return v37:constructor(...) or v37
    end
    function u35.constructor(p38, ...) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34.constructor(p38, ...)
    end
    function u35.onEnable(p39, p40, p41, _, u42) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u3
            [3] = u25
            [4] = u20
            [5] = u4
            [6] = u24
            [7] = u18
            [8] = u10
            [9] = u12
            [10] = u21
            [11] = u8
            [12] = u5
            [13] = u14
            [14] = u23
            [15] = u17
            [16] = u16
            [17] = u11
        --]]
        if not p41.PrimaryPart then
            return nil
        end
        local v43 = p41.Humanoid
        if not v43 then
            return nil
        end
        local u44 = u15.Assets.Misc.ReaperScythe:Clone()
        u44.Parent = p41
        for v45, v46 in u44:GetDescendants() do
            local _ = v45 - 1
            if v46:IsA("BasePart") then
                u3:setQueryIgnored(v46, true)
                v46.Transparency = 1
            end
        end
        u25:weldCharacterAccessories(p41)
        local u47 = nil
        u42:GiveTask(p39:watchEmoteAnimation(p40, p41, u20.GRIM_REAPER_DEAD_TO_ME_EMOTE, function(p48) --[[ Line: 93 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u4
                [3] = u24
                [4] = u18
                [5] = u10
                [6] = u44
                [7] = u12
                [8] = u47
            --]]
            local v49 = u42
            local v50
            if p48 == nil then
                v50 = p48
            else
                v50 = p48:GetMarkerReachedSignal("scythe_spawn"):Connect(function() --[[ Line: 97 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                        [2] = u4
                        [3] = u24
                        [4] = u18
                        [5] = u10
                        [6] = u44
                    --]]
                    u42:GiveTask(u4:playSound(u24.SCYTHE_PULL_1))
                    u18(1, u10, function(p51) --[[ Line: 99 ]]
                        --[[
                        Upvalues:
                            [1] = u44
                        --]]
                        for v52, v53 in u44:GetDescendants() do
                            local _ = v52 - 1
                            if v53:IsA("BasePart") then
                                v53.Transparency = p51
                            end
                        end
                    end, 1, 0)
                    u42:GiveTask(u44)
                end)
            end
            v49:GiveTask(v50)
            local v54 = u42
            if p48 ~= nil then
                p48 = p48:GetMarkerReachedSignal("scythe_hide"):Connect(function() --[[ Line: 117 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                        [2] = u4
                        [3] = u24
                        [4] = u18
                        [5] = u12
                        [6] = u44
                        [7] = u10
                        [8] = u47
                    --]]
                    u42:GiveTask(u4:playSound(u24.SCYTHE_PULL_2))
                    u18(0.3, u12, function(p55) --[[ Line: 119 ]]
                        --[[
                        Upvalues:
                            [1] = u44
                        --]]
                        for v56, v57 in u44:GetDescendants() do
                            local _ = v56 - 1
                            if v57:IsA("BasePart") then
                                v57.Transparency = p55
                            end
                        end
                    end, 0, 1)
                    u18(1, u10, function(p58) --[[ Line: 130 ]]
                        --[[
                        Upvalues:
                            [1] = u47
                        --]]
                        for v59, v60 in u47:GetDescendants() do
                            local _ = v59 - 1
                            if v60:IsA("BasePart") and v60.Transparency ~= 1 then
                                v60.Transparency = p58
                            elseif v60:IsA("TextLabel") then
                                v60.TextTransparency = p58
                            end
                        end
                    end, 0, 1)
                end)
            end
            v54:GiveTask(p48)
        end))
        local v61 = p41.PrimaryPart.CFrame
        local v62 = p41.PrimaryPart.CFrame.RightVector * 5
        local v63 = p41.PrimaryPart.CFrame.LookVector * 1.2
        local v64 = -v43.HipHeight + 0.5
        local v65 = Vector3.new(0, v64, 0)
        local v66 = v61 + v62 - v63 + v65
        local v67 = u21
        local v68 = v66 - Vector3.new(0, v67, 0)
        u47 = u15.Assets.Misc.Gravestone:Clone()
        u47:PivotTo(v68)
        local u69 = p41.PrimaryPart.Position
        local v70 = u8
        local v71 = u5.getPlayersInFrontWithAngle({
            ["maxAngle"] = 25,
            ["position"] = p41.PrimaryPart.Position,
            ["direction"] = p41.PrimaryPart.CFrame.LookVector,
            ["maxDistance"] = u21 * 30
        })
        table.sort(v71, function(p72, p73) --[[ Line: 165 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            local v74 = p72.Character
            if v74 ~= nil then
                v74 = v74:GetPivot()
            end
            if not v74 then
                local v75 = p73.Character
                if v75 ~= nil then
                    v75 = v75:GetPivot()
                end
                v74 = not v75
            end
            if v74 then
                return false
            else
                return (u69 - p72.Character:GetPivot().Position).Magnitude > (u69 - p73.Character:GetPivot().Position).Magnitude
            end
        end)
        local u76 = u47
        local v77 = 0
        local v78 = {}
        for v79, v80 in v71 do
            local _ = v79 - 1
            if v80 ~= u14:GetPlayerByUserId(p40) == true then
                v77 = v77 + 1
                v78[v77] = v80
            end
        end
        local v81 = v70.Reverse(v78)
        local v82 = u76.Root.GravestoneModel.Gravestone.SurfaceGui.GravestoneText
        v82.RichText = true
        local v83 = {
            "Forever Missed",
            "RIP",
            "Here Lies",
            "Sleep Well",
            "Farewell"
        }
        local v84 = v83[math.random(0, #v83 - 1) + 1]
        if #v81 > 0 then
            v82.Text = v84 .. "\n" .. u23.getGamePlayer(v81[1]):getDisplayName()
        else
            v82.Text = v84 .. "\nYou"
        end
        u76.Parent = u17
        u42:GiveTask(u76)
        u18(1, u10, function(p85) --[[ Line: 213 ]]
            --[[
            Upvalues:
                [1] = u76
            --]]
            for v86, v87 in u76:GetDescendants() do
                local _ = v86 - 1
                if v87:IsA("BasePart") and v87.Transparency ~= 1 then
                    v87.Transparency = p85
                end
            end
        end, 1, 0)
        local u88 = 0
        u42:GiveTask(u16.Heartbeat:Connect(function(p89) --[[ Line: 225 ]]
            --[[
            Upvalues:
                [1] = u88
            --]]
            u88 = u88 + p89
        end))
        local u90 = u4:playSound(u24.ROCK_RUMBLE, {
            ["playbackSpeedMultiplier"] = 0.5,
            ["position"] = u76:GetPivot().Position
        })
        u42:GiveTask(u90)
        u18(1.5, u10, function(p91) --[[ Line: 233 ]]
            --[[
            Upvalues:
                [1] = u90
            --]]
            local v92 = u90:getInstance()
            if not v92 then
                return nil
            end
            v92.Volume = p91
        end, 1, 0)
        u18(2, u11, function(p93) --[[ Line: 240 ]]
            --[[
            Upvalues:
                [1] = u76
                [2] = u88
            --]]
            local v94 = u76
            local v95 = u88 * 60
            local v96 = (math.sin(v95) - 1) / 20
            local v97 = u88 * 70
            local v98 = (math.sin(v97) - 1) / 20
            local v99 = u88 * 80
            local v100 = (math.cos(v99) - 1) / 20
            v94:PivotTo(p93 + Vector3.new(v96, v98, v100))
        end, v68, v66)
    end
    function u35.onDisable(_, _, _, _) --[[ Line: 247 ]] end
    v32:registerHandler(v33, u35)
end
u7.CreateController(u27.new())
return nil