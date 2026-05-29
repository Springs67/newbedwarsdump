local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = v12.RunService
local u16 = v12.UserInputService
local u17 = v12.Workspace
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u19 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u21 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u22 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "encoding", "projectile-type-encoding").getProjectileTypeByEncoding
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "VoidTurretAttackController"
    end,
    ["__index"] = u20
})
u29.__index = u29
function u29.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u10
    --]]
    u20.constructor(p32)
    p32.Name = "VoidTurretAttackController"
    p32.maid = u10.new()
end
function u29.KnitStart(u33) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u19
        [3] = u23
        [4] = u14
        [5] = u22
        [6] = u13
        [7] = u24
        [8] = u2
        [9] = u16
        [10] = u15
        [11] = u17
        [12] = u26
        [13] = u28
        [14] = u11
        [15] = u4
        [16] = u21
        [17] = u25
        [18] = u10
        [19] = u7
    --]]
    u20.KnitStart(u33)
    u19.AbilityUsed:connect(function(p34) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u33
            [3] = u14
        --]]
        if p34.ability ~= u23.VOID_TURRET_FIRE then
            return nil
        end
        local v35 = p34.extra
        u33:playAttackAnimation(v35.fromTurret, v35.target, p34.userCharacter == u14.LocalPlayer.Character)
    end)
    u22.changed:connect(function(p36, p37) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u13
            [3] = u24
            [4] = u2
            [5] = u23
            [6] = u16
            [7] = u15
            [8] = u17
            [9] = u26
            [10] = u28
            [11] = u11
            [12] = u4
        --]]
        local u38 = p36.Game.selectedTurret
        if u38 == p37.Game.selectedTurret then
            return nil
        end
        u33.maid:DoCleaning()
        local v39 = u38 == nil
        if not v39 then
            local v40 = u13:GetTags(u38)
            local v41 = u24.VOID_TURRET
            local v42 = table.find(v40, v41) ~= nil
            v39 = not v42
        end
        if v39 then
            return nil
        end
        task.spawn(function() --[[ Line: 75 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u2
                [3] = u23
            --]]
            u33.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u23.VOID_TURRET_FIRE, nil):expect())
        end)
        u33.maid:GiveTask(u16.InputBegan:Connect(function(p43, p44) --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u2
                [3] = u23
                [4] = u38
            --]]
            if not p44 and (u33:isAcceptableInput(p43) and p43.UserInputState == Enum.UserInputState.Begin) then
                if not u33.target then
                    return nil
                end
                if u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(u23.VOID_TURRET_FIRE) then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u23.VOID_TURRET_FIRE, p43, {
                        ["target"] = u33.target,
                        ["fromTurret"] = u38
                    })
                end
            end
        end))
        u33.maid:GiveTask(function() --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            u33:removeTarget()
        end)
        u33.maid:GiveTask(u15.Heartbeat:Connect(function() --[[ Line: 98 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u33
                [3] = u26
                [4] = u28
                [5] = u11
            --]]
            local v45 = u17.CurrentCamera
            if v45 ~= nil then
                v45 = v45.CFrame
            end
            if not v45 then
                u33:removeTarget()
                return nil
            end
            local v46 = u26:getLocalPlayerEntity()
            if not v46 then
                u33:removeTarget()
                return nil
            end
            local v47 = v45 * Vector3.new(0, 0, -20)
            local v48 = u28.getEntitiesWithinRadius(v47, 20)
            local v49 = Ray.new(v45.Position, v45.LookVector).Unit
            local v50 = (1 / 0)
            local v51 = nil
            for _, v52 in v48 do
                if v46:canAttack(v52) then
                    local v53 = v52:getInstance():GetPrimaryPartCFrame().Position
                    local v54 = v49:ClosestPoint(v53)
                    local v55 = (v53 - v54).Magnitude
                    if v55 <= 6 then
                        local v56 = v55 + (v49.Origin - v54).Magnitude / 3
                        if v56 < v50 then
                            v51 = v52:getInstance()
                            v50 = v56
                        end
                    end
                end
            end
            if u33.target ~= v51 then
                u33:removeTarget()
                if v51 then
                    local v57 = u33
                    local v58 = u11
                    local v59 = {
                        ["AlwaysOnTop"] = true,
                        ["Parent"] = v51.PrimaryPart,
                        ["Size"] = UDim2.new(0.8, 10, 0.8, 10),
                        ["Children"] = { u11("ImageLabel", {
                                ["Image"] = "rbxassetid://9429977101",
                                ["BackgroundTransparency"] = 1,
                                ["Size"] = UDim2.fromScale(1, 1),
                                ["ScaleType"] = Enum.ScaleType.Fit,
                                ["ImageColor3"] = Color3.fromRGB(255, 37, 222)
                            }) }
                    }
                    v57.targetIcon = v58("BillboardGui", v59)
                end
            end
            u33.target = v51
        end))
        u13:GetInstanceAddedSignal(u24.VULCAN_TURRET):Connect(function(p60) --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            p60:SetAttribute("ProjectilesIgnore", true)
            for _, v61 in p60:GetDescendants() do
                u4:setQueryIgnored(v61, true)
            end
        end)
    end)
    u21.On(function(p62, _, _, _, _, _, _, p63, _, _, _, _, _, _) --[[ Line: 163 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u14
            [3] = u10
            [4] = u7
        --]]
        local v64
        if p63 == nil then
            v64 = p63
        else
            v64 = p63.projectileData
        end
        if v64 then
            local v65 = u25(p63.projectileData.projectileType)
            if (v65 == "turretBullet" or v65 == "turretArtilleryBullet") and p62 == u14.LocalPlayer.Character then
                local u66 = u10.new()
                u66:GiveTask(u7.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["moveSpeedMultiplier"] = 0.5
                }))
                task.delay(0.1, function() --[[ Line: 176 ]]
                    --[[
                    Upvalues:
                        [1] = u66
                    --]]
                    u66:DoCleaning()
                end)
            end
        end
    end)
