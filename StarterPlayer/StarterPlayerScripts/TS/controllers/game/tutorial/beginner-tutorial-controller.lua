local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.ConfettiGroup
local u6 = v4.ConstraintType
local u7 = v4.IndicatorUIType
local u8 = v4.WatchCollectionTag
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u10 = v9.KnitClient
local u11 = v9.KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.CollectionService
local u17 = v15.Players
local u18 = v15.TweenService
local u19 = v15.Workspace
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tutorial", "tutorial-type").TutorialType
local u30 = v1.import(script, script.Parent, "base-tutorial-controller").BaseTutorialController
local u31 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
        return "BeginnerTutorialController"
    end,
    ["__index"] = u30
})
u31.__index = u31
function u31.new(...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    local v32 = u31
    local v33 = setmetatable({}, v32)
    return v33:constructor(...) or v33
end
function u31.constructor(p34) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u29
    --]]
    u30.constructor(p34, u29.BEGINNER)
    p34.Name = "BeginnerTutorialController"
end
function u31.KnitStart(p35) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    u30.KnitStart(p35)
end
function u31.assignSectionGuides(u36, p37) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u27
        [3] = u17
        [4] = u16
        [5] = u13
        [6] = u10
        [7] = u2
        [8] = u22
        [9] = u21
        [10] = u23
    --]]
    local u38 = u12.new()
    local u39 = u27.getGamePlayer(u17.LocalPlayer):getTeamId()
    if u39 == "" or not u39 then
        warn("Player has no team, cannot start tutorial.")
        return u38
    end
    if p37 == "generator" then
        local v40 = u16:GetTagged(u39 .. "_TeamOreGenerator")
        local function v44(p41) --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u36
                [3] = u38
            --]]
            local v42 = p41.PrimaryPart
            if not v42 then
                warn("TeamOreGenerator model has no primary part")
                return nil
            end
            local u43 = u36:setupArrowBeam((u13("Attachment", {
                ["Position"] = Vector3.new(0, -6, 0),
                ["Parent"] = v42
            })))
            u38:GiveTask(function() --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u43
                --]]
                u43:DoCleaning()
            end)
        end
        for v45, v46 in v40 do
            v44(v46, v45 - 1, v40)
        end
        for v47, v48 in u16:GetTagged("team-ore-gen-drop:" .. u39) do
            local _ = v47 - 1
            u38:GiveTask(u36:createHighlight(v48, {
                ["name"] = "ItemDropHighlight"
            }))
        end
        return u38
    end
    if p37 == "shop" then
        local v49 = u10.Controllers.ShopkeeperController:getShopkeeperModel("item_shop", u39)
        if v49 then
            local u50 = u36:createHighlight(v49, {
                ["name"] = "ItemShopkeeperHighlight"
            })
            local u51 = u36:setupArrowBeam((u13("Attachment", {
                ["Parent"] = v49.PrimaryPart
            })))
            u38:GiveTask(function() --[[ Line: 105 ]]
                --[[
                Upvalues:
                    [1] = u51
                --]]
                u51:DoCleaning()
            end)
            u38:GiveTask(function() --[[ Line: 108 ]]
                --[[
                Upvalues:
                    [1] = u50
                --]]
                u50:Destroy()
            end)
        end
        u38:GiveTask(function() --[[ Line: 112 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u22
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u22.BEDWARS_ITEM_SHOP)
        end)
        return u38
    end
    if p37 == "block" then
        u36:highlightWoolHotbarSlot()
        local u54 = u21.changed:connect(function(p52, p53) --[[ Line: 119 ]]
            --[[
            Upvalues:
                [1] = u36
            --]]
            if p52.Inventory.observedInventory.hotbar ~= p53.Inventory.observedInventory.hotbar then
                u36:highlightWoolHotbarSlot()
            end
        end)
        u38:GiveTask(function() --[[ Line: 124 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u17
            --]]
            u54:disconnect()
            u17.LocalPlayer:SetAttribute("TutorialHighlightedSlot", nil)
        end)
        return u38
    end
    if p37 ~= "bed" then
        if p37 == "team_upgrades" then
            local v55 = u10.Controllers.ShopkeeperController:getShopkeeperModel("upgrade_shop", u39)
            if v55 then
                local u56 = u36:setupArrowBeam((u13("Attachment", {
                    ["Parent"] = v55.PrimaryPart
                })))
                u38:GiveTask(function() --[[ Line: 170 ]]
                    --[[
                    Upvalues:
                        [1] = u56
                    --]]
                    u56:DoCleaning()
                end)
                local u57 = u36:createHighlight(v55, {
                    ["name"] = "UpgradeShopkeeperHighlight"
                })
                u38:GiveTask(function() --[[ Line: 176 ]]
                    --[[
                    Upvalues:
                        [1] = u57
                    --]]
                    u57:Destroy()
                end)
                return u38
            end
        else
            if p37 == "purchase_upgrade" then
                u38:GiveTask(function() --[[ Line: 183 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u22
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u22.TEAM_UPGRADE)
                end)
                return u38
            end
            if p37 == "recall" then
                u17.LocalPlayer:SetAttribute("TutorialHighlightedAbility", u23.RECALL)
                u38:GiveTask(function() --[[ Line: 190 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                    --]]
                    u17.LocalPlayer:SetAttribute("TutorialHighlightedAbility", nil)
                end)
                return u38
            end
            if p37 == "sprint" then
                u17.LocalPlayer:SetAttribute("SprintHighlighted", true)
                u38:GiveTask(function() --[[ Line: 197 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                    --]]
                    u17.LocalPlayer:SetAttribute("SprintHighlighted", nil)
                end)
            end
        end
        return u38
    end
    local v58 = u16:GetTagged("bed:" .. u39)
    local function v64(p59) --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u36
            [3] = u38
            [4] = u39
        --]]
        local u60 = u36:setupArrowBeam((u13("Attachment", {
            ["Position"] = Vector3.new(0, 3, 0),
            ["Parent"] = p59
        })))
        u38:GiveTask(function() --[[ Line: 139 ]]
            --[[
            Upvalues:
                [1] = u60
            --]]
            u60:DoCleaning()
        end)
        local v61 = u36:requestBedLayerPositions(u39)
        if not v61 then
            warn("No positions found for bed")
            return u38
        end
        for _, v62 in v61 do
            local u63 = u36:highlightBlockPosition(v62)
            if not u63 then
                return u38
            end
            u38:GiveTask(function() --[[ Line: 153 ]]
                --[[
                Upvalues:
                    [1] = u63
                --]]
                u63:DoCleaning()
            end)
        end
    end
    for v65, v66 in v58 do
        v64(v66, v65 - 1, v58)
    end
    return u38
