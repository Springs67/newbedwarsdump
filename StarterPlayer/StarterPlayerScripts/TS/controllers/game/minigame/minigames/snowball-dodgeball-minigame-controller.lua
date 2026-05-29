local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta").MinigameType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "SnowballDodgeballMinigameController"
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
    p9.Name = "SnowballDodgeballMinigameController"
end
function u6.KnitStart(u10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u4
    --]]
    u3.KnitStart(u10)
    u5.Client:WaitFor("MinigameStarted"):expect():Connect(function(p11) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u10
        --]]
        if p11.minigame.type == u4.SNOWBALL_DODGEBALL then
            u10:onMinigameStart()
        end
    end)
    u5.Client:WaitFor("MinigameEnded"):expect():Connect(function(p12) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u10
        --]]
        if p12.minigame.type == u4.SNOWBALL_DODGEBALL then
            u10:onMinigameEnded()
        end
    end)
end
function u6.onMinigameStart(_) --[[ Line: 40 ]] end
function u6.onMinigameEnded(_) --[[ Line: 42 ]] end
v2.CreateController(u6.new())
return nil