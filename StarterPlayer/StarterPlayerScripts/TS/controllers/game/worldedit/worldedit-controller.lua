local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u6 = v5.ColorUtil
local u7 = v5.DeviceUtil
local u8 = v5.Empty
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u10 = v9.KnitClient
local u11 = v9.KnitClient
local u12 = v9.Signal
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.ContextActionService
local u18 = v16.Players
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u29 = v1.import(script, script.Parent, "region-highlight").RegionHighlight
local u30 = v1.import(script, script.Parent, "worldedit-position-hud").WorldToolPositionHUD
local u31 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
        return "WorldeditController"
    end,
    ["__index"] = u21
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
        [1] = u21
        [2] = u14
        [3] = u27
        [4] = u12
    --]]
    u21.constructor(p34)
    p34.Name = "WorldeditController"
    p34.maid = u14.new()
    p34.gamemodeRemotes = u27.Client:GetNamespace("Gamemode")
    p34.regionHighlight = nil
    p34.pos1Highlight = nil
    p34.pos2Highlight = nil
    p34.region = {
        ["pos1"] = nil,
        ["pos2"] = nil
    }
    p34.regionChangeSignal = u12.new()
    p34.positionTree = nil
    p34.mobilePositionSelection = 1
end
function u31.KnitStart(u35) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.KnitStart(u35)
    u35.regionChangeSignal:Connect(function(p36) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35:onRegionChange(p36)
    end)
    u35.gamemodeRemotes:Get("RegionUpdate"):Connect(function(p37) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        local v38 = p37.region
        u35.region = {
            ["pos1"] = v38.pos1,
            ["pos2"] = v38.pos2
        }
        u35.regionChangeSignal:Fire({
            ["pos1"] = v38.pos1,
            ["pos2"] = v38.pos2
        })
    end)
