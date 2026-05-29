local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.CollectionTagAdded
local u6 = v3.DeviceUtil
local u7 = v3.ExpireList
local u8 = v3.SoundManager
local u9 = v3.WatchCharacterAnimation
local u10 = v3.WatchCollectionTag
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u12 = v11.KnitClient
local u13 = v11.KnitClient
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u18 = v17.CollectionService
local u19 = v17.ContentProvider
local u20 = v17.HttpService
local u21 = v17.Players
local u22 = v17.ReplicatedStorage
local u23 = v17.RunService
local u24 = v17.Workspace
local u25 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u26 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u27 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u28 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta")
local u32 = v31.ArmorEnchantMeta
local u33 = v31.EnchantMeta
local u34 = v31.ToolEnchantMeta
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-util").TeamUpgradeUtil
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u40 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u41 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u42 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u43 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u44 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u45 = v1.import(script, script.Parent, "ui", "enchant-pop-up", "enchant-pop-up").EnchantPopUp
local u46 = v1.import(script, script.Parent, "ui", "enchant-table-ui-util").EnchantTableUIUtil
local u47 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 52 ]]
        return "EnchantTableController"
    end,
    ["__index"] = u26
})
u47.__index = u47
function u47.new(...) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u47
    --]]
    local v48 = u47
    local v49 = setmetatable({}, v48)
    return v49:constructor(...) or v49
end
function u47.constructor(p50) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u7
    --]]
    u26.constructor(p50)
    p50.Name = "EnchantTableController"
    p50.upgradeCooldowns = u7.new(2)
    p50.learnedEnchants = {}
    p50.preloaded = false
