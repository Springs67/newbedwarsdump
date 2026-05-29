local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "gun-game", "gun-game-stages").gunGameStages
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v9 = {}
local u10 = setmetatable({}, {
    ["__index"] = v9
})
u10.FIRST = 0
v9[0] = "FIRST"
u10.MIDDLE = 1
v9[1] = "MIDDLE"
u10.LAST = 2
v9[2] = "LAST"
local u11 = {
    ["start"] = 1,
    ["progress"] = 1,
    ["place"] = "1st (tied)",
    ["highlightFirst"] = true,
    ["highlightMiddle"] = false,
    ["highlightLast"] = false,
    ["win"] = #u5,
    ["lastImageId"] = u6(u5[1][1].item).image,
    ["currentImageId"] = u6(u5[2][1].item).image,
    ["nextImageId"] = u6(u5[3][1].item).image
}
local u12 = u4.Component:extend("HudProgress")
function u12.init(p13, _) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u11
    --]]
    p13.connectionMaid = u3.new()
    p13:setState({
        ["progress"] = u11.progress,
        ["lastImageId"] = u11.lastImageId,
        ["currentImageId"] = u11.currentImageId,
        ["nextImageId"] = u11.nextImageId,
        ["place"] = u11.place,
        ["highlightFirst"] = u11.highlightFirst,
        ["highlightMiddle"] = u11.highlightMiddle,
        ["highlightLast"] = u11.highlightLast
    })
    p13:listenForProgressUpdates()
    p13:listenForLeaderboardUpdates()
end
function u12.render(p14) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
    --]]
    return u4.createFragment({
        p14:createStageIndicator(),
        p14:createWeaponLabel(Vector2.new(0.44, 0.06), p14.state.lastImageId, u10.FIRST),
        p14:createWeaponLabel(Vector2.new(0.51, 0.06), p14.state.currentImageId, u10.MIDDLE),
        p14:createWeaponLabel(Vector2.new(0.58, 0.06), p14.state.nextImageId, u10.LAST),
        p14:createPlaceIndicator()
    })
end
function u12.willUnmount(p15) --[[ Line: 64 ]]
    p15.connectionMaid:DoCleaning()
end
function u12.createStageIndicator(p16) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
        [3] = u4
    --]]
    local v17 = 0.925 * (p16.state.progress / p16.props.win)
    local v18 = u2.brighten(u8.backgroundPrimary, 0.3)
    local v19 = u4.createFragment
    local v20 = {}
    local v21 = u4.createElement("Frame", {
        ["BackgroundTransparency"] = 0.25,
        ["Size"] = UDim2.fromScale(0.19, 0.027),
        ["Position"] = UDim2.fromScale(0.41, 0.11),
        ["BackgroundColor3"] = u8.backgroundPrimary
    }, { u4.createElement("UIStroke", {
            ["Thickness"] = 1,
            ["Color"] = v18
        }), u4.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.2, 0)
        }), u4.createElement("Frame", {
            ["Size"] = UDim2.fromScale(v17, 0.5),
            ["Position"] = UDim2.fromScale(0.04, 0.25),
            ["BackgroundColor3"] = v18
        }, { u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.2, 0)
            }) }) })
    local v22 = u4.createElement
    local v23 = {
        ["BackgroundTransparency"] = 1,
        ["TextStrokeTransparency"] = 0,
        ["RichText"] = true,
        ["TextScaled"] = true,
        ["ZIndex"] = 3,
        ["Position"] = UDim2.fromScale(0.565, 0.105),
        ["FontSize"] = Enum.FontSize.Size28,
        ["Size"] = UDim2.fromScale(0.05, 0.05),
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
        ["Font"] = Enum.Font.LuckiestGuy
    }
    local v24 = p16.state.progress
    local v25 = tostring(v24)
    local v26 = p16.props.win
    v23.Text = v25 .. " / " .. tostring(v26)
    __set_list(v20, 1, {v21, v22("TextLabel", v23)})
    return v19(v20)
