local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.AbilityState
local u6 = v4.GameQueryUtil
local u7 = v4.RandomUtil
local u8 = v4.SoundManager
local u9 = v4.TimedProgressBar
local u10 = v4.WatchCollectionTag
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.CollectionService
local u17 = v15.Players
local u18 = v15.ReplicatedStorage
local u19 = v15.Workspace
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u28 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u30 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "ScarabKitController"
    end,
    ["__index"] = u28
})
u30.__index = u30
function u30.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    local v31 = u30
    local v32 = setmetatable({}, v31)
    return v32:constructor(...) or v32
end
function u30.constructor(p33) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u23
        [3] = u12
        [4] = u19
    --]]
    u28.constructor(p33, u23.SCARAB)
    p33.Name = "ScarabKitController"
    p33.spellAbilityMaid = u12.new()
    p33.maid = u12.new()
    p33.enabled = false
    p33.camera = u19.CurrentCamera
    p33.targetPosition = nil
    p33.buttonMaid = u12.new()
end
function u30.KnitStart(p34) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    u28.KnitStart(p34)
end
function u30.onKitLocalActivated(u35, p36) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u22
        [3] = u29
        [4] = u20
        [5] = u24
        [6] = u5
    --]]
    local v37 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v38 = u22.PLACE_SCARAB_HIVE
    local v39 = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = u29.SCARAB_SPAWNER_1
        },
        ["getExtraData"] = function() --[[ Name: getExtraData, Line 64 ]] end
    }
    v37:enableAbility(v38, v39):andThen(function(p40) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35.abilityRef = p40
    end)
    u35.enabledAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u22.PLACE_SCARAB_HIVE)
    p36:GiveTask(u20.NewHandItem:connect(function(p41) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        if u35.enabled then
            p41:setCancelled(true)
        end
    end))
    p36:GiveTask(u20.ItemAdded:connect(function(p42) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u35
            [3] = u5
            [4] = u2
        --]]
        if p42.item.Name == u24.SCARAB_SPAWNER and (u35.enabledAbility and u35.enabledAbility.abilityState == u5.DISABLED) then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u35.enabledAbility, u5.READY)
        end
    end))
    p36:GiveTask(u20.ItemRemoved:connect(function(p43) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u35
            [3] = u2
            [4] = u5
        --]]
        if p43.itemType == u24.SCARAB_SPAWNER and u35.enabledAbility then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u35.enabledAbility, u5.DISABLED)
        end
    end))
