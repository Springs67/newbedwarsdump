local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.ReplicatedStorage
local u7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "SparklingAppleJuiceController"
    end,
    ["__index"] = u9
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15, ...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p15, ...)
    p15.Name = "SparklingAppleJuiceController"
    p15.entityInstanceMaid = {}
end
function u12.KnitStart(u16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u10
        [4] = u11
        [5] = u5
    --]]
    u9.KnitStart(u16)
    u8.ItemConsumed:connect(function(p17) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u16
        --]]
        if p17.itemType == u10.SPARKLING_APPLE_JUICE then
            local v18 = p17.entity:getInstance()
            u16.entityInstanceMaid[v18] = u16:setEffectsOnCharacter(v18)
        end
    end)
    u8.StatusEffectRemoved:connect(function(p19) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u16
        --]]
        if p19.statusEffect == u11.SPEED then
            u16:removeEffects(p19.entityInstance)
        end
    end)
    u5:GetInstanceRemovedSignal("entity"):Connect(function(p20) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:removeEffects(p20)
    end)
end
function u12.removeEffects(p21, p22) --[[ Line: 53 ]]
    local v23 = p21.entityInstanceMaid[p22]
    if v23 then
        v23:DoCleaning()
        p21.entityInstanceMaid[p22] = nil
    end
end
function u12.setEffectsOnCharacter(_, p24) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u7
        [4] = u5
    --]]
    local v25 = u3.new()
    local v26 = u6.Assets.Effects.SparklingAppleJuiceEffect:Clone()
    v26.Parent = u7
    local v27 = v26.Trail
    v27.Parent = p24
    v27.Attachment0 = p24.LowerTorso.WaistCenterAttachment
    v27.Attachment1 = p24.UpperTorso.NeckAttachment
    u5:AddTag(v27, "FirstPersonHidden")
    v25:GiveTask(v27)
    local v28 = v26.Bubbles
    v28.Parent = p24.UpperTorso
    u5:AddTag(v28, "FirstPersonHidden")
    v25:GiveTask(v28)
    local v29 = v26.Sparkles
    v29.Parent = p24.UpperTorso
    u5:AddTag(v29, "FirstPersonHidden")
    v25:GiveTask(v29)
    return v25
end
v2.CreateController(u12.new())
return nil