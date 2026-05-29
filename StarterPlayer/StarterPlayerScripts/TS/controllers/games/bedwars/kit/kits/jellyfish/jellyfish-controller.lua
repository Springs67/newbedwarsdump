local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceType
local u4 = v2.DeviceUtil
local u5 = v2.RandomUtil
local u6 = v2.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.CollectionService
local u16 = v14.Players
local u17 = v14.ReplicatedStorage
local u18 = v14.RunService
local u19 = v14.TweenService
local u20 = v14.Workspace
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jellyfish", "jellyfish-kit-util")
local u28 = v27.EnemyJellyfishColors
local u29 = v27.JellyfishBalance
local u30 = v27.JellyfishParts
local u31 = v27.PrismaticJellyfishColors
local u32 = v27.SelfJellyfishColors
local u33 = v27.TeamJellyfishColors
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u37 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
        return "JellyfishController"
    end,
    ["__index"] = u22
})
u37.__index = u37
function u37.new(...) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u37
    --]]
    local v38 = u37
    local v39 = setmetatable({}, v38)
    return v39:constructor(...) or v39
end
function u37.constructor(p40, ...) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u34
    --]]
    u22.constructor(p40, ...)
    p40.Name = "JellyfishController"
    p40.jellyfishMaids = {}
    p40.requestPickUpJellyfishRemote = u34.Client:Get("RequestPickupJellyfish")
