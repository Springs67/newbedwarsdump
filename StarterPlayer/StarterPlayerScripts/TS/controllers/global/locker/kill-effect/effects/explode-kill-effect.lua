local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "Anonymous"
    end,
    ["__index"] = u3
})
u4.__index = u4
function u4.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(p7, ...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p7, ...)
end
function u4.onKill(_, _, _, p8) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2.Controllers.ExplosionController:playExplodeEffect(p8.Position, 0.5, {})
end
return u4