end
function u31.assignTaskGuides(u67, p68) --[[ Line: 204 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u8
        [3] = u26
        [4] = u13
        [5] = u11
        [6] = u25
        [7] = u21
        [8] = u17
        [9] = u2
        [10] = u7
        [11] = u24
        [12] = u18
        [13] = u6
        [14] = u16
        [15] = u19
        [16] = u28
    --]]
    local u69 = u12.new()
    if p68 == "place_block" then
        local v70 = u67:getTutorialBlockPosition()
        if not v70 then
            return u69
        end
        local u71 = u67:highlightBlockPosition(v70, true)
        u69:GiveTask(function() --[[ Line: 214 ]]
            --[[
            Upvalues:
                [1] = u71
            --]]
            local v72 = u71
            if v72 ~= nil then
                v72:DoCleaning()
            end
        end)
        return u69
    elseif p68 == "break_block" then
        local v73 = u67:getTutorialBlockPosition()
        if not v73 then
            return u69
        end
        local u74 = u67:highlightBlockPosition(v73, true)
        u69:GiveTask(function() --[[ Line: 228 ]]
            --[[
            Upvalues:
                [1] = u74
            --]]
            local v75 = u74
            if v75 ~= nil then
                v75:DoCleaning()
            end
        end)
        return u69
    elseif p68 == "kill_enemy" then
        u69:GiveTask((u8("Monster", function(p76) --[[ Line: 237 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u13
                [3] = u69
                [4] = u67
            --]]
            if p76:GetAttribute("MonsterType") ~= u26.PLAYER_DUMMY then
                return nil
            end
            u69:GiveTask((u13("Highlight", {
                ["FillTransparency"] = 1,
                ["OutlineTransparency"] = 0,
                ["Parent"] = p76,
                ["OutlineColor"] = Color3.fromRGB(255, 69, 105),
                ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
            })))
            local u77 = u67:setupArrowBeam(p76.UpperTorso.BodyFrontAttachment)
            u69:GiveTask(function() --[[ Line: 250 ]]
                --[[
                Upvalues:
                    [1] = u77
                --]]
                u77:DoCleaning()
            end)
        end)))
        return u69
    elseif p68 == "final_kill" then
        u69:GiveTask((u8("Monster", function(p78) --[[ Line: 258 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u13
                [3] = u69
                [4] = u67
            --]]
            if p78:GetAttribute("MonsterType") ~= u26.PLAYER_DUMMY then
                return nil
            end
            u69:GiveTask((u13("Highlight", {
                ["FillTransparency"] = 1,
                ["OutlineTransparency"] = 0,
                ["Parent"] = p78,
                ["OutlineColor"] = Color3.fromRGB(255, 69, 105),
                ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
            })))
            local u79 = u67:setupArrowBeam(p78.UpperTorso.BodyFrontAttachment)
            u69:GiveTask(function() --[[ Line: 271 ]]
                --[[
                Upvalues:
                    [1] = u79
                --]]
                u79:DoCleaning()
            end)
        end)))
        return u69
    else
        if p68 == "path_to_enemy_bed" then
            local v80 = u11.Controllers.BedwarsController:getTeamBed("2")
            if v80 then
                local u81 = u67:setupArrowBeam((u13("Attachment", {
                    ["Position"] = Vector3.new(0, 1, 0),
                    ["Parent"] = v80
                })))
                u69:GiveTask(function() --[[ Line: 286 ]]
                    --[[
                    Upvalues:
                        [1] = u81
                    --]]
                    u81:DoCleaning()
                end)
                return u69
            end
        else
            if p68 == "equip_axe" then
                u67:highlightSlotWithItem(u25.WOOD_AXE)
                local u84 = u21.changed:connect(function(p82, p83) --[[ Line: 294 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                        [2] = u25
                    --]]
                    if p82.Inventory.observedInventory.hotbar ~= p83.Inventory.observedInventory.hotbar then
                        u67:highlightSlotWithItem(u25.WOOD_AXE)
                    end
                end)
                u69:GiveTask(function() --[[ Line: 299 ]]
                    --[[
                    Upvalues:
                        [1] = u84
                        [2] = u17
                    --]]
                    u84:disconnect()
                    u17.LocalPlayer:SetAttribute("TutorialHighlightedSlot", nil)
                end)
                return u69
            end
            if p68 == "equip_pickaxe" then
                u67:highlightSlotWithItem(u25.WOOD_PICKAXE)
                local u87 = u21.changed:connect(function(p85, p86) --[[ Line: 307 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                        [2] = u25
                    --]]
                    if p85.Inventory.observedInventory.hotbar ~= p86.Inventory.observedInventory.hotbar then
                        u67:highlightSlotWithItem(u25.WOOD_PICKAXE)
                    end
                end)
                u69:GiveTask(function() --[[ Line: 312 ]]
                    --[[
                    Upvalues:
                        [1] = u87
                        [2] = u17
                    --]]
                    u87:disconnect()
                    u17.LocalPlayer:SetAttribute("TutorialHighlightedSlot", nil)
                end)
                return u69
            end
            if p68 == "equip_sword" then
                u67:highlightSlotWithItem(u25.STONE_SWORD)
                local u90 = u21.changed:connect(function(p88, p89) --[[ Line: 320 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                        [2] = u25
                    --]]
                    if p88.Inventory.observedInventory.hotbar ~= p89.Inventory.observedInventory.hotbar then
                        u67:highlightSlotWithItem(u25.STONE_SWORD)
                    end
                end)
                u69:GiveTask(function() --[[ Line: 325 ]]
                    --[[
                    Upvalues:
                        [1] = u90
                        [2] = u17
                    --]]
                    u90:disconnect()
                    u17.LocalPlayer:SetAttribute("TutorialHighlightedSlot", nil)
                end)
                return u69
            end
            if p68 == "break_bed" then
                local v91 = u11.Controllers.BedwarsController:getTeamBed("2")
                local v92
                if v91 == nil then
                    v92 = v91
                else
                    v92 = v91:WaitForChild("Covers", 3)
                end
                if v92 then
                    u69:GiveTask((u13("Highlight", {
                        ["FillTransparency"] = 1,
                        ["OutlineTransparency"] = 0,
                        ["Parent"] = v92,
                        ["OutlineColor"] = Color3.fromRGB(255, 69, 105),
                        ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
                    })))
                end
                if v91 then
                    local v93 = v91:GetPivot().Position
                    local v94 = u2.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController")
                    local v95 = {
                        ["uiType"] = u7.Custom
                    }
                    local v99 = {
                        ["distanceRelativeToPlayer"] = true,
                        ["scaleWithAlpha"] = true,
                        ["scaleOnFade"] = false,
                        ["easeOutOnAppoach"] = false,
                        ["color3"] = Color3.new(255, 255, 255),
                        ["template"] = u13("Frame", {
                            ["Name"] = "Container",
                            ["BackgroundTransparency"] = 1,
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["Children"] = { u13("ImageLabel", {
                                    ["Name"] = "BedIcon",
                                    ["BackgroundTransparency"] = 1,
                                    ["AnchorPoint"] = Vector2.new(0.5, 1),
                                    ["Position"] = UDim2.fromScale(0.5, 0.85),
                                    ["Size"] = UDim2.fromScale(0.7, 0.7),
                                    ["Image"] = u24(u25.WOOD_AXE).image
                                }) }
                        }),
                        ["transparency"] = function(_, _, _) --[[ Name: transparency, Line 372 ]]
                            return 0
                        end,
                        ["onEnterAnimation"] = function(p96) --[[ Name: onEnterAnimation, Line 379 ]]
                            --[[
                            Upvalues:
                                [1] = u18
                            --]]
                            local u97 = p96:FindFirstChild("PingIcon")
                            if u97 ~= nil then
                                u97 = u97:Clone()
                            end
                            if not u97 then
                                return nil
                            end
                            u97.Parent = p96
                            local u98 = u18:Create(u97, TweenInfo.new(0.15), {
                                ["ImageTransparency"] = 1,
                                ["Size"] = UDim2.fromScale(1.5, 1.5)
                            })
                            u98:Play()
                            u98.Completed:Connect(function() --[[ Line: 394 ]]
                                --[[
                                Upvalues:
                                    [1] = u98
                                    [2] = u97
                                --]]
                                u98:Destroy()
                                u97:Destroy()
                            end)
                        end
                    }
                    v95.uiConfig = v99
                    v95.creator = u17.LocalPlayer
                    v95.attachTo = v93
                    v95.constraintType = u6.Constrained
                    local u100 = v94:addIndicator(v95)
                    u69:GiveTask(function() --[[ Line: 404 ]]
                        --[[
                        Upvalues:
                            [1] = u100
                        --]]
                        u100:destroy()
                    end)
                    return u69
                end
            else
                if p68 == "collect_diamonds" then
                    local v101 = u16:GetTagged(u25.DIAMOND .. "_OreGenerator")
                    local function v105(p102) --[[ Line: 412 ]]
                        --[[
                        Upvalues:
                            [1] = u13
                            [2] = u67
                            [3] = u69
                        --]]
                        local v103 = p102.PrimaryPart
                        if not v103 then
                            warn("OreGenerator model has no primary part")
                            return nil
                        end
                        local u104 = u67:setupArrowBeam((u13("Attachment", {
                            ["Position"] = Vector3.new(0, -6, 0),
                            ["Parent"] = v103
                        })))
                        u69:GiveTask(function() --[[ Line: 424 ]]
                            --[[
                            Upvalues:
                                [1] = u104
                            --]]
                            u104:DoCleaning()
                        end)
                    end
                    for v106, v107 in v101 do
                        v105(v107, v106 - 1, v101)
                    end
                    return u69
                end
                if p68 == "collect_emeralds" then
                    local v108 = u16:GetTagged(u25.EMERALD .. "_OreGenerator")
                    local function v112(p109) --[[ Line: 435 ]]
                        --[[
                        Upvalues:
                            [1] = u13
                            [2] = u67
                            [3] = u69
                        --]]
                        local v110 = p109.PrimaryPart
                        if not v110 then
                            warn("OreGenerator model has no primary part")
                            return nil
                        end
                        local u111 = u67:setupArrowBeam((u13("Attachment", {
                            ["Position"] = Vector3.new(0, -6, 0),
                            ["Parent"] = v110
                        })))
                        u69:GiveTask(function() --[[ Line: 447 ]]
                            --[[
                            Upvalues:
                                [1] = u111
                            --]]
                            u111:DoCleaning()
                        end)
                    end
                    for v113, v114 in v108 do
                        v112(v114, v113 - 1, v108)
                    end
                    return u69
                end
                if p68 == "path_to_diamond_emerald_gen" then
                    local v115 = u13("Part", {
                        ["Name"] = "DiamondEmeraldGenMidpoint",
                        ["Size"] = Vector3.new(1, 1, 1),
                        ["Anchored"] = true,
                        ["CanCollide"] = false,
                        ["Transparency"] = 1,
                        ["CFrame"] = CFrame.new(u67:getGlobalOreGeneratorMidpoint()),
                        ["Parent"] = u19
                    })
                    local u116 = u67:setupArrowBeam((u13("Attachment", {
                        ["Position"] = Vector3.new(0, 1, 0),
                        ["Parent"] = v115
                    })))
                    u69:GiveTask(function() --[[ Line: 471 ]]
                        --[[
                        Upvalues:
                            [1] = u116
                        --]]
                        u116:DoCleaning()
                    end)
                    u69:GiveTask(v115)
                    return u69
                end
                if p68 == "purchase_upgrade" then
                    local u117 = u67:highlightTeamUpgradeButton()
                    u69:GiveTask(function() --[[ Line: 479 ]]
                        --[[
                        Upvalues:
                            [1] = u117
                        --]]
                        local v118 = u117
                        if v118 ~= nil then
                            v118:DoCleaning()
                        end
                    end)
                    return u69
                end
                if p68 == "sprint" then
                    if u17.LocalPlayer:GetAttribute("Sprinting") then
                        u28.Client:Get("SprintStart"):SendToServer()
                    else
                        u28.Client:Get("SprintStop"):SendToServer()
                    end
                    u69:GiveTask(u17.LocalPlayer:GetAttributeChangedSignal("Sprinting"):Connect(function() --[[ Line: 496 ]]
                        --[[
                        Upvalues:
                            [1] = u17
                            [2] = u28
                        --]]
                        if u17.LocalPlayer:GetAttribute("Sprinting") then
                            u28.Client:Get("SprintStart"):SendToServer()
                        else
                            u28.Client:Get("SprintStop"):SendToServer()
                        end
                    end))
                end
            end
        end
        return u69
    end
