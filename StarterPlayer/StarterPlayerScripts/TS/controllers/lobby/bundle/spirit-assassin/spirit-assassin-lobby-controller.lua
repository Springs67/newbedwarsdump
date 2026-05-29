local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "SpiritAssassinLobbyController"
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
    --]]
    u5.constructor(p9)
    p9.Name = "SpiritAssassinLobbyController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u4
    --]]
    u5.KnitStart(p10)
    local u11 = {
        Color3.fromRGB(255, 89, 89),
        Color3.fromRGB(218, 133, 65),
        Color3.fromRGB(91, 154, 76),
        Color3.fromRGB(82, 124, 174),
        Color3.fromRGB(180, 128, 255)
    }
    u2("prismatic-text", function(p12) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u11
        --]]
        local v13 = 1
        while p12.Parent ~= nil do
            local v14 = u4:Create(p12, TweenInfo.new(1), {
                ["TextColor3"] = u11[v13 + 1]
            })
            v14:Play()
            v14.Completed:Wait()
            local v15 = v13 + 1
            v13 = #u11 <= v15 and 0 or v15
        end
    end)
end
v3.CreateController(u6.new())
return nil