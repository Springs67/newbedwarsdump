local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u7 = v1.import(script, script.Parent, "diamond-guardian-client").DiamondGuardianClient
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "DiamondGuardianController"
    end,
    ["__index"] = u4
})
u8.__index = u8
function u8.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p11)
    p11.Name = "DiamondGuardianController"
end
function u8.KnitStart(u12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u5
    --]]
    u4.KnitStart(u12)
    u2(u5.DIAMOND_GUARDIAN, function(p13) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:spawnGuardian(p13)
    end)
end
function u8.spawnGuardian(_, p14) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    local v15 = u6:getGameEntityCFrame(p14)
    local v16 = p14:GetAttribute("EntityUUID")
    u7.new(v15, v16, p14)
end
v3.CreateController(u8.new())
return nil