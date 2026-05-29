local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCharacter
local u5 = v2.WatchCollectionTag
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.Players
local u11 = v8.ReplicatedStorage
local u12 = v8.TweenService
local u13 = v8.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "GlueTrapController"
    end,
    ["__index"] = u16
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p24)
    p24.Name = "GlueTrapController"
    p24.isPreloaded = false
end
function u21.KnitStart(u25) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u5
        [3] = u6
        [4] = u10
        [5] = u4
        [6] = u19
        [7] = u3
        [8] = u20
        [9] = u18
        [10] = u17
        [11] = u13
        [12] = u15
        [13] = u12
        [14] = u11
        [15] = u9
        [16] = u14
        [17] = u7
    --]]
    u16.KnitStart(u25)
    u5("GlueTrap", function(p26) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u10
        --]]
        local v27 = p26:GetAttribute("TeamId")
        local v28 = u6.Controllers.TeamController:getPlayerTeam(u10.LocalPlayer)
        if v28 ~= nil then
            v28 = v28.id
        end
        local u29 = v27 == v28
        local function u31(p30) --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            if p30:IsA("MeshPart") and (p30.Name ~= "Bucket_Steel2.001" and (p30.Name ~= "bucket_hand_mesh" and p30.Name ~= "bucket_mesh")) then
                p30.TextureID = u29 and "rbxassetid://11467440373" or "rbxassetid://11467440187"
            end
        end
        for v32, v33 in p26:GetDescendants() do
            local _ = v32 - 1
            if v33:IsA("MeshPart") and (v33.Name ~= "Bucket_Steel2.001" and (v33.Name ~= "bucket_hand_mesh" and v33.Name ~= "bucket_mesh")) then
                v33.TextureID = u29 and "rbxassetid://11467440373" or "rbxassetid://11467440187"
            end
        end
        p26.DescendantAdded:Connect(function(p34) --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            return u31(p34)
        end)
    end)
    u4(function(u35, u36) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u25
            [3] = u6
        --]]
        u36:GetAttributeChangedSignal("GlueSlow"):Connect(function() --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u10
                [3] = u35
                [4] = u25
                [5] = u6
            --]]
            if u36:GetAttribute("GlueSlow") == nil then
                if u10.LocalPlayer == u35 and u25.speedMaid then
                    u25.speedMaid:Destroy()
                    u25.speedMaid = nil
                end
            elseif u10.LocalPlayer == u35 then
                u25.speedMaid = u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["blockSprint"] = false,
                    ["moveSpeedMultiplier"] = u36:GetAttribute("GlueSlow")
                })
                return
            end
        end)
    end)
    u19.Client:OnEvent("GlueTrapPlayAlertedAnim", function(u37) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u3
            [3] = u20
            [4] = u18
            [5] = u17
            [6] = u13
            [7] = u19
        --]]
        local v38 = u37.player.Character
        if v38 ~= nil then
            v38 = v38.PrimaryPart
            if v38 ~= nil then
                v38 = v38.Position
            end
        end
        if v38 == nil then
            return nil
        end
        local v39 = u37.trap.PrimaryPart
        if not v39 then
            return nil
        end
        local u40 = u25:getTrapAnimator(u37.trap)
        if not u40 then
            return nil
        end
        v39.CFrame = CFrame.lookAt(v39.Position, v38)
        u3:playSound(u20.CHARGING_GLOOP_ALERT, {
            ["rollOffMaxDistance"] = 100,
            ["rollOffMinDistance"] = 30,
            ["position"] = u37.trap:GetPivot().Position
        })
        local u41 = u40:LoadAnimation(u18:getAnimation(u17.GLUE_TRAP_CHARGING_ALERTED))
        u41:Play()
        task.delay(1, function() --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u13
                [3] = u19
                [4] = u3
                [5] = u20
                [6] = u41
                [7] = u40
                [8] = u18
                [9] = u17
            --]]
            if not (u37.trap:IsDescendantOf(u13) and u37.player.Parent) then
                return nil
            end
            local v42 = u37.trap.PrimaryPart
            if not v42 then
                return nil
            end
            u19.Client:Get("GlueTrapStartCharging"):SendToServer({
                ["trap"] = u37.trap,
                ["player"] = u37.player
            })
            local v43 = u3:createSound(u20.CHARGING_GLOOP_LOOP)
            if v43 then
                v43.Parent = v42
                v43.Looped = true
                v43.Name = "GloopChargingSound"
                v43.Volume = 0.5
                v43:Play()
            end
            u41 = u40:LoadAnimation(u18:getAnimation(u17.GLUE_TRAP_CHARGING))
            u41:Play()
        end)
    end)
    u19.Client:OnEvent("GlueTrapStopCharging", function(p44) --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u18
            [3] = u17
        --]]
        local v45 = p44.trap
        if v45 ~= nil then
            v45 = v45.PrimaryPart
            if v45 ~= nil then
                v45 = v45:FindFirstChild("GloopChargingSound")
            end
        end
        local v46 = u25:getTrapAnimator(p44.trap)
        if v46 then
            for _, v47 in v46:GetPlayingAnimationTracks() do
                if v47.IsPlaying then
                    v47:Stop()
                end
            end
            local v48 = v46:LoadAnimation(u18:getAnimation(u17.GLUE_TRAP_IDLE))
            v48:AdjustSpeed(0.1)
            v48:Play()
        end
        if v45 then
            v45:Destroy()
        end
    end)
    u15.ProjectileLaunched:connect(function(p49) --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u18
            [3] = u17
            [4] = u3
            [5] = u20
        --]]
        local v50 = p49.projectile
        if p49.projectileType ~= "glue_trap" then
            return nil
        end
        local v51 = u25:getTrapAnimator(v50)
        if not v51 then
            return nil
        end
        local v52 = v51:LoadAnimation(u18:getAnimation(u17.GLUE_TRAP_FLYING))
        v52:AdjustSpeed(0.1)
        v52:Play()
        local v53 = u3:createSound(u20.GLOOP_LOOP)
        if v53 then
            v53.Parent = v50:FindFirstChildWhichIsA("BasePart")
            v53.Looped = true
            v53.Volume = 3
            v53:Play()
        end
    end)
    u15.ProjectileHit:connect(function(p54) --[[ Line: 186 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u20
        --]]
        if p54:isCancelled() then
            return nil
        end
        if p54.projectileType ~= "glue_trap" and p54.projectileType ~= "glue_trap_charging" then
            return nil
        end
        u3:playSound(u20.GLOOP_LANDED, {
            ["position"] = p54.hitData.hitCFrame.Position
        })
    end)
    u19.Client:OnEvent("GlueTrapReplace", function(u55) --[[ Line: 197 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u11
            [3] = u13
            [4] = u19
        --]]
        for _, v56 in u55.trap do
            local v57 = v56:GetDescendants()
            local function v59(p58) --[[ Line: 201 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                if p58:IsA("BasePart") then
                    u12:Create(p58, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                        ["Transparency"] = 1
                    }):Play()
                end
            end
            for v60, v61 in v57 do
                v59(v61, v60 - 1, v57)
            end
            local u62 = u11.Assets.Effects.LightUpgradeEffect:Clone()
            u62.CFrame = v56:GetPivot()
            u62.Parent = u13
            task.delay(1, function() --[[ Line: 217 ]]
                --[[
                Upvalues:
                    [1] = u62
                --]]
                u62:Destroy()
            end)
        end
        task.delay(1, function() --[[ Line: 221 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u55
            --]]
            u19.Client:Get("GlueTrapReplaceSetup"):SendToServer({
                ["trap"] = u55.trap,
                ["gameTeam"] = u55.gameTeam
            })
        end)
    end)
    u19.Client:OnEvent("GlueTrapAddCharging", function(p63) --[[ Line: 228 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u12
        --]]
        u25:setInitialTransparency(p63.trap, 1)
        local v64 = p63.trap:GetDescendants()
        local function v66(p65) --[[ Line: 231 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            if p65:IsA("BasePart") then
                u12:Create(p65, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    ["Transparency"] = 0
                }):Play()
            end
        end
        for v67, v68 in v64 do
            v66(v68, v67 - 1, v64)
        end
    end)
    u5("GlueTrap", function(u69) --[[ Line: 243 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u9
            [3] = u25
            [4] = u6
            [5] = u20
            [6] = u17
            [7] = u18
            [8] = u3
            [9] = u11
            [10] = u14
            [11] = u7
        --]]
        if not u69:IsDescendantOf(u13) then
            u69.AncestryChanged:Wait()
        end
        if not u69:IsDescendantOf(u13) or table.find(u9:GetTags(u69), "GlueTrap") == nil then
            return nil
        end
        task.spawn(function() --[[ Line: 250 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u6
                [3] = u20
                [4] = u17
            --]]
            if not u25.isPreloaded then
                u6.Controllers.PreloadController:runPreload({
                    ["sounds"] = {
                        u20.GLOOP_POP,
                        u20.GLOOP_TRIGGER,
                        u20.CHARGING_GLOOP_ALERT,
                        u20.CHARGING_GLOOP_LOOP
                    },
                    ["animations"] = {
                        u17.GLUE_TRAP_JUMP,
                        u17.GLUE_TRAP_IDLE,
                        u17.GLUE_TRAP_CHARGING,
                        u17.GLUE_TRAP_CHARGING_ALERTED
                    }
                })
                u25.isPreloaded = true
            end
        end)
        local u70 = u25:getTrapAnimator(u69)
        if u70 then
            local v71 = u70:LoadAnimation(u18:getAnimation(u17.GLUE_TRAP_IDLE))
            v71:AdjustSpeed(0.1)
            v71:Play()
        end
        u69.Destroying:Connect(function() --[[ Line: 265 ]]
            --[[
            Upvalues:
                [1] = u69
                [2] = u9
                [3] = u13
                [4] = u3
                [5] = u20
                [6] = u70
                [7] = u25
                [8] = u18
                [9] = u17
                [10] = u11
                [11] = u14
                [12] = u7
            --]]
            local v72 = u69:GetAttribute("DestroyedBySwapping")
            if v72 ~= 0 and (v72 == v72 and (v72 ~= "" and v72)) then
                return nil
            end
            local u73 = u69:Clone()
            u9:RemoveTag(u73, "GlueTrap")
            u73.Parent = u13
            local u74 = u69.PrimaryPart
            if u74 ~= nil then
                u74 = u74.CFrame
            end
            if not u74 then
                u73:Destroy()
                return nil
            end
            u73:PivotTo(u74)
            for v75, v76 in u73:GetDescendants() do
                local _ = v75 - 1
                if v76:IsA("BasePart") then
                    v76.CanCollide = false
                    v76.CanQuery = false
                end
            end
            local v77 = u73.PrimaryPart
            if v77 ~= nil then
                local v78 = v77:FindFirstChild("GloopChargingSound")
                if v78 ~= nil then
                    v78:Destroy()
                end
            end
            local v79 = {
                ["position"] = u74.Position
            }
            u3:playSound(u20.GLOOP_TRIGGER, v79)
            u70 = u25:getTrapAnimator(u73)
            if u70 then
                local v80 = u70:LoadAnimation(u18:getAnimation(u17.GLUE_TRAP_JUMP))
                v80:AdjustSpeed(0.1)
                v80:Play()
            end
            local u81 = u11.Assets.Effects.GlueExplosion:Clone()
            local u82 = u74 + Vector3.new(0, 5, 0)
            u14(0.4, u7, function(p83) --[[ Line: 313 ]]
                --[[
                Upvalues:
                    [1] = u73
                    [2] = u74
                    [3] = u82
                --]]
                local v84 = u73.PrimaryPart
                if v84 ~= nil then
                    v84 = v84.Parent
                end
                if not v84 then
                    return nil
                end
                u73:PivotTo(u74:Lerp(u82, p83))
            end)
            task.delay(0.4, function() --[[ Line: 323 ]]
                --[[
                Upvalues:
                    [1] = u73
                    [2] = u81
                    [3] = u82
                    [4] = u13
                    [5] = u3
                    [6] = u20
                --]]
                u73:Destroy()
                u81.Position = u82.Position
                u81.Parent = u13
                for _, v85 in u81:GetDescendants() do
                    if v85:IsA("ParticleEmitter") then
                        v85:Emit(30)
                    end
                end
                u3:playSound(u20.GLOOP_POP, {
                    ["rollOffMinDistance"] = 30,
                    ["rollOffMaxDistance"] = 100,
                    ["position"] = u82.Position
                })
            end)
            task.delay(1.5, function() --[[ Line: 338 ]]
                --[[
                Upvalues:
                    [1] = u81
                --]]
                u81:Destroy()
            end)
        end)
    end)
end
function u21.setInitialTransparency(_, p86, p87) --[[ Line: 344 ]]
    for _, v88 in p86:GetDescendants() do
        if v88:IsA("BasePart") then
            v88.Transparency = p87
        end
    end
end
function u21.getTrapAnimator(_, p89) --[[ Line: 351 ]]
    local v90 = p89:WaitForChild("AnimationController", 3)
    if v90 then
        local v91 = v90:WaitForChild("Animator", 3)
        local v92
        if v91 == nil then
            v92 = v91
        else
            v92 = v91:IsA("Animator")
        end
        if v92 then
            return v91
        else
            return nil
        end
    else
        return nil
    end
end
u6.CreateController(u21.new())
return nil