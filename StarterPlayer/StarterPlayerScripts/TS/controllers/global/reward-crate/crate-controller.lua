local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v3.WatchComponent
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.RunService
local u17 = v13.Workspace
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "crate", "reward-crate-component").RewardCrateComponent
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-constants").CrateConstants
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-meta").getCrateItemMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-meta").CrateMeta
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u30 = v1.import(script, script.Parent, "crate-reward-title").CrateRewardTitle
local u31 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "CrateController"
    end
})
u31.__index = u31
function u31.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    local v32 = u31
    local v33 = setmetatable({}, v32)
    return v33:constructor(...) or v33
end
function u31.constructor(p34) --[[ Line: 44 ]]
    p34.crateMaids = {}
end
function u31.onStart(u35) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u20
        [3] = u27
        [4] = u10
        [5] = u14
        [6] = u11
        [7] = u8
        [8] = u23
        [9] = u22
        [10] = u25
        [11] = u24
        [12] = u19
        [13] = u18
        [14] = u6
        [15] = u28
        [16] = u26
        [17] = u21
        [18] = u4
        [19] = u17
        [20] = u12
        [21] = u30
        [22] = u15
        [23] = u29
        [24] = u5
        [25] = u16
    --]]
    u7(u20, function(u36) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u10
            [3] = u35
            [4] = u14
            [5] = u11
            [6] = u8
            [7] = u23
            [8] = u22
        --]]
        local v37 = u36.attributes.crateType
        if not v37 then
            return nil
        end
        local v38 = u27[v37]
        local v39 = u10.new()
        u35.crateMaids[u36.instance] = v39
        if u36.attributes.owner == nil and true or u36.attributes.owner == u14.LocalPlayer.UserId then
            local v40 = u11("Part", {
                ["Name"] = "PromptPart",
                ["Transparency"] = 1,
                ["CanCollide"] = false,
                ["CanQuery"] = false,
                ["Anchored"] = true,
                ["Size"] = Vector3.new(1, 1, 1),
                ["Position"] = u36.instance:GetPivot().Position + Vector3.new(0, 5, 0),
                ["Parent"] = u36.instance
            })
            local v41 = u8.Controllers.ProximityPromptController
            local v42 = {
                ["Name"] = "OpenCratePrompt"
            }
            local v43 = u36.attributes.promptObjectLabel
            if v43 == nil then
                v43 = v38.displayName
            end
            v42.ObjectText = v43
            local v44 = u36.attributes.promptActionText
            v42.ActionText = v44 == nil and "Open Crate" or v44
            v42.HoldDuration = 1.2
            v42.RequiresLineOfSight = false
            v42.MaxActivationDistance = u23.CRATE_MAX_ACTIVATION_DISTANCE
            v42.Parent = v40
            local u45 = v41:createProximityPrompt(v42)
            u36:setOpenCratePrompt(u45)
            u45.Triggered:Connect(function(_) --[[ Line: 102 ]]
                --[[
                Upvalues:
                    [1] = u36
                    [2] = u8
                    [3] = u22
                    [4] = u45
                    [5] = u23
                --]]
                local v46 = u36.attributes.altarId
                if v46 == 0 or (v46 ~= v46 or not v46) then
                    u22.Client:GetNamespace("RewardCrate"):Get("OpenRewardCrate"):SendToServer({
                        ["crateId"] = u36.attributes.crateId
                    })
                    u45.Enabled = false
                    task.delay(u23.CRATE_OPEN_DECAY_SECONDS, function() --[[ Line: 113 ]]
                        --[[
                        Upvalues:
                            [1] = u45
                        --]]
                        u45.Enabled = true
                    end)
                else
                    u8.Controllers.CrateAltarController:requestOpenCrate(u36.attributes.crateId, u36.attributes.altarId)
                end
            end)
        end
        local u47 = nil
        u47 = u36.instance.Destroying:Connect(function() --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u36
                [3] = u47
            --]]
            u35:cleanupCrate(u36.instance)
            u47:Disconnect()
        end)
    end)
    u22.Client:GetNamespace("RewardCrate"):Get("CrateOpened"):Connect(function(p48) --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u10
            [3] = u23
            [4] = u24
            [5] = u35
            [6] = u19
            [7] = u18
            [8] = u6
            [9] = u28
            [10] = u26
            [11] = u11
            [12] = u21
            [13] = u4
            [14] = u17
            [15] = u12
            [16] = u30
            [17] = u15
            [18] = u29
            [19] = u5
            [20] = u16
        --]]
        local _ = p48.openingPlayer
        local u49 = p48.crateModel
        local v50 = p48.reward
        local u51 = p48.visualOverrides
        local u52 = v50.rarity
        if u52 == nil then
            u52 = u25.ONE_STAR
        end
        local v53
        if u49 == nil then
            v53 = u49
        else
            v53 = u49.Parent
        end
        if not v53 then
            return nil
        end
        local u54 = u10.new()
        task.delay(u23.CRATE_OPEN_DECAY_SECONDS, function() --[[ Line: 145 ]]
            --[[
            Upvalues:
                [1] = u54
            --]]
            u54:DoCleaning()
        end)
        local u55 = u24(v50.itemType)
        local u56 = {}
        for v57, v58 in u55.itemDisplay do
            u56[v57] = v58
        end
        local v59
        if u51 == nil then
            v59 = u51
        else
            v59 = u51.itemDisplay
        end
        if type(v59) == "table" then
            for v60, v61 in v59 do
                u56[v60] = v61
            end
        end
        local v62 = u35.crateMaids[u49]
        if v62 ~= nil then
            v62:GiveTask(u54)
        end
        local u63 = u19:playAnimation(u49, u18.LUCKY_BOX_OPEN)
        if not u63 then
            u54:DoCleaning()
            return nil
        end
        local u64 = u6:playSound(u28.LUCKY_BOX_OPEN, {
            ["rollOffMinDistance"] = 30,
            ["rollOffMaxDistance"] = 45,
            ["position"] = u49:GetPivot().Position
        })
        u54:GiveTask(function() --[[ Line: 178 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u28
                [3] = u49
                [4] = u64
            --]]
            u6:playSound(u28.LUCKY_BOX_CLOSE, {
                ["rollOffMinDistance"] = 30,
                ["rollOffMaxDistance"] = 45,
                ["position"] = u49:GetPivot().Position
            })
            local v65 = u64
            if v65 ~= nil then
                v65:Stop()
            end
        end)
        local u66 = u49.PrimaryPart
        if u66 ~= nil then
            u66 = u66:FindFirstChild("neon")
        end
        u66.Color = u26(u52).gradient.colorTop
        u66.Transparency = 0
        u54:GiveTask(function() --[[ Line: 197 ]]
            --[[
            Upvalues:
                [1] = u66
            --]]
            u66.Transparency = 1
        end)
        u54:GiveTask(function() --[[ Line: 200 ]]
            --[[
            Upvalues:
                [1] = u63
            --]]
            return u63:Stop(0.75)
        end)
        u54:GiveTask(u63:GetMarkerReachedSignal("pause"):Connect(function() --[[ Line: 203 ]]
            --[[
            Upvalues:
                [1] = u63
            --]]
            u63:AdjustSpeed(0)
        end))
        u54:GiveTask(u63:GetMarkerReachedSignal("glow_begin"):Connect(function() --[[ Line: 206 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u52
                [3] = u6
                [4] = u49
            --]]
            local v67 = ({
                u28.LUCKY_BOX_PREVIEW_COMMON,
                u28.LUCKY_BOX_PREVIEW_UNCOMMON,
                u28.LUCKY_BOX_PREVIEW_RARE,
                u28.LUCKY_BOX_PREVIEW_EPIC,
                u28.LUCKY_BOX_PREVIEW_LEGENDARY,
                u28.LUCKY_BOX_PREVIEW_MYTHIC
            })[u52 + 1]
            if v67 ~= "" and v67 then
                u6:playSound(v67, {
                    ["volumeMultiplier"] = 1.3,
                    ["rollOffMinDistance"] = 30,
                    ["rollOffMaxDistance"] = 45,
                    ["position"] = u49:GetPivot().Position
                })
            end
        end))
        u54:GiveTask(u63:GetMarkerReachedSignal("reveal_item"):Connect(function() --[[ Line: 218 ]]
            --[[
            Upvalues:
                [1] = u56
                [2] = u49
                [3] = u11
                [4] = u21
                [5] = u4
                [6] = u17
                [7] = u52
                [8] = u25
                [9] = u26
                [10] = u54
                [11] = u28
                [12] = u6
                [13] = u12
                [14] = u51
                [15] = u55
                [16] = u30
                [17] = u15
                [18] = u29
                [19] = u5
                [20] = u16
            --]]
            local u68 = nil
            local v69 = u56.image
            if v69 == "" or not v69 then
                if u56.itemType then
                    local v70 = u56.itemType
                    local v71 = u21.createItemInstance(v70):Clone()
                    for v72, v73 in v71:GetDescendants() do
                        local _ = v72 - 1
                        u4:setQueryIgnored(v73, true)
                    end
                    u68 = v71:FindFirstChild("Handle")
                    u68.Parent = u17
                    if u52 ~= u25.ONE_STAR then
                        for _, v74 in v71:GetDescendants() do
                            if v74:IsA("BasePart") and v74.Transparency ~= 1 then
                                for _, v75 in Enum.NormalId:GetEnumItems() do
                                    u11("Texture", {
                                        ["Texture"] = "rbxassetid://9353205239",
                                        ["Transparency"] = 0.7,
                                        ["Color3"] = u26(u52).gradient.colorTop,
                                        ["Parent"] = v74,
                                        ["Face"] = v75
                                    })
                                end
                            end
                        end
                    end
                elseif u56.text then
                    u68 = u11("Part", {
                        ["Transparency"] = 1,
                        ["CanCollide"] = false,
                        ["CanQuery"] = false,
                        ["Anchored"] = true,
                        ["Size"] = Vector3.new(1, 1, 1),
                        ["Position"] = u49:GetPrimaryPartCFrame().Position + Vector3.new(0, 5, 0),
                        ["Parent"] = u49
                    })
                    local v76 = {
                        ["MaxDistance"] = 60,
                        ["AlwaysOnTop"] = true,
                        ["DistanceLowerLimit"] = 25,
                        ["DistanceUpperLimit"] = 10,
                        ["Parent"] = u68,
                        ["Size"] = UDim2.fromOffset(40, 40)
                    }
                    local v77 = {
                        ["Size"] = UDim2.fromScale(1, 1)
                    }
                    local v78 = u56.text
                    if v78 ~= nil then
                        v78 = v78.richText
                    end
                    v77.Text = v78
                    local v79 = u56.text
                    if v79 ~= nil then
                        v79 = v79.color
                    end
                    if v79 == nil then
                        v79 = Color3.fromRGB(255, 255, 255)
                    end
                    v77.TextColor3 = v79
                    local v80 = u56.text
                    if v80 ~= nil then
                        v80 = v80.font
                    end
                    if v80 == nil then
                        v80 = Enum.Font.LuckiestGuy
                    end
                    v77.Font = v80
                    v77.TextScaled = true
                    v77.RichText = true
                    v77.TextXAlignment = Enum.TextXAlignment.Center
                    v77.BackgroundTransparency = 1
                    v76.Children = { u11("TextLabel", v77) }
                    u11("BillboardGui", v76)
                end
            else
                u68 = u11("Part", {
                    ["Transparency"] = 1,
                    ["CanCollide"] = false,
                    ["CanQuery"] = false,
                    ["Anchored"] = true,
                    ["Size"] = Vector3.new(1, 1, 1),
                    ["Position"] = u49:GetPrimaryPartCFrame().Position + Vector3.new(0, 5, 0),
                    ["Parent"] = u49
                })
                u11("BillboardGui", {
                    ["MaxDistance"] = 60,
                    ["AlwaysOnTop"] = true,
                    ["DistanceLowerLimit"] = 25,
                    ["DistanceUpperLimit"] = 25,
                    ["Parent"] = u68,
                    ["Size"] = UDim2.fromOffset(50, 50),
                    ["Children"] = { u11("ImageLabel", {
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["ScaleType"] = Enum.ScaleType.Fit,
                            ["Image"] = u56.image
                        }) }
                })
            end
            u54:GiveTask(u68)
            local v81 = ({
                u28.LUCKY_BOX_REVEAL_COMMON,
                u28.LUCKY_BOX_REVEAL_UNCOMMON,
                u28.LUCKY_BOX_REVEAL_RARE,
                u28.LUCKY_BOX_REVEAL_EPIC,
                u28.LUCKY_BOX_REVEAL_LEGENDARY,
                u28.LUCKY_BOX_REVEAL_MYTHIC
            })[u52 + 1]
            if v81 ~= "" and v81 then
                u6:playSound(v81, {
                    ["rollOffMinDistance"] = 30,
                    ["rollOffMaxDistance"] = 45,
                    ["position"] = u49:GetPivot().Position
                })
            end
            local u82 = u6:playSound(u28.LUCKY_BOX_SHIMMER, {
                ["rollOffMinDistance"] = 30,
                ["rollOffMaxDistance"] = 45,
                ["looped"] = true,
                ["position"] = u49:GetPivot().Position
            })
            u54:GiveTask(function() --[[ Line: 355 ]]
                --[[
                Upvalues:
                    [1] = u82
                --]]
                local v83 = u82
                if v83 ~= nil then
                    v83 = v83:Stop()
                end
                return v83
            end)
            local v84 = u11("Part", {
                ["Transparency"] = 1,
                ["CanCollide"] = false,
                ["CanQuery"] = false,
                ["Anchored"] = true,
                ["Size"] = Vector3.new(1, 1, 1),
                ["Position"] = u49:GetPrimaryPartCFrame().Position + Vector3.new(0, 7.5, 0),
                ["Parent"] = u49
            })
            u54:GiveTask(v84)
            local v85 = u12
            local v86 = {
                ["AlwaysOnTop"] = true,
                ["MaxDistance"] = 60,
                ["Size"] = UDim2.fromScale(6, 3)
            }
            local v87 = {}
            local v88 = #v87
            local v89 = {}
            local v90 = u51
            if v90 ~= nil then
                v90 = v90.displayName
            end
            if v90 == nil then
                v90 = u55.displayName
            end
            v89.itemDisplayName = v90
            v89.itemRarity = u52
            v87[v88 + 1] = u12.createElement(u30, v89)
            v85.mount(u12.createElement("BillboardGui", v86, v87), v84, "CrateRewardTitle")
            local u91 = u26(u52).id
            local v92 = u15.Assets.Effects.CrateItemParticles:FindFirstChild(u91)
            if v92 ~= nil then
                v92 = v92:Clone()
            end
            if v92 ~= nil then
                v92 = v92:GetChildren()
            end
            if v92 ~= nil and #v92 ~= 0 then
                for _, v93 in v92 do
                    v93.Parent = u68
                    u54:GiveTask(u29:enableInstanceEffect(v93))
                end
            end
            local v94 = u49:GetPrimaryPartCFrame()
            local v95 = CFrame.Angles(-0.5235987755982988, 0, 0.7853981633974483)
            local u96 = (v94 + Vector3.new(0, 5, 0)) * v95
            u68.CFrame = u96
            u68.Anchored = true
            local v97 = u49:FindFirstChild("effects")
            if v97 ~= nil then
                v97 = v97:FindFirstChild(u91)
            end
            local v98, v99
            if v97 then
                u54:GiveTask(u29:enableInstanceEffect(v97))
                v98 = false
                v99 = 0
            else
                v98 = false
                v99 = 0
            end
            while true do
                if v98 then
                    v99 = v99 + 1
                else
                    v98 = true
                end
                if v99 >= 1 then
                    if v97 then
                        for _, v100 in v97:GetDescendants() do
                            if v100:IsA("Beam") then
                                if not v100.Attachment0 then
                                    v100.Attachment0 = u68:FindFirstChild("A1.1")
                                end
                                if not v100.Attachment1 then
                                    v100.Attachment1 = u68:FindFirstChild("A1.1")
                                end
                            end
                        end
                    end
                    local u101 = 0
                    u54:GiveTask(u16.Heartbeat:Connect(function(p102) --[[ Line: 524 ]]
                        --[[
                        Upvalues:
                            [1] = u101
                            [2] = u68
                            [3] = u96
                        --]]
                        u101 = u101 + p102
                        local v103 = u101 * 3.141592653589793 / 2
                        local v104 = math.sin(v103) * 0.75
                        u68.CFrame = u96 + Vector3.new(0, v104, 0)
                    end))
                    return
                end
                task.delay(v99 * 0.4, function() --[[ Line: 445 ]]
                    --[[
                    Upvalues:
                        [1] = u49
                        [2] = u91
                        [3] = u54
                        [4] = u29
                        [5] = u6
                        [6] = u5
                        [7] = u28
                    --]]
                    local v105 = u49:FindFirstChild("effects")
                    if v105 ~= nil then
                        v105 = v105:FindFirstChild("firework")
                        if v105 ~= nil then
                            v105 = v105:FindFirstChild(u91)
                        end
                    end
                    if not v105 then
                        return nil
                    end
                    local u106 = v105:Clone()
                    u106.Name = "PlayingEffect"
                    u106.Parent = v105.Parent
                    u54:GiveTask(u106)
                    task.delay(3, function() --[[ Line: 462 ]]
                        --[[
                        Upvalues:
                            [1] = u106
                        --]]
                        u106:Destroy()
                    end)
                    u29:playInstanceEffects({ u106 })
                    local u107 = {}
                    for _, v108 in u106:GetDescendants() do
                        if v108:IsA("ParticleEmitter") then
                            table.insert(u107, v108)
                        end
                    end
                    task.delay(0.15, function() --[[ Line: 473 ]]
                        --[[
                        Upvalues:
                            [1] = u107
                        --]]
                        local function v121(u109) --[[ Line: 474 ]]
                            u109.TimeScale = 0.05
                            local u110 = u109.Color
                            local u111 = {}
                            local v112 = u110.Keypoints
                            local function v118(p113) --[[ Line: 479 ]]
                                --[[
                                Upvalues:
                                    [1] = u111
                                --]]
                                local v114 = { p113.Value:ToHSV() }
                                local v115 = Color3.fromHSV(v114[1], v114[2] / 1.5, 1 - (1 - v114[3]) / 1.5)
                                local v116 = ColorSequenceKeypoint.new(p113.Time, v115)
                                local v117 = u111
                                table.insert(v117, v116)
                            end
                            for v119, v120 in v112 do
                                v118(v120, v119 - 1, v112)
                            end
                            u109.Color = ColorSequence.new(u111)
                            task.delay(0.18, function() --[[ Line: 489 ]]
                                --[[
                                Upvalues:
                                    [1] = u109
                                    [2] = u110
                                --]]
                                u109.Color = u110
                                u109.TimeScale = 1
                            end)
                        end
                        for v122, v123 in u107 do
                            v121(v123, v122 - 1, u107)
                        end
                    end)
                    task.delay(0.4, function() --[[ Line: 498 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u5
                            [3] = u28
                            [4] = u49
                        --]]
                        u6:playSound(u5.fromList(u28.FIREWORK_CRACKLE_1, u28.FIREWORK_CRACKLE_2, u28.FIREWORK_CRACKLE_3), {
                            ["volumeMultiplier"] = 0.5,
                            ["rollOffMinDistance"] = 30,
                            ["rollOffMaxDistance"] = 45,
                            ["position"] = u49:GetPivot().Position
                        })
                    end)
                end)
            end
        end))
    end)
end
function u31.cleanupCrate(p124, p125) --[[ Line: 533 ]]
    local v126 = p124.crateMaids[p125]
    if v126 ~= nil then
        v126:DoCleaning()
    end
end
v2.defineMetadata(u31, "identifier", "client/controllers/global/reward-crate/crate-controller@CrateController")
v2.defineMetadata(u31, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u31, "$:flamework@Controller", v9, {
    {}
})
return {
    ["CrateController"] = u31
}