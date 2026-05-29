local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.StringUtil
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v10 = u7.Component:extend("KitShopToolbar")
function v10.init(p11, _) --[[ Line: 14 ]]
    p11.alive = true
    p11:setState({
        ["time"] = p11:getTime()
    })
end
function v10.didMount(u12) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    u1.Promise.defer(function() --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        while true do
            local v13 = task.wait(0.2)
            if v13 ~= 0 and (v13 == v13 and v13) then
                v13 = u12.alive
            end
            if v13 == 0 or (v13 ~= v13 or not v13) then
                return
            end
            u12:setState({
                ["time"] = u12:getTime()
            })
        end
    end)
end
function v10.willUnmount(p14) --[[ Line: 36 ]]
    p14.alive = false
end
function v10.getTime(_) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u6
        [4] = u8
        [5] = u5
    --]]
    local v15
    if u4.isHoarceKat() then
        v15 = os.time() + 604800
    elseif u9.isLobbyServer() then
        v15 = u6.Controllers.LobbyUpdateCountdownController:getUpdateTime()
    else
        v15 = u8.resetTime:getNextWeeklyResetTime()
    end
    local v16 = v15 - os.time()
    local v17 = math.max(0, v16)
    return u5.formatCountdownTime(v17, {
        ["days"] = true,
        ["hours"] = true,
        ["seperator"] = " : "
    })
end
function v10.render(p18) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
    --]]
    local v19 = "Next free rotation: <font face=\"Roboto\"><b>" .. p18.state.time .. "</b></font>"
    return u7.createElement("Frame", {
        ["BorderSizePixel"] = 0,
        ["Size"] = p18.props.Size,
        ["BackgroundColor3"] = u3.hexColor(3092550)
    }, { u7.createElement("TextLabel", {
            ["Text"] = "Kit Shop",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["Size"] = UDim2.fromScale(0.3, 0.5),
            ["Position"] = UDim2.fromScale(0.03, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }), u7.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Font"] = "Roboto",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["TextXAlignment"] = "Right",
            ["Text"] = v19,
            ["Size"] = UDim2.fromScale(0.97, 0.4),
            ["Position"] = UDim2.fromScale(0.95, 0.5),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }) })
end
return {
    ["KitShopToolbar"] = v10
}