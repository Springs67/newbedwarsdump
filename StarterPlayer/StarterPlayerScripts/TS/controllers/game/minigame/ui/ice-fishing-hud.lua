local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Countdown
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "KnitClient")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta")
local u14 = v13.getMinigameMeta
local u15 = v13.MinigameType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-util").MinigameUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
return {
    ["IceFishingHUD"] = v11.new(u10)(function(_, p18) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u16
            [3] = u12
            [4] = u14
            [5] = u15
            [6] = u17
            [7] = u10
            [8] = u5
            [9] = u3
            [10] = u4
            [11] = u9
            [12] = u8
            [13] = u7
        --]]
        local v19 = p18.useEffect
        local v20 = p18.useState
        local u21
        if u6.isHoarceKat() then
            u21 = nil
        else
            u21 = u16:getMinigameTeamIdByPlayer(u12.LocalPlayer)
        end
        local v22, u23 = v20({})
        local v24 = os.time()
        local v25 = u14(u15.ICE_FISHING).duration
        local v26, _ = v20(v24 + (v25 == nil and 90 or v25))
        v19(function() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u17
                [3] = u23
            --]]
            if u6.isHoarceKat() then
                return nil
            end
            local u28 = u17.Client:Get("IceFishingScoreUpdated"):Connect(function(p27) --[[ Line: 35 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23(p27.scoreUpdate)
            end)
            return function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:Disconnect()
            end
        end, {})
        local v29 = {}
        local v30 = #v29
        local v31 = {
            ["Size"] = UDim2.fromScale(0.8, 0.1),
            ["Position"] = UDim2.fromScale(0.5, 0.02),
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        }
        local v32 = {
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }),
            u10.createElement(u5, {
                ["EndTime"] = v26,
                ["TextLabel"] = {
                    ["Size"] = UDim2.fromScale(0.4, 0.4),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                },
                ["CountdownConfig"] = {
                    ["minutes"] = true,
                    ["hours"] = false,
                    ["days"] = false
                }
            }),
            ["HudTitleWrapper"] = u10.createElement("Frame", {
                ["AutomaticSize"] = "XY",
                ["BackgroundTransparency"] = 0.4,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0, 0.3),
                ["BackgroundColor3"] = Color3.fromRGB(33, 235, 255)
            }, {
                u10.createElement("UIListLayout", {
                    ["HorizontalAlignment"] = "Center"
                }),
                u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.2, 0)
                }),
                u10.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0, 6),
                    ["PaddingRight"] = UDim.new(0, 6),
                    ["PaddingTop"] = UDim.new(0, 6),
                    ["PaddingBottom"] = UDim.new(0, 6)
                }),
                u10.createElement(u3, {
                    ["Text"] = "TEAM POINTS",
                    ["TextSize"] = u6.isSmallScreen() and 16 or 20,
                    ["TextColor3"] = u4.WHITE,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["Font"] = Enum.Font.GothamBold
                })
            })
        }
        local _ = #v32
        local v33 = u9.entries(v22)
        table.sort(v33, function(p34, p35) --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            local v36 = p34[1]
            local _ = p34[2]
            local _ = p35[1]
            local _ = p35[2]
            return v36 == u21
        end)
        local function v45(p37) --[[ Line: 118 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u10
                [3] = u21
            --]]
            local v38 = p37[1]
            local v39 = p37[2]
            local v40 = u8.Controllers.MinigameTeamController:getTeam(v38)
            if not v40 then
                return nil
            end
            local v41 = {
                ["SizeConstraint"] = "RelativeYY",
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = v40.color
            }
            local v42 = { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }) }
            local v43 = #v42
            local v44
            if v38 == u21 then
                v44 = u10.createElement("UIStroke", {
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
            v42.PlayersRemaining = u10.createElement("TextLabel", {
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
            return u10.createFragment({
                ["TeamBox"] = u10.createElement("Frame", v41, v42)
            })
        end
        local v46 = 0
        local v47 = {}
        local v48 = {
            ["ResetOnSpawn"] = false,
            ["DisplayOrder"] = 99
        }
        for v49, v50 in v33 do
            local v51 = v45(v50, v49 - 1, v33)
            if v51 ~= nil then
                v46 = v46 + 1
                v47[v46] = v51
            end
        end
        local v52 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.65)
        }
        local v53 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v54 = #v53
        for v55, v56 in v47 do
            v53[v54 + v55] = v56
        end
        v32.TeamScores = u10.createElement(u7, v52, v53)
        v29[v30 + 1] = u10.createElement(u7, v31, v32)
        return u10.createFragment({
            ["IceFishingHud"] = u10.createElement("ScreenGui", v48, v29)
        })
    end)
}