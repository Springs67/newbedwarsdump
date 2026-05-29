local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v7.ReplicatedStorage
local u11 = v7.RunService
local u12 = v7.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jellyfish", "jellyfish-kit-util")
local u17 = v16.EnemyJellyfishColors
local u18 = v16.JellyfishBalance
local u19 = v16.JellyfishParts
local u20 = v16.JellyfishPlacement
local u21 = v16.SelfJellyfishColors
local u22 = v16.TeamJellyfishColors
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "JellyfishHandItemController"
    end,
    ["__index"] = u14
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
        [1] = u14
        [2] = u6
        [3] = u12
        [4] = u23
    --]]
    u14.constructor(p27)
    p27.Name = "JellyfishHandItemController"
    p27.maid = u6.new()
    p27.camera = u12.CurrentCamera
    p27.targetPosition = nil
    p27.requestPlaceJellyfishRemote = u23.Client:Get("RequestPlaceJellyfish")
end
function u24.KnitStart(u28) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u15
    --]]
    u14.KnitStart(u28)
    u13.PlaceBlock:connect(function(p29) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u28
        --]]
        if p29.blockType == u15.JELLYFISH_BLOCK_SNAPPING then
            p29:setCancelled(true)
            u28:requestPlaceJellyfish()
        end
    end)
end
function u24.enableHandHighlight(u30) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u11
        [4] = u9
        [5] = u3
        [6] = u18
    --]]
    local u31 = u10.Assets.Misc.JellyfishIndicator2:Clone()
    u31.Parent = u12
    u30.maid:GiveTask(u31)
    local function u34() --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        for v32, v33 in u31:GetChildren() do
            local _ = v32 - 1
            if v33:IsA("MeshPart") then
                v33.LocalTransparencyModifier = 1
            end
        end
    end
    local function u37() --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        for v35, v36 in u31:GetChildren() do
            local _ = v35 - 1
            if v36:IsA("MeshPart") then
                v36.LocalTransparencyModifier = 0
            end
        end
    end
    u30.maid:GiveTask(u11.Heartbeat:Connect(function(_) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u31
            [3] = u9
            [4] = u3
            [5] = u18
            [6] = u34
            [7] = u37
        --]]
        if not (u30:isEnabled() and u30.camera) then
            u31:Destroy()
            u30.maid:DoCleaning()
            return nil
        end
        local v38 = u9.LocalPlayer.Character
        if v38 ~= nil then
            v38 = v38:GetPivot().Position
        end
        if not v38 then
            return nil
        end
        local v39 = u9.LocalPlayer:GetMouse().UnitRay
        local v40
        if u3.isMobileControls() then
            v40 = u30.camera.CFrame.LookVector.Unit
        else
            v40 = v39.Direction
        end
        local v41 = u30:getSnappedPositionAboveBlock(u30.camera.CFrame.Position, v40, u18.DistancePlayerCanPlaceJellyfish * 1.5, v38)
        if v41 ~= nil then
            v41 = v41 + u18.DistanceFromGround
        end
        if not v41 then
            u30.targetPosition = nil
            u34()
            return nil
        end
        if (v41 - v38).Magnitude > u18.DistancePlayerCanPlaceJellyfish then
            u30.targetPosition = nil
            u34()
            return nil
        end
        if u30:jellyfishExistsAtLocation(v41) then
            u30.targetPosition = nil
            u34()
            return nil
        end
        u30.targetPosition = v41
        local v42 = u30:checkIndicatorPosition(v41)
        u30:recolorJellyfishIndicator(u31, v42[1], v42[2])
        u37()
        local v43 = u30.camera.CFrame.Position.X
        local v44 = u30.targetPosition.Y
        local v45 = u30.camera.CFrame.Position.Z
        local v46 = Vector3.new(v43, v44, v45)
        u31:PivotTo(CFrame.lookAt(u30.targetPosition, v46) * CFrame.Angles(0, 3.141592653589793, 0))
    end))
