local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.CollectionTagAdded
local u5 = v3.GameQueryUtil
local u6 = v3.MobileTouchType
local u7 = v3.SoundManager
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Debris
local u14 = v11.Players
local u15 = v11.ReplicatedStorage
local u16 = v11.RunService
local u17 = v11.TweenService
local u18 = v11.Workspace
local u19 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "melody", "melody-kit-balance").MelodyKitBalance
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "GuitarController"
    end,
    ["__index"] = u20
})
u32.__index = u32
function u32.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v33 = u32
    local v34 = setmetatable({}, v33)
    return v34:constructor(...) or v34
end
function u32.constructor(p35) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u9
    --]]
    u20.constructor(p35)
    p35.Name = "GuitarController"
    p35.maid = u9.new()
    p35.playingMaid = u9.new()
    p35.lastClickTime = -1
    p35.playing = false
    p35.lastHealTime = -1
end
function u32.KnitStart(u36) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u30
        [3] = u29
        [4] = u14
        [5] = u24
        [6] = u23
        [7] = u31
        [8] = u8
        [9] = u27
        [10] = u7
        [11] = u10
        [12] = u18
        [13] = u5
        [14] = u15
        [15] = u9
        [16] = u1
        [17] = u16
        [18] = u17
        [19] = u13
        [20] = u19
        [21] = u21
        [22] = u28
        [23] = u4
        [24] = u12
    --]]
    u20.KnitStart(u36)
    u30.Client:WaitFor("GuitarHeal"):andThen(function(p37) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u14
            [3] = u24
            [4] = u23
            [5] = u31
            [6] = u8
            [7] = u27
            [8] = u7
            [9] = u10
            [10] = u18
            [11] = u5
            [12] = u15
            [13] = u9
            [14] = u1
            [15] = u36
            [16] = u16
            [17] = u17
            [18] = u13
        --]]
        p37:Connect(function(p38) --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u14
                [3] = u24
                [4] = u23
                [5] = u31
                [6] = u8
                [7] = u27
                [8] = u7
                [9] = u10
                [10] = u18
                [11] = u5
                [12] = u15
                [13] = u9
                [14] = u1
                [15] = u36
                [16] = u16
                [17] = u17
                [18] = u13
            --]]
            local u39 = p38.targetEntity.PrimaryPart
            if u39 ~= nil then
                u39 = u39:FindFirstChild("RootRigAttachment")
            end
            local u40 = p38.sourceEntity:FindFirstChild(u29.GUITAR)
            if u40 ~= nil then
                u40 = u40:FindFirstChild("Handle")
                if u40 ~= nil then
                    u40 = u40:FindFirstChild("HealBeamAttachment")
                end
            end
            if u39 and u40 then
                local v41 = p38.sourceEntity == u14.LocalPlayer.Character
                if v41 then
                    u24:playAnimation(u14.LocalPlayer, u23.GUITAR_HEAL)
                end
                local v42 = u31.GUITAR_HEAL_1
                local v43 = u27[u8.Controllers.KitSkinController:getKitSkin(p38.sourceEntity)]
                if v43.melody then
                    v42 = v43.melody.guitarHealSound
                end
                local v44 = u7
                local v45 = {}
                local v46
                if v41 then
                    v46 = nil
                else
                    v46 = p38.sourceEntity:GetPrimaryPartCFrame().Position
                end
                v45.position = v46
                v45.volumeMultiplier = v41 and 1 or 1.4
                v44:playSound(v42, v45)
                local u47 = u10("Part", {
                    ["Size"] = Vector3.new(1, 1, 1),
                    ["Transparency"] = 1,
                    ["Anchored"] = true,
                    ["CanCollide"] = false,
                    ["CFrame"] = p38.sourceEntity:GetPrimaryPartCFrame(),
                    ["Parent"] = u18.CurrentCamera
                })
                u5:setQueryIgnored(u47, true)
                local u48 = u15:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("GuitarHeal"):Clone()
                local v49 = v43.melody
                if v49 ~= nil then
                    v49 = v49.particleColor
                end
                if v49 then
                    u48.Color = v43.melody.particleColor
                end
                u48.Parent = u47
                local u50 = u9.new()
                u50:GiveTask(function() --[[ Line: 113 ]]
                    --[[
                    Upvalues:
                        [1] = u48
                        [2] = u1
                        [3] = u36
                        [4] = u47
                    --]]
                    u48.Enabled = false
                    u1.Promise.delay(u36:getVisualPlayingTime()):andThen(function() --[[ Line: 116 ]]
                        --[[
                        Upvalues:
                            [1] = u47
                        --]]
                        u47:Destroy()
                    end)
                end)
                local u51 = tick()
                u50:GiveTask(u16.Heartbeat:Connect(function(_) --[[ Line: 123 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                        [2] = u40
                        [3] = u39
                        [4] = u47
                        [5] = u50
                    --]]
                    local v52 = (tick() - u51) / 0.8
                    local v53 = math.min(1, v52)
                    u47.CFrame = u40.WorldCFrame:Lerp(u39.WorldCFrame, v53)
                    if v53 == 1 then
                        u50:DoCleaning()
                    end
                end))
                local u54 = u10("Beam", {
                    ["TextureSpeed"] = 10,
                    ["Width0"] = 0,
                    ["Width1"] = 0,
                    ["FaceCamera"] = true,
                    ["Attachment0"] = u40,
                    ["Attachment1"] = u39,
                    ["Color"] = u48.Color,
                    ["Parent"] = u18.CurrentCamera
                })
                u17:Create(u54, TweenInfo.new(0.2), {
                    ["Width0"] = 0.35,
                    ["Width1"] = 0.35
                }):Play()
                u1.Promise.defer(function() --[[ Line: 146 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                        [2] = u54
                        [3] = u13
                    --]]
                    task.wait(0.2)
                    u17:Create(u54, TweenInfo.new(0.4), {
                        ["Width0"] = 0,
                        ["Width1"] = 0
                    }):Play()
                    u13:AddItem(u54, 1)
                end)
            end
        end)
    end)
    u19.AbilityUsed:connect(function(p55) --[[ Line: 158 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u21
            [3] = u36
            [4] = u1
            [5] = u28
            [6] = u19
        --]]
        if p55.userCharacter ~= u14.LocalPlayer.Character then
            return nil
        end
        if p55.ability ~= u21.MELODY_HEAL then
            return nil
        end
        if not u36.playing then
            u36:startPlaying()
        end
        local u56 = tick()
        u36.lastClickTime = u56
        local u57 = u1.Promise.delay(u36:getVisualPlayingTime()):andThen(function() --[[ Line: 171 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u56
            --]]
            if u36.lastClickTime == u56 then
                u36:stopPlaying()
            end
        end)
        u36.playingMaid:GiveTask(function() --[[ Line: 177 ]]
            --[[
            Upvalues:
                [1] = u57
            --]]
            u57:cancel()
        end)
        local v58 = u28.HEAL_COOLDOWN
        if u19.ItemCooldownModifierCheck:fire(v58).cooldown < tick() - u36.lastHealTime then
            u36:performHeal()
        end
    end)
    u4("GuitarPlaying", function(u59) --[[ Line: 186 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u14
            [3] = u31
            [4] = u8
            [5] = u27
            [6] = u7
            [7] = u17
            [8] = u1
            [9] = u12
        --]]
        local u60 = u9.new()
        local v61 = u59 == u14.LocalPlayer.Character
        local v62 = u31.GUITAR_LOOP
        local v63 = u27[u8.Controllers.KitSkinController:getKitSkin(u59)]
        if v63.melody then
            v62 = v63.melody.guitarLoopSound
        end
        local v64 = u7
        local v65 = {}
        local v66
        if v61 then
            v66 = nil
        else
            v66 = u59:GetPrimaryPartCFrame().Position
        end
        v65.position = v66
        local v67
        if v61 then
            v67 = nil
        else
            v67 = u59.PrimaryPart
        end
        v65.parent = v67
        v65.volumeMultiplier = v61 and 1 or 1.4
        local u68 = v64:playModifiableSound(v62, v65)
        if u68 then
            u68.TimePosition = tick() % u68.TimeLength
            u68.Looped = true
            u60:GiveTask(function() --[[ Line: 204 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u68
                    [3] = u1
                --]]
                u17:Create(u68, TweenInfo.new(0.4), {
                    ["Volume"] = 0
                }):Play()
                u1.Promise.delay(0.4):andThen(function() --[[ Line: 209 ]]
                    --[[
                    Upvalues:
                        [1] = u68
                    --]]
                    u68:Stop()
                end)
            end)
        end
        u60:GiveTask(u12:GetInstanceRemovedSignal("GuitarPlaying"):Connect(function(p69) --[[ Line: 215 ]]
            --[[
            Upvalues:
                [1] = u59
                [2] = u60
            --]]
            if p69 == u59 then
                u60:DoCleaning()
            end
        end))
    end)
