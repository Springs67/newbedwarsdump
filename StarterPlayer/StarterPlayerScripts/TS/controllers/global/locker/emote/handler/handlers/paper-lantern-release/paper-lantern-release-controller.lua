local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ReplicatedStorage
local u12 = v10.TweenService
local u13 = v10.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u21 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler
local u22 = v1.import(script, script.Parent, "lantern-flicker").LanternFlicker
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "PaperLanternReleaseController"
    end,
    ["__index"] = u15
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p26)
    p26.Name = "PaperLanternReleaseController"
end
function u23.KnitStart(p27) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u5
        [3] = u18
        [4] = u21
        [5] = u7
        [6] = u3
        [7] = u11
        [8] = u8
        [9] = u9
        [10] = u22
        [11] = u20
        [12] = u12
        [13] = u17
        [14] = u16
        [15] = u4
        [16] = u19
        [17] = u13
        [18] = u14
        [19] = u6
    --]]
    u15.KnitStart(p27)
    local v28 = u5.Controllers.EmoteHandlerController
    local v29 = u18.PAPER_LANTERN_RELEASE
    local u30 = u21
    local u31 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 50 ]]
            return "Anonymous"
        end,
        ["__index"] = u30
    })
    u31.__index = u31
    function u31.new(...) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        local v32 = u31
        local v33 = setmetatable({}, v32)
        return v33:constructor(...) or v33
    end
    function u31.constructor(p34) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30.constructor(p34)
        p34.playerLanternMaidMap = {}
    end
    function u31.onEnable(u35, u36, p37, _, p38) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u11
            [4] = u8
            [5] = u9
            [6] = u22
            [7] = u20
            [8] = u12
            [9] = u17
            [10] = u16
            [11] = u4
            [12] = u19
            [13] = u13
            [14] = u14
            [15] = u6
        --]]
        local u39 = false
        local u40 = u7.new()
        local v41 = u3.fromList
        local v42 = u11.Assets.Misc.LNYLanterns
        local v43 = v41(unpack(v42:GetChildren()))
        local u44 = v43:Clone()
        u44.Frame.BallSocketConstraint.Enabled = false
        local u45 = u8("WeldConstraint", {
            ["Parent"] = u44.Charm,
            ["Part0"] = u44.Charm,
            ["Part1"] = u44.Frame
        })
        local u46 = u44.Paper
        local u47 = u8("Part", {
            ["Name"] = "Handle",
            ["Size"] = Vector3.new(1, 1, 1),
            ["Transparency"] = 1,
            ["CanCollide"] = false,
            ["Anchored"] = false,
            ["CanQuery"] = false,
            ["CanTouch"] = false,
            ["Children"] = { u44 },
            ["Position"] = v43:GetPivot().Position
        })
        u8("WeldConstraint", {
            ["Parent"] = u47,
            ["Part0"] = u47,
            ["Part1"] = u46
        })
        local u48 = u8("Attachment", {
            ["Name"] = "LeftGripAttachment",
            ["Orientation"] = Vector3.new(0, 130, 0),
            ["Position"] = Vector3.new(1, 0, 0),
            ["Parent"] = u47
        })
        u8("PointLight", {
            ["Brightness"] = 3,
            ["Range"] = 9,
            ["Parent"] = u46,
            ["Color"] = Color3.fromRGB(255, 183, 0)
        })
        local u49 = u9.mount(u9.createElement(u22), u46)
        u40:GiveTask(function() --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u49
            --]]
            u9.unmount(u49)
        end)
        local u50 = u8("Accessory", {
            ["Name"] = "LanternEmoteAccesory",
            ["Children"] = { u47 }
        })
        u50.Parent = p37
        u20:weldCharacterAccessories(p37)
        u40:GiveTask(function() --[[ Line: 114 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u50
                [3] = u12
            --]]
            if u39 then
                local v51 = u50:GetDescendants()
                local function v53(p52) --[[ Line: 117 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                    --]]
                    if p52:IsA("BasePart") then
                        u12:Create(p52, TweenInfo.new(2), {
                            ["Transparency"] = 1
                        }):Play()
                    end
                end
                for v54, v55 in v51 do
                    v53(v55, v54 - 1, v51)
                end
                task.delay(2, function() --[[ Line: 127 ]]
                    --[[
                    Upvalues:
                        [1] = u50
                    --]]
                    u50:Destroy()
                end)
            else
                u50:Destroy()
            end
        end)
        local u56 = u17:getAssetId(u16.SUMMON_SNOW)
        p38:GiveTask(p37.Humanoid.Animator.AnimationPlayed:Connect(function(p57) --[[ Line: 138 ]]
            --[[
            Upvalues:
                [1] = u56
                [2] = u40
                [3] = u4
                [4] = u19
                [5] = u46
                [6] = u35
                [7] = u36
                [8] = u44
                [9] = u45
                [10] = u39
                [11] = u47
                [12] = u48
                [13] = u50
                [14] = u13
                [15] = u14
                [16] = u6
            --]]
            local v58 = p57.Animation
            if v58 ~= nil then
                v58 = v58.AnimationId
            end
            if v58 ~= u56 then
                return nil
            end
            u40:GiveTask(p57:GetMarkerReachedSignal("LeaveHand"):Connect(function() --[[ Line: 146 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u19
                    [3] = u46
                    [4] = u35
                    [5] = u36
                    [6] = u40
                    [7] = u44
                    [8] = u45
                    [9] = u39
                    [10] = u47
                    [11] = u48
                    [12] = u50
                    [13] = u13
                    [14] = u14
                    [15] = u6
                --]]
                u4:playSound(u19.LANTERN_RELEASE, {
                    ["rollOffMaxDistance"] = 50,
                    ["volumeMultiplier"] = 0.7,
                    ["position"] = u46:GetPivot().Position
                })
                local v59 = u35.playerLanternMaidMap[u36]
                if v59 then
                    v59:Destroy()
                end
                local u60 = 0
                u40:GiveTask(task.spawn(function() --[[ Line: 159 ]]
                    --[[
                    Upvalues:
                        [1] = u60
                        [2] = u44
                    --]]
                    while true do
                        local v61 = task.wait(0.01)
                        if v61 == 0 or (v61 ~= v61 or not v61) then
                            break
                        end
                        u60 = u60 + 1
                        local v62 = u44.Charm
                        local v63 = u60 % 10
                        local v64 = v63 ~= 0 and (v63 == v63 and v63) and 0 or (math.random() - 0.5) / 35
                        local v65 = (math.random() - 1) / 15
                        local v66 = u60 % 10
                        local v67 = v66 ~= 0 and (v66 == v66 and v66) and 0 or (math.random() - 0.5) / 35
                        v62:ApplyImpulse((Vector3.new(v64, v65, v67)))
                    end
                end))
                u44.Frame.BallSocketConstraint.Enabled = true
                u45:Destroy()
                u35.playerLanternMaidMap[u36] = u40
                u40:GiveTask(function() --[[ Line: 179 ]]
                    --[[
                    Upvalues:
                        [1] = u40
                        [2] = u35
                        [3] = u36
                    --]]
                    u40:Destroy()
                    u35.playerLanternMaidMap[u36] = nil
                end)
                u39 = true
                u47.Anchored = true
                u48:Destroy()
                u50.Parent = u13
                local u68 = u47.CFrame
                local u69 = 0
                local u70 = 0
                local u71 = 0
                local u72 = 0
                local u73 = 20
                local u74 = 20
                u40:GiveTask((task.spawn(function() --[[ Line: 198 ]]
                    --[[
                    Upvalues:
                        [1] = u71
                        [2] = u72
                    --]]
                    while true do
                        local v75 = task.wait(1)
                        if v75 == 0 or (v75 ~= v75 or not v75) then
                            break
                        end
                        local v76 = math.random()
                        u71 = math.round(v76)
                        local v77 = math.random()
                        u72 = math.round(v77)
                    end
                end)))
                u40:GiveTask((task.spawn(function() --[[ Line: 209 ]]
                    --[[
                    Upvalues:
                        [1] = u69
                        [2] = u71
                        [3] = u70
                        [4] = u72
                    --]]
                    while true do
                        local v78 = task.wait(0.25)
                        if v78 == 0 or (v78 ~= v78 or not v78) then
                            break
                        end
                        u69 = (u71 == 1 and 1 or -1) * 0.005
                        u70 = (u72 == 1 and 1 or -1) * 0.005
                    end
                end)))
                local u114 = u14(45, u6, function(p79) --[[ Line: 220 ]]
                    --[[
                    Upvalues:
                        [1] = u73
                        [2] = u69
                        [3] = u74
                        [4] = u70
                        [5] = u68
                        [6] = u47
                    --]]
                    u73 = u73 + u69
                    u74 = u74 + u70
                    local v80 = u73
                    u73 = math.clamp(v80, 19.5, 20.5)
                    local v81 = u74
                    u74 = math.clamp(v81, 19.5, 20.5)
                    local v82 = p79 * (5 / (2.71828 ^ ((u73 - 15) * -0.2) + 1) + 10)
                    local v83 = math.sin(v82) * 10
                    local v84 = p79 * (5 / (2.71828 ^ ((u74 - 15) * -0.2) + 1) + 10)
                    local v85 = math.cos(v84) * 10
                    local v86 = Vector3.new(v83, 30, v85)
                    local v87 = p79 / 0.15555555555555556
                    local v88 = 1 - math.min(v87, 1)
                    local v89 = u68 + v86
                    local v90 = { u68:ToEulerAnglesXYZ() }
                    local v91 = u47
                    local v92 = CFrame.new(u68.Position)
                    local v93 = CFrame.Angles
                    local v94 = v90[1] * v88
                    local v95 = (1 - u73 / 20) * 150
                    local v96 = v94 + math.rad(v95)
                    local v97 = v90[2] * v88
                    local v98 = (1 - u73 / 20) * 150
                    local v99 = v97 + math.rad(v98)
                    local v100 = v90[3] * v88
                    local v101 = (1 - u74 / 20) * 150
                    local v102 = v93(v96, v99, v100 + math.rad(v101))
                    local v103 = CFrame.new(v89.Position)
                    local v104 = CFrame.Angles
                    local v105 = v90[1] * v88
                    local v106 = (1 - u73 / 20) * 150
                    local v107 = v105 + math.rad(v106)
                    local v108 = v90[2] * v88
                    local v109 = (1 - u73 / 20) * 150
                    local v110 = v108 + math.rad(v109)
                    local v111 = v90[3] * v88
                    local v112 = (1 - u74 / 20) * 150
                    local v113 = v104(v107, v110, v111 + math.rad(v112))
                    v91:PivotTo((v92 * v102):Lerp(v103 * v113, p79))
                end)
                u40:GiveTask(function() --[[ Line: 236 ]]
                    --[[
                    Upvalues:
                        [1] = u114
                    --]]
                    u114:Cancel()
                end)
                u40:GiveTask(task.delay(43, function() --[[ Line: 239 ]]
                    --[[
                    Upvalues:
                        [1] = u40
                    --]]
                    u40:DoCleaning()
                end))
            end))
        end))
        p38:GiveTask(function() --[[ Line: 244 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u40
            --]]
            if not u39 then
                u40:Destroy()
            end
        end)
    end
    function u31.onDisable(_, _, _, _) --[[ Line: 250 ]] end
    v28:registerHandler(v29, u31)
end
u5.CreateController(u23.new())
return nil