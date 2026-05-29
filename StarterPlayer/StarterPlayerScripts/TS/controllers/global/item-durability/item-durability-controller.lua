local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "ItemDurabilityController"
    end,
    ["__index"] = u4
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p10)
    p10.Name = "ItemDurabilityController"
end
function u7.KnitStart(p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u3
        [4] = u5
    --]]
    u4.KnitStart(p11)
    u6.Client:Get("ItemDurabilityBroken"):Connect(function(p12) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        if p12.itemOwner then
            local v13 = p12.itemOwner:GetPivot().Position
            u3.ItemDurabilityBroken:fire(v13)
        end
    end)
    u3.HandItemRendered:connect(function(u14) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
        --]]
        local v15 = u14.tool
        if v15 ~= nil then
            v15 = v15:GetAttribute("Durability")
        end
        if v15 == 0 or (v15 ~= v15 or (v15 == "" or not (v15 and u14.tool))) then
            return nil
        end
        u14.tool:GetAttributeChangedSignal("Durability"):Connect(function() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u5
                [3] = u3
            --]]
            if u14.tool then
                local v16 = u14.tool:GetAttribute("Durability")
                local v17 = u5:getPlayerFromEntityInstance(u14.entity)
                u3.ItemDurabilityChanged:fire(u14.tool, v16, v17)
            end
        end)
    end)
end
v2.CreateController(u7.new())
return nil