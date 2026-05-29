local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u5 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "IceQueenProgressController"
    end,
    ["__index"] = u5
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
        [1] = u5
        [2] = u4
        [3] = u3
    --]]
    u5.constructor(p9, { u4.ICE_QUEEN })
    p9.Name = "IceQueenProgressController"
    p9.maid = u3.new()
end
function u6.KnitStart(p10) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.KnitStart(p10)
end
function u6.onKitEnabled(_) --[[ Line: 29 ]] end
function u6.onKitDisabled(_) --[[ Line: 31 ]] end
v2.CreateController(u6.new())
return nil