local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "prod-animations").ProdAnimations
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, script.Parent, "animation-test-app").AnimationTestApp
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "AnimationTestController"
    end,
    ["__index"] = u5
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p13)
    p13.Name = "AnimationTestController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u4
        [4] = u7
        [5] = u6
        [6] = u2
        [7] = u9
    --]]
    u5.KnitStart(p14)
    u8.Client:Get("OpenAnimationTest"):Connect(function() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
            [3] = u6
            [4] = u2
            [5] = u9
        --]]
        local v15 = u4.keys(u7)
        local v16 = u4.values(u7)
        local v17 = table.create(#v15)
        for v18, v19 in v15 do
            local v20 = v18 - 1
            v17[v18] = {
                ["Key"] = u6[v19],
                ["AssetId"] = v16[v20 + 1]
            }
        end
        local v21 = {
            ["appId"] = "AnimationTestApp",
            ["app"] = u9
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v21, {
            ["AnimationMap"] = v17
        })
    end)
end
v3.CreateController(u10.new())
return nil