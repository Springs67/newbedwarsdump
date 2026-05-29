local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.RunService
local u11 = v9.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "part-effect-util").PartEffectUtil
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "RewardController"
    end,
    ["__index"] = u12
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
        [1] = u12
    --]]
    u12.constructor(p21)
    p21.Name = "RewardController"
end
function u18.KnitStart(u22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
    --]]
    u12.KnitStart(u22)
    u14.Client:Get("DisplayReward"):Connect(function(p23) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:spawnRewards(p23.rewards, p23.displayConfig)
    end)
    u14.Client:Get("DisplayRewardOpening"):Connect(function(p24) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:startCaseOpening(p24.case, p24.rewards, p24.displayConfig, p24.owner)
    end)
end
function u18.startCaseOpening(u25, p26, u27, p28, u29) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u11
        [4] = u17
    --]]
    local u30 = p26:Clone()
    local v31 = u30.PrimaryPart
    if not v31 then
        return nil
    end
    local u32 = u7.new()
    u32:GiveTask(u30)
    local v33 = u8("Part", {
        ["Name"] = "Hitbox",
        ["Size"] = Vector3.new(8, 8, 8),
        ["Transparency"] = 1,
        ["CFrame"] = v31:GetPivot(),
        ["Parent"] = u30,
        ["Children"] = { v31 }
    })
    u8("WeldConstraint", {
        ["Parent"] = v33,
        ["Part0"] = v33,
        ["Part1"] = v31
    })
    local u34 = v31
    u30.PrimaryPart = v33
    local u35 = v33
    local v36 = u8("Attachment", {
        ["Parent"] = u35
    })
    u8("AlignOrientation", {
        ["RigidityEnabled"] = true,
        ["Mode"] = Enum.OrientationAlignmentMode.OneAttachment,
        ["Attachment0"] = v36,
        ["CFrame"] = CFrame.new(),
        ["Parent"] = u35
    })
    for v37, v38 in u30:GetDescendants() do
        local _ = v37 - 1
        if v38:IsA("BasePart") then
            v38.CollisionGroup = "RewardCase"
            v38.Anchored = false
            v38.CanCollide = true
        end
    end
    u30.Parent = u11
    u30:PivotTo(CFrame.new(p28.location))
    u25:launchPart(u35)
    task.delay(0.6, function() --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u34
            [3] = u32
            [4] = u17
        --]]
        for v39, v40 in u30:GetDescendants() do
            local _ = v39 - 1
            if v40:IsA("BasePart") then
                v40.Anchored = true
            end
        end
        if u34 then
            u32:GiveTask(u17.applyMotionEffects(u34, {
                ["rotate"] = true,
                ["bob"] = true
            }))
        end
    end)
    local v41 = p28.displayRewardsDelaySec
    local v42 = 0.75 + (v41 == nil and 1.15 or v41) + 0.35
    task.delay(v42, function() --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u27
            [3] = u35
            [4] = u29
            [5] = u32
        --]]
        task.delay(0.35, function() --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u27
                [3] = u35
                [4] = u29
                [5] = u32
            --]]
            u25:spawnRewards(u27, {
                ["aliveSec"] = 6,
                ["location"] = u35:GetPivot().Position
            }, u29)
            task.delay(6, function() --[[ Line: 143 ]]
                --[[
                Upvalues:
                    [1] = u32
                --]]
                u32:DoCleaning()
            end)
        end)
    end)