end
function u24.jellyfishExistsAtLocation(_, p47) --[[ Line: 133 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
    --]]
    local v48 = 0
    local v49 = {}
    for v50, v51 in u8:GetTagged("jellyfish") do
        local _ = v50 - 1
        if u9.LocalPlayer.UserId == v51:GetAttribute("PlacedByUserId") == true then
            v48 = v48 + 1
            v49[v48] = v51
        end
    end
    local v52 = nil
    for v53, v54 in v49 do
        local _ = v53 - 1
        if v54:GetAttribute("CenteredPosition") == p47 == true then
            return v54
        end
    end
    return v52
end
function u24.checkIndicatorPosition(_, p55) --[[ Line: 163 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u18
        [4] = u20
    --]]
    local v56 = 0
    local v57 = {}
    for v58, v59 in u8:GetTagged("jellyfish") do
        local _ = v58 - 1
        if u9.LocalPlayer.UserId == v59:GetAttribute("PlacedByUserId") == true then
            v56 = v56 + 1
            v57[v56] = v59
        end
    end
    local v60 = nil
    for v61, v62 in v57 do
        local _ = v61 - 1
        if (v62:GetAttribute("CenteredPosition") - p55).Magnitude < u18.JellyfishMinDistance == true then
            v60 = v62
            break
        end
    end
    local v63 = v60 == nil
    if v63 then
        v63 = not u20.jellyfishHasBlockOverlap(p55)
    end
    local v64 = nil
    for v65, v66 in v57 do
        local _ = v65 - 1
        if (v66:GetAttribute("CenteredPosition") - p55).Magnitude < u18.MaxReplicationRadius == true then
            v64 = v66
            break
        end
    end
    return { v63, v64 ~= nil }
end
function u24.recolorJellyfishIndicator(_, p67, p68, p69) --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u22
        [3] = u17
        [4] = u5
        [5] = u19
    --]]
    local v70
    if p68 and p69 then
        v70 = u21
    elseif p69 or not p68 then
        v70 = u17
    else
        v70 = u22
    end
    local v71 = u5.keys(u19)
    for v72, v73 in p67:GetDescendants() do
        local _ = v72 - 1
        local v74 = v73:IsA("MeshPart")
        if v74 then
            local v75 = v73.Name
            v74 = table.find(v71, v75) ~= nil
        end
        if v74 then
            v73.Color = v70[v73.Name]
        end
    end
end
function u24.getSnappedPositionAboveBlock(_, p76, p77, p78, p79) --[[ Line: 233 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u18
    --]]
    local v80 = RaycastParams.new()
    v80.FilterType = Enum.RaycastFilterType.Include
    v80.FilterDescendantsInstances = u8:GetTagged("block")
    local v81 = u2:serverRaycast(p76, p77 * p78, v80)
    if v81 then
        if (p79 - v81.Position).Magnitude > u18.DistancePlayerCanPlaceJellyfish then
            return nil
        else
            return u2:getWorldPosition(u2:snapPosition(u2:getBlockPosition(v81.Position)))
        end
    else
        return nil
    end
end
function u24.requestPlaceJellyfish(p82) --[[ Line: 253 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u18
    --]]
    if p82.targetPosition == nil then
        return nil
    end
    local v83 = u9.LocalPlayer.Character
    if v83 ~= nil then
        v83 = v83:GetPivot().Position
    end
    if not v83 then
        return nil
    end
    if (p82.targetPosition - v83).Magnitude > u18.DistancePlayerCanPlaceJellyfish then
        return false
    end
    p82.requestPlaceJellyfishRemote:CallServer(p82.targetPosition)
end
function u24.onEnable(p84, _, _) --[[ Line: 270 ]]
    p84:enableHandHighlight()
end
function u24.onDisable(p85) --[[ Line: 273 ]]
    p85.maid:DoCleaning()
end
function u24.isRelevantItem(_, p86) --[[ Line: 276 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return p86.itemType == u15.JELLYFISH
end
v4.CreateController(u24.new())
return nil