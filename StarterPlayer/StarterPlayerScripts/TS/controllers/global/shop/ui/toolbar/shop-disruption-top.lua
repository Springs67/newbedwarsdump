local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.TweenService
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local v12 = u7.Component:extend("ShopDisruptionTop")
function v12.init(p13) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    p13.disruptionHeader = u7.createRef()
end
function v12.didMount(p14) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v15 = p14.disruptionHeader:getValue()
    if v15 then
        u10:Create(v15, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
            ["Size"] = UDim2.fromScale(1, 0.55)
        }):Play()
    end
end
function v12.render(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u6
        [4] = u7
        [5] = u3
        [6] = u5
    --]]
    local v17 = not u4.isHoarceKat()
    if v17 then
        local v18 = u9.LocalPlayer:GetAttribute("DisruptionPriceIncrease")
        if v18 == 0 or v18 ~= v18 then
            v18 = false
        elseif v18 == "" then
            v18 = false
        end
        v17 = not v18
    end
    if v17 then
        return nil
    end
    local v19
    if u4.isHoarceKat() then
        v19 = "blue"
    else
        v19 = u6.Controllers.TeamController:getPlayerTeam(u9.LocalPlayer)
        if v19 ~= nil then
            v19 = v19.name
        end
    end
    local v20 = {}
    if not u4.isHoarceKat() then
        for _, v21 in u9:GetPlayers() do
            local v22 = v21:GetAttribute("DisruptorActivation")
            if v22 ~= 0 and (v22 == v22 and (v22 ~= "" and v22)) then
                v22 = v21:GetAttribute("DisruptorTarget") == v19
            end
            if v22 ~= 0 and (v22 == v22 and (v22 ~= "" and v22)) then
                table.insert(v20, v21)
            end
            if #v20 >= 3 then
                break
            end
        end
    end
    local v23 = {
        ["Size"] = p16.props.Size
    }
    local v24 = { u7.createElement("ImageLabel", {
            ["Image"] = "rbxassetid://11637830425",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }) }
    local _ = #v24
    local v25 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 4,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BorderMode"] = Enum.BorderMode.Inset
    }
    local v26 = { u7.createElement("TextLabel", {
            ["Text"] = "<b>\226\150\178 YOUR SHOP IS BEING DISRUPTED \226\150\178</b>",
            [u7.Ref] = p16.disruptionHeader,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.25),
            ["Size"] = UDim2.fromScale(1, 0.5),
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = Enum.Font.RobotoMono,
            ["TextColor3"] = u3.hexColor(15423319),
            ["BackgroundTransparency"] = 1
        }) }
    local v27 = #v26
    local v28 = table.create(#v20)
    local v29 = {}
    for v30, v31 in v20 do
        local _ = v30 - 1
        v28[v30] = p16:getNameString(v31)
    end
    v29.Text = "Eliminate <b>" .. table.concat(v28, ", ") .. "</b> to restore prices."
    v29.AnchorPoint = Vector2.new(0.5, 0.5)
    v29.Position = UDim2.fromScale(0.5, 0.75)
    v29.Size = UDim2.fromScale(1, 0.5)
    v29.TextScaled = true
    v29.RichText = true
    v29.Font = Enum.Font.RobotoMono
    v29.TextColor3 = u3.hexColor(15423319)
    v29.BackgroundTransparency = 1
    v29.AutoLocalize = false
    v26[v27 + 1] = u7.createElement("TextLabel", v29)
    v24.DisruptionHeader = u7.createElement("Frame", v25, v26)
    return u7.createElement(u5, v23, v24)
end
function v12.getNameString(_, p32) --[[ Line: 120 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v33 = p32.TeamColor.r * 255
    local v34 = math.round(v33)
    local v35 = tostring(v34)
    local v36 = p32.TeamColor.g * 255
    local v37 = math.round(v36)
    local v38 = tostring(v37)
    local v39 = p32.TeamColor.b * 255
    local v40 = math.round(v39)
    return "<font color=\"rgb(" .. v35 .. "," .. v38 .. "," .. tostring(v40) .. ")\">\226\150\160</font> " .. u11.getGamePlayer(p32):getDisplayName()
end
return {
    ["ShopDisruptionTop"] = v12
}