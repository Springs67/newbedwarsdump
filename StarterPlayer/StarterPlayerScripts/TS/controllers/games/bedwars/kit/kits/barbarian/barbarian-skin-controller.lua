local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "BarbarianSkinController"
    end,
    ["__index"] = u4
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
        [1] = u4
    --]]
    u4.constructor(p9)
    p9.Name = "BarbarianSkinController"
end
function u6.KnitStart(_) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    u2(function(u10, u11, p12) --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        p12:GiveTask(u10:GetAttributeChangedSignal("BarbarianRageLevel"):Connect(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u11
                [3] = u10
            --]]
            u5.updateAppearance(u11, u10:GetAttribute("BarbarianRageLevel"))
        end))
        local v13 = u10:GetAttribute("BarbarianRageLevel")
        if v13 ~= nil then
            u5.updateAppearance(u11, v13)
        end
    end)
end
v3.CreateController(u6.new())
return nil