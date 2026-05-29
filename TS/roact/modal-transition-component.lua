local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u3 = v2.SingleMotor
local u4 = v2.Spring
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "binding-util").BindingFromMotor
local v8 = u6.Component:extend("ModalTransitionComponent")
function v8.init(u9, u10) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u7
        [4] = u4
    --]]
    u9._maid = u5.new()
    u9.ScaleMotor = u3.new(0)
    u9.ScaleBinding = u7(u9.ScaleMotor)
    u9._maid:GiveTask(u10.Close:Connect(function(u11) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u10
        --]]
        u9.ScaleMotor:setGoal(u4.new(0, {
            ["dampingRatio"] = 1,
            ["frequency"] = u10.CloseSpeed
        }))
        u9.ScaleMotor:onComplete(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u11
            --]]
            u9._maid:DoCleaning()
            if u11 then
                u11()
            end
        end)
    end))
end
function v8.didMount(p12) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v13 = p12.ScaleMotor
    local v14 = {}
    local v15 = p12.props.OpenSpeed
    v14.frequency = (v15 == 0 or (v15 ~= v15 or not v15)) and 3.5 or v15
    v14.dampingRatio = 0.8
    v13:setGoal(u4.new(1, v14))
end
function v8.render(p16) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v17 = {
        ["Active"] = true,
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = p16.props.AnchorPoint,
        ["Position"] = p16.props.Position,
        ["Size"] = p16.props.Size
    }
    local v18 = { u6.createElement("UIScale", {
            ["Scale"] = p16.ScaleBinding
        }) }
    local v19 = #v18
    local v20 = p16.props[u6.Children]
    if v20 then
        for v21, v22 in v20 do
            if type(v21) == "number" then
                v18[v19 + v21] = v22
            else
                v18[v21] = v22
            end
        end
    end
    return u6.createElement("Frame", v17, v18)
end
function v8.willUnmount(p23) --[[ Line: 67 ]]
    p23._maid:DoCleaning()
end
v8.defaultProps = {
    ["CloseSpeed"] = 6
}
return v8