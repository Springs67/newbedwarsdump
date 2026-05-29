local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "DroneLobbyController"
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
    p9.Name = "DroneLobbyController"
end
function u6.KnitStart(p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u4
    --]]
    u5.KnitStart(p10)
    u2("LobbyDrone", function(u11) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        local u12 = math.random()
        local u13 = u11:GetPrimaryPartCFrame()
        local u14 = u12 * 5
        u4.RenderStepped:Connect(function(p15) --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u12
                [3] = u13
                [4] = u11
            --]]
            u14 = u14 + p15
            local v16 = 6.283185307179586 * u14 * 0.2
            local v17 = math.sin(v16) * (u12 * 0.8 + 0.2)
            u11:PivotTo(u13 + Vector3.new(0, v17, 0))
        end)
    end)
end
v3.CreateController(u6.new())
return nil