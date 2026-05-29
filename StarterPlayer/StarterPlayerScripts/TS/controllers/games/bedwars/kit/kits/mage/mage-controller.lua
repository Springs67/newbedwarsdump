local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.SoundManager
local u6 = v3.WatchCharacter
local u7 = v3.WatchCollectionTag
local u8 = v3.WatchPlayerCharacter
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.CollectionService
local u15 = v13.Players
local u16 = v13.ReplicatedStorage
local u17 = v13.RunService
local u18 = v13.TweenService
local u19 = v13.Workspace
local u20 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v21 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u22 = v21.InteractionCategory
local u23 = v21.InteractionPriority
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").ManaAttr
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "mage", "mage-kit-util")
local u30 = v29.MAGE_ELEMENT_CYCLE_INDEX
local u31 = v29.MageKitUtil
local u32 = v29.MAGE_SPELL_MANA_COST
local u33 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u34 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u35 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local u36 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u37 = u1.import(script, script.Parent, "ui", "mage-mana-bar").MageManaBar
local u38 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
        return "MageController"
    end,
    ["__index"] = u36
})
u38.__index = u38
function u38.new(...) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v39 = u38
    local v40 = setmetatable({}, v39)
    return v40:constructor(...) or v40
end
function u38.constructor(p41) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u28
        [3] = u16
    --]]
    u36.constructor(p41, u28.MAGE, {
        ["instances"] = { u16.Assets.Effects.TomeGuidingBeam }
    })
    p41.Name = "MageController"
end
function u38.onKitReplicationActivated(_, p42) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u28
        [4] = u1
        [5] = u30
        [6] = u27
        [7] = u31
        [8] = u20
        [9] = u10
        [10] = u35
        [11] = u15
        [12] = u26
        [13] = u32
    --]]
    p42:GiveTask(u6(function(u43, u44) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u28
            [3] = u1
            [4] = u30
            [5] = u27
            [6] = u31
        --]]
        if u9.Controllers.KitController:isUsingKit(u43, u28.MAGE) then
            u1.Promise.defer(function() --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u43
                    [2] = u30
                    [3] = u27
                    [4] = u31
                    [5] = u44
                --]]
                local v45 = u43:GetAttribute(u30)
                local v46 = v45 == nil and 0 or v45
                local v47 = u27.MAGE_ELEMENT_CYCLE[v46 + 1]
                local v48 = not u31.hasUnlockedMageElement(u43, v47) and "BASE" or v47
                u31.changeMageKitAppearance(u43, u44, v48)
            end)
        end
    end))
    p42:GiveTask(u6(function(u49, u50) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u28
            [3] = u30
            [4] = u27
            [5] = u31
        --]]
        if u9.Controllers.KitController:isUsingKit(u49, u28.MAGE) then
            u49:GetAttributeChangedSignal(u30):Connect(function() --[[ Line: 77 ]]
                --[[
                Upvalues:
                    [1] = u49
                    [2] = u30
                    [3] = u27
                    [4] = u31
                    [5] = u50
                --]]
                local v51 = u49:GetAttribute(u30)
                local v52 = u27.MAGE_ELEMENT_CYCLE[v51 + 1]
                local v53 = not u31.hasUnlockedMageElement(u49, v52) and "BASE" or v52
                u31.changeMageKitAppearance(u49, u50, v53)
            end)
        end
    end))
    p42:GiveTask(u20.StartLaunchProjectile:setPriority(u10.HIGH):connect(function(p54) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u15
            [3] = u26
            [4] = u32
        --]]
        local v55 = (p54.projectileType == "mage_spell_base" or (p54.projectileType == "mage_spell_nature" or p54.projectileType == "mage_spell_fire")) and true or p54.projectileType == "mage_spell_ice"
        if v55 then
            local v56 = u35(u15.LocalPlayer, u26)
            v55 = (v56 == nil and 0 or v56) < u32
        end
        if v55 then
            p54:setCancelled(true)
        end
    end))