end
function u31.isRelevantItem(_, p39) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    return p39.itemType == u26.WORLD_EDIT_WAND
end
function u31.onEnable(u40, _) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u7
        [3] = u17
        [4] = u20
        [5] = u4
        [6] = u3
        [7] = u2
        [8] = u22
        [9] = u19
        [10] = u18
        [11] = u15
        [12] = u24
        [13] = u13
        [14] = u26
        [15] = u25
        [16] = u28
        [17] = u8
        [18] = u6
        [19] = u10
    --]]
    if not u11.Controllers.GamemodeController:isLocalPlayerInCreativeMode() then
        return nil
    end
    local v41 = u40.regionHighlight
    if v41 ~= nil then
        v41:enable()
    end
    local v42 = u40.pos1Highlight
    if v42 ~= nil then
        v42:enable()
    end
    local v43 = u40.pos2Highlight
    if v43 ~= nil then
        v43:enable()
    end
    u40:displaySetPositions(u40.region.pos1, u40.region.pos2)
    if u7.isMobileControls() or u7.isGamepadControls() then
        u17:BindAction("worldedit-wand-mobile-select", function(_, p44, _) --[[ Line: 102 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u4
                [3] = u3
                [4] = u40
            --]]
            if p44 == Enum.UserInputState.Begin then
                local v45 = u20:getBlockSelector():getMouseInfo(u4.SELECT)
                local v46
                if v45 == nil then
                    v46 = v45
                else
                    v46 = v45.target
                end
                if v46 then
                    local v47 = v45.target
                    if not u3:getStore():getBlockAt(v47.blockRef.blockPosition) then
                        return nil
                    end
                    if u40.mobilePositionSelection == 1 then
                        u40.gamemodeRemotes:Get("SetPosition1"):CallServer(v47.blockRef.blockPosition)
                        u40.mobilePositionSelection = 2
                    elseif u40.mobilePositionSelection == 2 then
                        u40.gamemodeRemotes:Get("SetPosition2"):CallServer(v47.blockRef.blockPosition)
                        u40.mobilePositionSelection = 1
                    end
                    u40.region.pos1 = u3:getWorldPosition(v47.blockRef.blockPosition)
                    u40.regionChangeSignal:Fire(u40.region)
                end
            end
            return Enum.ContextActionResult.Pass
        end, false, Enum.UserInputType.Touch)
        u40.maid:GiveTask(function() --[[ Line: 128 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            u17:UnbindAction("worldedit-wand-mobile-select")
        end)
    else
        u17:BindAction("worldedit-wand-left-click", function(_, p48, _) --[[ Line: 133 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u4
                [3] = u3
                [4] = u40
            --]]
            if p48 == Enum.UserInputState.Begin then
                local v49 = u20:getBlockSelector():getMouseInfo(u4.SELECT)
                local v50
                if v49 == nil then
                    v50 = v49
                else
                    v50 = v49.target
                end
                if v50 then
                    local v51 = v49.target
                    if not u3:getStore():getBlockAt(v51.blockRef.blockPosition) then
                        return nil
                    end
                    u40.gamemodeRemotes:Get("SetPosition1"):CallServer(v51.blockRef.blockPosition)
                    u40.region.pos1 = u3:getWorldPosition(v51.blockRef.blockPosition)
                    u40.regionChangeSignal:Fire(u40.region)
                end
            end
            return Enum.ContextActionResult.Pass
        end, false, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2)
        u17:BindAction("worldedit-wand-right-click", function(_, p52, _) --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u4
                [3] = u3
                [4] = u40
            --]]
            if p52 == Enum.UserInputState.Begin then
                local v53 = u20:getBlockSelector():getMouseInfo(u4.SELECT)
                local v54
                if v53 == nil then
                    v54 = v53
                else
                    v54 = v53.target
                end
                if v54 then
                    local v55 = v53.target
                    if not u3:getStore():getBlockAt(v55.blockRef.blockPosition) then
                        return nil
                    end
                    u40.gamemodeRemotes:Get("SetPosition2"):CallServer(v55.blockRef.blockPosition)
                    u40.region.pos2 = u3:getWorldPosition(v55.blockRef.blockPosition)
                    u40.regionChangeSignal:Fire(u40.region)
                end
            end
            return Enum.ContextActionResult.Pass
        end, false, Enum.UserInputType.MouseButton2)
        u40.maid:GiveTask(function() --[[ Line: 174 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            u17:UnbindAction("worldedit-wand-right-click")
            u17:UnbindAction("worldedit-wand-left-click")
        end)
    end
    u40:setupYield(function() --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u22
        --]]
        local u56 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u22.WORLD_EDIT_RADIAL_WHEEL, {
            ["abilityType"] = "ItemSecondary",
            ["abilityButton"] = {
                ["icon"] = "rbxassetid://12518331579"
            }
        }):expect()
        return function() --[[ Line: 186 ]]
            --[[
            Upvalues:
                [1] = u56
            --]]
            u56.Destroy()
        end
    end)
    u40.maid:GiveTask(u19.AbilityUsed:connect(function(p57) --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u18
            [3] = u15
            [4] = u24
            [5] = u13
            [6] = u26
            [7] = u25
            [8] = u11
            [9] = u40
            [10] = u28
            [11] = u8
            [12] = u6
            [13] = u7
            [14] = u10
        --]]
        if p57.ability ~= u22.WORLD_EDIT_RADIAL_WHEEL then
            return nil
        end
        if p57:isCancelled() then
            return nil
        end
        if p57.userCharacter ~= u18.LocalPlayer.Character then
            return nil
        end
        local v58 = {}
        local v66 = {
            ["title"] = "Set",
            ["description"] = "Sets region to a selected block.",
            ["element"] = u15.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = u24.WORLD_EDIT_SET,
                ["Size"] = UDim2.fromScale(1, 1)
            }),
            ["onSelect"] = function() --[[ Name: onSelect, Line 209 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u26
                    [3] = u25
                    [4] = u11
                    [5] = u40
                --]]
                local v59 = 0
                local v60 = {}
                for v61, v62 in u13.values(u26) do
                    local _ = v61 - 1
                    if u25(v62).block ~= nil == true then
                        v59 = v59 + 1
                        v60[v59] = v62
                    end
                end
                u11.Controllers.AutoCompleteDropdownController:openAutoCompleteDropdownMenu(v60, function(p63) --[[ Line: 225 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                    --]]
                    local v64 = u25(p63)
                    return {
                        ["actionDescription"] = "select",
                        ["displayName"] = v64.displayName,
                        ["aliases"] = { v64.displayName },
                        ["image"] = v64.image
                    }
                end, function(p65) --[[ Line: 233 ]]
                    --[[
                    Upvalues:
                        [1] = u40
                    --]]
                    if p65 == "" or not p65 then
                        return nil
                    end
                    u40.gamemodeRemotes:Get("SetOperation"):SendToServer(p65)
                end)
                u11.Controllers.RadialWheelController:closeRadialWheel()
            end
        }
        local v85 = {
            ["title"] = "Replace",
            ["description"] = "Replaces selected blocks in a region with a different block.",
            ["element"] = u15.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = u24.WORLD_EDIT_REPLACE,
                ["Size"] = UDim2.fromScale(1, 1)
            }),
            ["onSelect"] = function() --[[ Name: onSelect, Line 250 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u26
                    [3] = u25
                    [4] = u11
                    [5] = u40
                    [6] = u15
                    [7] = u28
                    [8] = u8
                    [9] = u6
                --]]
                local v67 = 0
                local u68 = {}
                for v69, v70 in u13.values(u26) do
                    local _ = v69 - 1
                    if u25(v70).block ~= nil == true then
                        v67 = v67 + 1
                        u68[v67] = v70
                    end
                end
                local u71 = nil
                local u72 = nil
                u11.Controllers.AutoCompleteDropdownController:openAutoCompleteDropdownMenu(u68, function(p73) --[[ Line: 268 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                    --]]
                    local v74 = u25(p73)
                    return {
                        ["actionDescription"] = "select",
                        ["displayName"] = v74.displayName,
                        ["aliases"] = { v74.displayName },
                        ["image"] = v74.image
                    }
                end, function(p75) --[[ Line: 276 ]]
                    --[[
                    Upvalues:
                        [1] = u71
                        [2] = u11
                        [3] = u68
                        [4] = u25
                        [5] = u72
                        [6] = u40
                        [7] = u15
                        [8] = u28
                        [9] = u8
                        [10] = u6
                    --]]
                    u71 = p75
                    if not u71 then
                        return nil
                    end
                    local v76 = u11.Controllers.AutoCompleteDropdownController
                    local v77 = u68
                    local function v80(p78) --[[ Line: 282 ]]
                        --[[
                        Upvalues:
                            [1] = u25
                        --]]
                        local v79 = u25(p78)
                        return {
                            ["actionDescription"] = "select",
                            ["displayName"] = v79.displayName,
                            ["aliases"] = { v79.displayName },
                            ["image"] = v79.image
                        }
                    end
                    local function v82(p81) --[[ Line: 290 ]]
                        --[[
                        Upvalues:
                            [1] = u72
                            [2] = u40
                            [3] = u71
                        --]]
                        u72 = p81
                        if not u72 then
                            return nil
                        end
                        u40.gamemodeRemotes:Get("ReplaceOperation"):SendToServer(u71, u72)
                    end
                    local v83 = u15.createFragment
                    local v84 = {
                        ["ReplaceHUD"] = u15.createElement("Frame", {
                            ["BackgroundTransparency"] = 0.5,
                            ["BorderSizePixel"] = 0,
                            ["Size"] = UDim2.new(0.3363119415109667, 0, 0, 20),
                            ["Position"] = UDim2.new(0.5, 0, 0.25, -20),
                            ["AnchorPoint"] = Vector2.new(0.5, 0),
                            ["BackgroundColor3"] = u28.backgroundPrimary
                        }, { u15.createElement(u8, {
                                ["Size"] = UDim2.fromScale(1, 1)
                            }, { u15.createElement("UIListLayout", {
                                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
                                }), u15.createElement("TextLabel", {
                                    ["Text"] = " Replacing",
                                    ["TextScaled"] = true,
                                    ["BackgroundTransparency"] = 1,
                                    ["TextColor3"] = u6.WHITE,
                                    ["Font"] = Enum.Font.Roboto,
                                    ["Size"] = UDim2.new(0, 80, 1, 0),
                                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                                    ["TextYAlignment"] = Enum.TextYAlignment.Bottom
                                }), u15.createElement("ImageLabel", {
                                    ["BackgroundTransparency"] = 1,
                                    ["Image"] = u25(u71).image,
                                    ["Size"] = UDim2.fromScale(0.74, 1)
                                }, { u15.createElement("UIAspectRatioConstraint", {
                                        ["AspectRatio"] = 1
                                    }) }) }) })
                    }
                    v76:openAutoCompleteDropdownMenu(v77, v80, v82, v83(v84))
                end)
                u11.Controllers.RadialWheelController:closeRadialWheel()
            end
        }
        local v86 = {
            ["title"] = "Copy",
            ["description"] = "Copies the selected region.",
            ["element"] = u15.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = u24.WORLD_EDIT_COPY,
                ["Size"] = UDim2.fromScale(1, 1)
            }),
            ["onSelect"] = function() --[[ Name: onSelect, Line 347 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u11
                --]]
                u40.gamemodeRemotes:Get("CopyOperation"):SendToServer()
                u11.Controllers.RadialWheelController:closeRadialWheel()
            end
        }
        local v87 = {
            ["title"] = "Paste",
            ["description"] = "Pastes the selected region.",
            ["element"] = u15.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = u24.WORLD_EDIT_PASTE,
                ["Size"] = UDim2.fromScale(1, 1)
            }),
            ["onSelect"] = function() --[[ Name: onSelect, Line 360 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u11
                --]]
                u40.gamemodeRemotes:Get("PasteOperation"):SendToServer()
                u11.Controllers.RadialWheelController:closeRadialWheel()
            end
        }
        local v88 = {
            ["title"] = "Rotate",
            ["description"] = "Rotates the selected region.",
            ["element"] = u15.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = u24.WORLD_EDIT_ROTATE,
                ["Size"] = UDim2.fromScale(1, 1)
            }),
            ["onSelect"] = function() --[[ Name: onSelect, Line 373 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u11
                --]]
                u40.gamemodeRemotes:Get("RotateOperation"):SendToServer(0, nil, nil)
                u11.Controllers.RadialWheelController:closeRadialWheel()
            end
        }
        local v89 = {
            ["title"] = "Undo",
            ["description"] = "Reverts the last action.",
            ["element"] = u15.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = u24.WORLD_EDIT_UNDO,
                ["Size"] = UDim2.fromScale(1, 1)
            }),
            ["onSelect"] = function() --[[ Name: onSelect, Line 390 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u11
                --]]
                u40.gamemodeRemotes:Get("UndoOperation"):SendToServer()
                u11.Controllers.RadialWheelController:closeRadialWheel()
            end
        }
        local v90 = {
            ["title"] = "Redo",
            ["description"] = "Restores the last reverted action.",
            ["element"] = u15.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = u24.WORLD_EDIT_REDO,
                ["Size"] = UDim2.fromScale(1, 1)
            }),
            ["onSelect"] = function() --[[ Name: onSelect, Line 403 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u11
                --]]
                u40.gamemodeRemotes:Get("RedoOperation"):SendToServer()
                u11.Controllers.RadialWheelController:closeRadialWheel()
            end
        }
        local v91 = {
            ["title"] = "Delete",
            ["description"] = "Deletes all blocks in the selected region.",
            ["element"] = u15.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = u24.WORLD_EDIT_DELETE,
                ["Size"] = UDim2.fromScale(1, 1)
            }),
            ["onSelect"] = function() --[[ Name: onSelect, Line 416 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u11
                --]]
                u40.gamemodeRemotes:Get("DeleteOperation"):SendToServer()
                u11.Controllers.RadialWheelController:closeRadialWheel()
            end
        }
        table.insert(v58, v85)
        table.insert(v58, v89)
        table.insert(v58, v90)
        table.insert(v58, v91)
        table.insert(v58, v88)
        table.insert(v58, v87)
        table.insert(v58, v86)
        table.insert(v58, v66)
        local v92 = p57.inputObject
        local v93 = u7.isMobileControls() or u7.isGamepadControls()
        if not v93 then
            local v94
            if v92 == nil then
                v94 = v92
            else
                v94 = v92.UserInputType
            end
            v93 = v94 == Enum.UserInputType.MouseButton1
        end
        local v95
        if v93 then
            v95 = nil
        else
            v95 = v92
        end
        local v96
        if v92 == nil then
            v96 = v92
        else
            v96 = v92.UserInputType
        end
        local _ = v96 == Enum.UserInputType.MouseButton1
        local v97 = u10.Controllers.RadialWheelController
        local v98
        if v95 then
            local v99 = UDim2
            local v100
            if v92 == nil then
                v100 = v92
            else
                v100 = v92.Position.X
            end
            if v92 ~= nil then
                v92 = v92.Position.Y
            end
            v98 = v99.fromOffset(v100, v92)
        else
            v98 = UDim2.fromScale(0.5, 0.5)
        end
        local v101 = 8
        local v102 = true
        local v103
        if v95 then
            v103 = nil
        else
            v103 = UDim2.fromScale(0.6, 0.6)
        end
        v97:openRadialWheel(v58, v101, v95, v102, v98, v103)
    end))
    u40.maid:GiveTask(function() --[[ Line: 465 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:UnbindAction("worldedit-wand-left-click")
        u17:UnbindAction("worldedit-wand-right-click")
    end)
end
function u31.onDisable(p104) --[[ Line: 470 ]]
    p104.maid:DoCleaning()
    local v105 = p104.regionHighlight
    if v105 ~= nil then
        v105:disable()
    end
    local v106 = p104.pos1Highlight
    if v106 ~= nil then
        v106:disable()
    end
    local v107 = p104.pos2Highlight
    if v107 ~= nil then
        v107:disable()
    end
end
function u31.displaySetPositions(u108, p109, p110) --[[ Line: 485 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u30
        [3] = u18
    --]]
    local v111
    if p109 and p110 then
        local v112 = p109.X - p110.X
        local v113 = math.abs(v112)
        local v114 = p109.Y - p110.Y
        local v115 = math.abs(v114)
        local v116 = p109.Z - p110.Z
        local v117 = math.abs(v116)
        v111 = Vector3.new(v113, v115, v117)
    else
        v111 = nil
    end
    if u108.positionTree then
        u15.update(u108.positionTree, u15.createElement(u30, {
            ["Label"] = "World Edit Positions",
            ["Pos1Color"] = Color3.fromRGB(254, 185, 76),
            ["Pos2Color"] = Color3.fromRGB(72, 219, 66),
            ["SizeColor"] = Color3.fromRGB(255, 46, 242),
            ["Pos1"] = p109,
            ["Pos2"] = p110,
            ["Size"] = v111
        }))
    else
        u108.positionTree = u15.mount(u15.createElement(u30, {
            ["Label"] = "World Edit Positions",
            ["Pos1Color"] = Color3.fromRGB(254, 185, 76),
            ["Pos2Color"] = Color3.fromRGB(72, 219, 66),
            ["SizeColor"] = Color3.fromRGB(255, 46, 242),
            ["Pos1"] = p109,
            ["Pos2"] = p110,
            ["Size"] = v111
        }), u18.LocalPlayer:WaitForChild("PlayerGui"))
        u108.maid:GiveTask(function() --[[ Line: 510 ]]
            --[[
            Upvalues:
                [1] = u108
                [2] = u15
            --]]
            if u108.positionTree then
                u15.unmount(u108.positionTree)
                u108.positionTree = nil
            end
        end)
    end
end
function u31.onRegionChange(p118, p119) --[[ Line: 518 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u23
    --]]
    local v120 = p119.pos1
    local v121 = p119.pos2
    p118:displaySetPositions(v120, v121)
    if v120 then
        if p118.pos1Highlight then
            p118.pos1Highlight:updateRegion(v120, v120)
        else
            local v122 = u29.new
            local v123 = {
                ["selectionBox"] = {
                    ["Transparency"] = 0,
                    ["LineThickness"] = 0.06,
                    ["Color3"] = Color3.fromRGB(255, 204, 89),
                    ["SurfaceColor3"] = Color3.fromRGB(196, 143, 59)
                },
                ["extraSizeIncrement"] = u23 + 0.01
            }
            p118.pos1Highlight = v122(v120, v120, v123)
        end
    end
    if v121 then
        if p118.pos2Highlight then
            p118.pos2Highlight:updateRegion(v121, v121)
        else
            local v124 = u29.new
            local v125 = {
                ["selectionBox"] = {
                    ["Transparency"] = 0,
                    ["LineThickness"] = 0.06,
                    ["Color3"] = Color3.fromRGB(115, 255, 115),
                    ["SurfaceColor3"] = Color3.fromRGB(64, 196, 59)
                },
                ["extraSizeIncrement"] = u23 + 0.01
            }
            p118.pos2Highlight = v124(v121, v121, v125)
        end
    end
    if v120 and v121 then
        if p118.regionHighlight then
            p118.regionHighlight:updateRegion(v120, v121)
            return
        end
        local v126 = {
            ["extraSizeIncrement"] = u23
        }
        p118.regionHighlight = u29.new(v120, v121, v126)
    end
end
u10.CreateController(u31.new())
return nil