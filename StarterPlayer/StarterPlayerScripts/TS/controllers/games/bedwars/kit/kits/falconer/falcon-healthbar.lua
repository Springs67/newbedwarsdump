local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local v11 = u6.Component:extend("FalconHealthbar")
function v11.init(p12, _) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    p12.progressFrame = u6.createRef()
    p12.maid = u5.new()
    p12.characterMaid = u5.new()
    p12:setState({
        ["health"] = 100
    })
end
function v11.didMount(p13) --[[ Line: 23 ]]
    p13:hookCharacter(p13.props.instance)
end
function v11.hookCharacter(u14, u15) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if not u15 then
        return nil
    end
    u14.maid:DoCleaning()
    local u16 = u15:GetAttribute("Health")
    local u17 = u15:GetAttribute("MaxHealth")
    local function u22(p18, p19) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u7
            [3] = u16
            [4] = u17
        --]]
        u14:setState({
            ["health"] = math.max(0, p18)
        })
        local v20 = p18 / p19
        local v21 = math.clamp(v20, 0, 1)
        u7:Create(u14.progressFrame:getValue(), TweenInfo.new(0.3), {
            ["Size"] = UDim2.fromScale(v21, 1)
        }):Play()
        u16 = p18
        u17 = p19
    end
    local v23 = u16
    local v24 = u17
    u22(v23 == nil and 1 or v23, v24 == nil and 1 or v24)
    u14.maid:GiveTask(u15:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u15
            [3] = u17
        --]]
        u22(u15:GetAttribute("Health"), u17)
    end))
    u14.maid:GiveTask(u15:GetAttributeChangedSignal("MaxHealth"):Connect(function() --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u16
            [3] = u15
        --]]
        u22(u16, u15:GetAttribute("MaxHealth"))
    end))
end
function v11.render(p25) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u9
        [4] = u3
        [5] = u6
        [6] = u4
    --]]
    local v26 = u8:getLocalPlayerEntity()
    local _ = p25.state.health
    local v27
    if v26 == nil then
        v27 = v26
    else
        v27 = v26:getMaxHealth()
    end
    local _ = v27 == nil and 100 or v27
    local v28 = Color3.fromHex("#EC8D2F")
    if v26 ~= nil then
        v26 = v26:getInstance()
    end
    if v26 and u10:isActive(v26, u9.DECAY) then
        v28 = u3.hexColor(13970113)
    end
    return u6.createFragment({
        ["FalconHealthbarContainer"] = u6.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.6, 0.18),
            ["Position"] = UDim2.fromScale(0.5, -0.45),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["BackgroundColor3"] = u3.hexColor(2700097)
        }, {
            ["FalconHealthbarProgressWrapper"] = u6.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u6.createElement("Frame", {
                    [u6.Ref] = p25.progressFrame,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = v28,
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 0
                }) })
        })
    })
end
function v11.willUnmount(p29) --[[ Line: 114 ]]
    p29.characterMaid:DoCleaning()
    p29.maid:DoCleaning()
end
return {
    ["FalconHealthbar"] = v11
}