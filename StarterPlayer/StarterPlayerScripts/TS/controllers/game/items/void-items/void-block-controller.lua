local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "VoidBlockController"
    end,
    ["__index"] = u7
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p11)
    p11.Name = "VoidBlockController"
    p11.timer = 0
end
function u8.KnitStart(p12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u5
        [4] = u6
        [5] = u4
    --]]
    u7.KnitStart(p12)
    u2("void_block", function(u13) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
            [3] = u4
        --]]
        local u14 = u5.new()
        local u15 = u13:WaitForChild("Part", 3)
        if u15 == nil then
            return nil
        end
        local u17 = u6(1.5, u4, function(p16) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            u15.Transparency = p16
        end, u15.Transparency, 1)
        local u19 = u6(1.5, u4, function(p18) --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.Transparency = p18
        end, u13.Transparency, 1)
        u14:GiveTask(function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u19
            --]]
            u17:Cancel()
            u19:Cancel()
        end)
        u15.AncestryChanged:Connect(function(_, p20) --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            if p20 == nil then
                u14:DoCleaning()
            end
        end)
    end)
end
v3.CreateController(u8.new())
return nil