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
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
return {
    ["ColorBlockHUD"] = v10.new(u9)(function(_, p14) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u12
            [3] = u11
            [4] = u13
            [5] = u9
            [6] = u3
            [7] = u4
            [8] = u8
            [9] = u7
            [10] = u6
        --]]
        local v15 = p14.useEffect
        local v16 = p14.useState
        local u17
        if u5.isHoarceKat() then
            u17 = nil
        else
            u17 = u12:getMinigameTeamIdByPlayer(u11.LocalPlayer)
        end
        local v18, u19 = v16({})
        v15(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u13
                [3] = u19
            --]]
            if u5.isHoarceKat() then
                return nil
            end
            local u21 = u13.Client:Get("ColorBlockScoreUpdated"):Connect(function(p20) --[[ Line: 25 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                u19(p20.scoreUpdate)
            end)
            return function() --[[ Line: 28 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:Disconnect()
            end
        end, {})
        local v22 = {}
        local v23 = #v22
        local v24 = {
            ["Size"] = UDim2.fromScale(0.8, 0.1),
            ["Position"] = UDim2.fromScale(0.5, 0.02),
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        }
        local v25 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }),
            ["HudTitleWrapper"] = u9.createElement("Frame", {
                ["AutomaticSize"] = "XY",
                ["BackgroundTransparency"] = 0.4,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0, 0.3),
                ["BackgroundColor3"] = Color3.fromRGB(33, 235, 255)
            }, {
                u9.createElement("UIListLayout", {
                    ["HorizontalAlignment"] = "Center"
                }),
                u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.2, 0)
                }),
                u9.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0, 6),
                    ["PaddingRight"] = UDim.new(0, 6),
                    ["PaddingTop"] = UDim.new(0, 6),
                    ["PaddingBottom"] = UDim.new(0, 6)
                }),
                u9.createElement(u3, {
                    ["Text"] = "TEAM POINTS",
                    ["TextSize"] = u5.isSmallScreen() and 16 or 20,
                    ["TextColor3"] = u4.WHITE,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["Font"] = Enum.Font.GothamBold
                })
            })
        }
        local _ = #v25
        local v26 = u8.entries(v18)
        table.sort(v26, function(p27, p28) --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            local v29 = p27[1]
            local _ = p27[2]
            local _ = p28[1]
            local _ = p28[2]
            return v29 == u17
        end)
        local function v38(p30) --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u9
                [3] = u17
            --]]
            local v31 = p30[1]
            local v32 = p30[2]
            local v33 = u7.Controllers.MinigameTeamController:getTeam(v31)
            if not v33 then
                return nil
            end
            local v34 = {
                ["SizeConstraint"] = "RelativeYY",
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = v33.color
            }
            local v35 = { u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }) }
            local v36 = #v35
            local v37
            if u17 == v31 then
                v37 = u9.createElement("UIStroke", {
                    ["Thickness"] = 2,
                    ["Color"] = Color3.fromRGB(255, 255, 255)
                })
            else
                v37 = false
            end
            if v37 then
                v35[v36 + 1] = v37
            end
            local _ = #v35
            v35.PlayersRemaining = u9.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.8, 0.7),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = "<b>" .. tostring(v32) .. "</b>",
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Font"] = Enum.Font.Roboto
            })
            return u9.createFragment({
                ["TeamBox"] = u9.createElement("Frame", v34, v35)
            })
        end
        local v39 = 0
        local v40 = {}
        local v41 = {
            ["ResetOnSpawn"] = false,
            ["DisplayOrder"] = 99
        }
        for v42, v43 in v26 do
            local v44 = v38(v43, v42 - 1, v26)
            if v44 ~= nil then
                v39 = v39 + 1
                v40[v39] = v44
            end
        end
        local v45 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.65)
        }
        local v46 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v47 = #v46
        for v48, v49 in v40 do
            v46[v47 + v48] = v49
        end
        v25.TeamScores = u9.createElement(u6, v45, v46)
        v22[v23 + 1] = u9.createElement(u6, v24, v25)
        return u9.createFragment({
            ["ColorBlockHud"] = u9.createElement("ScreenGui", v41, v22)
        })
    end)
}