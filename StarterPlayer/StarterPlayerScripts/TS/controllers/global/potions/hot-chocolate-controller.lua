local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.ReplicatedStorage
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "HotChocolateController"
    end,
    ["__index"] = u8
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14, ...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p14, ...)
    p14.Name = "HotChocolateController"
    p14.entityInstanceMaid = {}
end
function u11.KnitStart(u15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u9
        [4] = u10
        [5] = u5
    --]]
    u8.KnitStart(u15)
    u7.ItemConsumed:connect(function(p16) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u15
        --]]
        if p16.itemType == u9.HOT_CHOCOLATE then
            local v17 = p16.entity:getInstance()
            u15:removeEffects(v17)
            u15.entityInstanceMaid[v17] = u15:setEffectsOnCharacter(v17)
        end
    end)
    u7.StatusEffectRemoved:connect(function(p18) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u15
        --]]
        if p18.statusEffect == u10.TOASTY then
            u15:removeEffects(p18.entityInstance)
        end
    end)
    u5:GetInstanceRemovedSignal("entity"):Connect(function(p19) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15:removeEffects(p19)
    end)
end
function u11.removeEffects(p20, p21) --[[ Line: 53 ]]
    local v22 = p20.entityInstanceMaid[p21]
    if v22 then
        v22:DoCleaning()
        p20.entityInstanceMaid[p21] = nil
    end
end
function u11.setEffectsOnCharacter(_, p23) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u5
    --]]
    local v24 = u3.new()
    local v25 = u6.Assets.Effects.HotChocolate:Clone()
    local v26 = v25.Smoke
    v26.Parent = p23.UpperTorso.BodyFrontAttachment
    u5:AddTag(v26, "FirstPersonHidden")
    v24:GiveTask(v26)
    local v27 = v25.PointLight
    v27.Parent = p23.Head
    v24:GiveTask(v27)
    return v24
end
v2.CreateController(u11.new())
return nil