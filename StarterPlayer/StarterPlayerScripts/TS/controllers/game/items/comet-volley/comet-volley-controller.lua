local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.GameQueryUtil
local u6 = v3.RandomUtil
local u7 = v3.SoundManager
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.TweenService
local u16 = v11.Workspace
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "comet-volley", "comet-volley-constants").CometVolleyConstants
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "CometVolleyController"
    end,
    ["__index"] = u19
})
u29.__index = u29
function u29.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u25
        [3] = u20
        [4] = u26
    --]]
    u19.constructor(p32)
    p32.Name = "CometVolleyController"
    p32.cometVolleyTargetSelectedRemote = u25.Client:Get("CometVolleyTargetSelected")
    p32.ascendingAnimation = u20.COMET_VOLLEY_ASCEND
    p32.targetingAnimation = u20.COMET_VOLLEY_TARGETING_IDLE
    p32.firingAnimation = u20.COMET_VOLLEY_COMET_FIRED
    p32.descendingAnimation = u20.COMET_VOLLEY_FALLING
    p32.fireToFallingTransitionAnimation = u20.COMET_VOLLEY_SHOOTING_TO_FALLING_TRANSITION
    p32.cometImpactSounds = {
        u26.COMET_VOLLEY_IMPACT_1,
        u26.COMET_VOLLEY_IMPACT_2,
        u26.COMET_VOLLEY_IMPACT_3,
        u26.COMET_VOLLEY_IMPACT_4
    }
