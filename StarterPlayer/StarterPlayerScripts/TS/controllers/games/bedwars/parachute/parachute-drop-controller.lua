local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").Tween
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "ParachuteDropController"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p11)
    p11.Name = "ParachuteDropController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u5
        [4] = u4
        [5] = u3
    --]]
    u6.KnitStart(p12)
    u7.Client:OnEvent("ParachuteDrop", function(p13) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u3
        --]]
        for _, u14 in p13 do
            task.spawn(function() --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u5
                    [3] = u4
                    [4] = u3
                --]]
                if u14.model.PrimaryPart == nil then
                    u14.model:GetPropertyChangedSignal("PrimaryPart"):Wait()
                end
                u5(u14.arriveTime - 0.1 - u4:GetServerTimeNow(), u3, function(p15) --[[ Line: 35 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                    --]]
                    if u14.model.PrimaryPart then
                        u14.model:PivotTo(CFrame.new(p15))
                    end
                end, u14.model:GetPrimaryPartCFrame().Position, u14.position)
            end)
        end
    end)
end
v2.CreateController(u8.new())
return nil