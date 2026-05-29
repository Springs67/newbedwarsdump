local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.ReplicatedStorage
local u13 = v9.RunService
local u14 = v9.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-gardener", "spirit-gardener-balance")
local u20 = v19.SpiritGardenerKitBalance
local u21 = v19.SpiritGardenerUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "SpiritGardenerSeedHandController"
    end,
    ["__index"] = u16
})
u24.__index = u24
function u24.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
        [3] = u14
        [4] = u23
    --]]
    u16.constructor(p27)
    p27.Name = "SpiritGardenerSeedHandController"
    p27.maid = u8.new()
    p27.camera = u14.CurrentCamera
    p27.targetPosition = nil
    p27.requestPlaceSpiritGardenerFlowerRemote = u23.Client:Get("RequestPlaceSpiritGardenerFlower")
end
function u24.KnitStart(u28) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u22
    --]]
    u16.KnitStart(u28)
    u15.PlaceBlock:connect(function(p29) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u28
        --]]
        if p29.blockType == u22.SOULVINE_FLOWER or (p29.blockType == u22.TEARBLOOM_FLOWER or p29.blockType == u22.CRYSTALHEART_FLOWER) then
            p29:setCancelled(true)
            u28:requestFlowerPlacement()
        end
    end)
end
function u24.enableHandHighlight(u30) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u22
        [3] = u14
        [4] = u13
        [5] = u11
        [6] = u5
        [7] = u20
        [8] = u2
    --]]
    if not u30.currentItemType then
        return nil
    end
    local u31 = u12.Assets.Misc.SoulvineFlowerIndicator:Clone()
    local v32 = u30.currentItemType
    if v32 == u22.SOULVINE_SEED then
        u31 = u12.Assets.Misc.SoulvineFlowerIndicator:Clone()
    elseif v32 == u22.TEARBLOOM_SEED then
        u31 = u12.Assets.Misc.TearbloomFlowerIndicator:Clone()
    elseif v32 == u22.CRYSTALHEART_SEED then
        u31 = u12.Assets.Misc.CrystalheartFlowerIndicator:Clone()
    end
    u31.Parent = u14
    u30.maid:GiveTask(u31)
    local function u35() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        for v33, v34 in u31:GetDescendants() do
            local _ = v33 - 1
            if v34:IsA("MeshPart") then
                v34.LocalTransparencyModifier = 1
            end
            if v34:IsA("Beam") then
                v34.Enabled = false
            end
        end
    end
    local function u38() --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        for v36, v37 in u31:GetDescendants() do
            local _ = v36 - 1
            if v37:IsA("MeshPart") then
                v37.LocalTransparencyModifier = 0
            end
            if v37:IsA("Beam") then
                v37.Enabled = true
            end
        end
    end
    u30.maid:GiveTask(u13.Heartbeat:Connect(function(_) --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u31
            [3] = u11
            [4] = u5
            [5] = u20
            [6] = u35
            [7] = u2
            [8] = u38
        --]]
        if not (u30:isEnabled() and u30.camera) then
            u31:Destroy()
            u30.maid:DoCleaning()
            return nil
        end
        local v39 = u11.LocalPlayer.Character
        if v39 ~= nil then
            v39 = v39:GetPivot().Position
        end
        if not v39 then
            return nil
        end
        local v40 = u11.LocalPlayer:GetMouse().UnitRay
        local v41
        if u5.isMobileControls() then
            v41 = u30.camera.CFrame.LookVector.Unit
        else
            v41 = v40.Direction
        end
        local v42 = u30:getSnappedPosition(u30.camera.CFrame.Position, v41, u20.DISTANCE_CAN_PLACE_FLOWERS * 1.5, v39)
        if not v42 then
            u30.targetPosition = nil
            u35()
            return nil
        end
        if (v42 - v39).Magnitude > u20.DISTANCE_CAN_PLACE_FLOWERS then
            u30.targetPosition = nil
            u35()
            return nil
        end
        if u30:checkIsInvalidPlacement(u2:getBlockPosition(v42)) then
            u30.targetPosition = nil
            u35()
            return nil
        end
        u30.targetPosition = v42
        u30:recolorIndicator(u31)
        u38()
        u31:PivotTo(CFrame.new(u30.targetPosition))
    end))
end
function u24.recolorIndicator(_, _) --[[ Line: 146 ]] end
function u24.checkIsInvalidPlacement(_, p43) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u22
    --]]
    if not p43 then
        return true
    end
    if u7.Controllers.MapController:isInDenyRegion(p43) then
        return true
    end
    if u2:getStore():getBlockAt(p43) then
        return true
    end
    local v44 = u2:getStore():getBlockAt(p43 - Vector3.new(0, 1, 0))
    if not v44 then
        return true
    end
    local v45 = u2:getHandlerRegistry():getHandler(v44.Name)
    if v45 ~= nil then
        v45 = v45:getBlockMeta()
    end
    if v45 ~= nil then
        v45 = v45.denyPlaceOn
    end
    return v45 and true or v44.Name == u22.BED
end
function u24.getSnappedPosition(_, p46, p47, p48, p49) --[[ Line: 189 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
        [3] = u20
    --]]
    local v50 = RaycastParams.new()
    v50.FilterType = Enum.RaycastFilterType.Include
    v50.FilterDescendantsInstances = u10:GetTagged("block")
    local v51 = u2:serverRaycast(p46, p47 * p48, v50)
    if v51 then
        if (p49 - v51.Position).Magnitude > u20.DISTANCE_CAN_PLACE_FLOWERS then
            return nil
        else
            return u2:getWorldPosition(u2:snapPosition(u2:getBlockPosition(v51.Position)))
        end
    else
        return nil
    end
end
function u24.requestFlowerPlacement(p52) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u20
        [3] = u4
        [4] = u18
        [5] = u17
        [6] = u21
        [7] = u6
    --]]
    if p52.targetPosition == nil then
        return nil
    end
    local v53 = u11.LocalPlayer.Character
    if v53 ~= nil then
        v53 = v53:GetPivot().Position
    end
    if not v53 then
        return nil
    end
    if (p52.targetPosition - v53).Magnitude > u20.DISTANCE_CAN_PLACE_FLOWERS then
        return false
    end
    if p52.requestPlaceSpiritGardenerFlowerRemote:CallServer(p52.targetPosition, p52.currentItemType) then
        local v54 = u4:playAnimation(u11.LocalPlayer, u18:getAssetId(u17.PLACE_BLOCK), {
            ["looped"] = false
        })
        if v54 ~= nil then
            v54:Play()
        end
        u6:playSound(u21.CROP_PLANT_SOUNDS[math.random(0, #u21.CROP_PLANT_SOUNDS - 1) + 1], {
            ["position"] = p52.targetPosition
        })
    end
end
function u24.onEnable(p55, p56, _) --[[ Line: 238 ]]
    p55.currentItemType = p56.itemType
    p55:enableHandHighlight()
end
function u24.onDisable(p57) --[[ Line: 242 ]]
    p57.maid:DoCleaning()
end
function u24.isRelevantItem(_, p58) --[[ Line: 245 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    return p58.itemType == u22.SOULVINE_SEED or (p58.itemType == u22.TEARBLOOM_SEED or p58.itemType == u22.CRYSTALHEART_SEED)
end
u7.CreateController(u24.new())
return nil