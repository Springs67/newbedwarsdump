local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent, "ui", "goose-indicator-app").GooseIndicatorApp
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "GoldenGooseIndicatorController"
    end,
    ["__index"] = u5
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
        [1] = u5
    --]]
    u5.constructor(p10)
    p10.Name = "GoldenGooseIndicatorController"
end
function u7.KnitStart(p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u2
        [4] = u6
    --]]
    u5.KnitStart(p11)
    u3("ActiveGoose", function(p12) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
        --]]
        if not p12.PrimaryPart then
            p12:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("goose-indicator")
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            ["appId"] = "goose-indicator",
            ["app"] = u6
        }, {
            ["billboardAdornee"] = p12.PrimaryPart
        }, nil, p12.PrimaryPart)
    end)
end
v4.CreateController(u7.new())
return nil