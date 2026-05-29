local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-util").MinigameUtil
return {
    ["MinigameTeamScoreHud"] = v10.new(u9)(function(p13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u12
            [3] = u11
            [4] = u7
            [5] = u9
            [6] = u4
            [7] = u3
            [8] = u8
            [9] = u6
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local u17
        if u5.isHoarceKat() then
            u17 = nil
        else
            u17 = u12:getMinigameTeamIdByPlayer(u11.LocalPlayer)
        end
        local v18, u19 = v15(nil)
        v16(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u7
                [3] = u19
            --]]
            if u5.isHoarceKat() then
                return nil
            end
            local v20 = u7.Controllers.MinigameController
            if v20.scoreSnapshot then
                u19(v20.scoreSnapshot)
            end
            local u22 = v20.scoreUpdateSignal:Connect(function(p21) --[[ Line: 27 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                u19(p21)
            end)
            return function() --[[ Line: 30 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                u22:Disconnect()
            end
        end, {})
        local v23 = {
            ["ResetOnSpawn"] = false,
            ["DisplayOrder"] = 99
        }
        local v24 = {}
        local v25 = #v24
        local v26 = {
            ["Size"] = UDim2.fromScale(0.8, 0.125),
            ["Position"] = UDim2.fromScale(0.5, 0.02),
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        }
        local v27 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local _ = #v27
        local v28 = {
            ["AutomaticSize"] = "XY",
            ["BackgroundTransparency"] = 0.4,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0, 0.3),
            ["BackgroundColor3"] = Color3.fromRGB(33, 235, 255)
        }
        local v29 = { u9.createElement("UIListLayout", {
                ["HorizontalAlignment"] = "Center"
            }), u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.2, 0)
            }), u9.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 6),
                ["PaddingRight"] = UDim.new(0, 6),
                ["PaddingTop"] = UDim.new(0, 6),
                ["PaddingBottom"] = UDim.new(0, 6)
            }) }
        local v30 = #v29
        local v31 = {}
        local v32 = p13.Minigame.teamScoresHud
        if v32 ~= nil then
            v32 = string.upper(v32.title)
        end
        v31.Text = v32 == nil and "TEAM POINTS" or v32
        v31.TextSize = u5.isSmallScreen() and 16 or 20
        v31.TextColor3 = u4.WHITE
        v31.Position = UDim2.fromScale(0.5, 0.5)
        v31.AnchorPoint = Vector2.new(0.5, 0.5)
        v31.TextXAlignment = Enum.TextXAlignment.Center
        v31.TextYAlignment = Enum.TextYAlignment.Center
        v31.Font = Enum.Font.GothamBold
        v29[v30 + 1] = u9.createElement(u3, v31)
        v27.HudTitleWrapper = u9.createElement("Frame", v28, v29)
        if v18 then
            local v33 = u8.entries(v18)
            table.sort(v33, function(p34, p35) --[[ Line: 100 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                local v36 = p34[1]
                local _ = p34[2]
                local _ = p35[1]
                local _ = p35[2]
                return v36 == u17
            end)
            local function v45(p37) --[[ Line: 111 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u9
                    [3] = u17
                --]]
                local v38 = p37[1]
                local v39 = p37[2]
                local v40 = u7.Controllers.MinigameTeamController:getTeam(v38)
                if not v40 then
                    return nil
                end
                local v41 = {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = v40.color
                }
                local v42 = { u9.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.1, 0)
                    }) }
                local v43 = #v42
                local v44
                if u17 == v38 then
                    v44 = u9.createElement("UIStroke", {
                        ["Thickness"] = 2,
                        ["Color"] = Color3.fromRGB(255, 255, 255)
                    })
                else
                    v44 = false
                end
                if v44 then
                    v42[v43 + 1] = v44
                end
                local _ = #v42
                v42.TeamScore = u9.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.8, 0.7),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Text"] = "<b>" .. tostring(v39) .. "</b>",
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.Roboto
                })
                return u9.createFragment({
                    ["TeamBox"] = u9.createElement("Frame", v41, v42)
                })
            end
            local v46 = 0
            v18 = {}
            for v47, v48 in v33 do
                local v49 = v45(v48, v47 - 1, v33)
                if v49 ~= nil then
                    v46 = v46 + 1
                    v18[v46] = v49
                end
            end
        end
        local v50 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.65)
        }
        local v51 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, u5.isSmallScreen() and 6 or 10)
            }) }
        local v52 = #v51
        if v18 then
            for v53, v54 in v18 do
                v51[v52 + v53] = v54
            end
        end
        v27.TeamScores = u9.createElement(u6, v50, v51)
        v24[v25 + 1] = u9.createElement(u6, v26, v27)
        return u9.createFragment({
            ["SnowballDodgeballHud"] = u9.createElement("ScreenGui", v23, v24)
        })
    end)
}