end
function u37.KnitStart(u41) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u15
        [3] = u12
        [4] = u21
        [5] = u11
        [6] = u16
        [7] = u26
        [8] = u8
        [9] = u35
        [10] = u6
        [11] = u5
        [12] = u18
        [13] = u34
    --]]
    u22.KnitStart(u41)
    u15:GetInstanceAddedSignal("jellyfish"):Connect(function(u42) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u41
            [3] = u21
            [4] = u11
            [5] = u16
            [6] = u26
            [7] = u8
            [8] = u35
            [9] = u6
            [10] = u5
            [11] = u18
            [12] = u34
        --]]
        local v43 = u12.new()
        u41.jellyfishMaids[u42] = v43
        u42:WaitForChild("RootPart")
        local v44 = u42:GetChildren()
        local function v47(u45) --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u11
            --]]
            if u45:IsA("MeshPart") then
                u45.LocalTransparencyModifier = 1
                u21(1.5, u11, function(p46) --[[ Line: 70 ]]
                    --[[
                    Upvalues:
                        [1] = u45
                    --]]
                    u45.LocalTransparencyModifier = p46
                    return u45.LocalTransparencyModifier
                end, 1, 0):Play()
            end
        end
        for v48, v49 in v44 do
            v47(v49, v48 - 1, v44)
        end
        local v50 = u16:GetPlayerByUserId(u42:GetAttribute("PlacedByUserId"))
        local u51 = u26.DEFAULT
        if v50 and v50.Character then
            u51 = u8.Controllers.KitController:getKitSkin(v50.Character)
        end
        local v52 = { u35.JELLYFISH_DEPLOY_1, u35.JELLYFISH_DEPLOY_2, u35.JELLYFISH_DEPLOY_3 }
        local v53
        if u51 == u26.JELLYFISH_HOLIDAY then
            v53 = { u35.HOLIDAY_JELLYFISH_DEPLOY_1, u35.HOLIDAY_JELLYFISH_DEPLOY_2, u35.HOLIDAY_JELLYFISH_DEPLOY_3 }
        else
            v53 = u51 == u26.JELLYFISH_DESSERT and { u35.DESSERT_JELLYFISH_DEPLOY_1, u35.DESSERT_JELLYFISH_DEPLOY_2, u35.DESSERT_JELLYFISH_DEPLOY_3 } or v52
        end
        u6:playSound(u5.fromList(unpack(v53)), {
            ["position"] = u42:GetPivot().Position
        })
        local u54 = u41:setUpJellyfishAnimationTracks(u42)
        v43:GiveTask(u54.idle)
        v43:GiveTask(u54.attack)
        v43:GiveTask(u54.spawn)
        if u41:checkPositionForAnimation(u42) then
            u54.spawn:Play()
            u54.spawn.Ended:Connect(function() --[[ Line: 103 ]]
                --[[
                Upvalues:
                    [1] = u54
                --]]
                u54.idle:Play()
            end)
        end
        local u55 = 0
        v43:GiveTask(u18.Heartbeat:Connect(function(p56) --[[ Line: 110 ]]
            --[[
            Upvalues:
                [1] = u55
                [2] = u54
                [3] = u41
                [4] = u42
            --]]
            u55 = u55 + p56
            if u55 <= 5 then
                return nil
            end
            u55 = 0
            local v57 = u54.idle.IsPlaying or (u54.attack.IsPlaying or u54.spawn.IsPlaying)
            local v58 = nil
            for v59, v60 in { u54.idle, u54.attack, u54.spawn } do
                local _ = v59 - 1
                if v60.IsPlaying == true then
                    v58 = v60
                    break
                end
            end
            if u41:checkPositionForAnimation(u42) then
                if not v57 then
                    u54.idle:Play()
                    return
                end
            elseif v58 ~= nil then
                v58:Stop()
            end
        end))
        local v61 = u41:createMovementConnection(u42)
        if v61 then
            v43:GiveTask(v61)
        end
        u41:recolorJellyfish(u42)
        v43:GiveTask(u16.LocalPlayer:GetAttributeChangedSignal("Team"):Connect(function() --[[ Line: 153 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u42
            --]]
            u41:recolorJellyfish(u42)
        end))
        v43:GiveTask(u42:GetAttributeChangedSignal("Team"):Connect(function() --[[ Line: 157 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u42
            --]]
            u41:recolorJellyfish(u42)
        end))
        u34.Client:OnEvent("JellyfishZapAttack", function(p62) --[[ Line: 160 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u41
                [3] = u16
                [4] = u35
                [5] = u51
                [6] = u26
                [7] = u6
                [8] = u5
                [9] = u54
            --]]
            if p62.jellyfishId == u42:GetAttribute("Id") and p62.ownerId == u42:GetAttribute("PlacedByUserId") then
                u41:createLightningBeam(u42, p62.targetEntityInstance)
                u41:createStaticHitEffect(u42, p62.targetEntityInstance)
                local v63 = u16:GetPlayerFromCharacter(p62.targetEntityInstance)
                if v63 ~= nil then
                    local v64 = u16.LocalPlayer == v63
                    local v65 = { u35.JELLYFISH_ZAP_1, u35.JELLYFISH_ZAP_2 }
                    local v66
                    if u51 == u26.JELLYFISH_HOLIDAY then
                        v66 = { u35.HOLIDAY_JELLYFISH_ZAP_1, u35.HOLIDAY_JELLYFISH_ZAP_2 }
                    else
                        v66 = u51 == u26.JELLYFISH_DESSERT and { u35.DESSERT_JELLYFISH_ZAP_1, u35.DESSERT_JELLYFISH_ZAP_2 } or v65
                    end
                    local v67 = u6
                    local v68 = u5.fromList(unpack(v66))
                    local v69 = {}
                    local v70
                    if v64 then
                        v70 = nil
                    else
                        v70 = u42:GetPivot().Position
                    end
                    v69.position = v70
                    v67:playSound(v68, v69)
                end
                if u41:checkPositionForAnimation(u42) then
                    u54.attack:Play()
                    u54.attack.Ended:Connect(function() --[[ Line: 181 ]]
                        --[[
                        Upvalues:
                            [1] = u54
                        --]]
                        u54.idle:Play()
                    end)
                end
            end
        end)
        v43:GiveTask(u42:GetAttributeChangedSignal("State"):Connect(function() --[[ Line: 187 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u41
            --]]
            local v71 = u42:GetAttribute("State")
            if v71 == 0 then
                u42.Tentacles_3.Electric.Enabled = false
                return
            elseif v71 == 1 then
                u42.Tentacles_3.Electric.Enabled = true
                u41:createActivationBeam(u42)
            end
        end))
        v43:GiveTask(u42:GetAttributeChangedSignal("ActivationOrderId"):Connect(function() --[[ Line: 201 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u16
                [3] = u35
                [4] = u51
                [5] = u26
                [6] = u6
            --]]
            local v72 = u42:GetAttribute("ActivationOrderId")
            local v73 = u42:GetAttribute("PlacedByUserId") == u16.LocalPlayer.UserId
            local v74 = {
                u35.JELLYFISH_PULSE_2,
                u35.JELLYFISH_PULSE_3,
                u35.JELLYFISH_PULSE_4,
                u35.JELLYFISH_PULSE_5
            }
            local v75
            if u51 == u26.JELLYFISH_HOLIDAY then
                v75 = {
                    u35.HOLIDAY_JELLYFISH_PULSE_2,
                    u35.HOLIDAY_JELLYFISH_PULSE_3,
                    u35.HOLIDAY_JELLYFISH_PULSE_4,
                    u35.HOLIDAY_JELLYFISH_PULSE_5
                }
            else
                v75 = u51 == u26.JELLYFISH_DESSERT and {
                    u35.DESSERT_JELLYFISH_PULSE_2,
                    u35.DESSERT_JELLYFISH_PULSE_3,
                    u35.DESSERT_JELLYFISH_PULSE_4,
                    u35.DESSERT_JELLYFISH_PULSE_5
                } or v74
            end
            local v76 = u6
            local v77 = v75[v72 + 1]
            local v78 = {}
            local v79
            if v73 then
                v79 = nil
            else
                v79 = u42:GetPivot().Position
            end
            v78.position = v79
            v78.volumeMultiplier = not v73 and 1.2 or 1 - v72 * 0.17
            v76:playSound(v77, v78)
        end))
        if u42:GetAttribute("PlacedByUserId") == u16.LocalPlayer.UserId then
            task.delay(1.75, function() --[[ Line: 219 ]]
                --[[
                Upvalues:
                    [1] = u41
                    [2] = u42
                --]]
                u41:createProximityPrompt(u42)
                u41:createConnectionBeams(u42)
            end)
        end
    end)
    u15:GetInstanceRemovedSignal("jellyfish"):Connect(function(p80) --[[ Line: 226 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        local v81 = u41.jellyfishMaids[p80]
        if v81 ~= nil then
            v81:DoCleaning()
        end
        u41.jellyfishMaids[p80] = nil
    end)
end
function u37.checkPositionForAnimation(_, p82) --[[ Line: 235 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u4
        [3] = u3
        [4] = u29
    --]]
    local v83 = u16.LocalPlayer.Character
    if v83 ~= nil then
        v83 = v83:GetPivot().Position
    end
    if not v83 then
        return false
    end
    local v84 = u4.guessCurrentDeviceType() == u3.Mobile
    if v84 then
        return false
    end
    local v85 = (v83 - p82:GetPivot().Position).Magnitude
    local v86
    if v84 then
        v86 = u29.JellyfishMobileAnimationDistance
    else
        v86 = u29.JellyfishAnimationDistance
    end
    return v85 < v86
end
function u37.createConnectionBeams(_, u87) --[[ Line: 252 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u16
        [3] = u29
        [4] = u9
        [5] = u26
        [6] = u17
        [7] = u12
    --]]
    u87:WaitForChild("RootPart")
    local v88 = 0
    local v89 = {}
    for v90, v91 in u15:GetTagged("jellyfish") do
        local _ = v90 - 1
        if v91:GetAttribute("PlacedByUserId") == u16.LocalPlayer.UserId == true then
            v88 = v88 + 1
            v89[v88] = v91
        end
    end
    local v92 = 0
    local v93 = {}
    for v94, v95 in v89 do
        local _ = v94 - 1
        if (v95:GetAttribute("CenteredPosition") - u87:GetAttribute("CenteredPosition")).Magnitude < u29.MaxReplicationRadius == true then
            v92 = v92 + 1
            v93[v92] = v95
        end
    end
    local v96 = u16:GetPlayerByUserId((u87:GetAttribute("PlacedByUserId")))
    local v97
    if v96 then
        v97 = u9.Controllers.KitSkinController:getKitSkin(v96)
    else
        v97 = u26.DEFAULT
    end
    local u98 = u17.Assets.Effects.JellyfishConnectionBeam:Clone()
    if v97 == u26.JELLYFISH_DESSERT then
        u98 = u17.Assets.Effects.JellyfishDessertConnectionBeam:Clone()
    end
    local function v101(p99) --[[ Line: 291 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u98
            [3] = u87
        --]]
        p99:WaitForChild("RootPart")
        local u100 = u12.new()
        u98.Parent = p99.Bell_Under.BeamAttachment
        u98.Attachment0 = p99.Bell_Under.BeamAttachment
        u98.Attachment1 = u87.Bell_Under.BeamAttachment
        u98.Enabled = true
        p99.Destroying:Connect(function() --[[ Line: 298 ]]
            --[[
            Upvalues:
                [1] = u100
            --]]
            u100:DoCleaning()
        end)
        u87.Destroying:Connect(function() --[[ Line: 301 ]]
            --[[
            Upvalues:
                [1] = u100
            --]]
            u100:DoCleaning()
        end)
    end
    for v102, v103 in v93 do
        v101(v103, v102 - 1, v93)
    end
end
function u37.createLightningBeam(_, p104, p105) --[[ Line: 309 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u9
        [3] = u26
        [4] = u17
        [5] = u13
        [6] = u19
    --]]
    local v106 = u16:GetPlayerByUserId((p104:GetAttribute("PlacedByUserId")))
    local v107
    if v106 then
        v107 = u9.Controllers.KitSkinController:getKitSkin(v106)
    else
        v107 = u26.DEFAULT
    end
    local v108 = u17.Assets.Effects.StaticConnection
    if v107 == u26.JELLYFISH_DESSERT then
        v108 = u17.Assets.Effects.JellyfishDessertStaticConnection
    end
    local u109 = v108.Beam1:Clone()
    local u110 = v108.Beam2:Clone()
    local u111 = v108.PointLight:Clone()
    local v112 = u16:GetPlayerFromCharacter(p105)
    local u113
    if v112 then
        u113 = v112.Character
        if u113 ~= nil then
            u113 = u113:FindFirstChild("UpperTorso")
            if u113 ~= nil then
                u113 = u113:FindFirstChild("BodyFrontAttachment")
            end
        end
    else
        u113 = u13("Attachment", {
            ["Parent"] = p105:FindFirstChildWhichIsA("Part")
        })
        task.delay(1, function() --[[ Line: 337 ]]
            --[[
            Upvalues:
                [1] = u113
            --]]
            u113:Destroy()
        end)
    end
    if not u113 then
        return nil
    end
    u109.Parent = p104
    u109.Attachment0 = p104.Bell_Under.BeamAttachment
    u109.Attachment1 = u113
    u110.Parent = p104
    u110.Attachment0 = p104.Bell_Under.BeamAttachment
    u110.Attachment1 = u113
    u111.Parent = u113
    task.delay(0.24, function() --[[ Line: 351 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u109
            [3] = u110
            [4] = u111
        --]]
        u19:Create(u109, TweenInfo.new(0.12), {
            ["Width0"] = 0,
            ["Width1"] = 0
        }):Play()
        u19:Create(u110, TweenInfo.new(0.12), {
            ["Width0"] = 0,
            ["Width1"] = 0
        }):Play()
        task.wait(0.12)
        u109:Destroy()
        u110:Destroy()
        u111:Destroy()
    end)
end
function u37.createStaticHitEffect(_, p114, p115) --[[ Line: 366 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u9
        [3] = u26
        [4] = u17
        [5] = u20
        [6] = u36
    --]]
    local v116 = p115:FindFirstChild("UpperTorso")
    if not v116 then
        return nil
    end
    local v117 = u16:GetPlayerByUserId((p114:GetAttribute("PlacedByUserId")))
    local v118
    if v117 then
        v118 = u9.Controllers.KitSkinController:getKitSkin(v117)
    else
        v118 = u26.DEFAULT
    end
    local u119 = u17.Assets.Effects.StaticHit:Clone()
    if v118 == u26.JELLYFISH_DESSERT then
        u119 = u17.Assets.Effects.JellyfishDessertStaticHit:Clone()
    end
    u119.Parent = u20
    u119.Anchored = false
    u119.CFrame = v116.CFrame
    u119.Lightning.Anchored = false
    u119.Lightning.CFrame = v116.CFrame
    u36:playEffects(u119:GetChildren(), p115)
    task.delay(0.2, function() --[[ Line: 384 ]]
        --[[
        Upvalues:
            [1] = u119
        --]]
        u119.Attachment.PointLight.Enabled = false
    end)
    task.delay(5, function() --[[ Line: 387 ]]
        --[[
        Upvalues:
            [1] = u119
        --]]
        u119:Destroy()
    end)
end
function u37.createActivationBeam(p120, p121) --[[ Line: 391 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u16
        [3] = u9
        [4] = u26
        [5] = u17
    --]]
    local u122 = u12.new()
    local v123 = u16:GetPlayerByUserId((p121:GetAttribute("PlacedByUserId")))
    local v124
    if v123 then
        v124 = u9.Controllers.KitSkinController:getKitSkin(v123)
    else
        v124 = u26.DEFAULT
    end
    local v125 = u17.Assets.Effects.JellyfishActivationBeam:Clone()
    if v124 == u26.JELLYFISH_DESSERT then
        v125 = u17.Assets.Effects.JellyfishDessertActivationBeam:Clone()
    end
    v125.Parent = p121.Bell_Under.BeamAttachment
    u122:GiveTask(v125)
    p121.Destroying:Connect(function() --[[ Line: 402 ]]
        --[[
        Upvalues:
            [1] = u122
        --]]
        u122:DoCleaning()
    end)
    v125.Attachment1 = p121.Bell_Under.BeamAttachment
    local v126 = p120:getJellyfishOrPlayerById(p121:GetAttribute("ActivatedBy"))
    if v126 == nil then
        u122:DoCleaning()
        return nil
    end
    v126.Destroying:Connect(function() --[[ Line: 411 ]]
        --[[
        Upvalues:
            [1] = u122
        --]]
        u122:DoCleaning()
    end)
    if v126:IsA("Player") then
        local v127 = v126.Character
        if v127 ~= nil then
            v127 = v127:FindFirstChild("RightHand")
            if v127 ~= nil then
                v127 = v127:FindFirstChild("RightGripAttachment")
            end
        end
        v125.Attachment0 = v127
    else
        v125.Attachment0 = v126.Bell_Under.BeamAttachment
    end
    v125.Enabled = true
    task.delay(1, function() --[[ Line: 429 ]]
        --[[
        Upvalues:
            [1] = u122
        --]]
        u122:DoCleaning()
    end)
end
function u37.createProximityPrompt(u128, p129) --[[ Line: 433 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
        [3] = u23
        [4] = u34
        [5] = u16
    --]]
    local u130 = p129:GetAttribute("Id")
    local u131 = u12.new()
    local u132 = u9.Controllers.ProximityPromptController:createProximityPrompt({
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 10,
        ["HoldDuration"] = 0,
        ["ActionText"] = "Pick Up",
        ["ObjectText"] = "Jellyfish",
        ["Parent"] = p129
    })
    u131:GiveTask(u132)
    local u134 = u23.On(function(p133) --[[ Line: 445 ]]
        --[[
        Upvalues:
            [1] = u130
            [2] = u132
        --]]
        if p133:GetAttribute("Id") == u130 and p133:HasTag("jellyfish") then
            u132.ActionText = "Remove"
        end
    end)
    u131:GiveTask(function() --[[ Line: 450 ]]
        --[[
        Upvalues:
            [1] = u134
        --]]
        u134()
    end)
    u34.Client:WaitFor("EntityDeathEvent"):andThen(function(p135) --[[ Line: 454 ]]
        --[[
        Upvalues:
            [1] = u130
            [2] = u131
        --]]
        local u136 = nil
        u136 = p135:Connect(function(p137) --[[ Line: 456 ]]
            --[[
            Upvalues:
                [1] = u130
                [2] = u131
                [3] = u136
            --]]
            if p137.entityInstance:GetAttribute("Id") == u130 and p137.entityInstance:HasTag("jellyfish") then
                u131:DoCleaning()
                u136:Disconnect()
            end
        end)
        u131:GiveTask(u136)
    end)
    p129.AncestryChanged:Once(function() --[[ Line: 465 ]]
        --[[
        Upvalues:
            [1] = u131
        --]]
        u131:DoCleaning()
    end)
    u132.Triggered:Connect(function(p138) --[[ Line: 468 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u128
            [3] = u130
        --]]
        if p138 == u16.LocalPlayer then
            u128.requestPickUpJellyfishRemote:CallServer(u130)
        end
    end)
end
function u37.getJellyfishOrPlayerById(_, p139) --[[ Line: 474 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
    --]]
    local v140 = u16:GetPlayerByUserId(p139)
    if v140 then
        return v140
    end
    local v141 = 0
    local v142 = {}
    for v143, v144 in u15:GetTagged("jellyfish") do
        local _ = v143 - 1
        if v144:GetAttribute("Id") == p139 == true then
            v141 = v141 + 1
            v142[v141] = v144
        end
    end
    return v142[1]
end
function u37.recolorJellyfish(u145, u146) --[[ Line: 496 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u16
        [3] = u32
        [4] = u33
        [5] = u28
        [6] = u10
        [7] = u30
    --]]
    local v147 = u8.Controllers.TeamController:getPlayerTeam(u16.LocalPlayer)
    if v147 ~= nil then
        v147 = v147.id
    end
    local v148 = v147 == nil and true or string.find(v147, "spectat")
    if v148 ~= 0 and (v148 == v148 and v148) then
        return nil
    end
    local v149 = u146:GetAttribute("Team")
    local u150 = u146:GetAttribute("PlacedByUserId")
    local v151 = v147 == v149
    local u152
    if u150 == u16.LocalPlayer.UserId then
        u152 = u32
    elseif v151 then
        u152 = u33
    else
        u152 = u28
    end
    local u153 = u10.keys(u30)
    task.delay(0, function() --[[ Line: 512 ]]
        --[[
        Upvalues:
            [1] = u146
            [2] = u153
            [3] = u152
            [4] = u16
            [5] = u150
            [6] = u8
            [7] = u145
        --]]
        u146:WaitForChild("RootPart")
        for v154, v155 in u146:GetDescendants() do
            local _ = v154 - 1
            local v156 = v155:IsA("MeshPart")
            if v156 then
                local v157 = v155.Name
                v156 = table.find(u153, v157) ~= nil
            end
            if v156 then
                v155.Color = u152[v155.Name]
            end
        end
        local v158 = u16:GetPlayerByUserId(u150)
        if not v158 then
            return nil
        end
        if u8.Controllers.JellyfishPrismaticController:isPrismaticSkinEquipped(v158) then
            u145:applyJellyfishPrismaticEffect(u146)
        end
    end)
end
function u37.applyJellyfishPrismaticEffect(_, u159) --[[ Line: 537 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u31
        [3] = u19
    --]]
    local u160 = u159.Detail_Ring
    task.spawn(function() --[[ Line: 539 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u31
            [3] = u160
            [4] = u159
            [5] = u19
        --]]
        local u161 = u12.new()
        local v162 = Instance.new("Color3Value")
        v162.Value = u31[1]
        u161:GiveTask(v162.Changed:Connect(function(p163) --[[ Line: 543 ]]
            --[[
            Upvalues:
                [1] = u160
            --]]
            u160.Color = p163
        end))
        u159.Destroying:Connect(function() --[[ Line: 546 ]]
            --[[
            Upvalues:
                [1] = u161
            --]]
            u161:DoCleaning()
        end)
        u159:GetAttributeChangedSignal("Team"):Connect(function() --[[ Line: 549 ]]
            --[[
            Upvalues:
                [1] = u161
            --]]
            u161:DoCleaning()
        end)
        local v164 = 1
        while u160.Parent ~= nil do
            local v165 = u19:Create(v162, TweenInfo.new(3), {
                ["Value"] = u31[v164 + 1]
            })
            v165:Play()
            v165.Completed:Wait()
            local v166 = v164 + 1
            v164 = #u31 <= v166 and 0 or v166
        end
        u161:DoCleaning()
    end)
end
function u37.createMovementConnection(_, u167) --[[ Line: 567 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local u168 = math.random(0, 1) * 2 - 1
    local u169 = u167:GetAttribute("CenteredPosition")
    local u170 = 0
    return u18.Heartbeat:Connect(function(p171) --[[ Line: 573 ]]
        --[[
        Upvalues:
            [1] = u170
            [2] = u167
            [3] = u169
            [4] = u168
        --]]
        u170 = u170 + p171
        if not u167 then
            return nil
        end
        local v172 = u167
        local v173 = CFrame.new
        local v174 = u169.X
        local v175 = u170
        local v176 = u169.Y + math.sin(v175)
        local v177 = u169.Z
        v172:PivotTo(v173((Vector3.new(v174, v176, v177))) * CFrame.Angles(0, 3.141592653589793 * u170 * 0.17 * u168, 0))
    end)
end
function u37.setUpJellyfishAnimationTracks(_, p178) --[[ Line: 584 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u24
    --]]
    local v179 = Instance.new("AnimationController")
    v179.Parent = p178
    local v180 = Instance.new("Animator")
    v180.Parent = v179
    return {
        ["spawn"] = v180:LoadAnimation(u25:getAnimation(u24.JELLYFISH_SPAWN)),
        ["idle"] = v180:LoadAnimation(u25:getAnimation(u24.JELLYFISH_MOUNT_IDLE)),
        ["attack"] = v180:LoadAnimation(u25:getAnimation(u24.JELLYFISH_ATTACK))
    }
end
u8.CreateController(u37.new())
return nil