end
function u12.createPlaceIndicator(p27) --[[ Line: 111 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4.createElement("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["TextStrokeTransparency"] = 0,
        ["RichText"] = true,
        ["Position"] = UDim2.fromScale(0.51, 0),
        ["FontSize"] = Enum.FontSize.Size24,
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
        ["Font"] = Enum.Font.LuckiestGuy,
        ["Text"] = p27.state.place
    })
end
function u12.createWeaponLabel(p28, p29, p30, p31) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
        [3] = u4
        [4] = u2
    --]]
    local v32
    if p31 == u10.FIRST then
        v32 = p28.state.highlightFirst
    else
        v32 = false
    end
    local v33
    if p31 == u10.MIDDLE then
        v33 = p28.state.highlightMiddle
    else
        v33 = false
    end
    local v34
    if p31 == u10.LAST then
        v34 = p28.state.highlightLast
    else
        v34 = false
    end
    local v35 = {
        ["transparency"] = 0.7,
        ["backgroundColor"] = u8.backgroundPrimary,
        ["strokeColor"] = u8.backgroundPrimary,
        ["size"] = UDim2.fromScale(0.05, 0.05)
    }
    if v32 or v33 then
        v35.size = UDim2.fromScale(0.07, 0.07)
        v35.transparency = 0
    end
    if v34 then
        v35.size = UDim2.fromScale(0.07, 0.07)
        v35.transparency = 0
        v35.backgroundColor = Color3.new(220, 188, 129)
        v35.strokeColor = Color3.new(220, 188, 129)
    end
    return u4.createElement("ImageLabel", {
        ["BackgroundTransparency"] = 0.5,
        ["Position"] = UDim2.fromScale(p29.X, p29.Y),
        ["Size"] = v35.size,
        ["ScaleType"] = Enum.ScaleType.Fit,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Image"] = p30,
        ["BackgroundColor3"] = v35.backgroundColor,
        ["ImageTransparency"] = v35.transparency
    }, { u4.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = u2.brighten(v35.strokeColor, 0.3)
        }), u4.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        }) })
end
function u12.listenForProgressUpdates(u36) --[[ Line: 165 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u6
        [4] = u5
    --]]
    local v41 = u7.Client:WaitFor("GunGameUpdate"):expect():Connect(function(p37) --[[ Line: 166 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u11
            [3] = u6
            [4] = u5
        --]]
        local v38, v39, v40
        if p37.progress == u36.props.start then
            v38 = u11.lastImageId
            v39 = u11.currentImageId
            v40 = u11.nextImageId
            u36:updateHighlightStates(true, false, false)
        elseif p37.progress == u36.props.win then
            v38 = u6(u5[p37.progress - 3 + 1][1].item).image
            v39 = u6(u5[p37.progress - 2 + 1][1].item).image
            v40 = u6(u5[p37.progress - 1 + 1][1].item).image
            u36:updateHighlightStates(false, false, true)
        else
            v38 = u6(u5[p37.progress - 2 + 1][1].item).image
            v39 = u6(u5[p37.progress - 1 + 1][1].item).image
            v40 = u6(u5[p37.progress + 1][1].item).image
            u36:updateHighlightStates(false, true, false)
        end
        u36:setState({
            ["progress"] = p37.progress,
            ["lastImageId"] = v38,
            ["currentImageId"] = v39,
            ["nextImageId"] = v40
        })
    end)
    u36.connectionMaid:GiveTask(v41)
end
function u12.listenForLeaderboardUpdates(u42) --[[ Line: 198 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v45 = u7.Client:WaitFor("GunGameLeaderboardUpdate"):expect():Connect(function(p43) --[[ Line: 199 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        local v44 = u42:ordinalSuffix(p43.place)
        if p43.tied then
            v44 = v44 .. " (tied)"
        end
        u42:setState({
            ["place"] = v44
        })
    end)
    u42.connectionMaid:GiveTask(v45)
end
function u12.ordinalSuffix(_, p46) --[[ Line: 210 ]]
    local v47 = p46 % 10
    local v48 = p46 % 100
    if v47 == 1 and v48 ~= 11 then
        return tostring(p46) .. "st"
    elseif v47 == 2 and v48 ~= 12 then
        return tostring(p46) .. "nd"
    elseif v47 == 3 and v48 ~= 13 then
        return tostring(p46) .. "rd"
    else
        return tostring(p46) .. "th"
    end
end
function u12.updateHighlightStates(p49, p50, p51, p52) --[[ Line: 224 ]]
    p49:setState({
        ["highlightFirst"] = p50,
        ["highlightMiddle"] = p51,
        ["highlightLast"] = p52
    })
end
return {
    ["HudProgressWrapper"] = function() --[[ Name: HudProgressWrapper, Line 232 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u12
            [3] = u11
        --]]
        return u4.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u4.createElement(u12, {
                ["start"] = u11.start,
                ["win"] = u11.win
            }) })
    end,
    ["HudProgress"] = u12
}