end
function u32.isRelevantItem(_, p70) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    return p70.itemType == u29.GUITAR
end
function u32.onEnable(p71, _) --[[ Line: 225 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u21
        [3] = u6
        [4] = u22
    --]]
    local v72 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v73 = {
        ["action"] = "Attack",
        ["actionId"] = "guitar-click",
        ["boundFunction"] = function(_, _, _) --[[ Name: boundFunction, Line 230 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u21
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u21.MELODY_HEAL)
        end,
        ["mobile"] = {
            ["touchType"] = u6.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 235 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u21
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u21.MELODY_HEAL)
            end
        }
    }
    local v74 = v72:bindAction(v73)
    p71.maid:GiveTask(v74)
    p71.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u21.MELODY_HEAL, u22[u21.MELODY_HEAL].triggerConfig):expect())
end
function u32.onDisable(p75) --[[ Line: 262 ]]
    p75:stopPlaying()
    p75.maid:DoCleaning()
end
function u32.startPlaying(p76) --[[ Line: 266 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u14
        [3] = u23
    --]]
    p76.playing = true
    local u77 = u24:playAnimation(u14.LocalPlayer, u23.GUITAR_PLAY, {
        ["looped"] = true
    })
    if u77 then
        p76.playingMaid:GiveTask(function() --[[ Line: 272 ]]
            --[[
            Upvalues:
                [1] = u77
            --]]
            u77:Stop()
        end)
    end
