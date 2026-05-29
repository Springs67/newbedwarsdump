local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "WinEffect"
    end,
    ["__index"] = u2
})
v4.__index = v4
function v4.constructor(p5, p6) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.constructor(p5)
    p5.winEffectType = p6
    p5.Name = "WinEffect"
    p5.Client = {}
end
function v4.KnitStart(u7) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.Client:Get("WinEffectTriggered"):Connect(function(p8) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        if p8.winEffectType ~= u7.winEffectType then
            return nil
        end
        u7:onWin(p8.winningPlayer)
    end)
end
return {
    ["WinEffect"] = v4
}