end
function u31.onTaskStart(_, _) --[[ Line: 503 ]] end
function u31.onTaskEnd(_, _) --[[ Line: 505 ]] end
function u31.onSectionStart(_, p119) --[[ Line: 507 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p119 == "sprint" then
        u10.Controllers.SprintController:stopSprinting(true, false)
    end
end
function u31.onSectionEnd(_, _) --[[ Line: 515 ]] end
function u31.onTutorialStart(_) --[[ Line: 517 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u28
    --]]
    u20.TeamUpgradeOpened:connect(function(_) --[[ Line: 518 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28.Client:Get("TutorialTeamUpgradeOpened"):SendToServer({})
    end)
end
function u31.onTutorialEnd(_) --[[ Line: 522 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u5
        [3] = u10
    --]]
    u14.mount(u14.createElement(u5, {
        ["Lifetime"] = 20
    }))
    u10.Controllers.SpectateUIController:setLobbyButtonsVisiblity(false)
end
function u31.highlightWoolHotbarSlot(_) --[[ Line: 528 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u24
        [3] = u17
    --]]
    local v120 = u21:getState().Inventory.observedInventory.hotbar
    local v121 = nil
    for v122, v123 in v120 do
        local _ = v122 - 1
        local v124 = v123.item
        local v125
        if v124 then
            v125 = u24(v124.itemType).block ~= nil
        else
            v125 = nil
        end
        if v125 == true then
            v121 = v123
            break
        end
    end
    if not v121 then
        warn("No wool slot found")
        return nil
    end
    local v126 = (table.find(v120, v121) or 0) - 1
    u17.LocalPlayer:SetAttribute("TutorialHighlightedSlot", v126)
end
function u31.requestBedLayerPositions(_, p127) --[[ Line: 556 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    return u28.Client:Get("RequestBedLayerPositions"):CallServer(p127)
end
function u31.getGlobalOreGeneratorMidpoint(_) --[[ Line: 559 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u25
    --]]
    local v128 = Vector3.new(0, 0, 0)
    local v129 = v128
    local v130 = Vector3.new(0, 0, 0)
    for v131, v132 in u16:GetTagged(u25.EMERALD .. "_OreGenerator") do
        local _ = v131 - 1
        local v133 = v132.PrimaryPart
        if v133 then
            v128 = v133.Position
            v129 = v128
        end
    end
    for v134, v135 in u16:GetTagged(u25.DIAMOND .. "_OreGenerator") do
        local _ = v134 - 1
        local v136 = v135.PrimaryPart
        if v136 then
            local v137 = v136.Position
            v130 = v137
        end
    end
    return (v129 + v130) / 2 - Vector3.new(0, 9, 0)
end
function u31.getTutorialBlockPosition(_) --[[ Line: 591 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u3
    --]]
    local v138 = u11.Controllers.BedwarsController:getTeamBed("1")
    if v138 then
        return u3:getBlockPosition(v138.Position) - Vector3.new(0, 0, 2)
    else
        return nil
    end
end
u10.CreateController(u31.new())
return nil