local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local v8 = {}
local u9 = setmetatable({}, {
    ["__index"] = v8
})
u9.HORIZONTAL_SLIDE = 0
v8[0] = "HORIZONTAL_SLIDE"
u9.ROTATE = 1
v8[1] = "ROTATE"
local function v31(u10, p11) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u9
        [4] = u6
        [5] = u7
        [6] = u2
    --]]
    local v12 = p11.useState
    local v13 = p11.useEffect
    local v14 = {}
    for v15, v16 in u10 do
        v14[v15] = v16
    end
    v14.Animation = nil
    local u17, _ = v12(u4.createRef())
    v13(function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u3
            [3] = u10
            [4] = u9
            [5] = u6
            [6] = u7
            [7] = u2
        --]]
        local u18 = u17:getValue()
        if not u18 then
            return nil
        end
        local u19 = u3.new()
        local v20 = u10.Animation
        if v20 == u9.HORIZONTAL_SLIDE then
            local u21 = true
            local u22 = u18.Rotation
            u19:GiveTask(function() --[[ Line: 42 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21 = false
            end)
            local u23 = 3
            u19:GiveTask(u6.Heartbeat:Connect(function(p24) --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u18
                    [3] = u22
                    [4] = u7
                    [5] = u2
                --]]
                u23 = u23 + p24
                if u23 >= 3 then
                    if u18.Rotation == u22 + 0 then
                        u18.Rotation = u22 + 180
                        u18.Offset = Vector2.new(1, 0)
                        u7(3, u2, function(p25) --[[ Line: 52 ]]
                            --[[
                            Upvalues:
                                [1] = u18
                            --]]
                            u18.Offset = p25
                        end, Vector2.new(1, 0), Vector2.new(-1, 0))
                    else
                        u18.Rotation = u22 + 0
                        u18.Offset = Vector2.new(1, 0)
                        u7(3, u2, function(p26) --[[ Line: 58 ]]
                            --[[
                            Upvalues:
                                [1] = u18
                            --]]
                            u18.Offset = p26
                        end, Vector2.new(1, 0), Vector2.new(-1, 0))
                    end
                    u23 = 0
                end
            end))
        elseif v20 == u9.ROTATE then
            u19:GiveTask(u6.Heartbeat:Connect(function(p27) --[[ Line: 69 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18.Rotation = (u18.Rotation + 45 * p27) % 360
            end))
        end
        return function() --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            u19:DoCleaning()
        end
    end, {})
    local v28 = {}
    for v29, v30 in v14 do
        v28[v29] = v30
    end
    v28[u4.Ref] = u17
    return u4.createElement("UIGradient", v28)
end
return {
    ["GradientAnimationType"] = u9,
    ["Gradient"] = v5.new(u4)(v31)
}