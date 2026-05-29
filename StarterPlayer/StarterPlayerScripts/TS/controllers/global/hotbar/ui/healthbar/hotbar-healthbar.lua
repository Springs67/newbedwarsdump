local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.TweenService
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u15 = v1.import(script, script.Parent, "shield").Shield
local v16 = u7.Component:extend("HotbarHealthbar")
function v16.init(p17, _) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    p17.progressFrame = u7.createRef()
    p17.maid = u6.new()
    p17.characterMaid = u6.new()
    p17:setState({
        ["health"] = 100,
        ["shield"] = 0
    })
end
function v16.didMount(u18) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if u9.LocalPlayer then
        u18.characterMaid:GiveTask(u9.LocalPlayer.CharacterAdded:Connect(function(p19) --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18:hookCharacter(p19)
        end))
        if u9.LocalPlayer.Character then
            u18:hookCharacter(u9.LocalPlayer.Character)
        end
    end
end
function v16.hookCharacter(u20, u21) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u5
        [4] = u12
    --]]
    u20.maid:DoCleaning()
    local u22 = u21:GetAttribute("Health")
    local u23 = u21:GetAttribute("MaxHealth")
    local function u28(p24, p25) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u10
            [3] = u22
            [4] = u23
        --]]
        u20:setState({
            ["health"] = math.max(0, p24)
        })
        local v26 = p24 / p25
        local v27 = math.clamp(v26, 0, 1)
        u10:Create(u20.progressFrame:getValue(), TweenInfo.new(0.3), {
            ["Size"] = UDim2.fromScale(v27, 1)
        }):Play()
        u22 = p24
        u23 = p25
    end
    local v29 = u22
    local v30 = u23
    u28(v29 == nil and 1 or v29, v30 == nil and 1 or v30)
    u20.maid:GiveTask(u21:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u21
            [3] = u23
        --]]
        u28(u21:GetAttribute("Health"), u23)
    end))
    u20.maid:GiveTask(u21:GetAttributeChangedSignal("MaxHealth"):Connect(function() --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u22
            [3] = u21
        --]]
        u28(u22, u21:GetAttribute("MaxHealth"))
    end))
    local u31 = u11:getEntity(u21)
    if u31 then
        for v32, v33 in u5.values(u12) do
            local _ = v32 - 1
            u20.maid:GiveTask(u31:onShieldChanged(v33):Connect(function() --[[ Line: 74 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u12
                    [3] = u31
                    [4] = u20
                --]]
                local v34 = 0
                local v35 = v34
                for v36, v37 in u5.values(u12) do
                    local _ = v36 - 1
                    local v38 = u31
                    if v38 ~= nil then
                        v38 = v38:getShield(v37)
                    end
                    v34 = v35 + (v38 == nil and 0 or v38)
                    v35 = v34
                end
                u20:setState({
                    ["shield"] = v35
                })
            end))
        end
    end
end
function v16.render(p39) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u12
        [4] = u7
        [5] = u15
        [6] = u3
        [7] = u14
        [8] = u13
        [9] = u4
    --]]
    local v40 = u11:getLocalPlayerEntity()
    local v41 = u5.values(u12)
    local v42 = table.create(#v41)
    for v43, v44 in v41 do
        local _ = v43 - 1
        v42[v43] = u7.createElement(u15, {
            ["ShieldType"] = v44
        })
    end
    local v45 = p39.state.health + p39.state.shield
    local v46
    if v40 == nil then
        v46 = v40
    else
        v46 = v40:getMaxHealth()
    end
    local v47 = v46 == nil and 100 or v46
    local v48 = u3.hexColor(13317668)
    if v40 ~= nil then
        v40 = v40:getInstance()
    end
    if v40 and u14:isActive(v40, u13.DECAY) then
        v48 = u3.hexColor(13970113)
    end
    local v49 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.85, 0.2),
        ["Position"] = UDim2.fromScale(0.5, -0.2),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["BackgroundColor3"] = u3.hexColor(2700097)
    }
    local v50 = {}
    local v51 = #v50
    local v52 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v53 = { u7.createElement("Frame", {
            [u7.Ref] = p39.progressFrame,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = v48,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 0
        }) }
    local _ = #v53
    local v54 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v55 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = v45 < v47 and "Left" or "Right"
        }) }
    local v56 = #v55
    for v57, v58 in v42 do
        v55[v56 + v57] = v58
    end
    v53.ShieldBarContainer = u7.createElement(u4, v54, v55)
    v50.HealthbarProgressWrapper = u7.createElement(u4, v52, v53)
    local v59 = v51 + 1
    local v60 = u7.createElement
    local v61 = "TextLabel"
    local v62 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["TextScaled"] = true,
        ["Font"] = "LuckiestGuy",
        ["ZIndex"] = 11
    }
    local v63 = p39.state.health
    local v64 = math.round(v63)
    local v65 = tostring(v64)
    local v66 = " "
    local v67
    if p39.state.shield > 0 then
        local v68 = p39.state.shield
        local v69 = math.round(v68)
        v67 = "(+" .. tostring(v69) .. ")"
    else
        v67 = ""
    end
    v62.Text = v65 .. v66 .. v67
    v62.Size = UDim2.fromScale(0.3, 1.4)
    v62.Position = UDim2.fromScale(0.5, 0)
    v62.AnchorPoint = Vector2.new(0.5, 0.35)
    v62.TextColor3 = Color3.fromRGB(255, 255, 255)
    v50[v59] = v60(v61, v62)
    return u7.createFragment({
        ["HotbarHealthbarContainer"] = u7.createElement("Frame", v49, v50)
    })
end
function v16.willUnmount(p70) --[[ Line: 189 ]]
    p70.characterMaid:DoCleaning()
    p70.maid:DoCleaning()
end
return {
    ["HotbarHealthbar"] = v16
}