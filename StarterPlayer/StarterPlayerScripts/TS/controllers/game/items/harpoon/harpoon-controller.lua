local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.ExpireList
local u6 = v3.SoundManager
local u7 = v3.TimedProgressBar
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.RunService
local u15 = v12.UserInputService
local u16 = v12.Workspace
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").HarpoonBalance
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
        return "HarpoonController"
    end,
    ["__index"] = u18
})
u32.__index = u32
function u32.new(...) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v33 = u32
    local v34 = setmetatable({}, v33)
    return v34:constructor(...) or v34
end
function u32.constructor(p35) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u9
        [3] = u5
    --]]
    u18.constructor(p35)
    p35.Name = "HarpoonController"
    p35.uiMaid = u9.new()
    p35.visualCooldowns = u5.new(1)
    p35.isPreloaded = false
end
function u32.KnitStart(u36) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u8
        [3] = u26
        [4] = u31
        [5] = u19
        [6] = u30
        [7] = u17
        [8] = u27
        [9] = u28
        [10] = u2
        [11] = u22
        [12] = u13
        [13] = u29
        [14] = u21
        [15] = u11
        [16] = u7
        [17] = u16
        [18] = u4
        [19] = u20
        [20] = u1
        [21] = u23
        [22] = u6
        [23] = u15
    --]]
    u18.KnitStart(u36)
    u8.Controllers.KitController:watchKit(function(_, p37) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u36
            [3] = u8
            [4] = u31
            [5] = u19
        --]]
        if p37 == u26.HARPOON and not u36.isPreloaded then
            u8.Controllers.PreloadController:runPreload({
                ["sounds"] = {
                    u31.HARPOON_HIT_ENEMY,
                    u31.HARPOON_HIT_PART,
                    u31.HARPOON_LEAP,
                    u31.HARPOON_THROW
                },
                ["animations"] = {
                    u19.HARPOON_ATTACK_START,
                    u19.HARPOON_HANG,
                    u19.HARPOON_HANG_IDLE,
                    u19.HARPOON_RETURN,
                    u19.HARPOON_STTACK
                }
            })
            u36.isPreloaded = true
        end
    end)
    u30.ProjectileExpired:connect(function(p38) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        if p38.projectileType == "harpoon_projectile" then
            u36:returnHarpoon(p38.player, p38.projectileModel)
        end
    end)
    u17.ProjectileLaunched:connect(function(p39) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u27
            [3] = u28
            [4] = u2
            [5] = u22
            [6] = u13
            [7] = u36
        --]]
        if p39:isLocalShooter() and p39.projectileType == "harpoon_projectile" then
            local v40 = u17.AbilityCooldownModifierCheck:fire(u27(u28.HARPOON).projectileSource.fireDelaySec).cooldown
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u22.HARPOON, v40)
        end
        if p39.projectileType == "harpoon_projectile" and p39.shooter then
            local v41 = u13:GetPlayerFromCharacter(p39.shooter)
            if not v41 then
                return nil
            end
            u36:hideHandItem(v41)
        end
    end)
    u29.Client:Get("TridentAttached"):Connect(function(p42) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u21
            [3] = u2
            [4] = u11
            [5] = u7
            [6] = u16
            [7] = u4
            [8] = u13
            [9] = u20
            [10] = u19
        --]]
        if p42.attached then
            u36.uiMaid:DoCleaning()
            local v43 = u21.MAX_ANCHOR_TIME - 0.4
            local v44 = p42.anchorTime
            if v44 ~= 0 and (v44 == v44 and v44) then
                v43 = p42.anchorTime - 0.4
            end
            local v45 = u36
            local v46 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController")
            local v47 = u11.createElement
            local v48 = u7
            local v49 = {
                ["Size"] = UDim2.fromScale(1, 0.05),
                ["EndTime"] = u16:GetServerTimeNow() + v43,
                ["ProgressBarConfig"] = {
                    ["GradientRotation"] = 0,
                    ["BarGradient"] = ColorSequence.new(Color3.fromRGB(28, 112, 255), Color3.fromRGB(51, 148, 255))
                }
            }
            v45.uiMaid = v46:addComponent(v47(v48, v49))
            local v50 = u36.animationTrack
            if v50 ~= nil then
                v50:Stop()
            end
            local v51 = u36.animationTrack
            if v51 ~= nil then
                v51:Destroy()
            end
            u36.animationTrack = u4:playAnimation(u13.LocalPlayer, u20:getAssetId(u19.HARPOON_HANG_IDLE))
        else
            u36.uiMaid:DoCleaning()
            local v52 = u36.animationTrack
            if v52 ~= nil then
                v52:Stop()
            end
            local v53 = u36.animationTrack
            if v53 ~= nil then
                v53:Destroy()
            end
        end
    end)
    u17.ProjectileLaunched:connect(function(p54) --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u23
            [3] = u31
            [4] = u36
            [5] = u6
        --]]
        if p54:isCancelled() then
            return nil
        end
        if p54.projectileType ~= "harpoon_projectile" or not u1.instanceof(p54.shooter, u23) then
            return nil
        end
        local v55 = p54.shooter:getPlayer()
        if v55 ~= nil then
            v55 = v55.Character
        end
        if not v55 then
            return nil
        end
        local v56 = v55:GetPivot().Position
        if not v56 then
            return nil
        end
        local v57 = u31.HARPOON_THROW
        local v58 = u36:getKitSkinData(v55)
        local v59
        if v58 == nil then
            v59 = v58
        else
            v59 = v58.throwSound
        end
        if v59 ~= "" and v59 then
            v57 = v58.throwSound
        end
        u6:playSound(v57, {
            ["position"] = v56
        })
    end)
    u17.ProjectileHit:connect(function(p60) --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u23
            [3] = u31
            [4] = u36
            [5] = u6
        --]]
        if p60:isCancelled() then
            return nil
        end
        if p60.projectileType ~= "harpoon_projectile" or not u1.instanceof(p60.shooter, u23) then
            return nil
        end
        local v61 = p60.shooter:getPlayer()
        if v61 ~= nil then
            v61 = v61.Character
        end
        if not v61 then
            return nil
        end
        local v62 = p60.hitData.hitCFrame.Position
        if not v62 then
            return nil
        end
        local v63 = u31.HARPOON_HIT_PART
        local v64 = u36:getKitSkinData(v61)
        local v65
        if v64 == nil then
            v65 = v64
        else
            v65 = v64.hitPartSound
        end
        if v65 ~= "" and v65 then
            v63 = v64.hitPartSound
        end
        u6:playSound(v63, {
            ["position"] = v62
        })
    end)
    u17.ProjectileHit:connect(function(p66) --[[ Line: 186 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u23
            [3] = u36
            [4] = u16
            [5] = u4
            [6] = u20
            [7] = u19
            [8] = u31
            [9] = u6
        --]]
        if p66:isCancelled() then
            return nil
        end
        if p66.projectileType == "harpoon_projectile" and u1.instanceof(p66.shooter, u23) then
            if u36.visualCooldowns:has(p66.projectileRefId) then
                return nil
            end
            u36.visualCooldowns:add(p66.projectileRefId)
            local u67 = p66.projectileModel:Clone()
            u67.Parent = u16
            u67.PrimaryPart.Anchored = true
            local u68 = p66.shooter:getPlayer()
            task.delay(0.55, function() --[[ Line: 199 ]]
                --[[
                Upvalues:
                    [1] = u67
                    [2] = u36
                    [3] = u68
                --]]
                u67:Destroy()
                u36:showHandItem(u68)
            end)
            if p66.hitEntity then
                local v69 = p66.hitEntity:getInstance()
                local u70 = u4:playAnimation(v69, u20:getAssetId(u19.R15_ANIM_EMOTE_SLEEP))
                local v71 = u31.HARPOON_HIT_ENEMY
                local v72 = u36:getKitSkinData(u68.Character)
                local v73
                if v72 == nil then
                    v73 = v72
                else
                    v73 = v72.hitEnemySound
                end
                if v73 ~= "" and v73 then
                    v71 = v72.hitEnemySound
                end
                local v74 = u6
                local v75 = {}
                local v76 = v69.PrimaryPart
                if v76 ~= nil then
                    v76 = v76.Position
                end
                v75.position = v76
                v74:playSound(v71, v75)
                task.delay(0.4, function() --[[ Line: 226 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u68
                        [3] = u20
                        [4] = u19
                        [5] = u70
                    --]]
                    u4:playAnimation(u68, u20:getAssetId(u19.HARPOON_STTACK))
                    local v77 = u70
                    if v77 ~= nil then
                        v77:Stop()
                    end
                    local v78 = u70
                    if v78 ~= nil then
                        v78:Destroy()
                    end
                end)
            end
        end
    end)
    u15.JumpRequest:Connect(function() --[[ Line: 240 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u13
        --]]
        local v79 = u29.Client:Get("TridentUnanchor"):CallServer() and u13.LocalPlayer.Character
        if v79 then
            v79.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    u29.Client:Get("HarpoonTeleport"):Connect(function(p80) --[[ Line: 249 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u36
            [3] = u6
        --]]
        local v81 = p80.shooter.Character
        local v82 = u31.HARPOON_LEAP
        local v83 = u36:getKitSkinData(v81)
        local v84
        if v83 == nil then
            v84 = v83
        else
            v84 = v83.leapSound
        end
        if v84 ~= "" and v84 then
            v82 = v83.leapSound
        end
        if v81 then
            local v85 = u6
            local v86 = {}
            if v81 ~= nil then
                v81 = v81.PrimaryPart
            end
            v86.parent = v81
            v85:playSound(v82, v86)
        end
    end)
end
function u32.returnHarpoon(u87, u88, p89) --[[ Line: 274 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u24
        [3] = u28
        [4] = u10
        [5] = u16
        [6] = u14
        [7] = u4
        [8] = u20
        [9] = u19
    --]]
    local u90 = u9.new()
    local u91 = p89:Clone()
    if not p89.PrimaryPart then
        return nil
    end
    local u92 = u24:getEntity(u88)
    if not u92 then
        return nil
    end
    u91:PivotTo(p89.PrimaryPart.CFrame)
    for v93, v94 in u91:GetDescendants() do
        local _ = v93 - 1
        if v94:IsA("BodyForce") then
            v94:Destroy()
        end
    end
    local u95 = false
    local u96 = u92:getHandItemInstanceFromCharacter()
    local v97
    if u96 == nil then
        v97 = u96
    else
        v97 = u96.Name
    end
    if v97 ~= u28.HARPOON then
        return nil
    end
    u91.Parent = u96
    local v98 = u10
    local v99 = {
        ["Name"] = "AntiGravity"
    }
    local v100 = u91.PrimaryPart.AssemblyMass * u16.Gravity
    v99.Force = Vector3.new(0, v100, 0)
    v99.Parent = u91.PrimaryPart
    v98("BodyForce", v99)
    u91.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    local u101 = 0
    local u102 = 0
    u90:GiveTask(u14.Heartbeat:Connect(function(p103) --[[ Line: 313 ]]
        --[[
        Upvalues:
            [1] = u92
            [2] = u96
            [3] = u91
            [4] = u90
            [5] = u88
            [6] = u101
            [7] = u95
            [8] = u4
            [9] = u20
            [10] = u19
            [11] = u87
            [12] = u102
        --]]
        if u92:getHandItemInstanceFromCharacter() ~= u96 then
            u91:Destroy()
            u90:DoCleaning()
            return nil
        end
        if not u96 or u96.Parent ~= u88.Character then
            u91:Destroy()
            u90:DoCleaning()
            return nil
        end
        if u101 > 0.75 then
            u91:Destroy()
            u90:DoCleaning()
            return nil
        end
        if u101 > 0.6 and not u95 then
            u95 = true
            u4:playAnimation(u88, u20:getAssetId(u19.HARPOON_RETURN))
            u87:showHandItem(u88)
            u91:Destroy()
            u90:DoCleaning()
            return nil
        end
        u91.PrimaryPart.Anchored = false
        local v104 = u96:FindFirstChild("Handle").Position - u91.PrimaryPart.Position
        local v105 = u102 + v104.Magnitude
        local v106 = p103 / 0.75 * v105
        local v107 = u91.PrimaryPart.Position + v104.Unit * v106
        u102 = u102 + v106
        u91:PivotTo(CFrame.new(v107) * CFrame.Angles(0, u101 * 3.141592653589793, u101 * 6 * 3.141592653589793))
        u101 = u101 + p103
    end))
end
function u32.hideHandItem(_, p108) --[[ Line: 357 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u28
    --]]
    local v109 = u24:getEntity(p108)
    if not v109 then
        return nil
    end
    local v110 = v109:getHandItemInstanceFromCharacter()
    local v111
    if v110 == nil then
        v111 = v110
    else
        v111 = v110.Name
    end
    if v111 ~= u28.HARPOON then
        return nil
    end
    for v112, v113 in v110:GetDescendants() do
        local _ = v112 - 1
        if v113:IsA("Part") or v113:IsA("MeshPart") then
            v113.Transparency = 1
        end
    end
end
function u32.showHandItem(_, p114) --[[ Line: 380 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u28
    --]]
    local v115 = u24:getEntity(p114)
    if not v115 then
        return nil
    end
    local v116 = v115:getHandItemInstanceFromCharacter()
    local v117
    if v116 == nil then
        v117 = v116
    else
        v117 = v116.Name
    end
    if v117 ~= u28.HARPOON then
        return nil
    end
    for v118, v119 in v116:GetDescendants() do
        local _ = v118 - 1
        if v119:IsA("Part") or v119:IsA("MeshPart") then
            v119.Transparency = 0
        end
    end
end
function u32.getKitSkinData(_, p120) --[[ Line: 403 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u25
    --]]
    if not p120 then
        return nil
    end
    local v121 = u25[u8.Controllers.KitSkinController:getKitSkin(p120)]
    if v121.triton then
        return v121.triton
    end
end
u8.CreateController(u32.new())
return nil