end
function u38.onKitReplicationDeactivated(_) --[[ Line: 99 ]] end
function u38.onKitLocalActivated(u57, p58) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u15
        [3] = u30
        [4] = u27
        [5] = u31
        [6] = u14
        [7] = u33
        [8] = u16
        [9] = u19
        [10] = u5
        [11] = u34
        [12] = u7
        [13] = u11
        [14] = u17
        [15] = u2
        [16] = u12
        [17] = u37
    --]]
    u57:registerTomeInteraction()
    p58:GiveTask(u8(u15.LocalPlayer, function(p59) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u30
            [3] = u27
            [4] = u31
        --]]
        local v60 = u15.LocalPlayer:GetAttribute(u30)
        local v61 = v60 == nil and 0 or v60
        local v62 = u27.MAGE_ELEMENT_CYCLE[v61 + 1]
        local v63 = not u31.hasUnlockedMageElement(u15.LocalPlayer, v62) and "BASE" or v62
        u31.changeMageKitAppearance(u15.LocalPlayer, p59, v63)
    end))
    p58:GiveTask(u8(u15.LocalPlayer, function(p64) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u57
        --]]
        for _, v65 in u14:GetTagged("ElementTome") do
            u57:enableTomeGuidingBeam(v65, p64)
        end
    end))
    u33.Client:OnEvent("SpawnElementTome", function(p66) --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u19
            [3] = u5
            [4] = u34
            [5] = u14
        --]]
        local v67 = u16.Assets.Misc.ElementTome:Clone()
        v67.Parent = u19
        v67:SetAttribute("TomeSecret", p66.secret)
        v67:PivotTo(CFrame.new(p66.position))
        u5:playSound(u34.AERY_BUTTERFLY_SPAWN, {
            ["position"] = nil
        })
        u14:AddTag(v67, "ElementTome")
    end)
    p58:GiveTask(u15.LocalPlayer:GetAttributeChangedSignal(u30):Connect(function() --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u30
            [3] = u27
            [4] = u31
        --]]
        local v68 = u15.LocalPlayer:GetAttribute(u30)
        local v69 = u27.MAGE_ELEMENT_CYCLE[v68 + 1]
        if not u15.LocalPlayer.Character then
            return nil
        end
        local v70 = not u31.hasUnlockedMageElement(u15.LocalPlayer, v69) and "BASE" or v69
        u31.changeMageKitAppearance(u15.LocalPlayer, u15.LocalPlayer.Character, v70)
    end))
    p58:GiveTask(u7("ElementTome", function(u71) --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u15
            [3] = u57
            [4] = u17
        --]]
        local u72 = u11.new()
        local v73 = u15.LocalPlayer.Character
        if not v73 then
            return nil
        end
        u57:enableTomeGuidingBeam(u71, v73)
        local u74 = u71:GetPivot().Position
        local u75 = 0
        u72:GiveTask(u17.Heartbeat:Connect(function(p76) --[[ Line: 148 ]]
            --[[
            Upvalues:
                [1] = u71
                [2] = u72
                [3] = u75
                [4] = u74
            --]]
            if u71.Parent == nil then
                u72:DoCleaning()
                return nil
            end
            if u71.PrimaryPart == nil then
                u72:DoCleaning()
                return nil
            end
            u75 = u75 + p76
            local v77 = u75
            local v78 = math.sin(v77)
            local v79 = Vector3.new(0, v78, 0)
            u71:PivotTo((CFrame.new(u74 + v79)))
        end))
        u72:GiveTask(u71.AncestryChanged:Connect(function(_, p80) --[[ Line: 165 ]]
            --[[
            Upvalues:
                [1] = u72
            --]]
            if p80 == nil then
                u72:DoCleaning()
            end
        end))
    end))
    p58:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u12.createFragment({
        ["MageManaBar"] = u12.createElement(u37)
    })))
end
function u38.onKitLocalDeactivated(_) --[[ Line: 175 ]] end
function u38.playLearnTomeEffect(_, u81, u82, u83) --[[ Line: 177 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u31
    --]]
    task.spawn(function() --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u81
            [2] = u82
            [3] = u18
            [4] = u31
            [5] = u83
        --]]
        if u81.Parent ~= nil then
            if not u81.Character then
                return nil
            end
            local u84 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
            task.spawn(function() --[[ Line: 184 ]]
                --[[
                Upvalues:
                    [1] = u82
                    [2] = u18
                    [3] = u84
                    [4] = u31
                    [5] = u83
                --]]
                local v85 = u82:WaitForChild("Tome"):WaitForChild("TomeText")
                local v86 = v85:FindFirstChild("Highlight")
                u18:Create(v85, u84, {
                    ["Color"] = u31.MageElementMeta[u83].color
                }):Play()
                u18:Create(v86, u84, {
                    ["OutlineColor"] = u31.MageElementMeta[u83].color
                }):Play()
            end)
        end
    end)
