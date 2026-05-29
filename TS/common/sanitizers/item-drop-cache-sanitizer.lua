local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "common", "sanitizers", "team-gen-item-drop-sanitizer").TeamGenItemDropSanitizer
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "ItemDropCacheSanitizer"
    end,
    ["__index"] = u1
})
u2.__index = u2
function u2.new(...) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(p5, ...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    u1.constructor(p5, ...)
end
function u2.sanitizeOnRetrieve(_, _) --[[ Line: 21 ]]
    return nil
end
function u2.sanitizeOnStore(p6, p7) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v8 = u1.sanitizeOnStore(p6, p7)
    if v8 then
        local v9 = p7:FindFirstChildOfClass("BodyForce")
        if v9 ~= nil then
            v9:Destroy()
        end
        local v10 = p7:FindFirstChildOfClass("BodyGyro")
        if v10 ~= nil then
            v10:Destroy()
        end
    end
    return v8
end
return {
    ["ItemDropCacheSanitizer"] = u2
}