end
function u30.onKitLocalDeactivated(_) --[[ Line: 91 ]] end
function u30.onKitReplicationActivated(_, p44) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u17
        [3] = u18
        [4] = u14
        [5] = u9
        [6] = u13
        [7] = u19
        [8] = u8
        [9] = u26
        [10] = u25
        [11] = u16
        [12] = u7
        [13] = u6
    --]]
    p44:GiveTask(u10("scarab_spawner", function(u45) --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u18
            [3] = u14
            [4] = u9
        --]]
        task.spawn(function() --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u45
                [2] = u17
                [3] = u18
                [4] = u14
                [5] = u9
            --]]
            local v46 = u45:GetAttribute("PlacedByUserId")
            local v47 = ColorSequence.new(Color3.fromRGB(43, 255, 0), Color3.fromRGB(43, 255, 0))
            if v46 ~= 0 and (v46 == v46 and v46) then
                local v48 = u17:GetPlayerByUserId(v46)
                if v48 and v48.Team == u17.LocalPlayer.Team then
                    v47 = ColorSequence.new(Color3.fromRGB(43, 255, 0), Color3.fromRGB(43, 255, 0))
                else
                    v47 = ColorSequence.new(Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 0, 0))
                end
            end
            local v49 = u18.Assets.Effects.ScarabSpawnerOne
            local v50 = 0
            while u45:GetAttribute("ScarabHiveLevel") == nil and v50 < 5 do
                task.wait(0.2)
                v50 = v50 + 1
            end
            local v51 = u45:GetAttribute("ScarabHiveLevel")
            if v51 == 2 then
                v49 = u18.Assets.Effects.ScarabSpawnerTwo
            end
            if v51 == 3 then
                v49 = u18.Assets.Effects.ScarabSpawnerThree
            end
            local v52 = v49:Clone()
            v52:PivotTo(CFrame.new(u45.Position) + Vector3.new(-0.35, 0, 0))
            v52.Parent = u45
            local v53 = u45:GetAttribute("ExpireTime")
            if v53 ~= 0 and (v53 == v53 and v53) then
                local v54 = u14.mount
                local v55 = u14.createElement
                local v56 = {
                    ["StudsOffsetWorldSpace"] = Vector3.new(0, 2, 0),
                    ["MaxDistance"] = 110,
                    ["ExtentsOffset"] = Vector3.new(0, 0, 0),
                    ["Size"] = UDim2.fromScale(4.5, 1)
                }
                local v57 = {}
                local v58 = u14.createElement
                local v59 = u9
                local v60 = {
                    ["Size"] = UDim2.fromScale(0.5, 0.2),
                    ["EndTime"] = v53,
                    ["ProgressBarConfig"] = {
                        ["GradientRotation"] = 0,
                        ["Flip"] = true,
                        ["BarGradient"] = v47
                    }
                }
                __set_list(v57, 1, {v58(v59, v60)})
                v54(v55("BillboardGui", v56, v57), u45)
            end
        end)
    end))
    p44:GiveTask(u10("explosive-spider", function(u61) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u19
            [3] = u8
            [4] = u26
        --]]
        task.spawn(function() --[[ Line: 147 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u61
                [3] = u19
                [4] = u8
                [5] = u26
            --]]
            local u62 = u13("Highlight", {
                ["Enabled"] = false,
                ["FillTransparency"] = 0.5,
                ["OutlineTransparency"] = 0,
                ["DepthMode"] = Enum.HighlightDepthMode.Occluded,
                ["FillColor"] = Color3.fromRGB(255, 59, 59),
                ["OutlineColor"] = Color3.fromRGB(255, 59, 59),
                ["Parent"] = u61
            })
            local u63 = u19:GetServerTimeNow() + 5
            task.delay(0.5, function() --[[ Line: 158 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u26
                    [3] = u61
                    [4] = u19
                    [5] = u63
                    [6] = u62
                --]]
                u8:playSound(u26.TNT_HISS_1, {
                    ["position"] = u61.PrimaryPart.Position
                })
                local v64 = 0
                while u61 and u19:GetServerTimeNow() < u63 do
                    if v64 % 2 == 0 then
                        u62.Enabled = true
                        u8:playSound(u26.COUNTDOWN_TICK, {
                            ["position"] = u61:GetPivot().Position
                        })
                    else
                        u62.Enabled = false
                    end
                    local v65 = task.wait
                    local v66 = 0.3 - v64 * 0.01
                    v65((math.max(v66, 0.1)))
                    v64 = v64 + 1
                end
            end)
        end)
    end))
    p44:GiveTask(u10("Scarab", function(p67) --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u26
            [3] = u13
        --]]
        u8:playSound(u26.SCARAB_SPAWN, {
            ["position"] = p67:GetPivot().Position
        })
        local v68 = p67:GetAttribute("ScarabLevel")
        if v68 == nil then
            v68 = false
        end
        if v68 ~= 0 and (v68 == v68 and v68) then
            u13("Sound", {
                ["RollOffMinDistance"] = 20,
                ["RollOffMaxDistance"] = 40,
                ["Volume"] = 1,
                ["Playing"] = true,
                ["Looped"] = true,
                ["SoundId"] = "rbxassetid://" .. tostring(7910583431),
                ["Parent"] = p67.PrimaryPart
            })
        end
    end))
    p44:GiveTask(u10("FlyingScarab", function(p69) --[[ Line: 198 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u26
        --]]
        local v70 = p69:WaitForChild("HumanoidRootPart", 3)
        u13("Sound", {
            ["RollOffMinDistance"] = 20,
            ["RollOffMaxDistance"] = 40,
            ["Volume"] = 1,
            ["Playing"] = true,
            ["Looped"] = true,
            ["SoundId"] = u26.SCARAB_FLY,
            ["Parent"] = v70
        })
    end))
    u25.Client:Get("EntityDeathEvent"):Connect(function(p71) --[[ Line: 210 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u7
            [3] = u26
            [4] = u8
        --]]
        if u16:HasTag(p71.entityInstance, "Scarab") then
            u8:playSound(u7.fromList(u26.SCARAB_DEATH_1, u26.SCARAB_DEATH_2, u26.SCARAB_DEATH_3), {
                ["position"] = p71.cframe.Position
            })
        end
    end)
    p44:GiveTask(u10("no-query-block", function(p72) --[[ Line: 218 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        u6:setQueryIgnored(p72, true)
    end))
end
function u30.onKitReplicationDeactivated(_) --[[ Line: 222 ]] end
function u30.onInnateAbilityEnabled(_, _, _) --[[ Line: 224 ]] end
function u30.onAbilityUsed(p73, _, p74) --[[ Line: 226 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u27
        [3] = u23
        [4] = u22
        [5] = u25
    --]]
    local v75 = u17:GetPlayerFromCharacter(p74.userCharacter)
    if not v75 or v75 ~= u17.LocalPlayer then
        return nil
    end
    if not u27(v75, u23.SCARAB) then
        return nil
    end
    if p74.ability == u22.PLACE_SCARAB_HIVE then
        local v76 = p73:selectBlockPosition()
        if not v76 then
            return nil
        end
        u25.Client:Get("ScarabHiveRequest"):SendToServer({
            ["blockPosition"] = v76
        })
    end
end
function u30.disableBlockPlacement(p77) --[[ Line: 244 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    if p77.blockPlacer then
        u21:dispatch({
            ["type"] = "UnequipItemInHand",
            ["equip"] = true
        })
        p77.blockPlacer:disable()
        p77.blockPlacer = nil
        p77.enabled = false
        p77:cleanUpIndicator()
    end
end
function u30.cleanUpIndicator(p78) --[[ Line: 256 ]]
    p78:disableBlockPlacement()
    p78.maid:DoCleaning()
end
function u30.selectBlockPosition(p79) --[[ Line: 260 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u3
        [3] = u11
    --]]
    local v80 = u17.LocalPlayer.Character
    if v80 ~= nil then
        v80 = v80.PrimaryPart
        if v80 ~= nil then
            v80 = v80.Position
        end
    end
    if not v80 then
        return nil
    end
    local v81 = u3:getBlockPosition(v80)
    local v82 = false
    local v83 = 0
    while true do
        if v82 then
            v83 = v83 + 1
        else
            v82 = true
        end
        if v83 >= 5 then
            break
        end
        if not p79:checkPlacement(v81) then
            v81 = v81 - Vector3.new(0, 1, 0)
        end
    end
    if not p79:checkPlacement(v81) then
        return nil
    end
    local v84 = false
    local v85 = 0
    while true do
        if v84 then
            v85 = v85 + 1
        else
            v84 = true
        end
        if v85 >= 2 then
            return
        end
        local v86 = false
        local v87 = 0
        while true do
            if true then
                if v86 then
                    v87 = v87 + 1
                else
                    v86 = true
                end
            end
            if v87 >= 2 then
                break
            end
            local v88 = v81 + Vector3.new(v85, 0, v87)
            local v89 = u3:getStore():getBlockAt(v88)
            if not (u11.Controllers.MapController:isInDenyRegion(v88) or (u11.Controllers.MapController:isOutOfBounds(v88) or v89)) then
                return v88
            end
        end
    end
end
function u30.checkPlacement(_, p90) --[[ Line: 337 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return (u3:getStore():getBlockAt(p90 - Vector3.new(0, 1, 0)) or u3:getStore():getBlockAt(p90 + Vector3.new(0, 1, 0)) or (u3:getStore():getBlockAt(p90 - Vector3.new(1, 0, 0)) or u3:getStore():getBlockAt(p90 - Vector3.new(-1, 0, 0)) or (u3:getStore():getBlockAt(p90 - Vector3.new(0, 0, 1)) or u3:getStore():getBlockAt(p90 - Vector3.new(0, 0, -1))))) and true or false
end
u11.CreateController(u30.new())
return nil