end
function u38.fadeOutTome(_, u87) --[[ Line: 197 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    task.spawn(function() --[[ Line: 198 ]]
        --[[
        Upvalues:
            [1] = u87
            [2] = u18
        --]]
        local u88 = TweenInfo.new(0.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
        for _, u89 in u87:GetDescendants() do
            task.spawn(function() --[[ Line: 201 ]]
                --[[
                Upvalues:
                    [1] = u89
                    [2] = u18
                    [3] = u88
                --]]
                if u89:IsA("BasePart") then
                    u18:Create(u89, u88, {
                        ["Transparency"] = 1
                    }):Play()
                end
            end)
        end
        task.wait(1)
        u87:Destroy()
    end)
end
function u38.enableTomeGuidingBeam(_, u90, u91) --[[ Line: 213 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u14
    --]]
    task.spawn(function() --[[ Line: 214 ]]
        --[[
        Upvalues:
            [1] = u91
            [2] = u90
            [3] = u16
            [4] = u14
        --]]
        local v92 = u91:WaitForChild("UpperTorso"):WaitForChild("BodyFrontAttachment")
        local v93 = u90:WaitForChild("Tome"):WaitForChild("CenterAttachment")
        for _, v94 in u16.Assets.Effects.TomeGuidingBeam:Clone():GetChildren() do
            if v94:IsA("Beam") then
                v94.Attachment0 = v92
                v94.Attachment1 = v93
                v94.Parent = v93
                u14:AddTag(v94, "TomeGuidingBeam")
            end
        end
    end)
end
function u38.destroyTomeGuidingBeam(_) --[[ Line: 228 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    for v95, v96 in u14:GetTagged("TomeGuidingBeam") do
        local _ = v95 - 1
        v96:Destroy()
    end
end
function u38.registerTomeInteraction(u97) --[[ Line: 237 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u23
        [4] = u22
        [5] = u25
        [6] = u24
        [7] = u33
        [8] = u31
        [9] = u5
        [10] = u27
    --]]
    u9.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Learn New Element",
        ["interactionObjectText"] = "Tome of the Elements",
        ["interactionTag"] = "ElementTome",
        ["holdDuration"] = 0.3,
        ["maxActivationDistance"] = 10,
        ["clickablePrompt"] = u4.isMobileControls(),
        ["priority"] = u23.ABILITY,
        ["category"] = u22.ABILITY,
        ["onInteracted"] = function(u98, u99, p100) --[[ Name: onInteracted, Line 247 ]]
            --[[
            Upvalues:
                [1] = u97
                [2] = u25
                [3] = u24
                [4] = u9
                [5] = u33
                [6] = u31
                [7] = u5
                [8] = u27
            --]]
            u97:destroyTomeGuidingBeam()
            u25:playAnimation(u98, u24.PUNCH)
            u9.Controllers.ViewmodelController:playAnimation(u24.FP_USE_ITEM)
            local v101 = {
                ["secret"] = u99:GetAttribute("TomeSecret")
            }
            local u102 = u33.Client:Get("LearnElementTome"):CallServer(v101)
            if u102.success and u102.element then
                p100:Destroy()
                u97:playLearnTomeEffect(u98, u99, u102.element)
                local v103 = u31.MageElementMeta[u102.element].learnSound
                if v103 ~= "" and v103 then
                    u5:playSound(v103)
                end
                task.delay(u27.LEARN_TOME_DURATION, function() --[[ Line: 265 ]]
                    --[[
                    Upvalues:
                        [1] = u97
                        [2] = u99
                        [3] = u98
                        [4] = u102
                        [5] = u31
                    --]]
                    u97:fadeOutTome(u99)
                    if u98.Parent and (u98.Character and u102.element) then
                        u31.changeMageKitAppearance(u98, u98.Character, u102.element)
                    end
                end)
            end
        end
    })
end
function u38.onInnateAbilityEnabled(_, _, _) --[[ Line: 277 ]] end
function u38.onAbilityUsed(_, _, _) --[[ Line: 279 ]] end
u9.CreateController(u38.new())
return nil