end
function u47.KnitStart(u51) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u5
        [3] = u15
        [4] = u37
        [5] = u42
        [6] = u6
        [7] = u25
        [8] = u27
        [9] = u2
        [10] = u38
        [11] = u39
        [12] = u14
        [13] = u30
        [14] = u21
        [15] = u29
        [16] = u40
        [17] = u10
        [18] = u43
        [19] = u13
        [20] = u35
        [21] = u28
        [22] = u4
        [23] = u9
        [24] = u36
        [25] = u22
        [26] = u44
        [27] = u41
        [28] = u8
        [29] = u12
        [30] = u24
        [31] = u20
        [32] = u23
        [33] = u16
        [34] = u33
        [35] = u46
        [36] = u45
        [37] = u32
        [38] = u34
    --]]
    u26.KnitStart(u51)
    u5("broken-enchant-table", function(u52) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u37
            [3] = u42
            [4] = u6
            [5] = u25
            [6] = u27
            [7] = u2
            [8] = u38
            [9] = u39
            [10] = u14
            [11] = u30
            [12] = u21
            [13] = u29
            [14] = u40
        --]]
        local v53 = u15
        local v54 = {
            ["ObjectText"] = "Repair Enchant Table",
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 6,
            ["HoldDuration"] = 3.68,
            ["Parent"] = u52
        }
        local v55 = u37.ENCHANT_TABLE_COST
        v54.ActionText = tostring(v55) .. " Diamonds"
        v54.KeyboardKeyCode = u42.promptKeyboardKey
        v54.ClickablePrompt = u6.isMobileControls()
        local u56 = v53("ProximityPrompt", v54)
        u56.PromptButtonHoldBegan:Connect(function(p57) --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u52
                [3] = u56
                [4] = u27
                [5] = u2
                [6] = u38
                [7] = u39
                [8] = u37
                [9] = u14
                [10] = u30
                [11] = u21
                [12] = u29
            --]]
            if u25.StartEnchantRepair:fire(u52):isCancelled() then
                u56:InputHoldEnd()
                return nil
            end
            local v58 = u52:GetAttribute("Team")
            local v59 = u27:getState().Game.myTeam
            if v59 ~= nil then
                v59 = v59.id
            end
            if v58 ~= v59 then
                u56:InputHoldEnd()
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "You can only repair your team\'s Enchant Table."
                })
                return nil
            end
            if not u38.hasEnough(p57, u39.DIAMOND, u37.ENCHANT_TABLE_COST) then
                u56:InputHoldEnd()
                local v60 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                local v61 = {}
                local v62 = u37.ENCHANT_TABLE_COST
                v61.message = "You need " .. tostring(v62) .. " diamonds to repair the Enchant Table."
                v60:sendErrorNotification(v61)
                return nil
            end
            local u63 = u14.new()
            local u64 = u30:playAnimation(u21.LocalPlayer, u29.REPAIR_ENCHANT_TABLE)
            u63:GiveTask(function() --[[ Line: 109 ]]
                --[[
                Upvalues:
                    [1] = u64
                --]]
                local v65 = u64
                if v65 ~= nil then
                    v65:Stop()
                end
                local v66 = u64
                if v66 ~= nil then
                    v66:Destroy()
                end
            end)
            u56.PromptButtonHoldEnded:Connect(function() --[[ Line: 119 ]]
                --[[
                Upvalues:
                    [1] = u63
                --]]
                u63:DoCleaning()
            end)
        end)
        u56.Triggered:Connect(function(_) --[[ Line: 123 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u52
            --]]
            u40.Client:Get("RepairEnchantTable"):CallServer(u52)
        end)
    end)
    u10("enchant-table", function(u67) --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u51
            [3] = u43
            [4] = u13
            [5] = u6
            [6] = u35
            [7] = u27
            [8] = u21
            [9] = u2
            [10] = u28
            [11] = u4
            [12] = u30
            [13] = u29
        --]]
        local u68 = u67.Name == u39.ENCHANT_TABLE_GLITCHED
        u51:preloadAssets()
        task.spawn(function() --[[ Line: 130 ]]
            --[[
            Upvalues:
                [1] = u67
                [2] = u43
            --]]
            local v69 = u67:FindFirstChild("SpawnEffect")
            if v69 then
                v69:WaitForChild("Main")
                v69:WaitForChild("Outline")
                v69:WaitForChild("Outline1")
                v69:WaitForChild("Specs")
                u43:playEffects(u67.SpawnEffect:GetChildren(), nil)
            end
        end)
        local u70 = u13.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Open",
            ["ObjectText"] = "Enchant Table",
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 6,
            ["Parent"] = u67,
            ["ClickablePrompt"] = u6.isMobileControls()
        })
        if not u35.USE_ENCHANT_TABLE_ANY_TEAM then
            local v71 = u27:getState().Game.myTeam ~= nil
            if v71 then
                local v72 = u27:getState().Game.myTeam
                if v72 ~= nil then
                    v72 = v72.id
                end
                v71 = v72 ~= u67:GetAttribute("Team")
            end
            if v71 then
                u70.Enabled = false
            end
            u27.changed:connect(function(p73, p74) --[[ Line: 160 ]]
                --[[
                Upvalues:
                    [1] = u67
                    [2] = u70
                --]]
                if p73 == p74 then
                    return nil
                elseif p73.Game.myTeam then
                    local v75 = p73.Game.myTeam
                    if v75 ~= nil then
                        v75 = v75.id
                    end
                    if v75 == u67:GetAttribute("Team") then
                        u70.Enabled = true
                    else
                        u70.Enabled = false
                    end
                else
                    return nil
                end
            end)
        end
        u70.Triggered:Connect(function(p76) --[[ Line: 178 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u2
                [3] = u28
                [4] = u67
            --]]
            if p76 ~= u21.LocalPlayer then
                return nil
            end
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u28.ENCHANT_TABLE, {
                ["EnchantTableType"] = u67.Name
            })
        end)
        task.spawn(function() --[[ Line: 187 ]]
            --[[
            Upvalues:
                [1] = u67
                [2] = u68
                [3] = u4
                [4] = u30
                [5] = u29
            --]]
            local v77 = u67:WaitForChild("Rig")
            if v77 ~= nil then
                v77 = v77:WaitForChild("AnimationController"):WaitForChild("Animator")
            end
            if u68 then
                u4:playAnimation(v77, u30:getAssetId(u29.ENCHANT_TABLE_GLITCHED_IDLE), {
                    ["looped"] = true
                })
            else
                u4:playAnimation(v77, u30:getAssetId(u29.ENCHANT_TABLE_LOOP), {
                    ["looped"] = true
                })
            end
        end)
    end)
    u9({ u30:getAssetId(u29.REPAIR_ENCHANT_TABLE) }, function(p78, p79) --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u51
            [2] = u21
            [3] = u36
            [4] = u14
            [5] = u22
            [6] = u44
            [7] = u41
            [8] = u43
            [9] = u8
        --]]
        local u80 = p78.Character
        if not u80 then
            return nil
        end
        if u51.upgradeCooldowns:has(p78.UserId) and p78.UserId ~= u21.LocalPlayer.UserId then
            return nil
        end
        u51.upgradeCooldowns:add(p78.UserId)
        local v81 = u36:getEntity(p78)
        local v82 = u80.PrimaryPart
        if v82 ~= nil then
            v82 = v82.Position
        end
        if not v82 then
            return nil
        end
        local u83 = u51:getClosestBrokenEnchantTable(v82)
        if not u83 then
            return nil
        end
        local u84 = u14.new()
        if v81 ~= nil then
            v81 = v81:getItemInHandClient()
        end
        if v81 then
            for _, u85 in v81:GetDescendants() do
                if u85:IsA("BasePart") then
                    local u86 = u85.Transparency
                    u85.Transparency = 1
                    u84:GiveTask(function() --[[ Line: 238 ]]
                        --[[
                        Upvalues:
                            [1] = u85
                            [2] = u86
                        --]]
                        u85.Transparency = u86
                    end)
                end
            end
        end
        local u87 = u80 == u21.LocalPlayer.Character
        local u88 = u22.Assets.Effects.RepairEnchantTableHammer:Clone()
        u88.Parent = u80
        u44:weldCharacterAccessories(u80)
        local u89 = {
            u41.ENCHANT_TABLE_REPAIR_HAMMER_1,
            u41.ENCHANT_TABLE_REPAIR_HAMMER_2,
            u41.ENCHANT_TABLE_REPAIR_HAMMER_3,
            u41.ENCHANT_TABLE_REPAIR_HAMMER_4
        }
        local u90 = nil
        u90 = p79:GetMarkerReachedSignal("hammer_1"):Connect(function() --[[ Line: 250 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u83
                [3] = u8
                [4] = u89
                [5] = u87
                [6] = u80
                [7] = u90
            --]]
            u43:playEffects(u83.HammerEffect:GetChildren(), nil)
            local v91 = u8
            local v92 = u89[1]
            local v93 = {}
            local v94
            if u87 then
                v94 = nil
            else
                v94 = u80.PrimaryPart
                if v94 ~= nil then
                    v94 = v94.Position
                end
            end
            v93.position = v94
            v91:playSound(v92, v93)
            u90:Disconnect()
        end)
        local u95 = nil
        u95 = p79:GetMarkerReachedSignal("hammer_2"):Connect(function() --[[ Line: 271 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u83
                [3] = u8
                [4] = u89
                [5] = u87
                [6] = u80
                [7] = u95
            --]]
            u43:playEffects(u83.HammerEffect:GetChildren(), nil)
            local v96 = u8
            local v97 = u89[2]
            local v98 = {}
            local v99
            if u87 then
                v99 = nil
            else
                v99 = u80.PrimaryPart
                if v99 ~= nil then
                    v99 = v99.Position
                end
            end
            v98.position = v99
            v96:playSound(v97, v98)
            u95:Disconnect()
        end)
        local u100 = nil
        u100 = p79:GetMarkerReachedSignal("hammer_3"):Connect(function() --[[ Line: 292 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u83
                [3] = u8
                [4] = u89
                [5] = u87
                [6] = u80
                [7] = u100
            --]]
            u43:playEffects(u83.HammerEffect:GetChildren(), nil)
            local v101 = u8
            local v102 = u89[3]
            local v103 = {}
            local v104
            if u87 then
                v104 = nil
            else
                v104 = u80.PrimaryPart
                if v104 ~= nil then
                    v104 = v104.Position
                end
            end
            v103.position = v104
            v101:playSound(v102, v103)
            u100:Disconnect()
        end)
        local u105 = nil
        u105 = p79:GetMarkerReachedSignal("hammer_4"):Connect(function() --[[ Line: 313 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u83
                [3] = u8
                [4] = u89
                [5] = u87
                [6] = u80
                [7] = u105
            --]]
            u43:playEffects(u83.HammerEffect:GetChildren(), nil)
            local v106 = u8
            local v107 = u89[4]
            local v108 = {}
            local v109
            if u87 then
                v109 = nil
            else
                v109 = u80.PrimaryPart
                if v109 ~= nil then
                    v109 = v109.Position
                end
            end
            v108.position = v109
            v106:playSound(v107, v108)
            u105:Disconnect()
        end)
        p79.Stopped:Connect(function() --[[ Line: 333 ]]
            --[[
            Upvalues:
                [1] = u88
                [2] = u84
            --]]
            u88:Destroy()
            u84:DoCleaning()
        end)
        p79.Destroying:Connect(function() --[[ Line: 337 ]]
            --[[
            Upvalues:
                [1] = u88
                [2] = u84
            --]]
            u88:Destroy()
            u84:DoCleaning()
        end)
    end)
    u40.Client:OnEvent("EnchantTableResearch", function(u110) --[[ Line: 343 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u12
            [3] = u51
            [4] = u41
            [5] = u39
            [6] = u4
            [7] = u30
            [8] = u29
            [9] = u8
            [10] = u43
            [11] = u22
            [12] = u24
            [13] = u14
            [14] = u20
            [15] = u23
            [16] = u16
            [17] = u33
            [18] = u46
            [19] = u45
        --]]
        local v111 = u21:GetPlayerFromCharacter(u110.entityInstance)
        if not v111 then
            return nil
        end
        local v112 = u12.Controllers.TeamController:getPlayerTeam(v111)
        local v113 = u12.Controllers.TeamController:getPlayerTeam(u21.LocalPlayer)
        if v111 and (v113 and v112 == v113) then
            u51.learnedEnchants[u110.enchant] = true
        end
        local v114 = u110.entityInstance.PrimaryPart
        if v114 ~= nil then
            v114 = v114.Position
        end
        if u110.enchantTable then
            v114 = u110.enchantTable.Position
        end
        if u110.orbOriginPosition then
            v114 = u110.orbOriginPosition
        end
        if not v114 then
            return nil
        end
        local u115 = {
            ["implosion"] = u41.ENCHANT_TABLE_RESEARCH_IMPLODE,
            ["research"] = u41.ENCHANT_TABLE_RESEARCH_CONSUME
        }
        local v116 = u110.enchantTable
        if v116 ~= nil then
            v116 = v116.Name
        end
        local v117 = v116 == u39.ENCHANT_TABLE_GLITCHED
        if v117 and u110.enchantTable then
            u115.implosion = u41.GLITCH_ETABLE_IMPLOSION
            u115.research = u41.GLITCH_ETABLE_ORB_CONSUME
            task.spawn(function() --[[ Line: 383 ]]
                --[[
                Upvalues:
                    [1] = u110
                    [2] = u4
                    [3] = u30
                    [4] = u29
                --]]
                local v118 = u110.enchantTable
                if v118 ~= nil then
                    v118 = v118:FindFirstChild("Rig")
                    if v118 ~= nil then
                        v118 = v118:WaitForChild("AnimationController"):WaitForChild("Animator")
                    end
                end
                u4:playAnimation(v118, u30:getAssetId(u29.ENCHANT_TABLE_GLITCHED_ACTION), {
                    ["looped"] = false
                })
            end)
        end
        u8:playSound(u115.implosion, {
            ["rollOffMaxDistance"] = 120,
            ["position"] = v114
        })
        if u110.enchantTable then
            u43:playEffects(u110.enchantTable.Implosion:GetChildren(), nil)
        end
        local v119 = u22.Assets.Effects.EnchantResearchOrb
        if v117 then
            v119 = u22.Assets.Effects.EnchantResearchOrbGlitched
        end
        local u120 = v119:Clone()
        u120.Parent = u24
        if u110.enchantTable then
            u120:PivotTo(CFrame.new(u110.enchantTable.OrbAttachment.WorldPosition))
        else
            u120:PivotTo(CFrame.new(v114))
        end
        local u121 = u14.new()
        u121:GiveTask(function() --[[ Line: 416 ]]
            --[[
            Upvalues:
                [1] = u120
            --]]
            u120:Destroy()
        end)
        local u122 = 0
        local u123 = u110.entityInstance:FindFirstChild("UpperTorso")
        if u123 == nil then
            return nil
        end
        local v124 = math.random(-2, 2)
        local v125 = math.random(3, 4)
        local v126 = math.random
        local u127 = Vector3.new(v124, v125, v126(-2, 2))
        local u128 = u20:GenerateGUID(false)
        u23:BindToRenderStep(u128, Enum.RenderPriority.Last.Value, function(p129) --[[ Line: 430 ]]
            --[[
            Upvalues:
                [1] = u123
                [2] = u120
                [3] = u122
                [4] = u127
            --]]
            if u123.Parent == nil then
                return nil
            end
            if u120.PrimaryPart == nil then
                return nil
            end
            u122 = u122 + p129
            local v130 = u122 / 1.2
            local v131 = math.clamp(v130, 0, 1)
            local v132 = u120.PrimaryPart.Position:Lerp(u123.Position, (math.sqrt(v131)))
            local v133 = v131 * 3.141592653589793
            local v134 = math.sin(v133)
            local v135 = v132 + u127 * Vector3.new(v134, v134, v134)
            local v136 = CFrame.Angles(6.283185307179586 * (u122 % 2), 6.283185307179586 * (u122 % 3), 6.283185307179586 * (u122 % 1.5))
            u120:PivotTo(CFrame.new(v135) * v136)
        end)
        u121:GiveTask(function() --[[ Line: 451 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u128
            --]]
            u23:UnbindFromRenderStep(u128)
        end)
        local u137 = u110.entityInstance == u21.LocalPlayer.Character
        task.delay(1.2, function() --[[ Line: 455 ]]
            --[[
            Upvalues:
                [1] = u121
                [2] = u110
                [3] = u8
                [4] = u115
                [5] = u137
            --]]
            u121:DoCleaning()
            if u110.entityInstance.PrimaryPart then
                local v138 = u8
                local v139 = u115.research
                local v140 = {}
                local v141
                if u137 then
                    v141 = nil
                else
                    v141 = u110.entityInstance.PrimaryPart.Position
                end
                v140.position = v141
                v138:playSound(v139, v140)
            end
        end)
        if u110.entityInstance == u21.LocalPlayer.Character then
            task.delay(1.2, function() --[[ Line: 464 ]]
                --[[
                Upvalues:
                    [1] = u51
                    [2] = u16
                    [3] = u33
                    [4] = u110
                    [5] = u46
                    [6] = u45
                    [7] = u21
                --]]
                if u51.enchantPopupTree then
                    u16.unmount(u51.enchantPopupTree)
                end
                local v142 = u33[u110.enchant]
                local v143 = u16
                local v144 = u16
                local v145 = {
                    ["EnchantName"] = v142.name,
                    ["EnchantImage"] = v142.image
                }
                local v146 = u110.enchantTable
                if v146 ~= nil then
                    v146 = v146.Name
                end
                v145.EnchantTableType = v146
                local v147 = u46
                local v148 = u110.enchantTable
                if v148 ~= nil then
                    v148 = v148.Name
                end
                v145.ThemeColor = v147.getThemeColor(v148)
                u51.enchantPopupTree = v143.mount(v144.createElement(u45, v145), u21.LocalPlayer:WaitForChild("PlayerGui"))
            end)
        end
    end)
    u40.Client:OnEvent("ArmorEnchantResearch", function(u149) --[[ Line: 494 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u41
            [3] = u39
            [4] = u4
            [5] = u30
            [6] = u29
            [7] = u8
            [8] = u43
            [9] = u22
            [10] = u24
            [11] = u14
            [12] = u20
            [13] = u23
            [14] = u51
            [15] = u16
            [16] = u32
            [17] = u46
            [18] = u45
        --]]
        if not u21:GetPlayerFromCharacter(u149.entityInstance) then
            return nil
        end
        local v150 = u149.entityInstance.PrimaryPart
        if v150 ~= nil then
            v150 = v150.Position
        end
        if u149.enchantTable then
            v150 = u149.enchantTable.Position
        end
        if u149.orbOriginPosition then
            v150 = u149.orbOriginPosition
        end
        if not v150 then
            return nil
        end
        local u151 = {
            ["implosion"] = u41.ENCHANT_TABLE_RESEARCH_IMPLODE,
            ["research"] = u41.ENCHANT_TABLE_RESEARCH_CONSUME
        }
        local v152 = u149.enchantTable
        if v152 ~= nil then
            v152 = v152.Name
        end
        local v153 = v152 == u39.ENCHANT_TABLE_GLITCHED
        if v153 and u149.enchantTable then
            u151.implosion = u41.GLITCH_ETABLE_IMPLOSION
            u151.research = u41.GLITCH_ETABLE_ORB_CONSUME
            task.spawn(function() --[[ Line: 526 ]]
                --[[
                Upvalues:
                    [1] = u149
                    [2] = u4
                    [3] = u30
                    [4] = u29
                --]]
                local v154 = u149.enchantTable
                if v154 ~= nil then
                    v154 = v154:FindFirstChild("Rig")
                    if v154 ~= nil then
                        v154 = v154:WaitForChild("AnimationController"):WaitForChild("Animator")
                    end
                end
                u4:playAnimation(v154, u30:getAssetId(u29.ENCHANT_TABLE_GLITCHED_ACTION), {
                    ["looped"] = false
                })
            end)
        end
        u8:playSound(u151.implosion, {
            ["rollOffMaxDistance"] = 120,
            ["position"] = v150
        })
        if u149.enchantTable then
            u43:playEffects(u149.enchantTable.Implosion:GetChildren(), nil)
        end
        local v155 = u22.Assets.Effects.ArmorEnchantResearchOrb
        if v153 then
            v155 = u22.Assets.Effects.EnchantResearchOrbGlitched
        end
        local u156 = v155:Clone()
        u156.Parent = u24
        if u149.enchantTable then
            u156:PivotTo(CFrame.new(u149.enchantTable.OrbAttachment.WorldPosition))
        else
            u156:PivotTo(CFrame.new(v150))
        end
        local u157 = u14.new()
        u157:GiveTask(function() --[[ Line: 559 ]]
            --[[
            Upvalues:
                [1] = u156
            --]]
            u156:Destroy()
        end)
        local u158 = 0
        local u159 = u149.entityInstance:FindFirstChild("UpperTorso")
        if u159 == nil then
            return nil
        end
        local v160 = math.random(-2, 2)
        local v161 = math.random(3, 4)
        local v162 = math.random
        local u163 = Vector3.new(v160, v161, v162(-2, 2))
        local u164 = u20:GenerateGUID(false)
        u23:BindToRenderStep(u164, Enum.RenderPriority.Last.Value, function(p165) --[[ Line: 573 ]]
            --[[
            Upvalues:
                [1] = u159
                [2] = u156
                [3] = u158
                [4] = u163
            --]]
            if u159.Parent == nil then
                return nil
            end
            if u156.PrimaryPart == nil then
                return nil
            end
            u158 = u158 + p165
            local v166 = u158 / 1.2
            local v167 = math.clamp(v166, 0, 1)
            local v168 = u156.PrimaryPart.Position:Lerp(u159.Position, (math.sqrt(v167)))
            local v169 = v167 * 3.141592653589793
            local v170 = math.sin(v169)
            local v171 = v168 + u163 * Vector3.new(v170, v170, v170)
            local v172 = CFrame.Angles(6.283185307179586 * (u158 % 2), 6.283185307179586 * (u158 % 3), 6.283185307179586 * (u158 % 1.5))
            u156:PivotTo(CFrame.new(v171) * v172)
        end)
        u157:GiveTask(function() --[[ Line: 594 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u164
            --]]
            u23:UnbindFromRenderStep(u164)
        end)
        local u173 = u149.entityInstance == u21.LocalPlayer.Character
        task.delay(1.2, function() --[[ Line: 598 ]]
            --[[
            Upvalues:
                [1] = u157
                [2] = u149
                [3] = u8
                [4] = u151
                [5] = u173
            --]]
            u157:DoCleaning()
            if u149.entityInstance.PrimaryPart then
                local v174 = u8
                local v175 = u151.research
                local v176 = {}
                local v177
                if u173 then
                    v177 = nil
                else
                    v177 = u149.entityInstance.PrimaryPart.Position
                end
                v176.position = v177
                v174:playSound(v175, v176)
            end
        end)
        if u149.entityInstance == u21.LocalPlayer.Character then
            task.delay(1.2, function() --[[ Line: 607 ]]
                --[[
                Upvalues:
                    [1] = u51
                    [2] = u16
                    [3] = u32
                    [4] = u149
                    [5] = u46
                    [6] = u45
                    [7] = u21
                --]]
                if u51.enchantPopupTree then
                    u16.unmount(u51.enchantPopupTree)
                end
                local v178 = u32[u149.enchant]
                local v179 = u16
                local v180 = u16
                local v181 = {
                    ["EnchantName"] = v178.name,
                    ["EnchantImage"] = v178.image
                }
                local v182 = u149.enchantTable
                if v182 ~= nil then
                    v182 = v182.Name
                end
                v181.EnchantTableType = v182
                local v183 = u46
                local v184 = u149.enchantTable
                if v184 ~= nil then
                    v184 = v184.Name
                end
                v181.ThemeColor = v183.getThemeColor(v184)
                u51.enchantPopupTree = v179.mount(v180.createElement(u45, v181), u21.LocalPlayer:WaitForChild("PlayerGui"))
            end)
        end
    end)
    u40.Client:OnEvent("ToolEnchantResearch", function(u185) --[[ Line: 637 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u41
            [3] = u39
            [4] = u4
            [5] = u30
            [6] = u29
            [7] = u8
            [8] = u43
            [9] = u22
            [10] = u24
            [11] = u14
            [12] = u20
            [13] = u23
            [14] = u51
            [15] = u16
            [16] = u34
            [17] = u46
            [18] = u45
        --]]
        if not u21:GetPlayerFromCharacter(u185.entityInstance) then
            return nil
        end
        local v186 = u185.entityInstance.PrimaryPart
        if v186 ~= nil then
            v186 = v186.Position
        end
        if u185.enchantTable then
            v186 = u185.enchantTable.Position
        end
        if u185.orbOriginPosition then
            v186 = u185.orbOriginPosition
        end
        if not v186 then
            return nil
        end
        local u187 = {
            ["implosion"] = u41.ENCHANT_TABLE_RESEARCH_IMPLODE,
            ["research"] = u41.ENCHANT_TABLE_RESEARCH_CONSUME
        }
        local v188 = u185.enchantTable
        if v188 ~= nil then
            v188 = v188.Name
        end
        local v189 = v188 == u39.ENCHANT_TABLE_GLITCHED
        if v189 and u185.enchantTable then
            u187.implosion = u41.GLITCH_ETABLE_IMPLOSION
            u187.research = u41.GLITCH_ETABLE_ORB_CONSUME
            task.spawn(function() --[[ Line: 669 ]]
                --[[
                Upvalues:
                    [1] = u185
                    [2] = u4
                    [3] = u30
                    [4] = u29
                --]]
                local v190 = u185.enchantTable
                if v190 ~= nil then
                    v190 = v190:FindFirstChild("Rig")
                    if v190 ~= nil then
                        v190 = v190:WaitForChild("AnimationController"):WaitForChild("Animator")
                    end
                end
                u4:playAnimation(v190, u30:getAssetId(u29.ENCHANT_TABLE_GLITCHED_ACTION), {
                    ["looped"] = false
                })
            end)
        end
        u8:playSound(u187.implosion, {
            ["rollOffMaxDistance"] = 120,
            ["position"] = v186
        })
        if u185.enchantTable then
            u43:playEffects(u185.enchantTable.Implosion:GetChildren(), nil)
        end
        local v191 = u22.Assets.Effects.ArmorEnchantResearchOrb
        if v189 then
            v191 = u22.Assets.Effects.EnchantResearchOrbGlitched
        end
        local u192 = v191:Clone()
        u192.Parent = u24
        if u185.enchantTable then
            u192:PivotTo(CFrame.new(u185.enchantTable.OrbAttachment.WorldPosition))
        else
            u192:PivotTo(CFrame.new(v186))
        end
        local u193 = u14.new()
        u193:GiveTask(function() --[[ Line: 702 ]]
            --[[
            Upvalues:
                [1] = u192
            --]]
            u192:Destroy()
        end)
        local u194 = 0
        local u195 = u185.entityInstance:FindFirstChild("UpperTorso")
        if u195 == nil then
            return nil
        end
        local v196 = math.random(-2, 2)
        local v197 = math.random(3, 4)
        local v198 = math.random
        local u199 = Vector3.new(v196, v197, v198(-2, 2))
        local u200 = u20:GenerateGUID(false)
        u23:BindToRenderStep(u200, Enum.RenderPriority.Last.Value, function(p201) --[[ Line: 716 ]]
            --[[
            Upvalues:
                [1] = u195
                [2] = u192
                [3] = u194
                [4] = u199
            --]]
            if u195.Parent == nil then
                return nil
            end
            if u192.PrimaryPart == nil then
                return nil
            end
            u194 = u194 + p201
            local v202 = u194 / 1.2
            local v203 = math.clamp(v202, 0, 1)
            local v204 = u192.PrimaryPart.Position:Lerp(u195.Position, (math.sqrt(v203)))
            local v205 = v203 * 3.141592653589793
            local v206 = math.sin(v205)
            local v207 = v204 + u199 * Vector3.new(v206, v206, v206)
            local v208 = CFrame.Angles(6.283185307179586 * (u194 % 2), 6.283185307179586 * (u194 % 3), 6.283185307179586 * (u194 % 1.5))
            u192:PivotTo(CFrame.new(v207) * v208)
        end)
        u193:GiveTask(function() --[[ Line: 737 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u200
            --]]
            u23:UnbindFromRenderStep(u200)
        end)
        local u209 = u185.entityInstance == u21.LocalPlayer.Character
        task.delay(1.2, function() --[[ Line: 741 ]]
            --[[
            Upvalues:
                [1] = u193
                [2] = u185
                [3] = u8
                [4] = u187
                [5] = u209
            --]]
            u193:DoCleaning()
            if u185.entityInstance.PrimaryPart then
                local v210 = u8
                local v211 = u187.research
                local v212 = {}
                local v213
                if u209 then
                    v213 = nil
                else
                    v213 = u185.entityInstance.PrimaryPart.Position
                end
                v212.position = v213
                v210:playSound(v211, v212)
            end
        end)
        if u185.entityInstance == u21.LocalPlayer.Character then
            task.delay(1.2, function() --[[ Line: 750 ]]
                --[[
                Upvalues:
                    [1] = u51
                    [2] = u16
                    [3] = u34
                    [4] = u185
                    [5] = u46
                    [6] = u45
                    [7] = u21
                --]]
                if u51.enchantPopupTree then
                    u16.unmount(u51.enchantPopupTree)
                end
                local v214 = u34[u185.enchant]
                local v215 = u16
                local v216 = u16
                local v217 = {
                    ["EnchantName"] = v214.name,
                    ["EnchantImage"] = v214.image
                }
                local v218 = u185.enchantTable
                if v218 ~= nil then
                    v218 = v218.Name
                end
                v217.EnchantTableType = v218
                local v219 = u46
                local v220 = u185.enchantTable
                if v220 ~= nil then
                    v220 = v220.Name
                end
                v217.ThemeColor = v219.getThemeColor(v220)
                u51.enchantPopupTree = v215.mount(v216.createElement(u45, v217), u21.LocalPlayer:WaitForChild("PlayerGui"))
            end)
        end
    end)
