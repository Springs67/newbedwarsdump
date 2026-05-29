local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameComponent
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "components", "out").Component
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local v10 = v8.PhysicsService
local u11 = v8.Players
local u12 = v8.ReplicatedStorage
local u13 = v8.RunService
local u14 = v8.ServerStorage
local u15 = v8.Workspace
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes")
local u18 = v17.NpcAnimationAttr
local u19 = v17.NpcAutoPlaceAttr
local u20 = v17.NpcCollectionServiceTag
local u21 = v17.NpcLookAtPlayerAttr
local u22 = v17.NpcLookMinDistanceAttr
local u23 = v17.NpcNameAttr
local u24 = v17.NpcScale
local u25 = v17.NpcSecondaryAnimationAttr
local u26 = v17.NpcVerticalOffset
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "character", "character-util").CharacterUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config")
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").SetAttribute
local v31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "billboard", "attributes")
local u32 = v31.BillboardAlwaysOnTopAttr
local u33 = v31.BillboardAutomaticSizeAttr
local u34 = v31.BillboardMaxSizeAttr
local u35 = v31.BillboardSizeAttr
local u36 = v31.BillboardStudsOffsetAttr
local u37 = v31.BillboardSubtitleAttr
local u38 = v31.BillboardTitleAttr
if u13:IsServer() then
    v10:CreateCollisionGroup("NPCs")
    v10:CollisionGroupSetCollidable("NPCs", "Players", false)
end
local v39 = {}
local u40 = setmetatable({}, {
    ["__index"] = v39
})
u40.CLIENT = 0
v39[0] = "CLIENT"
u40.SERVER = 1
v39[1] = "SERVER"
local u41 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 61 ]]
        return "NpcSpawnComponent"
    end,
    ["__index"] = u4
})
u41.__index = u41
function u41.new(...) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u41
    --]]
    local v42 = u41
    local v43 = setmetatable({}, v42)
    return v43:constructor(...) or v43
end
function u41.constructor(p44) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u16
        [3] = u28
        [4] = u23
        [5] = u19
        [6] = u18
        [7] = u25
        [8] = u21
        [9] = u22
        [10] = u24
        [11] = u20
        [12] = u26
    --]]
    u4.constructor(p44)
    p44.npcModelSetup = false
    p44.npcModelSetupSignal = u16.new()
    local v45 = {
        u23,
        u19,
        u18,
        u25,
        u21,
        u22,
        u24,
        u20,
        u26
    }
    p44.config = u28.new(p44.instance, v45)
end
function u41.onStart(p46) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u40
        [2] = u13
        [3] = u15
    --]]
    if p46.attributes.SpawnOnOnly == u40.CLIENT then
        if u13:IsServer() then
            return nil
        end
    elseif u13:IsClient() then
        return nil
    end
    if not p46.instance:IsDescendantOf(u15) then
        return nil
    end
    if not u15:FindFirstChild("NpcContainer") then
        local v47 = Instance.new("Folder")
        v47.Name = "NpcContainer"
        v47.Parent = u15
    end
    local v48 = {}
    for v49, v50 in p46.config.Values do
        v48[v49] = v50
    end
    for v51, v52 in p46.attributes do
        v48[v51] = v52
    end
    p46.config.Values = v48
    local v53 = {}
    for v54, v55 in p46.config.Values do
        v53[v54] = v55
    end
    for v56, v57 in p46.attributes do
        v53[v56] = v57
    end
    p46.attributes = v53
    if u13:IsServer() then
        local v58 = p46.attributes.NpcName
        p46:setNpcModel(p46:getNpcModelFromVillagers(v58 == nil and "desertMerchant" or v58))
    else
        local v59 = p46.attributes.NpcName
        p46:setNpcModel((p46:getNpcModelFromReplicatedStorage(v59 == nil and "desertMerchant" or v59)))
    end
    p46.instance.Transparency = 1
end
function u41.getTag(p60) --[[ Line: 135 ]]
    return p60.tag
