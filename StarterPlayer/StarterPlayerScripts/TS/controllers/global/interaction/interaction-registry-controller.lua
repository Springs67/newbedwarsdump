local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v2.Signal
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v10 = {}
local v11 = setmetatable({}, {
    ["__index"] = v10
})
v11.OTHER = 1
v10[1] = "OTHER"
v11.ABILITY = 2
v10[2] = "ABILITY"
local v12 = {}
local v13 = setmetatable({}, {
    ["__index"] = v12
})
v13.OTHER = "other"
v12.other = "OTHER"
v13.ABILITY = "ability"
v12.ability = "ABILITY"
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "InteractionRegistryController"
    end,
    ["__index"] = u8
})
u14.__index = u14
function u14.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17, ...) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
    --]]
    u8.constructor(p17, ...)
    p17.Name = "InteractionRegistryController"
    p17.onPromptCreated = u5.new()
    p17.registeredInteractions = {}
    p17.proximityPrompts = {}
end
function u14.KnitStart(_) --[[ Line: 56 ]] end
function u14.RegisterInteraction(u18, u19) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    if u18:getInteractionDefinition(u19.interactionTag) then
        error("Tag " .. u19.interactionTag .. " is already registered")
    end
    local u20 = u6.new()
    u18.registeredInteractions[u19.interactionTag] = {
        ["definition"] = u19,
        ["maid"] = u20
    }
    for _, v21 in u7:GetTagged(u19.interactionTag) do
        if v21:IsA("BasePart") and (not u19.shouldMakeInteraction or u19.shouldMakeInteraction(v21)) then
            u20:GiveTask(u18:givePartProximityPrompt(v21, u19))
        end
    end
    u20:GiveTask(u7:GetInstanceAddedSignal(u19.interactionTag):Connect(function(p22) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u20
            [3] = u18
        --]]
        if not (p22:IsA("BasePart") or p22:IsA("Model")) then
            error("Only BaseParts & Models can have an interaction, got " .. p22:GetFullName())
        end
        if u19.shouldMakeInteraction and not u19.shouldMakeInteraction(p22) then
            return nil
        end
        u20:GiveTask(u18:givePartProximityPrompt(p22, u19))
    end))
    u20:GiveTask(u7:GetInstanceRemovedSignal(u19.interactionTag):Connect(function(p23) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u19
        --]]
        if not (p23:IsA("BasePart") or p23:IsA("Model")) then
            return nil
        end
        u18:removePrompt(p23, u19.interactionTag)
    end))
    if u19.onVisibilityStateChanged then
        local u27 = u19.onVisibilityStateChanged:Connect(function(p24) --[[ Line: 112 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
            --]]
            local v25 = u18.proximityPrompts[u19.interactionTag]
            if v25 then
                for _, v26 in v25 do
                    v26.Enabled = p24
                end
            end
        end)
        u20:GiveTask(function() --[[ Line: 125 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            return u27:Disconnect()
        end)
    end
    u20:GiveTask(function() --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u19
        --]]
        u18:unregisterInteraction(u19.interactionTag)
    end)
    return u20
end
function u14.unregisterInteraction(p28, p29) --[[ Line: 135 ]]
    local v30 = p28.registeredInteractions[p29]
    if not v30 then
        return false
    end
    v30.maid:DoCleaning()
    p28.proximityPrompts[p29] = nil
    p28.registeredInteractions[p29] = nil
    return true
end
function u14.getProximityPrompts(p31) --[[ Line: 151 ]]
    return p31.proximityPrompts
end
function u14.getInteractionDefinition(p32, p33) --[[ Line: 154 ]]
    local v34 = p32.registeredInteractions[p33]
    if v34 ~= nil then
        v34 = v34.definition
    end
    return v34
end
function u14.givePartProximityPrompt(u35, u36, u37) --[[ Line: 163 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
    --]]
    local v38 = u37.interactionLabel
    if type(v38) == "function" then
        v38 = v38(u36)
    end
    local v39 = u37.interactionObjectText
    if type(v39) == "function" then
        v39 = v39(u36)
    end
    local v40 = u4.Controllers.ProximityPromptController
    local v41 = {
        ["AutoLocalize"] = true,
        ["RequiresLineOfSight"] = false,
        ["Name"] = u37.interactionTag,
        ["ObjectText"] = v39,
        ["ActionText"] = v38,
        ["ClickablePrompt"] = u37.clickablePrompt,
        ["KeyboardKeyCode"] = u37.KeyCode
    }
    local v42
    if u37.instantActivation then
        v42 = 0
    else
        v42 = u37.holdDuration
        if v42 == nil then
            v42 = u9.promptHoldDuration
        end
    end
    v41.HoldDuration = v42
    v41.Parent = u36
    v41.MaxActivationDistance = u37.maxActivationDistance
    local u43 = v40:createProximityPrompt(v41)
    u43.Triggered:Connect(function(p44) --[[ Line: 193 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u36
            [3] = u37
            [4] = u43
        --]]
        local function v45() --[[ Line: 194 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u36
                [3] = u37
            --]]
            u35:removePrompt(u36, u37.interactionTag)
        end
        u37.onInteracted(p44, u36, u43, v45)
        if u37.removePromptOnInteract then
            u35:removePrompt(u36, u37.interactionTag)
        end
    end)
    if u37.promptButtonHoldBegan ~= nil then
        u43.PromptButtonHoldBegan:Connect(function(p46) --[[ Line: 203 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u36
                [3] = u43
            --]]
            local v47 = u37.promptButtonHoldBegan
            if v47 ~= nil then
                v47(p46, u36, u43)
            end
        end)
    end
    if u37.promptButtonHoldEnded ~= nil then
        u43.PromptButtonHoldBegan:Connect(function(p48) --[[ Line: 211 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u36
                [3] = u43
            --]]
            local v49 = u37.promptButtonHoldEnded
            if v49 ~= nil then
                v49(p48, u36, u43)
            end
        end)
    end
    local v50 = u35.proximityPrompts[u37.interactionTag] or {}
    local v51 = u35.proximityPrompts
    local v52 = u37.interactionTag
    local v53 = {}
    local v54 = #v53
    local v55 = #v50
    table.move(v50, 1, v55, v54 + 1, v53)
    v53[v54 + v55 + 1] = u43
    v51[v52] = v53
    u35.onPromptCreated:Fire(u43, u37.interactionTag)
    return u43
end
function u14.removePrompt(p56, p57, p58) --[[ Line: 241 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v59 = p56.proximityPrompts[p58]
    if not v59 then
        return false
    end
    local v60 = false
    local v61 = 0
    local v62 = nil
    while true do
        if v60 then
            v61 = v61 + 1
        else
            v60 = true
        end
        if v61 >= #v59 then
            break
        end
        if v59[v61 + 1].Parent == p57 then
            v62 = v59[v61 + 1]
            break
        end
    end
    if not v62 then
        return false
    end
    table.remove(v59, v61 + 1)
    v62:Destroy()
    u7:RemoveTag(p57, p58)
    return true
end
return {
    ["InteractionPriority"] = v11,
    ["InteractionCategory"] = v13,
    ["InteractionRegistryController"] = v3.CreateController(u14.new())
}