end
function u29.removeTarget(p67) --[[ Line: 184 ]]
    p67.target = nil
    local v68 = p67.targetIcon
    if v68 ~= nil then
        v68:Destroy()
    end
end
function u29.isAcceptableInput(_, p69) --[[ Line: 191 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v70 = false
    local v71 = u8.Controllers.KeybindLoadController:getKeybinds()
    local v72
    if v71 == nil then
        v72 = v71
    else
        v72 = v71.keyboard
        if v72 ~= nil then
            v72 = v72.controlActions.Attack
        end
    end
    local v73 = v72 or Enum.UserInputType.MouseButton1
    if v71 ~= nil then
        v71 = v71.gamepad
        if v71 ~= nil then
            v71 = v71.controlActions.Attack
        end
    end
    local v74 = v71 or Enum.KeyCode.ButtonR2
    return v70 or (p69.UserInputType == v73 and true or p69.KeyCode == v73) or p69.UserInputType == Enum.UserInputType.Touch or p69.KeyCode == v74
end
function u29.playAttackAnimation(_, u75, u76, p77) --[[ Line: 235 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u27
        [4] = u1
        [5] = u18
        [6] = u9
    --]]
    local u78 = u10.new()
    local v79 = u5
    local v80 = u27.VOID_CRAB_BEAM_ATTACK
    local v81 = {
        ["rollOffMaxDistance"] = 100
    }
    local v82
    if p77 then
        v82 = nil
    else
        v82 = u75
    end
    v81.parent = v82
    local u83 = v79:playSound(v80, v81)
    u78:GiveTask(function() --[[ Line: 241 ]]
        --[[
        Upvalues:
            [1] = u83
        --]]
        local v84 = u83
        if v84 ~= nil then
            v84:Stop()
        end
        local v85 = u83
        if v85 ~= nil then
            v85:Destroy()
        end
    end)
    u78:GiveTask(u75.AncestryChanged:Connect(function() --[[ Line: 251 ]]
        --[[
        Upvalues:
            [1] = u75
            [2] = u78
        --]]
        if u75.Parent then
            return nil
        end
        u78:DoCleaning()
    end))
    u78:GiveTask(u76.AncestryChanged:Connect(function() --[[ Line: 257 ]]
        --[[
        Upvalues:
            [1] = u76
            [2] = u78
        --]]
        if u76.Parent then
            return nil
        end
        u78:DoCleaning()
    end))
    local v86 = u75:WaitForChild("Head"):WaitForChild("BulletOrigin")
    local u87 = v86:WaitForChild("TargetBeam")
    local u88 = v86:WaitForChild("BlastBeam")
    u87.Enabled = true
    if u76 ~= nil then
        u76 = u76:FindFirstChild("UpperTorso")
        if u76 ~= nil then
            u76 = u76:FindFirstChild("BodyFrontAttachment")
        end
    end
    u87.Attachment1 = u76
    u88.Attachment1 = u76
    local u93 = u1.Promise.delay(1.8):andThen(function() --[[ Line: 281 ]]
        --[[
        Upvalues:
            [1] = u87
            [2] = u88
            [3] = u18
            [4] = u9
            [5] = u78
        --]]
        u87.Enabled = false
        u88.Enabled = true
        local u90 = u18(0.1, u9, function(p89) --[[ Line: 284 ]]
            --[[
            Upvalues:
                [1] = u88
            --]]
            u88.Width0 = 0.1 + p89 * 0.4
            u88.Width1 = 0.2 + p89 * 0.6
        end)
        u78:GiveTask(function() --[[ Line: 288 ]]
            --[[
            Upvalues:
                [1] = u90
            --]]
            return u90:Cancel()
        end)
        task.delay(0.3, function() --[[ Line: 291 ]]
            --[[
            Upvalues:
                [1] = u88
                [2] = u18
                [3] = u9
                [4] = u78
            --]]
            if not u88.Parent then
                return nil
            end
            local u92 = u18(0.05, u9, function(p91) --[[ Line: 295 ]]
                --[[
                Upvalues:
                    [1] = u88
                --]]
                u88.Width0 = 0.5 * (1 - p91)
                u88.Width1 = 0.8 * (1 - p91)
            end)
            u78:GiveTask(function() --[[ Line: 299 ]]
                --[[
                Upvalues:
                    [1] = u92
                --]]
                return u92:Cancel()
            end)
        end)
    end)
    u78:GiveTask(function() --[[ Line: 305 ]]
        --[[
        Upvalues:
            [1] = u93
        --]]
        return u93:cancel()
    end)
end
u7.CreateController(u29.new())
return nil