end
function u41.setNametag(p61, p62, p63, p64) --[[ Line: 138 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u38
        [3] = u37
        [4] = u29
        [5] = u36
        [6] = u34
        [7] = u35
        [8] = u32
        [9] = u33
        [10] = u9
    --]]
    local v65 = p61.instance
    u30(v65, u38, p62)
    u30(v65, u37, p63)
    local v66
    if p64 == nil then
        v66 = p64
    else
        v66 = p64.BillboardStudsOffset
    end
    if v66 == nil then
        local v67 = 0
        local v68
        if p63 == "" or not p63 then
            v68 = u29.isLobbyServer() and 6.8 or 5
        else
            v68 = u29.isLobbyServer() and 9.3 or 5
        end
        v66 = Vector3.new(v67, v68, 0)
    end
    u30(v65, u36, v66)
    local v69
    if p64 == nil then
        v69 = p64
    else
        v69 = p64.BillboardMaxSize
    end
    if v69 == nil then
        v69 = Vector2.new(820, 170)
    end
    u30(v65, u34, v69)
    local v70
    if p64 == nil then
        v70 = p64
    else
        v70 = p64.BillboardSize
    end
    if v70 == nil then
        v70 = UDim2.fromScale(10, 2)
    end
    u30(v65, u35, v70)
    local v71
    if p64 == nil then
        v71 = p64
    else
        v71 = p64.AlwaysOnTop
    end
    u30(v65, u32, v71 == nil and true or v71)
    if p64 ~= nil then
        p64 = p64.AutomaticSize
    end
    if p64 == nil then
        p64 = false
    end
    u30(v65, u33, p64)
    u9:AddTag(v65, "Billboard")
end
function u41.getNpcModel(p72) --[[ Line: 191 ]]
    return p72.npcModel
end
function u41.setNpcModel(p73, p74, p75) --[[ Line: 194 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u27
        [4] = u9
    --]]
    p73.maid:DoCleaning()
    local v76 = p74:WaitForChild("Humanoid")
    if not p74.PrimaryPart then
        warn("Error setting Npc Model for \"" .. p74.Name .. "\". A primary part is not defined")
        return nil
    end
    p73.npcModel = p74
    p73.humanoid = v76
    p73.maid:GiveTask(p73.npcModel)
    if v76 and not v76:FindFirstAncestorOfClass("Animator") then
        u6("Animator", {
            ["Parent"] = v76
        })
    end
    if p73.attributes.NpcScale ~= nil then
        u7(p74, p73.attributes.NpcScale)
    end
    for _, v77 in p74:GetChildren() do
        if v77:IsA("LocalScript") then
            v77:Destroy()
        end
    end
    local v78 = p73:getSpawnPosition(p73.attributes.AutomaticPlaceIgnoreHipHeight and 0 or 0.5 * p74.PrimaryPart.Size.Y + v76.HipHeight) + Vector3.new(0, 0.6, 0)
    if p73.attributes.NpcVerticalOffset ~= nil then
        local v79 = p73.attributes.NpcVerticalOffset
        local v80 = Vector3.new(0, v79, 0)
        v78 = v78 - Vector3.new(0, 0.6, 0) + v80
    end
    p73.npcModel.Parent = p73.instance
    p73.npcModel.PrimaryPart.Anchored = true
    p73.npcModel:PivotTo(v78)
    if p73.attributes.NpcDisableCollisions == true then
        for v81, v82 in p74:GetDescendants() do
            local _ = v81 - 1
            if v82:IsA("BasePart") then
                v82.CollisionGroup = "NPCs"
                v82.CanCollide = false
                v82.CanQuery = false
            end
        end
    end
    if p73.attributes.NpcBoxCollision == true and p73.attributes.NpcDisableCollisions == false then
        local v83 = p73.npcModel:Clone()
        v83.Name = "NPCHitbox"
        for v84, v85 in v83:GetDescendants() do
            local _ = v84 - 1
            if v85:IsA("BasePart") then
                v85.Transparency = 1
                v85.CanQuery = true
                v85.CanCollide = true
            end
        end
        v83.Parent = p73.npcModel
        v83:PivotTo(p73.npcModel:GetPivot())
    end
    p73.humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    local v86
    if p75 == nil then
        v86 = p75
    else
        v86 = p75.desc
    end
    if v86 then
        p73.humanoid = p73.npcModel:WaitForChild("Humanoid")
        p73.humanoid:ApplyDescription(p75.desc)
    end
    if p75 ~= nil then
        p75 = p75.sanitize
    end
    if p75 then
        u27.sanitizeBedwarsChar(p73.npcModel, nil)
    end
    local v87 = p73.attributes.NpcCollectionServiceTag
    if v87 ~= "" and v87 then
        u9:AddTag(p73.npcModel, p73.attributes.NpcCollectionServiceTag)
    end
    u9:AddTag(p73.npcModel, "NpcModel")
    p73.npcModelSetup = true
    p73.npcModelSetupSignal:Fire()
