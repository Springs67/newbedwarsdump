local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "BrReleaseController"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p10)
    p10.Name = "BrReleaseController"
end
function u7.KnitStart(p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u4
        [4] = u5
    --]]
    u6.KnitStart(p11)
    u2("br-spin", function(u12) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u5
        --]]
        if not u12.PrimaryPart then
            u12:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        local u13 = u12:GetPrimaryPartCFrame()
        local u14 = 0
        local u15 = u4.new()
        u15:GiveTask(u5.Heartbeat:Connect(function(p16) --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u15
                [3] = u14
                [4] = u13
            --]]
            if u12.PrimaryPart == nil then
                u15:DoCleaning()
                return nil
            end
            u14 = u14 + p16
            local v17 = u13 * CFrame.Angles(0, 6.283185307179586 * u14 * 0.22, 0)
            local v18 = 6.283185307179586 * u14 * 0.2
            local v19 = math.sin(v18) * 0.7 - 0.35
            u12:PivotTo(v17 + Vector3.new(0, v19, 0))
        end))
    end)
end
v3.CreateController(u7.new())
return nil