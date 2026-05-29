local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u4 = v3.BlockEngine
local u5 = v3.GreedyBlockHandler
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u7 = v6.RandomUtil
local u8 = v6.SoundManager
local u9 = v6.WatchCharacterAnimation
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Lighting
local u16 = v14.Players
local u17 = v14.ReplicatedStorage
local u18 = v14.Workspace
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u20 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u21 = u1.import(script, script.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil
local u22 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
        return "NoxiousSledgehammerController"
    end,
    ["__index"] = u22
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
        [1] = u22
        [2] = u12
    --]]
    u22.constructor(p35)
    p35.Name = "NoxiousSledgehammerController"
    p35.maid = u12.new()
    p35.lastPlayedEffect = {}
end
function u32.KnitStart(u36) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u9
        [3] = u25
        [4] = u24
        [5] = u16
        [6] = u26
        [7] = u28
        [8] = u8
        [9] = u30
        [10] = u12
        [11] = u13
        [12] = u15
        [13] = u19
        [14] = u11
        [15] = u21
        [16] = u10
        [17] = u20
        [18] = u23
        [19] = u29
        [20] = u4
        [21] = u18
        [22] = u17
        [23] = u31
        [24] = u7
        [25] = u27
        [26] = u1
        [27] = u5
    --]]
    u22.KnitStart(u36)
    u9({ u25:getAssetId(u24.SLEDGEHAMMER_SWING) }, function(p37, p38) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u26
            [3] = u28
            [4] = u36
            [5] = u8
            [6] = u30
            [7] = u12
            [8] = u13
            [9] = u15
            [10] = u19
            [11] = u11
            [12] = u21
        --]]
        local u39 = p37.Character
        if not u39 then
            return nil
        end
        local u40 = p37 == u16.LocalPlayer
        local v41 = u26.getInventory(p37).hand
        if v41 ~= nil then
            v41 = v41.tool
        end
        if v41 ~= nil then
            v41 = v41.Name
        end
        if v41 ~= u28.NOXIOUS_SLEDGEHAMMER then
            return nil
        end
        local v42 = os.clock()
        local v43 = u36.lastPlayedEffect[p37.UserId]
        if v42 - (v43 == nil and 0 or v43) < 0.5 then
            return nil
        end
        u36.lastPlayedEffect[p37.UserId] = os.clock()
        if u39.PrimaryPart then
            local v44 = u8
            local v45 = u30.SLEDGEHAMMER_SWING
            local v46 = {}
            local v47
            if u40 then
                v47 = nil
            else
                v47 = u39.PrimaryPart
                if v47 ~= nil then
                    v47 = v47.CFrame.Position
                end
            end
            v46.position = v47
            v46.rollOffMinDistance = 30
            v46.rollOffMaxDistance = 100
            v44:playSound(v45, v46)
        end
        local u48 = u12.new()
        local u49 = 1
        local v50 = false
        while true do
            if v50 then
                u49 = u49 + 1
            else
                v50 = true
            end
            if u49 > 3 then
                return
            end
            u48:GiveTask(p38:GetMarkerReachedSignal("impact_" .. tostring(u49)):Connect(function() --[[ Line: 121 ]]
                --[[
                Upvalues:
                    [1] = u49
                    [2] = u48
                    [3] = u40
                    [4] = u13
                    [5] = u15
                    [6] = u19
                    [7] = u11
                    [8] = u21
                    [9] = u39
                    [10] = u8
                    [11] = u30
                --]]
                if u49 == 3 then
                    u48:DoCleaning()
                end
                if u40 then
                    local u51 = u13("DepthOfFieldEffect", {
                        ["Name"] = "SledgehammerDepthOfField",
                        ["InFocusRadius"] = 20,
                        ["FocusDistance"] = 0,
                        ["FarIntensity"] = 0,
                        ["Parent"] = u15
                    })
                    local u53 = u19(0.14, u11, function(p52) --[[ Line: 135 ]]
                        --[[
                        Upvalues:
                            [1] = u51
                        --]]
                        u51.FarIntensity = (math.sqrt(p52) - p52) / 1.2
                    end)
                    task.spawn(function() --[[ Line: 139 ]]
                        --[[
                        Upvalues:
                            [1] = u53
                            [2] = u51
                        --]]
                        u53:Wait()
                        u51:Destroy()
                    end)
                    u21.shakeScreenDirection(Vector2.new(1, 1), {
                        ["zMagnitude"] = 1,
                        ["duration"] = u49 < 3 and 0.15 or 0.4
                    })
                end
                if u39.PrimaryPart then
                    local v54 = u8
                    local v55 = ({ u30.SLEDGEHAMMER_IMPACT_1, u30.SLEDGEHAMMER_IMPACT_2, u30.SLEDGEHAMMER_IMPACT_3 })[u49 - 1 + 1]
                    local v56 = {}
                    local v57
                    if u40 then
                        v57 = nil
                    else
                        v57 = u39.PrimaryPart
                        if v57 ~= nil then
                            v57 = v57.CFrame.Position
                        end
                    end
                    v56.position = v57
                    v56.rollOffMinDistance = 30
                    v56.rollOffMaxDistance = 150
                    v56.volumeMultiplier = 1.6
                    v54:playSound(v55, v56)
                end
            end))
        end
    end)
    u10.Controllers.PreloadController:preloadForItemType(u28.NOXIOUS_SLEDGEHAMMER, {
        ["animations"] = { u24.SLEDGEHAMMER_SWING, u24.FP_SLEDGEHAMMER_SWING },
        ["sounds"] = {
            u30.SLEDGEHAMMER_IMPACT_1,
            u30.SLEDGEHAMMER_IMPACT_2,
            u30.SLEDGEHAMMER_IMPACT_3,
            u30.SLEDGEHAMMER_SWING
        }
    })
    u20.CanUseLocalAbility:connect(function(p58) --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u36
        --]]
        if p58.ability ~= u23.NOXIOUS_SLEDGEHAMMER_SLAM then
            return nil
        end
        if u36.slammingMaid then
            p58:setCancelled(true)
        end
    end)
    u20.AbilityUsed:connect(function(p59) --[[ Line: 186 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u16
            [3] = u25
            [4] = u24
            [5] = u10
            [6] = u36
            [7] = u12
        --]]
        if p59.ability ~= u23.NOXIOUS_SLEDGEHAMMER_SLAM then
            return nil
        end
        if p59.userCharacter ~= u16.LocalPlayer.Character then
            return nil
        end
        if p59:isCancelled() then
            return nil
        end
        u25:playAnimation(u16.LocalPlayer, u24.SLEDGEHAMMER_SWING)
        u10.Controllers.ViewmodelController:playAnimation(u24.FP_SLEDGEHAMMER_SWING)
        if not u36.slammingMaid then
            u36.slammingMaid = u12.new()
            u36.slammingMaid:GiveTask(u10.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["moveSpeedMultiplier"] = 0
            }))
            u36.slammingMaid:GiveTask(function() --[[ Line: 203 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                u36.slammingMaid = nil
                return u36.slammingMaid
            end)
            task.delay(1, function() --[[ Line: 207 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                local v60 = u36.slammingMaid
                if v60 ~= nil then
                    v60:DoCleaning()
                end
            end)
        end
    end)
    u29.Client:Get("SledgehammerSlam"):Connect(function(p61) --[[ Line: 215 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u18
            [3] = u17
            [4] = u31
            [5] = u8
            [6] = u30
            [7] = u7
            [8] = u27
            [9] = u1
            [10] = u5
        --]]
        local u62 = p61[1]
        local v63 = 0
        local u64 = 0
        for _, v65 in p61[2] do
            local u66 = {}
            for _, v67 in v65.blockPositions do
                local v68 = u4:getStore():getBlockAt(v67)
                if v68 then
                    local v69 = {
                        ["itemType"] = v68.Name
                    }
                    local v70 = v68:GetAttribute("Data")
                    v69.data = v70 == nil and 0 or v70
                    u66[v67] = v69
                end
            end
            if v63 <= 5 or math.random() >= 0.6 then
                v63 = v63 + 1
                task.delay(v65.workspaceTime - u18:GetServerTimeNow(), function() --[[ Line: 244 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                        [2] = u64
                        [3] = u62
                        [4] = u18
                        [5] = u31
                        [6] = u8
                        [7] = u30
                        [8] = u66
                        [9] = u7
                        [10] = u27
                        [11] = u4
                        [12] = u1
                        [13] = u5
                    --]]
                    local v71 = u17.Assets.Effects.NoxiousExplosion:Clone()
                    local v72 = (u64 + 1) * -5
                    v71.Position = u62 * Vector3.new(0, 0, v72)
                    v71.Parent = u18
                    local v73 = u31
                    local v74 = {
                        ["destroyAfterSec"] = 4
                    }
                    local v75 = (u64 + 1) / 3
                    v74.sizeMultiplier = math.pow(v75, 1.8)
                    v73:playEffects({ v71 }, nil, v74)
                    u8:playSound(u30.HALLOWEEN_BOSS_RUNE_EXPLODE, {
                        ["rollOffMaxDistance"] = 120,
                        ["rollOffMinDistance"] = 20,
                        ["position"] = v71.Position,
                        ["volumeMultiplier"] = u64 * 0.1 + 0.1,
                        ["playbackSpeedMultiplier"] = u64 * 0.6 + 0.94
                    })
                    local u76 = 0
                    for u77, u78 in u66 do
                        if u76 < (u64 <= 1 and 3 or 9) then
                            task.spawn(function() --[[ Line: 263 ]]
                                --[[
                                Upvalues:
                                    [1] = u76
                                    [2] = u7
                                    [3] = u27
                                    [4] = u78
                                    [5] = u30
                                    [6] = u8
                                    [7] = u4
                                    [8] = u77
                                --]]
                                task.wait(u76 * 0.01)
                                local v79 = u7
                                local v80 = u27(u78.itemType).block
                                if v80 ~= nil then
                                    v80 = v80.hitSound
                                end
                                local v81 = v80 == nil and function() --[[ Line: 272 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u30
                                    --]]
                                    return { u30.GENERIC_BLOCK_HIT }
                                end or v80
                                u8:playSound(v79.fromList(unpack(v81())), {
                                    ["rollOffMaxDistance"] = 120,
                                    ["rollOffMinDistance"] = 20,
                                    ["volumeMultiplier"] = 0.5,
                                    ["position"] = u4:getWorldPosition(u77)
                                })
                            end)
                        end
                        local v82 = u76 + 1
                        local v83 = u4:getHandlerRegistry():getHandler(u78.itemType)
                        if v83 and u1.instanceof(v83, u5) then
                            local u84 = v83:place(u77, u78.data)
                            u84.CanCollide = false
                            u84.Anchored = false
                            u76 = v82
                            for _, v85 in u84:GetChildren() do
                                if v85:IsA("BasePart") then
                                    v85.CanCollide = false
                                    v85.Anchored = false
                                end
                            end
                            local v86 = (u84.Position - u62.Position).Unit
                            local v87 = v86.X
                            local v88 = v86.Y
                            local v89 = Vector3.new(v87, 0.1, v88)
                            u84.Parent = u18
                            u84.AssemblyLinearVelocity = v89 * 50
                            task.delay(3, function() --[[ Line: 306 ]]
                                --[[
                                Upvalues:
                                    [1] = u84
                                --]]
                                return u84:Destroy()
                            end)
                        else
                            u76 = v82
                        end
                    end
                    u64 = u64 + 1
                end)
            end
        end
    end)
end
function u32.isRelevantItem(_, p90) --[[ Line: 315 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    return p90.itemType == u28.NOXIOUS_SLEDGEHAMMER
end
function u32.onEnable(p91, _, _) --[[ Line: 318 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u23
    --]]
    p91:setupYield(function() --[[ Line: 319 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u23
        --]]
        local u92 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u23.NOXIOUS_SLEDGEHAMMER_SLAM, {
            ["abilityType"] = "ItemPrimary",
            ["clickToTrigger"] = true,
            ["abilityButton"] = {
                ["icon"] = "rbxassetid://6862310392"
            }
        }):expect()
        return function() --[[ Line: 327 ]]
            --[[
            Upvalues:
                [1] = u92
            --]]
            u92.Destroy()
        end
    end)
end
function u32.onDisable(p93) --[[ Line: 332 ]]
    p93.maid:DoCleaning()
end
u10.CreateController(u32.new())
return nil