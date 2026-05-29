local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u3 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local v4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "LegacyKitKnitController"
    end,
    ["__index"] = u2
})
v4.__index = v4
function v4.constructor(p5, p6) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.constructor(p5)
    p5.kits = p6
    p5.enabled = false
end
function v4.KnitStart(u7) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
    --]]
    local function u11(p8) --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u1
        --]]
        if p8.Bedwars.kit then
            local v9 = u7.kits
            local v10 = p8.Bedwars.kit
            if table.find(v9, v10) ~= nil then
                if u7.enabled then
                    return nil
                end
                u7.enabled = true
                u1.Promise.defer(function() --[[ Line: 34 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                    --]]
                    u7:onKitEnabled()
                end)
                return nil
            end
        end
        if not u7.enabled then
            return nil
        end
        u7.enabled = false
        u1.Promise.defer(function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            u7:onKitDisabled()
        end)
    end
    u3.changed:connect(function(p12, p13) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        if p12.Bedwars.kit ~= p13.Bedwars.kit then
            u11(p12)
        end
    end)
    u11(u3:getState())
end
function v4.isEnabled(p14) --[[ Line: 55 ]]
    return p14.enabled
end
function v4.getHandItem(p15) --[[ Line: 58 ]]
    return p15.handItem
end
return {
    ["LegacyKitKnitController"] = v4
}