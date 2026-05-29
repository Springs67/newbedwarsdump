local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "defender", "defender-kit-balance").DefenderSchematicColors
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "DefenseScannerHandItemController"
    end,
    ["__index"] = u14
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
    --]]
    u14.constructor(p25)
    p25.Name = "DefenseScannerHandItemController"
    p25.maid = u7.new()
    p25.currentHighlightedPosition = Vector3.new()
    p25.customBlockHighlight = nil
end
function u22.KnitStart(u26) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u21
        [4] = u6
        [5] = u18
        [6] = u3
        [7] = u17
        [8] = u2
    --]]
    u14.KnitStart(u26)
    u13.PlaceBlock:connect(function(p27) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u6
            [3] = u26
            [4] = u18
        --]]
        if p27:isCancelled() then
            return nil
        end
        if p27.blockType ~= u21.DEFENSE_SCANNER_BLOCK_SNAPPING then
            return nil
        end
        task.spawn(function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u26
                [3] = u18
            --]]
            local v28 = u6.Controllers.DefenderKitController:canPlayerAffordBlockAtPosition(u26.currentHighlightedPosition)
            local v29 = u6.Controllers.DefenderKitController
            local v30 = u26.currentHighlightedPosition
            local v31
            if v28 then
                v31 = u18.click
            else
                v31 = u18.error
            end
            v29:changeSchematicBlockColor(v30, v31)
            if u6.Controllers.DefenderKitController:requestPlaceDefenderBlock(u26.currentHighlightedPosition) then
                u26:hideCustomVisuals()
            end
        end)
        p27:setCancelled(true)
    end)
    u3.BeforeHighlightBlock:connect(function(p32) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u21
            [3] = u26
            [4] = u2
            [5] = u6
        --]]
        local v33 = u17:getLocalPlayerEntity()
        if not v33 then
            return nil
        end
        if v33 ~= nil then
            v33 = v33:getHandItemInstanceFromCharacter()
        end
        if not v33 then
            return nil
        end
        if v33.Name ~= u21.DEFENSE_SCANNER then
            u26:hideCustomVisuals()
            return nil
        end
        if not p32.mouseInfo.target then
            u26:hideCustomVisuals()
            return nil
        end
        local v34 = u2:snapPosition(u2:getBlockPosition(p32.mouseInfo.target.blockInstance.Position))
        local v35 = u2:getWorldPosition(v34)
        if not u6.Controllers.DefenderKitController:isValidSchematicPosition(v34) then
            u26:hideCustomVisuals()
            return nil
        end
        local v36 = u6.Controllers.DefenderKitController:getBlockForSchematicPosition(v34)
        if not v36 then
            u26:hideCustomVisuals()
            return nil
        end
        u26:updateCustomVisuals(v36, v35)
    end)
end
function u22.createTestPart(_, p37, p38) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
    --]]
    local u39 = u8("Part", {
        ["Size"] = Vector3.new(1, 1, 1),
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["Parent"] = u12,
        ["Color"] = p38,
        ["Material"] = Enum.Material.Neon,
        ["Position"] = p37
    })
    task.delay(2, function() --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        u39:Destroy()
    end)
end
function u22.updateCustomVisuals(p40, p41, p42) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
    --]]
    p40:updateCustomBlockHighlight(p41, p42)
    u6.Controllers.DefenderPopupController:updatePopup(p41, p42)
    p40.currentHighlightedPosition = u2:getBlockPosition(p42)
end
function u22.hideCustomVisuals(p43) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    p43:hideCustomBlockHighlight()
    u6.Controllers.DefenderPopupController:hidePopup()
    p43.currentHighlightedPosition = Vector3.new()
end
function u22.onEnable(p44, _, _) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u10
        [3] = u15
        [4] = u5
        [5] = u6
    --]]
    local u45 = u16:playAnimation(u10.LocalPlayer, u15.PAINT_SHOTGUN_IDLE, {
        ["looped"] = true
    })
    p44.maid:GiveTask(function() --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        local v46 = u45
        if v46 ~= nil then
            v46:Stop()
        end
    end)
    u5.Controllers.ViewmodelController:playAnimation(u15.FP_HOLD, {
        ["looped"] = true,
        ["keepEnabledOnUnequipItem"] = false
    })
    u6.Controllers.DefenderKitController:setSchematicBlocksQueryable(true)
    p44.maid:GiveTask(function() --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        u6.Controllers.DefenderKitController:setSchematicBlocksQueryable(false)
    end)
end
function u22.onDisable(p47) --[[ Line: 147 ]]
    p47:hideCustomVisuals()
    p47.maid:DoCleaning()
end
function u22.isRelevantItem(_, p48) --[[ Line: 151 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    return p48.itemType == u21.DEFENSE_SCANNER
end
function u22.updateCustomBlockHighlight(p49, p50, p51) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u6
        [3] = u10
        [4] = u19
        [5] = u20
        [6] = u11
        [7] = u12
    --]]
    if p50 == u21.WOOL_WHITE then
        local v52 = u6.Controllers.TeamController:getPlayerTeam(u10.LocalPlayer)
        if v52 then
            p50 = u19.getTeamWoolById(v52.id) or u21.WOOL_WHITE
        end
    end
    local v53 = u20(p50).block
    if v53 ~= nil then
        v53 = v53.greedyMesh
        if v53 ~= nil then
            v53 = v53.textures
        end
    end
    if not v53 then
        return nil
    end
    if not p49.customBlockHighlight then
        p49.customBlockHighlight = u11.Assets.Misc.DefenderCustomBlockHighlight:Clone()
        p49.customBlockHighlight.Parent = u12
    end
    if #v53 == 1 then
        p49.customBlockHighlight.Top.Texture = v53[1]
        p49.customBlockHighlight.Bottom.Texture = v53[1]
        p49.customBlockHighlight.Left.Texture = v53[1]
        p49.customBlockHighlight.Front.Texture = v53[1]
        p49.customBlockHighlight.Right.Texture = v53[1]
        p49.customBlockHighlight.Back.Texture = v53[1]
    else
        p49.customBlockHighlight.Top.Texture = v53[1]
        p49.customBlockHighlight.Bottom.Texture = v53[2]
        p49.customBlockHighlight.Left.Texture = v53[3]
        p49.customBlockHighlight.Front.Texture = v53[4]
        p49.customBlockHighlight.Right.Texture = v53[5]
        p49.customBlockHighlight.Back.Texture = v53[6]
    end
    p49.customBlockHighlight:PivotTo(CFrame.new(p51))
end
function u22.hideCustomBlockHighlight(p54) --[[ Line: 193 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v55 = p54.customBlockHighlight
    if v55 ~= nil then
        v55:PivotTo(u12:GetPivot())
    end
end
u5.CreateController(u22.new())
return nil