local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u5 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "DuckWalkEmoteController"
    end,
    ["__index"] = u3
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p9)
    p9.Name = "DuckWalkEmoteController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u4
        [4] = u5
    --]]
    u3.KnitStart(p10)
    local v11 = u2.Controllers.EmoteHandlerController
    local v12 = u4.DUCK_WALK
    local u13 = u5
    local u14 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
            return "Anonymous"
        end,
        ["__index"] = u13
    })
    u14.__index = u14
    function u14.new(...) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        local v15 = u14
        local v16 = setmetatable({}, v15)
        return v16:constructor(...) or v16
    end
    function u14.constructor(p17, ...) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.constructor(p17, ...)
    end
    function u14.onEnable(_, _, _, _, _) --[[ Line: 46 ]] end
    function u14.onDisable(_, _, _, _) --[[ Line: 48 ]] end
    v11:registerHandler(v12, u14)
end
u2.CreateController(u6.new())
return nil