end
function u47.preloadAssets(p221) --[[ Line: 780 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u15
        [3] = u30
        [4] = u29
    --]]
    if p221.preloaded then
        return nil
    end
    p221.preloaded = true
    task.spawn(function() --[[ Line: 785 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u15
            [3] = u30
            [4] = u29
        --]]
        u19:PreloadAsync({ u15("Animation", {
                ["AnimationId"] = u30:getAssetId(u29.REPAIR_ENCHANT_TABLE)
            }) })
    end)
end
function u47.getClosestBrokenEnchantTable(_, u222) --[[ Line: 791 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v223 = u18:GetTagged("broken-enchant-table")
    table.sort(v223, function(p224, p225) --[[ Line: 793 ]]
        --[[
        Upvalues:
            [1] = u222
        --]]
        return (p224.Position - u222).Magnitude < (p225.Position - u222).Magnitude
    end)
    local v226 = nil
    for v227, v228 in v223 do
        local _ = v227 - 1
        if true == true then
            v226 = v228
            break
        end
    end
    return v226
end
function u47.getClosestEnchantTable(_, u229) --[[ Line: 817 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v230 = u18:GetTagged("enchant-table")
    table.sort(v230, function(p231, p232) --[[ Line: 819 ]]
        --[[
        Upvalues:
            [1] = u229
        --]]
        return (p231.Position - u229).Magnitude < (p232.Position - u229).Magnitude
    end)
    local v233 = nil
    for v234, v235 in v230 do
        local _ = v234 - 1
        if true == true then
            v233 = v235
            break
        end
    end
    return v233
end
function u47.researchEnchant(p236) --[[ Line: 843 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u2
        [3] = u28
        [4] = u40
    --]]
    local v237 = u21.LocalPlayer.Character
    if v237 ~= nil then
        v237 = v237.PrimaryPart
        if v237 ~= nil then
            v237 = v237.Position
        end
    end
    if not v237 then
        return nil
    end
    local v238 = p236:getClosestEnchantTable(v237)
    if not v238 then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u28.ENCHANT_TABLE)
    u40.Client:Get("ResearchEnchant"):CallServer({
        ["enchantTable"] = v238
    })
end
function u47.researchArmorEnchant(p239) --[[ Line: 865 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u2
        [3] = u28
        [4] = u40
    --]]
    local v240 = u21.LocalPlayer.Character
    if v240 ~= nil then
        v240 = v240.PrimaryPart
        if v240 ~= nil then
            v240 = v240.Position
        end
    end
    if not v240 then
        return nil
    end
    local v241 = p239:getClosestEnchantTable(v240)
    if not v241 then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u28.ENCHANT_TABLE)
    u40.Client:Get("ResearchArmorEnchant"):CallServer({
        ["enchantTable"] = v241
    })
end
function u47.researchToolEnchant(p242) --[[ Line: 887 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u2
        [3] = u28
        [4] = u40
    --]]
    local v243 = u21.LocalPlayer.Character
    if v243 ~= nil then
        v243 = v243.PrimaryPart
        if v243 ~= nil then
            v243 = v243.Position
        end
    end
    if not v243 then
        return nil
    end
    local v244 = p242:getClosestEnchantTable(v243)
    if not v244 then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u28.ENCHANT_TABLE)
    u40.Client:Get("ResearchToolEnchant"):CallServer({
        ["enchantTable"] = v244
    })
end
function u47.unmountEnchantPopup(p245) --[[ Line: 909 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    if p245.enchantPopupTree then
        u16.unmount(p245.enchantPopupTree)
        p245.enchantPopupTree = nil
    end
end
u12.CreateController(u47.new())
return nil