end
function u32.stopPlaying(p78) --[[ Line: 277 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    p78.playing = false
    p78.playingMaid:DoCleaning()
    task.spawn(function() --[[ Line: 280 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30.Client:Get("StopPlayingGuitar"):SendToServer()
    end)
end
function u32.performHeal(p79) --[[ Line: 284 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u26
        [3] = u28
        [4] = u1
        [5] = u25
        [6] = u30
    --]]
    p79.lastHealTime = tick()
    local v80 = nil
    if u14.LocalPlayer.Character then
        local v81 = u14.LocalPlayer.Character:GetPrimaryPartCFrame().Position
        u26:getAliveEntityInstances()
        local v82 = 0
        local v83 = {}
        for v84, v85 in u26:getAliveEntityInstances() do
            local _ = v84 - 1
            if v85 ~= u14.LocalPlayer.Character == true then
                v82 = v82 + 1
                v83[v82] = v85
            end
        end
        local v86 = 0
        local v87 = {}
        for v88, v89 in v83 do
            local _ = v88 - 1
            local v90 = u26:getEntity(v89)
            if v90 ~= nil then
                v86 = v86 + 1
                v87[v86] = v90
            end
        end
        local v91 = 0
        local v92 = {}
        for v93, v94 in v87 do
            local _ = v93 - 1
            local v95 = v94:getInstance().PrimaryPart
            if v95 then
                v95 = (v94:getInstance():GetPrimaryPartCFrame().Position - v81).Magnitude <= u28.HEAL_TARGET_RANGE
            end
            if v95 == true then
                v91 = v91 + 1
                v92[v91] = v94
            end
        end
        local v96 = 0
        local v97 = {}
        for v98, v99 in v92 do
            local _ = v98 - 1
            local v100 = u1.instanceof(v99, u25)
            if v100 then
                v100 = v99:getPlayer().Team == u14.LocalPlayer.Team
            end
            if v100 == true then
                v96 = v96 + 1
                v97[v96] = v99
            end
        end
        local v101 = 0
        local v102 = {}
        for v103, v104 in v97 do
            local _ = v103 - 1
            if v104:isAlive() == true then
                v101 = v101 + 1
                v102[v101] = v104
            end
        end
        table.sort(v102, function(p105, p106) --[[ Line: 357 ]]
            return p105:getHealth() < p106:getHealth()
        end)
        if #v102 > 0 then
            v80 = v102[1]:getInstance()
        end
    end
    u30.Client:Get("PlayGuitar"):SendToServer({
        ["healTarget"] = v80
    })
end
function u32.getCooldown(_) --[[ Line: 370 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u19
    --]]
    local v107 = u28.HEAL_COOLDOWN
    return u19.ItemCooldownModifierCheck:fire(v107).cooldown
end
function u32.getVisualPlayingTime(p108) --[[ Line: 375 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    return p108:getCooldown() + u28.VISUAL_PLAYING_ADDED_TIME
end
u8.CreateController(u32.new())
return nil