end
function u18.spawnRewards(u43, p44, u45, u46) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u11
        [3] = u5
        [4] = u16
        [5] = u6
        [6] = u13
        [7] = u4
        [8] = u10
    --]]
    local u47 = {}
    local function v55(p48) --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u43
            [3] = u47
        --]]
        local v49 = u15.getRewardName(p48)
        local v50 = u43
        local v51 = {
            ["image"] = u15.getRewardImageId(p48)
        }
        local v52 = u15.getRewardType
        local v53 = v50:createRewardDisplay(v51, v49 .. " " .. tostring(v52(p48)))
        local v54 = u47
        table.insert(v54, v53)
    end
    for v56, v57 in p44 do
        v55(v57, v56 - 1, p44)
    end
    local u58 = 0
    local u59 = 0
    local function v94(u60) --[[ Line: 165 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u45
            [3] = u58
            [4] = u43
            [5] = u5
            [6] = u16
            [7] = u59
            [8] = u6
            [9] = u13
            [10] = u4
            [11] = u46
            [12] = u10
            [13] = u47
        --]]
        u60.Parent = u11
        u60.Position = u45.location
        local v61 = u45.velocity
        if not v61 then
            local v62 = u58
            local v63 = math.cos(v62) * 33
            local v64 = u58
            local v65 = math.sin(v64) * 33
            v61 = Vector3.new(v63, 40, v65)
        end
        if u45.direction then
            local _ = v61 * u45.direction
        end
        local u93 = u43:launchPart(u60, v61, function(u66) --[[ Line: 174 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u16
                [3] = u59
                [4] = u60
                [5] = u6
                [6] = u45
                [7] = u13
                [8] = u4
                [9] = u46
                [10] = u10
            --]]
            local u67 = u5:playSound(u16.NEW_EMERALD_PICKUP, {
                ["playbackSpeedMultiplier"] = 1.1 - u59 * 0.1,
                ["position"] = u60.Position
            })
            u66:GiveTask(function() --[[ Line: 179 ]]
                --[[
                Upvalues:
                    [1] = u67
                --]]
                local v68 = u67
                if v68 ~= nil then
                    v68 = v68:Destroy()
                end
                return v68
            end)
            local v69 = u6.Controllers.FireworkController
            local v70 = u45.location
            local v71 = u45.fireworkType
            if v71 == nil then
                v71 = u13.NEW_YEARS
            end
            v69:playFireworkEffect(v70, v71)
            local u72 = u5:playSound(u4.fromList(u16.FIREWORK_EXPLODE_1, u16.FIREWORK_EXPLODE_2, u16.FIREWORK_EXPLODE_3), {
                ["playbackSpeedMultiplier"] = 1.1 - u59 * 0.1,
                ["position"] = u60.Position
            })
            u66:GiveTask(function() --[[ Line: 197 ]]
                --[[
                Upvalues:
                    [1] = u72
                --]]
                local v73 = u72
                if v73 ~= nil then
                    v73 = v73:Destroy()
                end
                return v73
            end)
            local v74 = {
                ["rollOffMaxDistance"] = 120,
                ["rollOffMinDistance"] = 30,
                ["volumeMultiplier"] = 1.4,
                ["parent"] = u60
            }
            local u75 = u5:playSound(u16.EMERALD_GENERATOR_AURA, v74)
            u66:GiveTask(function() --[[ Line: 210 ]]
                --[[
                Upvalues:
                    [1] = u75
                --]]
                local v76 = u75
                if v76 ~= nil then
                    v76 = v76:Destroy()
                end
                return v76
            end)
            local v77 = u45.aliveSec
            if v77 ~= 0 and (v77 == v77 and v77) then
                task.delay(u45.aliveSec - 1, function() --[[ Line: 222 ]]
                    --[[
                    Upvalues:
                        [1] = u46
                        [2] = u66
                        [3] = u10
                        [4] = u60
                    --]]
                    local v78 = u46
                    if v78 ~= nil then
                        v78 = v78.Character
                    end
                    if v78 then
                        local u79 = 0
                        local u80 = v78:FindFirstChild("UpperTorso")
                        if u80 == nil then
                            return nil
                        end
                        local v81 = math.random(-2, 2)
                        local v82 = math.random(3, 4)
                        local v83 = math.random
                        local u84 = Vector3.new(v81, v82, v83(-2, 2))
                        u66:GiveTask(u10.Heartbeat:Connect(function(p85) --[[ Line: 239 ]]
                            --[[
                            Upvalues:
                                [1] = u80
                                [2] = u60
                                [3] = u79
                                [4] = u84
                            --]]
                            if u80.Parent == nil then
                                return nil
                            end
                            if u60 == nil then
                                return nil
                            end
                            u79 = u79 + p85
                            local v86 = u79 / 0.95
                            local v87 = math.clamp(v86, 0, 1)
                            local v88 = u60.Position:Lerp(u80.Position, (math.sqrt(v87)))
                            local v89 = v87 * 3.141592653589793
                            local v90 = math.sin(v89)
                            local v91 = v88 + u84 * Vector3.new(v90, v90, v90)
                            local v92 = CFrame.Angles(6.283185307179586 * (u79 % 2), 6.283185307179586 * (u79 % 3), 6.283185307179586 * (u79 % 1.5))
                            u60:PivotTo(CFrame.new(v91) * v92)
                        end))
                    end
                end)
            end
        end)
        if u45.aliveSec ~= nil then
            task.delay(u45.aliveSec, function() --[[ Line: 266 ]]
                --[[
                Upvalues:
                    [1] = u93
                    [2] = u60
                --]]
                u93:DoCleaning()
                u60:Destroy()
            end)
        end
        u58 = u58 + 6.283185307179586 / #u47
        u59 = u59 + 1
        task.wait(0.2)
    end
    for v95, v96 in u47 do
        v94(v96, v95 - 1, u47)
    end
    return u47
end
function u18.createRewardDisplay(_, p97, p98) --[[ Line: 280 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
    --]]
    local v99 = u8("Part", {
        ["Name"] = "RewardPart",
        ["Transparency"] = 1,
        ["CollisionGroup"] = "RewardDisplay",
        ["CanQuery"] = true,
        ["CanCollide"] = true
    })
    local v100 = u8("BillboardGui", {
        ["StudsOffset"] = Vector3.new(0, 6, 0),
        ["Brightness"] = 1.5,
        ["ResetOnSpawn"] = false,
        ["Size"] = UDim2.new(4, 20, 4, 20),
        ["Parent"] = v99,
        ["Children"] = { u8("TextLabel", {
                ["Name"] = "Name",
                ["TextSize"] = 14,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 10,
                ["Text"] = "<b>" .. p98 .. "</b>",
                ["Size"] = UDim2.fromScale(1, 0.25),
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Top,
                ["Font"] = Enum.Font.Arial,
                ["Parent"] = v99
            }) }
    })
    local v101 = p97.image
    if v101 == "" or not v101 then
        if p97.text then
            u8("TextLabel", {
                ["Name"] = "RewardText",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Text"] = p97.text.value,
                ["Size"] = UDim2.fromScale(2.5, 0.3),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["TextColor3"] = p97.text.color or u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["Font"] = Enum.Font.LuckiestGuy,
                ["Parent"] = v100
            })
        end
        return v99
    else
        u8("ImageLabel", {
            ["Name"] = "RewardImage",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.75),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
            ["Image"] = p97.image,
            ["Children"] = { u8("UIAspectRatioConstraint", {
                    ["DominantAxis"] = Enum.DominantAxis.Width,
                    ["AspectType"] = Enum.AspectType.FitWithinMaxSize
                }) },
            ["Parent"] = v100
        })
        return v99
    end
end
function u18.launchPart(_, p102, p103, p104) --[[ Line: 348 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v105 = u7.new()
    p102.AssemblyLinearVelocity = p103 or Vector3.new(24, 40, 24)
    if p104 ~= nil then
        p104(v105)
    end
    return v105
end
u6.CreateController(u18.new())
return nil