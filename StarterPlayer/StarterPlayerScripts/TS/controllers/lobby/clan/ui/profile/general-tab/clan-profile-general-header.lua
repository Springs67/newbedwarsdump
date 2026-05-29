local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Countdown
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-border-meta").ClanBorderMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u12 = v1.import(script, script.Parent.Parent, "war-tab", "clan-war-medals-display").ClanWarMedalsDisplay
return {
    ["ClanProfileGeneralHeader"] = v7.new(u6)(function(p13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u5
            [4] = u3
            [5] = u11
            [6] = u10
            [7] = u12
            [8] = u9
            [9] = u4
        --]]
        local _ = p14.useState
        local v15 = u8:getState().Clans.myClan
        local function v19(p16) --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u5
                [3] = u3
            --]]
            local v17 = p16.Stat
            local v18 = p16.Value
            return u6.createElement(u5, {
                ["Size"] = UDim2.fromScale(1, 0.2)
            }, { u6.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["TextTransparency"] = 0.3,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["TextColor3"] = u3.WHITE,
                    ["Text"] = v17
                }, { u6.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 16
                    }) }), u6.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Right",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["AutoLocalize"] = false,
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["Position"] = UDim2.fromScale(1, 0),
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["TextColor3"] = u3.WHITE,
                    ["Text"] = "<b>" .. v18 .. "</b>"
                }, { u6.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 16
                    }) }) })
        end
        local v20 = {}
        for v21, v22 in p13 do
            v20[v21] = v22
        end
        v20.GuestView = nil
        v20.Clan = nil
        local v23 = {}
        for v24, v25 in v20 do
            v23[v24] = v25
        end
        local v26 = { u6.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0),
                ["PaddingTop"] = UDim.new(0.1, 0)
            }), u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.1, 0)
            }) }
        local _ = #v26
        local v27 = {
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
        local v28 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Top",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v29 = #v28
        local v30 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromOffset(120, 120)
        }
        local v31 = {}
        local _ = #v31
        local v32 = {
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Image"] = p13.Clan.image,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["ScaleType"] = Enum.ScaleType.Fit
        }
        local v33 = p13.Clan.image
        v32.BackgroundTransparency = (v33 == "" or not v33) and 0 or 1
        v32.BackgroundColor3 = u11.backgroundTertiary
        v32.ZIndex = 5
        local v34 = p13.Clan.clanWar
        if v34 ~= nil then
            v34 = v34.medals
        end
        if v34 then
            local v35 = {}
            local v36 = u10
            local v37 = p13.Clan.clanWar
            if v37 ~= nil then
                v37 = v37.medals
            end
            v35.Medals = v36.convertToMedalCount(v37)
            v35.FrameProps = {
                ["ZIndex"] = 15,
                ["Size"] = UDim2.fromScale(1, 0.25),
                ["Position"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(1, 1)
            }
            v34 = u6.createElement(u12, v35)
        end
        local v38 = {}
        local v39 = #v38
        if v34 then
            v38[v39 + 1] = v34
        end
        v31.ClanEmblem = u6.createElement("ImageLabel", v32, v38)
        local v40 = {
            ["BackgroundTransparency"] = 1,
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["Size"] = UDim2.fromOffset(120, 120)
        }
        local v41 = p13.Clan.selectedBorder
        local v42
        if v41 == 0 or (v41 ~= v41 or not v41) then
            v42 = nil
        else
            v42 = u9[p13.Clan.selectedBorder].borderImage
        end
        v40.Image = v42
        v40.ZIndex = 10
        v31.ClanEmblemBorder = u6.createElement("ImageLabel", v40)
        v28[v29 + 1] = u6.createElement(u5, v30, v31)
        local v43 = not p13.GuestView
        if v43 then
            local v44
            if v15 == nil then
                v44 = v15
            else
                v44 = v15.timeToDelete
            end
            v43 = v44 ~= nil
            if v43 then
                v43 = u6.createElement(u4, {
                    ["PreText"] = "Clan deleting in:\n",
                    ["OnCompleteText"] = "Clan is being deleted. (Please wait ~5min)",
                    ["EndTime"] = v15.timeToDelete,
                    ["TextLabel"] = {
                        ["TextSize"] = 16,
                        ["LayoutOrder"] = 4,
                        ["Size"] = UDim2.new(1, 0, 0.4, 0),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left
                    }
                })
            end
        end
        local v45 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.7, 0.7)
        }
        local v46 = {}
        local v47 = u6.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Top",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.05, 0)
        })
        local v48 = u6.createElement("TextLabel", {
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Top",
            ["AutomaticSize"] = "Y",
            ["TextSize"] = 20,
            ["AutoLocalize"] = false,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0),
            ["TextColor3"] = u11.textPrimary,
            ["Text"] = p13.Clan.name,
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
        })
        local v49 = u6.createElement("TextLabel", {
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Top",
            ["AutomaticSize"] = "Y",
            ["TextSize"] = 16,
            ["AutoLocalize"] = false,
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0),
            ["TextColor3"] = u3.WHITE,
            ["Text"] = "[" .. p13.Clan.tag .. "]",
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
        })
        local v50 = u6.createElement
        local v51 = {
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Bottom",
            ["AutomaticSize"] = "Y",
            ["TextSize"] = 16,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0),
            ["TextColor3"] = u11.mcYellow
        }
        local v52 = p13.Clan.level
        v51.Text = "Lv. " .. tostring(v52)
        v51.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        __set_list(v46, 1, {v47, v48, v49, v50("TextLabel", v51)})
        local v53 = #v46
        if v43 then
            v46[v53 + 1] = v43
        end
        v28.ClanNamesContainer = u6.createElement(u5, v45, v46)
        v26.Left = u6.createElement(u5, v27, v28)
        local v54 = {
            ["Size"] = UDim2.fromScale(0.4, 1)
        }
        local v55 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Top",
                ["HorizontalAlignment"] = "Left",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v56 = #v55
        local v57 = 0
        local v58 = {
            ["Stat"] = "Members"
        }
        for _ in p13.Clan.members do
            v57 = v57 + 1
        end
        local v59 = tostring(v57)
        local v60 = p13.Clan.maxMembers
        v58.Value = v59 .. "/" .. tostring(v60)
        v55[v56 + 1] = u6.createElement(v19, v58)
        v55[v56 + 2] = u6.createElement(v19, {
            ["Stat"] = "Leader",
            ["Value"] = p13.Clan.leader.offlinePlayer.name
        })
        v26.Right = u6.createElement(u5, v54, v55)
        return u6.createFragment({
            ["ClanHeader"] = u6.createElement("Frame", v23, v26)
        })
    end)
}