end
function u41.getSpawnPosition(p88, p89) --[[ Line: 298 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u15
    --]]
    if p88.attributes.AutomaticPlace ~= true then
        return p88.instance.CFrame
    end
    local v90 = RaycastParams.new()
    v90.IgnoreWater = true
    v90.FilterType = Enum.RaycastFilterType.Exclude
    local v91 = 0
    local v92 = {}
    for v93, v94 in u11:GetPlayers() do
        local _ = v93 - 1
        local v95 = v94.Character
        if v95 ~= nil then
            v91 = v91 + 1
            v92[v91] = v95
        end
    end
    local v96 = { p88.instance }
    local v97 = #v96
    table.move(v92, 1, #v92, v97 + 1, v96)
    v90.FilterDescendantsInstances = v96
    local v98 = u15:Raycast(p88.instance.Position, Vector3.new(-0, -20, -0), v90)
    if not v98 then
        return p88.instance.CFrame
    end
    local v99 = v98.Position + Vector3.new(0, p89, 0)
    local v100 = CFrame.new(v99)
    local v101 = CFrame.Angles
    local v102 = p88.instance.Orientation.Y
    return v100 * v101(0, math.rad(v102), 0)
end
function u41.getNpcModelFromVillagers(_, p103) --[[ Line: 340 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
    --]]
    if u13:IsClient() then
        error("You can\'t get npc model from villagers from the client")
    end
    local v104 = u14.Assets.Villagers:FindFirstChild(p103)
    if not v104 then
        error("Villager " .. p103 .. " not found")
    end
    if not v104:IsA("Model") then
        error("Villager " .. p103 .. " must be of type Model")
    end
    if not v104.PrimaryPart then
        error("Villager " .. p103 .. " has no PrimaryPart")
    end
    local v105 = v104:Clone()
    for v106, v107 in v105:GetDescendants() do
        local _ = v106 - 1
        if v107:IsA("BasePart") then
            v107.CastShadow = false
        end
    end
    return v105
end
function u41.getNpcModelFromReplicatedStorage(_, p108) --[[ Line: 366 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
    --]]
    if u13:IsServer() then
        error("Intended for client use")
    end
    local v109 = u12.Assets:FindFirstChild(p108)
    if not v109 then
        error("Villager " .. p108 .. " not found")
    end
    if not v109:IsA("Model") then
        error("Villager " .. p108 .. " must be of type Model")
    end
    if not v109.PrimaryPart then
        error("Villager " .. p108 .. " has no PrimaryPart")
    end
    local v110 = v109:Clone()
    for v111, v112 in v110:GetDescendants() do
        local _ = v111 - 1
        if v112:IsA("BasePart") then
            v112.CastShadow = false
        end
    end
    return v110
end
u41.tag = "NpcSpawn"
v2.defineMetadata(u41, "identifier", "shared/components/npc-spawn-component@NpcSpawnComponent")
v2.defineMetadata(u41, "flamework:implements", { "$:flamework@OnStart" })
local v113 = {
    ["tag"] = "NpcSpawn",
    ["defaults"] = {
        ["AutomaticPlace"] = true,
        ["NpcAnimation"] = "rbxassetid://3338042785",
        ["NpcLookAtPlayer"] = false,
        ["NpcSecondaryAnimation"] = "rbxassetid://2510196951",
        ["NpcVerticalOffset"] = 0,
        ["SpawnOnOnly"] = u40.SERVER
    },
    ["attributes"] = {
        ["NpcName"] = v3.optional(v3.string),
        ["AutomaticPlace"] = v3.optional(v3.boolean),
        ["AutomaticPlaceIgnoreHipHeight"] = v3.optional(v3.boolean),
        ["NpcAnimation"] = v3.optional(v3.string),
        ["NpcSecondaryAnimation"] = v3.optional(v3.string),
        ["NpcLookAtPlayer"] = v3.optional(v3.boolean),
        ["NpcLookMinimumDistance"] = v3.optional(v3.number),
        ["NpcScale"] = v3.optional(v3.number),
        ["NpcCollectionServiceTag"] = v3.optional(v3.string),
        ["NpcVerticalOffset"] = v3.optional(v3.number),
        ["NpcDisableCollisions"] = v3.optional(v3.boolean),
        ["NpcBoxCollision"] = v3.optional(v3.boolean),
        ["SpawnOnOnly"] = v3.optional(v3.literal(0, 1))
    },
    ["instanceGuard"] = v3.instanceIsA("BasePart")
}
v2.decorate(u41, "$c:init@Component", v5, { v113 })
return {
    ["SpawnContext"] = u40,
    ["NpcSpawnComponent"] = u41
}