local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "FireworkArrowController"
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
    p9.Name = "FireworkArrowController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u2
        [4] = u5
    --]]
    u3.KnitStart(p10)
    u4.Client:OnEvent("FireworkArrowExplode", function(p11) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
        --]]
        u2.Controllers.FireworkController:playFireworkEffect(p11.position, u5.NORMAL)
    end)
end
u2.CreateController(u6.new())
return nil