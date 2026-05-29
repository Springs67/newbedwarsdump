local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local v10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "bw-player-render")
local u11 = v10.BWPlayerRender
local u12 = v10.PlayerRenderFallbackMode
return {
    ["KillFeedCardEntity"] = v8.new(u7)(function(p13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u4
            [3] = u9
            [4] = u3
            [5] = u7
            [6] = u11
            [7] = u12
            [8] = u5
        --]]
        local _ = p14.useState
        local v15 = p13.Entity.teamId
        local v16
        if v15 == "" or not v15 then
            v16 = nil
        else
            v16 = u6.Controllers.TeamController:getTeamById(p13.Entity.teamId)
        end
        local v17
        if u4.isHoarceKat() then
            v17 = false
        else
            v17 = u9.LocalPlayer.UserId == p13.Entity.userId
        end
        local v18 = { Color3.fromRGB(62, 174, 255), Color3.fromRGB(42, 113, 165) }
        local v19
        if v17 then
            v19 = { Color3.fromRGB(255, 213, 62), Color3.fromRGB(165, 131, 42) }
        else
            local v20 = p13.Entity.teamId
            local v21 = u6.Controllers.TeamController:getPlayerTeam(u9.LocalPlayer)
            if v21 ~= nil then
                v21 = v21.id
            end
            v19 = v20 ~= v21 and { Color3.fromRGB(255, 62, 62), Color3.fromRGB(164, 39, 39) } or v18
        end
        local v22 = {
            ["AutomaticSize"] = "X",
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0, 1),
            ["BackgroundColor3"] = u3.WHITE,
            ["LayoutOrder"] = p13.Position == "left" and 1 or 3
        }
        local v23 = { u7.createElement("UIGradient", {
                ["Rotation"] = p13.Position == "left" and 180 or 0,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v19[1]), ColorSequenceKeypoint.new(1, v19[2]) })
            }), u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 0)
            }) }
        local v24 = #v23
        if v16 then
            v16 = u7.createFragment({
                ["TeamIndicator"] = u7.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.new(0, 4, 1, 0),
                    ["BackgroundColor3"] = v16.color,
                    ["LayoutOrder"] = p13.Position == "left" and 1 or 5
                })
            })
        end
        if v16 then
            v23[v24 + 1] = v16
        end
        local v25 = #v23
        local v26
        if p13.Entity.userId == nil then
            v26 = false
        else
            v26 = u7.createFragment({
                ["EntityImage"] = u7.createElement(u11, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["FallbackMode"] = u12.KIT,
                    ["PlayerUserId"] = p13.Entity.userId,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["LayoutOrder"] = p13.Position == "left" and 2 or 4
                })
            })
        end
        if v26 then
            v23[v25 + 1] = v26
        end
        local v27 = #v23
        local v28
        if p13.Entity.icon == nil then
            v28 = false
        else
            v28 = u7.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = p13.Entity.icon,
                ["LayoutOrder"] = p13.Position == "left" and 2 or 4
            })
        end
        if v28 then
            v23[v27 + 1] = v28
        end
        local v29 = #v23 + 1
        local v30 = u7.createElement
        local v31 = u5
        local v32 = {
            ["AutomaticSize"] = "X",
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0, 0.9)
        }
        local v33 = { (u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, u4.isSmallScreen() and 2 or 6),
                ["PaddingBottom"] = UDim.new(0, u4.isSmallScreen() and 2 or 6),
                ["PaddingLeft"] = UDim.new(0, u4.isSmallScreen() and 4 or 8),
                ["PaddingRight"] = UDim.new(0, u4.isSmallScreen() and 4 or 8)
            })) }
        local v34 = u7.createElement
        local v35 = "TextLabel"
        local v36 = {
            ["TextScaled"] = true,
            ["AutomaticSize"] = "X",
            ["AutoLocalize"] = false,
            ["SizeConstraint"] = "RelativeYY",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 1,
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Size"] = UDim2.fromScale(0, 1),
            ["Text"] = p13.Entity.name,
            ["TextColor3"] = u3.WHITE,
            ["Font"] = Enum.Font.GothamBold
        }
        local v37
        if p13.Position == "left" then
            v37 = Enum.TextXAlignment.Left
        else
            v37 = Enum.TextXAlignment.Right
        end
        v36.TextXAlignment = v37
        v33.EntityName = v34(v35, v36)
        v23[v29] = v30(v31, v32, v33)
        return u7.createFragment({
            ["KillerSection"] = u7.createElement("Frame", v22, v23)
        })
    end)
}