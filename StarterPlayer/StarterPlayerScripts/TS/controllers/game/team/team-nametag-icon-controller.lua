local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local _ = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local _ = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "TeamNametagIconController"
    end,
    ["__index"] = u5
})
u6.__index = u6
function u6.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p9)
    p9.Name = "TeamNametagIconController"
end
function u6.KnitStart(_) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    u2(function(p10, _) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        if p10 == u4.LocalPlayer then
            return nil
        else
            return nil
        end
    end)
end
return {
    ["TeamNametagIconController"] = v3.CreateController(u6.new())
}