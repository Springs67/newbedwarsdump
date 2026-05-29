local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "shared-constants").IS_DEV
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "DebugPartComponent"
    end
})
u2.__index = u2
function u2.new(...) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(_, p5) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if not p5:IsA("BasePart") then
        error("Any instance with DebugPart tag must be a BasePart")
    end
    p5.CanCollide = false
    p5.Transparency = u1 and 0.5 or 1
end
function u2.Destroy(_) --[[ Line: 24 ]] end
u2.Tag = "DebugPart"
return u2