end
function u29.KnitStart(u33) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u18
        [3] = u24
        [4] = u26
        [5] = u7
        [6] = u25
        [7] = u14
        [8] = u16
        [9] = u15
        [10] = u13
        [11] = u22
        [12] = u2
        [13] = u4
        [14] = u21
        [15] = u23
        [16] = u10
    --]]
    u19.KnitStart(u33)
    u18.ItemConsumed:connect(function(p34) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u24
            [3] = u26
            [4] = u7
        --]]
        if not u33:isValidItem(p34.itemType) then
            return nil
        end
        local v35 = p34.entity:getInstance()
        if v35 == nil then
            return nil
        end
        local v36 = v35.PrimaryPart
        if v36 ~= nil then
            v36 = v36.Position
        end
        if v36 == nil then
            return nil
        end
        local v37
        if p34.itemType == u24.HERO_COMET_VOLLEY then
            v37 = u26.COMET_VOLLEY_HERO_CONSUME
        else
            v37 = u26.COMET_VOLLEY_VILLAIN_CONSUME
        end
        u7:playSound(v37, {
            ["rollOffMaxDistance"] = 120,
            ["looped"] = false,
            ["volumeMultiplier"] = 0.8,
            ["position"] = v36,
            ["parent"] = v35
        })
    end)
    u25.Client:OnEvent("CometVolleyOreSpawning", function(u38) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u24
            [3] = u26
            [4] = u16
            [5] = u15
            [6] = u7
            [7] = u13
        --]]
        local u39 = u14.Assets.Blocks.iron_ore_mesh_block:Clone()
        local v40 = u39.PrimaryPart
        if v40 == nil then
            return nil
        end
        local u41
        if u38.itemType == u24.HERO_COMET_VOLLEY then
            u41 = u26.COMET_VOLLEY_HERO_ORE
        else
            u41 = u26.COMET_VOLLEY_VILLAIN_ORE
        end
        u39:PivotTo(CFrame.new(u38.worldPosition))
        u39.Parent = u16
        v40.Anchored = true
        local v42 = u39:FindFirstChild("Root")
        if v42 ~= nil then
            v42:SetAttribute("Block", false)
        end
        local v43 = u39:GetDescendants()
        local function v47(p44) --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u38
                [3] = u7
                [4] = u41
                [5] = u39
                [6] = u13
            --]]
            if p44:IsA("Part") or (p44:IsA("Texture") or p44:IsA("MeshPart")) then
                p44.Transparency = 1
                local v45 = u15:Create(p44, TweenInfo.new(u38.spawnDuration), {
                    ["Transparency"] = 0
                })
                v45:Play()
                v45.Completed:Connect(function() --[[ Line: 106 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u41
                        [3] = u38
                        [4] = u39
                    --]]
                    u7:playSound(u41, {
                        ["rollOffMaxDistance"] = 180,
                        ["looped"] = false,
                        ["volumeMultiplier"] = 0.2,
                        ["position"] = u38.worldPosition
                    })
                    local v46 = u39
                    if v46 ~= nil then
                        v46:Destroy()
                    end
                end)
                if u38.attackingPlayer == u13.LocalPlayer then
                    u7:playSound(u41, {
                        ["rollOffMaxDistance"] = 180,
                        ["looped"] = false,
                        ["volumeMultiplier"] = 0.2
                    })
                end
            end
        end
        for v48, v49 in v43 do
            v47(v49, v48 - 1, v43)
        end
    end)
    u25.Client:OnEvent("CometVolleyInitiated", function(u50) --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u16
            [3] = u24
            [4] = u26
            [5] = u14
            [6] = u13
            [7] = u33
            [8] = u2
            [9] = u4
            [10] = u21
            [11] = u23
        --]]
        local u51 = u50.player
        local v52 = u51.Character
        if not v52 then
            return nil
        end
        local u53 = u22:getEntity(u51)
        if u53 ~= nil then
            u53:hideNametag()
        end
        v52.Archivable = true
        local u54 = v52:Clone()
        u54.Parent = u16
        u54:SetAttribute("Transparency", 0)
        if not v52.PrimaryPart then
            return nil
        end
        v52:SetAttribute("Transparency", 1)
        local u75 = u51:GetAttributeChangedSignal("CometVolleyState"):Connect(function() --[[ Line: 151 ]]
            --[[
            Upvalues:
                [1] = u51
                [2] = u24
                [3] = u26
                [4] = u14
                [5] = u13
                [6] = u16
                [7] = u54
                [8] = u33
                [9] = u50
                [10] = u2
                [11] = u4
                [12] = u21
                [13] = u23
            --]]
            local v55 = u51:GetAttribute("CometVolleyState")
            local v56 = u51:GetAttribute("CometVolleyVariant")
            local v57
            if v56 == u24.HERO_COMET_VOLLEY then
                v57 = u26.COMET_VOLLEY_HERO_ASCEND
            else
                v57 = u26.COMET_VOLLEY_VILLAIN_ASCEND
            end
            local u58 = u51.Character
            local v59
            if v56 == u24.HERO_COMET_VOLLEY then
                v59 = u14.Assets.Effects.CometVolleyHeroEffects:Clone()
            else
                v59 = u14.Assets.Effects.CometVolleyVillainEffects:Clone()
            end
            if not u58 then
                return nil
            end
            if u51 == u13.LocalPlayer then
                u16.CurrentCamera.CameraSubject = u54.Humanoid
            end
            local v60 = u54.Humanoid.Animator
            if not u54.PrimaryPart then
                return nil
            end
            u54.PrimaryPart.Anchored = true
            local u61 = false
            if v55 == "Ascending" then
                u33:handleAscendEffects(u50.targetPosition, u54.PrimaryPart, v60, v57, v59)
            elseif v55 == "Targeting" then
                local u62, u63, u64
                if u13.LocalPlayer == u51 then
                    u62 = u14.Assets.Misc.CometVolleyIndicator:Clone()
                    u62.Parent = u16
                    u62.Anchored = true
                    u63 = u33:enableTargetIndicator(u51, u62)
                    u64 = u33:enablePlayerRotation(u51, u54, u50.targetPosition)
                else
                    u62 = nil
                    u63 = nil
                    u64 = nil
                end
                local u65 = nil
                local v67 = {
                    ["action"] = "Attack",
                    ["actionId"] = "comet-volley-fire",
                    ["boundFunction"] = function(_, p66, _) --[[ Name: boundFunction, Line 190 ]]
                        --[[
                        Upvalues:
                            [1] = u33
                            [2] = u51
                            [3] = u54
                            [4] = u50
                            [5] = u65
                            [6] = u61
                        --]]
                        if p66 == Enum.UserInputState.Begin then
                            if not u33:requestCometVolley(u51, u54, u50.targetPosition) then
                                u65:DoCleaning()
                                return nil
                            end
                            u61 = true
                        elseif p66 == Enum.UserInputState.End then
                            u65:DoCleaning()
                        end
                    end
                }
                u65 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v67)
                local u68 = u4:playAnimation(v60, u21:getAssetId(u33.targetingAnimation), {
                    ["looped"] = true
                })
                u65:GiveTask(function() --[[ Line: 207 ]]
                    --[[
                    Upvalues:
                        [1] = u62
                        [2] = u63
                        [3] = u64
                        [4] = u61
                        [5] = u33
                        [6] = u51
                        [7] = u54
                        [8] = u50
                        [9] = u68
                    --]]
                    local v69 = u62
                    if v69 ~= nil then
                        v69:Destroy()
                    end
                    local v70 = u63
                    if v70 ~= nil then
                        v70:Disconnect()
                    end
                    local v71 = u64
                    if v71 ~= nil then
                        v71:Disconnect()
                    end
                    if not u61 then
                        u33:requestCometVolley(u51, u54, u50.targetPosition)
                    end
                    local v72 = u68
                    if v72 ~= nil then
                        v72:Stop()
                    end
                end)
                task.delay(u23.COMET_VOLLEY_TARGETING_DURATION - 0.15, function() --[[ Line: 229 ]]
                    --[[
                    Upvalues:
                        [1] = u68
                        [2] = u65
                    --]]
                    local v73 = u68
                    if v73 ~= nil then
                        v73:Stop()
                    end
                    local v74 = u65
                    if v74 ~= nil then
                        v74:DoCleaning()
                    end
                end)
            elseif v55 == "Firing" then
                u4:playAnimation(v60, u21:getAssetId(u33.firingAnimation), {
                    ["looped"] = false
                })
            elseif v55 == "Descending" then
                u33:handleDescendEffects(u50.originPosition + Vector3.new(0, 0, 0), u54.PrimaryPart, v60)
                task.delay(u23.COMET_VOLLEY_DESCEND_DURATION, function() --[[ Line: 254 ]]
                    --[[
                    Upvalues:
                        [1] = u58
                        [2] = u51
                        [3] = u13
                        [4] = u16
                        [5] = u54
                    --]]
                    u58:SetAttribute("Transparency", 0)
                    if u51 == u13.LocalPlayer then
                        u16.CurrentCamera.CameraSubject = u58.Humanoid
                    end
                    u54:Destroy()
                end)
            end
        end)
        task.delay(u23.COMET_VOLLEY_ASCEND_DURATION + u23.COMET_VOLLEY_TARGETING_DURATION + u23.COMET_VOLLEY_FIRING_DURATION + u23.COMET_VOLLEY_DESCEND_DURATION + 0.1, function() --[[ Line: 266 ]]
            --[[
            Upvalues:
                [1] = u75
                [2] = u53
            --]]
            local v76 = u75
            if v76 ~= nil then
                v76:Disconnect()
            end
            local v77 = u53
            if v77 ~= nil then
                v77:showNametag()
            end
        end)
    end)
    u25.Client:OnEvent("CometSpawned", function(p78) --[[ Line: 278 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u14
            [3] = u16
            [4] = u10
            [5] = u15
            [6] = u33
        --]]
        local u79
        if p78.variant == u24.HERO_COMET_VOLLEY then
            u79 = u14.Assets.Misc.HeroComet:Clone()
        else
            u79 = u14.Assets.Misc.VillainComet:Clone()
        end
        local v80 = u79.PrimaryPart
        if v80 == nil then
            return nil
        end
        u79.Parent = u16
        v80.Anchored = true
        u10(u79, math.random(2, 6))
        local v81 = u79:FindFirstChild("Comet")
        if v81 ~= nil then
            local v82 = v81:FindFirstChild("Effects")
            if v82 ~= nil then
                for v83, v84 in v82:GetDescendants() do
                    local _ = v83 - 1
                    if v84:IsA("ParticleEmitter") then
                        v84:Emit()
                    end
                end
            end
        end
        local v85 = u79:GetChildren()
        local function v87(p86) --[[ Line: 305 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            if p86:IsA("MeshPart") then
                p86.Transparency = 1
                u15:Create(p86, TweenInfo.new(0.3), {
                    ["Transparency"] = 0
                }):Play()
            end
        end
        for v88, v89 in v85 do
            v87(v89, v88 - 1, v85)
        end
        v80:PivotTo(CFrame.new(p78.originPosition))
        local v90 = (p78.originPosition - p78.targetPosition).Unit
        local v91 = CFrame.lookAt(v80.Position + v90, p78.targetPosition + v90)
        v80:PivotTo(CFrame.new(p78.originPosition, v91.Position))
        local v92 = u79:FindFirstChild("Comet")
        if v92 ~= nil then
            local v93 = v92:FindFirstChild("Effects")
            if v93 ~= nil then
                for v94, v95 in v93:GetDescendants() do
                    local _ = v94 - 1
                    if v95:IsA("ParticleEmitter") then
                        v95:Emit()
                    end
                end
            end
        end
        u33:tweenCometToTarget(v80, p78.targetPosition, p78.travelDuration)
        task.delay(p78.travelDuration + 0.05, function() --[[ Line: 340 ]]
            --[[
            Upvalues:
                [1] = u79
            --]]
            local v96 = u79
            if v96 ~= nil then
                v96:Destroy()
            end
            for _, v97 in u79:GetDescendants() do
                if (v97:IsA("Weld") or v97:IsA("BasePart")) and v97 ~= nil then
                    v97:Destroy()
                end
            end
        end)
    end)
end
function u29.requestCometVolley(p98, p99, p100, u101) --[[ Line: 356 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u7
        [3] = u26
    --]]
    if p99:GetAttribute("CometVolleyState") ~= "Targeting" then
        return false
    end
    local v102 = p98:getTargetPosition(p99, p100)
    if not v102 then
        return false
    end
    p98.cometVolleyTargetSelectedRemote:SendToServer({
        ["targetPosition"] = v102
    })
    task.delay(u23.COMET_VOLLEY_FIRING_DURATION, function() --[[ Line: 368 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u26
            [3] = u101
        --]]
        local v103 = {
            ["rollOffMaxDistance"] = 180,
            ["looped"] = false,
            ["volumeMultiplier"] = 0.6,
            ["position"] = u101
        }
        u7:playSound(u26.COMET_VOLLEY_FIRED, v103)
    end)
    return true
end
function u29.handleDescendEffects(p104, p105, p106, p107) --[[ Line: 378 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u21
        [3] = u23
        [4] = u15
        [5] = u7
        [6] = u26
    --]]
    local u108 = u4:playAnimation(p107, u21:getAssetId(p104.fireToFallingTransitionAnimation), {
        ["looped"] = false
    })
    local v109 = u15:Create(p106, TweenInfo.new(u23.COMET_VOLLEY_DESCEND_DURATION, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
        ["CFrame"] = CFrame.new(p105)
    })
    local u110 = u7:playSound(u26.WIND_LOOP, {
        ["rollOffMaxDistance"] = 180,
        ["volumeMultiplier"] = 1.4,
        ["looped"] = false,
        ["parent"] = p106,
        ["position"] = p106.Position
    })
    local u111 = p107:LoadAnimation(u21:getAnimation(p104.descendingAnimation))
    task.delay(0.25, function() --[[ Line: 394 ]]
        --[[
        Upvalues:
            [1] = u108
            [2] = u111
        --]]
        local v112 = u108
        if v112 ~= nil then
            v112:Stop()
        end
        u111:Play()
        u111.Looped = true
        u111:AdjustSpeed(1)
    end)
    v109:Play()
    v109.Completed:Connect(function() --[[ Line: 404 ]]
        --[[
        Upvalues:
            [1] = u111
            [2] = u110
        --]]
        local v113 = u111
        if v113 ~= nil then
            v113:Stop()
        end
        local v114 = u110
        if v114 ~= nil then
            v114:Stop()
        end
    end)
end
function u29.handleAscendEffects(p115, p116, p117, p118, p119, u120) --[[ Line: 415 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u12
        [3] = u4
        [4] = u21
        [5] = u23
        [6] = u15
        [7] = u7
    --]]
    u120:PivotTo(CFrame.new(p117.Position))
    u120.Parent = p117
    local v121 = u120:FindFirstChild("Root")
    if v121 == nil then
        return nil
    end
    v121.Anchored = false
    for v122, v123 in u120:GetDescendants() do
        local _ = v122 - 1
        if v123:IsA("ParticleEmitter") then
            v123.Enabled = true
        end
        if v123:IsA("Trail") then
            v123.Enabled = true
        end
    end
    u28:weldParts(v121, p117)
    u120:SetAttribute("RotationSpeed", 359)
    u12:AddTag(u120, "RotatingObject")
    local u124 = u4:playAnimation(p118, u21:getAssetId(p115.ascendingAnimation), {
        ["looped"] = true,
        ["speed"] = 0.66
    })
    local v125 = u15:Create(p117, TweenInfo.new(u23.COMET_VOLLEY_ASCEND_DURATION, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
        ["CFrame"] = CFrame.new(p116)
    })
    local u126 = u7:playSound(p119, {
        ["rollOffMaxDistance"] = 180,
        ["volumeMultiplier"] = 1.4,
        ["looped"] = false,
        ["parent"] = p117,
        ["position"] = p117.Position
    })
    v125:Play()
    v125.Completed:Connect(function() --[[ Line: 454 ]]
        --[[
        Upvalues:
            [1] = u124
            [2] = u126
            [3] = u120
        --]]
        local v127 = u124
        if v127 ~= nil then
            v127:Stop()
        end
        local v128 = u126
        if v128 ~= nil then
            v128:Stop()
        end
        local v129 = u120
        if v129 ~= nil then
            v129:Destroy()
        end
    end)
end
function u29.getTargetPosition(_, p130, p131) --[[ Line: 469 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v132 = p130:GetMouse().UnitRay
    local v133 = p130.Character
    if not v133 then
        return nil
    end
    local v134 = RaycastParams.new()
    v134.FilterDescendantsInstances = { v133, p131 }
    v134.FilterType = Enum.RaycastFilterType.Exclude
    local v136 = u5:raycast(v132.Origin, v132.Direction.Unit * 1000, v134, {
        ["ignorePart"] = function(p135) --[[ Name: ignorePart, Line 480 ]]
            return p135:IsA("BasePart") and not p135.CanCollide and true or false
        end
    })
    if v136 ~= nil then
        v136 = v136.Position
    end
    return v136 or nil
end
function u29.enableTargetIndicator(_, p137, u138) --[[ Line: 497 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local u139 = p137:GetMouse()
    local u140 = nil
    u140 = u139.Move:Connect(function() --[[ Line: 500 ]]
        --[[
        Upvalues:
            [1] = u139
            [2] = u138
            [3] = u23
            [4] = u140
        --]]
        local v141 = u139.Hit.Position
        u138.CFrame = CFrame.new(v141)
        task.delay(u23.COMET_VOLLEY_TARGETING_DURATION - 0.15, function() --[[ Line: 503 ]]
            --[[
            Upvalues:
                [1] = u138
                [2] = u140
            --]]
            local v142 = u138
            if v142 ~= nil then
                v142:Destroy()
            end
            local v143 = u140
            if v143 ~= nil then
                v143:Disconnect()
            end
            return nil
        end)
    end)
    return u140
end
function u29.enablePlayerRotation(_, p144, u145, u146) --[[ Line: 517 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local u147 = p144:GetMouse()
    local u148 = nil
    u148 = u147.Move:Connect(function() --[[ Line: 520 ]]
        --[[
        Upvalues:
            [1] = u147
            [2] = u23
            [3] = u148
            [4] = u146
            [5] = u145
        --]]
        local v149 = u147.Hit.Position
        task.delay(u23.COMET_VOLLEY_TARGETING_DURATION - 0.15, function() --[[ Line: 522 ]]
            --[[
            Upvalues:
                [1] = u148
            --]]
            local v150 = u148
            if v150 ~= nil then
                v150:Disconnect()
            end
            return nil
        end)
        local v151 = v149 - u146
        u145:PivotTo((CFrame.new(u146, u146 + v151)))
    end)
    return u148
end
function u29.tweenCometToTarget(u152, u153, u154, p155) --[[ Line: 536 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u7
        [3] = u6
        [4] = u14
        [5] = u27
        [6] = u16
        [7] = u17
        [8] = u9
    --]]
    local v156 = (u154 - u153.Position).Unit
    local v157 = CFrame.lookAt(u153.Position, u154 + v156)
    local v158 = u15:Create(u153, TweenInfo.new(p155, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
        ["CFrame"] = CFrame.new(u154, v157.Position)
    })
    v158:Play()
    v158.Completed:Connect(function() --[[ Line: 546 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u152
            [4] = u154
            [5] = u153
            [6] = u14
            [7] = u27
            [8] = u16
            [9] = u17
            [10] = u9
        --]]
        local v159 = u7
        local v160 = u6.fromList
        local v161 = u152.cometImpactSounds
        local v162 = {
            ["rollOffMaxDistance"] = 140,
            ["volumeMultiplier"] = 0.8,
            ["position"] = u154
        }
        v159:playSound(v160(unpack(v161)), v162)
        local v163 = u153
        if v163 ~= nil then
            v163:Destroy()
        end
        local u164 = u14.Assets.Effects.WizardImpact:Clone()
        if not u164.PrimaryPart then
            return nil
        end
        u27:playEffects({ u164 }, nil)
        local v165 = u154
        local v166 = u164.PrimaryPart.Size.Y / 2 + 0.5
        local v167 = Vector3.new(0, v166, 0)
        u164:PivotTo(CFrame.new(v165 + v167))
        u164.Parent = u16
        task.delay(0.5, function() --[[ Line: 566 ]]
            --[[
            Upvalues:
                [1] = u164
                [2] = u17
                [3] = u9
            --]]
            local u168 = u164.Crack.SurfaceGui.ImageLabel
            local u169 = u164.Crack.SurfaceGui.Brightness
            u17(0.5, u9, function(p170) --[[ Line: 570 ]]
                --[[
                Upvalues:
                    [1] = u164
                    [2] = u169
                    [3] = u168
                --]]
                u164.Crack.SurfaceGui.Brightness = u169 * (1 - p170)
                u168.ImageTransparency = p170 * 0.4
            end)
            task.wait(1.5)
            u17(1.5, u9, function(p171) --[[ Line: 576 ]]
                --[[
                Upvalues:
                    [1] = u168
                --]]
                u168.ImageTransparency = 0.4 + p171 * 0.6
            end):Wait()
            u164:Destroy()
        end)
    end)
end
function u29.isValidItem(_, p172) --[[ Line: 584 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    return p172 == u24.HERO_COMET_VOLLEY or p172 == u24.VILLAIN_COMET_VOLLEY
end
v8.CreateController(u29.new())
return nil