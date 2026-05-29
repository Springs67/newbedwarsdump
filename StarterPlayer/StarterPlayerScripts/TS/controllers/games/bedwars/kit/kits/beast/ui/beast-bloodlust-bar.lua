local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "beast", "beast-util").BeastKit
local v8 = u5.Component:extend("BeastBloodlustBar")
function v8.init(p9, _) --[[ Line: 12 ]]
    p9.state = {
        ["bloodlust"] = p9:getBloodlust()
    }
end
function v8.getBloodlust(_) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v10 = u6.LocalPlayer:GetAttribute("BeastBloodlust")
    return type(v10) ~= "number" and 0 or v10
end
function v8.didMount(u11) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u11.bloodlustSignal = u6.LocalPlayer:GetAttributeChangedSignal("BeastBloodlust"):Connect(function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:setState({
            ["bloodlust"] = u11:getBloodlust()
        })
    end)
end
function v8.willUnmount(p12) --[[ Line: 28 ]]
    local v13 = p12.bloodlustSignal
    if v13 ~= nil then
        v13:Disconnect()
    end
end
function v8.render(p14) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u4
        [4] = u3
    --]]
    local v15 = p14.state.bloodlust / u7.BloodlustRequired
    local v16 = math.clamp(v15, 0.001, 1)
    local v17 = {
        ["Size"] = p14.props.Size,
        ["Position"] = p14.props.Position,
        ["AnchorPoint"] = p14.props.AnchorPoint
    }
    local v18 = {}
    local v19 = #v18
    local v20 = {
        ["Hide"] = false,
        ["Progress"] = v16,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v21 = p14.props.ProgressBarConfig
    if v21 then
        for v22, v23 in v21 do
            v20[v22] = v23
        end
    end
    local v24 = {}
    local v25 = #v24
    local v26 = p14.props[u5.Children]
    if v26 then
        for v27, v28 in v26 do
            if type(v27) == "number" then
                v24[v25 + v27] = v28
            else
                v24[v27] = v28
            end
        end
    end
    v18[v19 + 1] = u5.createElement(u4, v20, v24)
    return u5.createElement(u3, v17, v18)
end
return {
    ["BeastBloodlustBar"] = v8
}