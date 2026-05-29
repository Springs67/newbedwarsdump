local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "StatusEffectController"
    end,
    ["__index"] = u9
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p16)
    p16.Name = "StatusEffectController"
    p16.handlerClassDefinitionsMap = {}
    p16.handlerClassInstancesMap = {}
    p16.statusEffectMaids = {}
end
function u13.KnitStart(u17) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u10
        [4] = u12
        [5] = u8
        [6] = u3
        [7] = u5
        [8] = u11
    --]]
    u9.KnitStart(u17)
    u7.PlayerRemoving:Connect(function(p18) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u12
            [3] = u8
            [4] = u17
        --]]
        local v19 = u10:getEntity(p18)
        if v19 ~= nil then
            v19 = v19:getInstance()
        end
        if not v19 then
            return nil
        end
        for _, v20 in u12:getAllActive(v19) do
            u8.StatusEffectRemoved:fire(v19, v20.statusEffect)
            local v21 = u17.statusEffectMaids[v20.statusEffect]
            if v21 ~= nil then
                local v22 = v21[v19]
                if v22 ~= nil then
                    v22:DoCleaning()
                end
            end
        end
    end)
    u3("entity", function(u23) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u17
            [3] = u5
            [4] = u11
        --]]
        local u24 = {}
        for v25, v26 in u12:getAllActive(u23) do
            local _ = v25 - 1
            u17:setupStatusEffect(u23, v26.statusEffect, u24)
        end
        for v27, u28 in u5.values(u11) do
            local _ = v27 - 1
            local u29 = u12:getAttributeName(u28)
            u23:GetAttributeChangedSignal(u29):Connect(function() --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u29
                    [3] = u17
                    [4] = u28
                    [5] = u24
                --]]
                local v30 = u23:GetAttribute(u29)
                if v30 == 0 or (v30 ~= v30 or (v30 == "" or not v30)) then
                    local v31 = u17.statusEffectMaids[u28]
                    if v31 ~= nil then
                        local v32 = v31[u23]
                        if v32 ~= nil then
                            v32:DoCleaning()
                            return
                        end
                    end
                else
                    u17:setupStatusEffect(u23, u28, u24)
                end
            end)
        end
    end)
end
function u13.setHandler(p33, p34, p35) --[[ Line: 100 ]]
    p33.handlerClassDefinitionsMap[p34] = p35
end
function u13.setupStatusEffect(p36, u37, u38, u39) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u2
        [3] = u6
        [4] = u10
        [5] = u8
    --]]
    local u40 = u12:getAttributeName(u38)
    local u41 = u2.getOrCreate(p36.statusEffectMaids, u38, {})
    local u42 = u2.getOrCreate(u41, u37, u6.new())
    local v43 = u37:GetAttribute(u40)
    if v43 == 0 or (v43 ~= v43 or not v43) then
        u42:DoCleaning()
        return nil
    end
    if not u10:getEntity(u37) then
        return nil
    end
    if u39[u38] ~= nil then
        u8.StatusEffectReapplied:fire(u37, u38)
        return nil
    end
    u39[u38] = true
    u8.StatusEffectAdded:fire(u37, u38)
    local u44 = p36.handlerClassInstancesMap[u38]
    if u44 then
        u44:apply(u37, u38)
    else
        local v45 = p36.handlerClassDefinitionsMap[u38]
        if v45 then
            u44 = v45.new()
            p36.handlerClassInstancesMap[u38] = u44
            u44:apply(u37, u38)
        end
    end
    u42:GiveTask(u37:GetAttributeChangedSignal(u40 .. "_stacks"):Connect(function() --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u40
            [3] = u8
            [4] = u38
        --]]
        if u37:GetAttribute(u40 .. "_stacks") ~= nil then
            u8.StatusEffectChanged:fire(u37, u38)
        end
    end))
    u42:GiveTask(u37:GetAttributeChangedSignal(u40):Connect(function() --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u40
            [3] = u8
            [4] = u38
        --]]
        if u37:GetAttribute(u40) ~= nil then
            u8.StatusEffectChanged:fire(u37, u38)
        end
    end))
    u42:GiveTask(function() --[[ Line: 168 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u37
            [3] = u38
            [4] = u39
            [5] = u44
            [6] = u41
            [7] = u42
        --]]
        u8.StatusEffectRemoved:fire(u37, u38)
        u39[u38] = nil
        local v46 = u44
        if v46 ~= nil then
            v46:remove(u37, u38)
        end
        u41[u37] = nil
        u42:Destroy()
    end)
end
v4.CreateController(u13.new())
return nil