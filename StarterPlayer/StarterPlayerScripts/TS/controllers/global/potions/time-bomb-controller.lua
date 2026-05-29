local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "TimeBombController"
    end,
    ["__index"] = u4
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p10)
    p10.Name = "TimeBombController"
end
function u7.KnitStart(p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
        [4] = u6
        [5] = u3
    --]]
    u4.KnitStart(p11)
    u5.Client:WaitFor("ActivateTimeBomb"):andThen(function(p12) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
            [3] = u3
        --]]
        p12:Connect(function(p13) --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u6
                [3] = u3
            --]]
            u2:playSound(u6.TNT_EXPLODE_1, {
                ["rollOffMaxDistance"] = 220,
                ["position"] = p13.position
            })
            u3.Controllers.ExplosionController:playExplodeEffect(p13.position, 1, {})
        end)
    end)
end
u3.CreateController(u7.new())
return nil