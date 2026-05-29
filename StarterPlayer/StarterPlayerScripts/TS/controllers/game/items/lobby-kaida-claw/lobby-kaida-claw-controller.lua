local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "LobbyKaidaClawController"
    end,
    ["__index"] = u3
})
u5.__index = u5
function u5.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p8)
    p8.Name = "LobbyKaidaClawController"
end
function u5.KnitStart(p9) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.KnitStart(p9)
end
function u5.isRelevantItem(_, p10) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return p10.itemType == u4.LOBBY_KAIDA_CLAW
end
function u5.onEnable(_, _) --[[ Line: 30 ]] end
function u5.onDisable(_) --[[ Line: 32 ]] end
v2.CreateController(u5.new())
return nil