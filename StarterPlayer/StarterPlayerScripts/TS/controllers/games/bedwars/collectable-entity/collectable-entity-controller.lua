local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.Players
local u11 = v8.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v13 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u14 = v13.InteractionCategory
local u15 = v13.InteractionPriority
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "CollectableEntityController"
    end,
    ["__index"] = u16
})
v21.__index = v21
function v21.constructor(p22, ...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p22, ...)
    p22.Name = "CollectableEntityController"
    p22.entityMap = {}
    p22.entityMaidMap = {}
end
function v21.KnitStart(u23) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u19
        [3] = u7
        [4] = u9
    --]]
    u16.KnitStart(u23)
    u19.Client:WaitFor("CollectableEntitySpawn"):andThen(function(p24) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u7
        --]]
        p24:Connect(function(p25) --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u7
            --]]
            local v26 = u23:validCollectableEntityTypes()
            local v27 = p25.entityType
            if table.find(v26, v27) == nil then
                return nil
            end
            u23.entityMap[p25.id] = p25.entityType
            u23.entityMaidMap[p25.id] = u7.new()
            local v28 = u23:pickDisplayModel(p25.entityType, p25.model)
            local v29 = u23
            local v30 = {}
            for v31, v32 in p25 do
                v30[v31] = v32
            end
            v30.tag = v28.collectionTag
            v30.repStorageModel = v28.repStorageModel
            v30.proximityPrompt = v28.proximityPrompt
            v30.attributes = p25.attributes
            v29:createLocalModel(v30)
        end)
    end)
    u19.Client:OnEvent("CollectableEntityRemoved", function(p33) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u9
        --]]
        local v34 = u23:validCollectableEntityTypes()
        local v35 = p33.entityType
        if table.find(v34, v35) == nil then
            return nil
        end
        local v36 = nil
        for v37, v38 in u9:GetTagged(p33.entityType) do
            local _ = v37 - 1
            if v38:GetAttribute("Id") == p33.id == true then
                v36 = v38
                break
            end
        end
        if v36 then
            u23:onWillRemoveEntity(p33.id, p33.entityType, p33.collector, v36)
        end
        u23.entityMap[p33.id] = nil
        local v39 = u23.entityMaidMap[p33.id]
        if v39 ~= nil then
            v39:DoCleaning()
        end
        u23.entityMaidMap[p33.id] = nil
        if v36 ~= nil then
            v36:Destroy()
        end
    end)
end
function v21.createLocalModel(u40, p41) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u6
        [4] = u3
        [5] = u15
        [6] = u14
        [7] = u18
        [8] = u17
        [9] = u5
        [10] = u20
        [11] = u9
    --]]
    local v42 = p41.repStorageModel:Clone()
    if p41.attributes ~= nil then
        for v43, v44 in p41.attributes do
            if typeof(v44) == "string" or (typeof(v44) == "number" or typeof(v44) == "boolean") then
                v42:SetAttribute(v43, v44)
            end
        end
    end
    v42.Parent = u11
    v42:SetAttribute("Id", p41.id)
    v42:SetAttribute("SpawnTime", u11:GetServerTimeNow())
    v42:PivotTo(CFrame.new(p41.position))
    for _, v45 in p41.repStorageModel:GetDescendants() do
        if v45:IsA("BasePart") then
            u4:setQueryIgnored(v45, true)
        end
    end
    v42.PrimaryPart.Anchored = true
    v42.PrimaryPart.CanCollide = false
    local v46 = p41.tag .. "_ProximityPrompt"
    if p41.proximityPrompt and not u6.Controllers.InteractionRegistryController:getInteractionDefinition(v46) then
        local v47 = u6.Controllers.InteractionRegistryController
        local v48 = {}
        local v49 = p41.proximityPrompt.interactionLabel
        v48.interactionLabel = v49 == nil and "Pick Up" or v49
        v48.interactionObjectText = p41.proximityPrompt.interactionObjectText
        v48.interactionTag = v46
        local v50 = p41.proximityPrompt.instantActivation
        v48.instantActivation = v50 == nil and true or v50
        local v51 = p41.proximityPrompt.maxActivationDistance
        v48.maxActivationDistance = v51 == nil and 5 or v51
        local v52 = p41.proximityPrompt.clickablePrompt
        if v52 == nil then
            v52 = u3.isMobileControls()
        end
        v48.clickablePrompt = v52
        local v53 = p41.proximityPrompt.priority
        if v53 == nil then
            v53 = u15.OTHER
        end
        v48.priority = v53
        v48.category = p41.proximityPrompt.category or u14.OTHER
        v48.removePromptOnInteract = p41.proximityPrompt.removePromptOnInteract
        function v48.onInteracted(p54, p55, p56) --[[ Line: 188 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u18
                [3] = u17
                [4] = u6
                [5] = u5
                [6] = u20
            --]]
            if not u40:canPickupEntity(p54, p55) then
                return nil
            end
            u18:playAnimation(p54, u17.PUNCH)
            u6.Controllers.ViewmodelController:playAnimation(u17.FP_USE_ITEM)
            u5:playSound(u20.PICKUP_ITEM_DROP)
            if p56 then
                u40:collectEntity(p54, p55, p55.Name)
            end
        end
        v47:RegisterInteraction(v48)
    end
    u40:onCreatedEntity(p41.id, p41.entityType, v42)
    u9:AddTag(v42, p41.tag)
    u9:AddTag(v42, v46)
    return v42
end
function v21.collectEntity(p57, p58, p59, p60) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u19
    --]]
    if p58 == u10.LocalPlayer then
        local v61 = p59:GetAttribute("Id")
        local v62 = p57.entityMap[v61]
        if not v62 then
            return nil
        end
        if u12.CollectEntity:fire(v62, p59):isCancelled() then
            return nil
        end
        u19.Client:Get("CollectCollectableEntity"):SendToServer({
            ["id"] = v61,
            ["collectableName"] = p60
        })
    end
end
function v21.getEntityMaid(p63, p64) --[[ Line: 225 ]]
    return p63.entityMaidMap[p64]
end
function v21.getEntity(p65, p66) --[[ Line: 230 ]]
    return p65.entityMap[p66]
end
function v21.canPickupEntity(_, _, _) --[[ Line: 235 ]]
    return true
end
return {
    ["CollectableEntityController"] = v21
}