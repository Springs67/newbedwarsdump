local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.CircularSpinner
local u5 = v2.ColorUtil
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.TabsComponent
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-border-meta").ClanBorderType
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-leaderboard").ClanWarLeaderboardType
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-medals").ClanWarMedal
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-profile-dto").ClanWarDivision
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, script.Parent.Parent, "clan-war-active-banner").ClanWarActiveBanner
local u21 = v1.import(script, script.Parent, "clan-war-leaderboard-entry").ClanWarLeaderboardCard
local u22 = {}
local v23 = {
    ["tag"] = "gg",
    ["clanId"] = "123",
    ["icon"] = v19.AFK_CRATE_RENDER,
    ["score"] = v15.calculateMedalsScore({
        [v17.BRONZE] = 1,
        [v17.SILVER] = 3,
        [v17.GOLD] = 1
    }),
    ["division"] = u18.Division_I,
    ["medals"] = {
        [v17.BRONZE] = 1,
        [v17.SILVER] = 3,
        [v17.GOLD] = 1
    }
}
local v24 = {
    ["tag"] = "gg",
    ["clanId"] = "123",
    ["icon"] = v19.AFK_CRATE_RENDER,
    ["score"] = v15.calculateMedalsScore({
        [v17.BRONZE] = 3
    }),
    ["division"] = u18.Division_II,
    ["medals"] = {
        [v17.BRONZE] = 3
    }
}
local v25 = {
    ["tag"] = "gg",
    ["clanId"] = "123",
    ["icon"] = v19.AFK_CRATE_RENDER,
    ["score"] = v15.calculateMedalsScore({
        [v17.SILVER] = 3,
        [v17.GOLD] = 2
    }),
    ["division"] = u18.Division_III,
    ["medals"] = {
        [v17.SILVER] = 3,
        [v17.GOLD] = 2
    }
}
local v26 = {
    ["tag"] = "gg",
    ["clanId"] = "123",
    ["icon"] = v19.AFK_CRATE_RENDER,
    ["score"] = v15.calculateMedalsScore({
        [v17.GOLD] = 3
    }),
    ["division"] = u18.Division_I,
    ["medals"] = {
        [v17.GOLD] = 3
    }
}
__set_list(u22, 1, {v23, v24, v25, v26, {
    ["tag"] = "gg",
    ["score"] = 450,
    ["clanId"] = "123",
    ["icon"] = v19.AFK_CRATE_RENDER,
    ["division"] = u18.Division_I,
    ["medals"] = {}
}, {
    ["tag"] = "gg",
    ["score"] = 450,
    ["clanId"] = "123",
    ["icon"] = v19.AFK_CRATE_RENDER,
    ["division"] = u18.Division_I,
    ["medals"] = {}
}})
local u27 = {}
local v28 = {
    ["tag"] = "FAST",
    ["clanId"] = "123",
    ["icon"] = v19.AFK_CRATE_RENDER,
    ["score"] = v15.calculateMedalsScore({
        [v17.BRONZE] = 1,
        [v17.SILVER] = 3,
        [v17.GOLD] = 1
    }),
    ["division"] = u18.Division_I,
    ["medals"] = {
        [v17.BRONZE] = 1,
        [v17.SILVER] = 3,
        [v17.GOLD] = 1
    },
    ["border"] = v14.GOLD
}
local v29 = {
    ["tag"] = "LOVE",
    ["clanId"] = "123",
    ["icon"] = v19.AFK_CRATE_RENDER,
    ["score"] = v15.calculateMedalsScore({
        [v17.BRONZE] = 3
    }),
    ["division"] = u18.Division_II,
    ["medals"] = {
        [v17.BRONZE] = 3
    }
}
local v30 = {
    ["tag"] = "EZ",
    ["clanId"] = "123",
    ["icon"] = v19.AFK_CRATE_RENDER,
    ["score"] = v15.calculateMedalsScore({
        [v17.SILVER] = 3,
        [v17.GOLD] = 2
    }),
    ["division"] = u18.Division_III,
    ["medals"] = {
        [v17.SILVER] = 3,
        [v17.GOLD] = 2
    },
    ["border"] = v14.WANTED
}
local v31 = {
    ["tag"] = "RCR",
    ["clanId"] = "123",
    ["icon"] = v19.AFK_CRATE_RENDER,
    ["score"] = v15.calculateMedalsScore({
        [v17.GOLD] = 3
    }),
    ["division"] = u18.Division_I,
    ["medals"] = {
        [v17.GOLD] = 3
    }
}
local v32 = {
    ["tag"] = "EASY",
    ["clanId"] = "123",
    ["icon"] = v19.AFK_CRATE_RENDER,
    ["score"] = v15.calculateMedalsScore({
        [v17.GOLD] = 3
    }),
    ["division"] = u18.Division_I,
    ["medals"] = {
        [v17.GOLD] = 3
    }
}
local v33 = {
    ["tag"] = "HOOK",
    ["clanId"] = "123",
    ["icon"] = v19.AFK_CRATE_RENDER,
    ["score"] = v15.calculateMedalsScore({
        [v17.GOLD] = 3
    }),
    ["division"] = u18.Division_I,
    ["medals"] = {
        [v17.GOLD] = 3
    },
    ["border"] = v14.SILVER
}
__set_list(u27, 1, {v28, v29, v30, v31, v32, v33})
return {
    ["ClanWarLeaderboard"] = v11.new(u10)(function(_, p34) --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u6
            [3] = u22
            [4] = u27
            [5] = u12
            [6] = u13
            [7] = u18
            [8] = u9
            [9] = u10
            [10] = u8
            [11] = u20
            [12] = u4
            [13] = u5
            [14] = u21
            [15] = u3
            [16] = u7
        --]]
        local v35 = p34.useState
        local v36 = p34.useEffect
        local v37, u38 = v35(true)
        local v39, u40 = v35({})
        local u41, u42 = v35(u16.WEEKLY)
        v36(function() --[[ Line: 170 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u41
                [3] = u16
                [4] = u40
                [5] = u22
                [6] = u27
                [7] = u38
                [8] = u12
                [9] = u13
                [10] = u18
                [11] = u9
            --]]
            local u43 = true
            if u6.isHoarceKat() then
                if u41 == u16.WEEKLY then
                    u40(u22)
                else
                    u40(u27)
                end
                u38(false)
                return nil
            end
            if u12:IsStudio() then
                local v44 = u13:getState().Clans.myClan
                if v44 and u41 == u16.WEEKLY then
                    u40({
                        {
                            ["score"] = 450,
                            ["tag"] = v44.tag,
                            ["icon"] = v44.image,
                            ["clanId"] = v44.id,
                            ["medals"] = {},
                            ["division"] = u18.Division_I
                        }
                    })
                else
                    u40(u27)
                end
                u38(false)
                return nil
            end
            if u41 == u16.WEEKLY then
                u9.Controllers.ClanController:requestClanWarWeeklyLeaderboardAsync():andThen(function(p45) --[[ Line: 199 ]]
                    --[[
                    Upvalues:
                        [1] = u43
                        [2] = u40
                        [3] = u38
                    --]]
                    if not u43 then
                        return nil
                    end
                    if p45 then
                        u40(p45)
                    end
                    u38(false)
                end)
            elseif u41 == u16.ALLTIME then
                u9.Controllers.ClanController:requestClanWarAllTimeLeaderboardAsync():andThen(function(p46) --[[ Line: 211 ]]
                    --[[
                    Upvalues:
                        [1] = u43
                        [2] = u40
                        [3] = u38
                    --]]
                    if not u43 then
                        return nil
                    end
                    if p46 then
                        u40(p46)
                    end
                    u38(false)
                end)
            end
        end, { u41 })
        local v47 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v49 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.02, 0)
            }), u10.createElement(u8, {
                ["Value"] = u41,
                ["Tabs"] = {
                    {
                        ["text"] = "WEEKLY",
                        ["value"] = u16.WEEKLY
                    },
                    {
                        ["text"] = "ALL-TIME",
                        ["value"] = u16.ALLTIME
                    }
                },
                ["OnChange"] = function(p48) --[[ Name: OnChange, Line 246 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                    --]]
                    u42(p48.value)
                end,
                ["FrameProps"] = {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.06)
                },
                ["UIListLayout"] = {
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
                }
            }) }
        local v50 = #v49
        local v51
        if u41 == u16.WEEKLY then
            v51 = u10.createElement(u20, {
                ["FrameProps"] = {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.14)
                }
            })
        else
            v51 = false
        end
        if v51 then
            v49[v50 + 1] = v51
        end
        local v52 = #v49
        local v53
        if v37 then
            v53 = u10.createElement(u4, {
                ["Size"] = UDim2.fromScale(0.5, 0.5)
            }, { u10.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        elseif #v39 == 0 then
            v53 = u10.createFragment({
                ["Empty"] = u10.createElement("TextLabel", {
                    ["Text"] = "Leaderboard is empty",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.6, 0.3),
                    ["TextColor3"] = u5.WHITE
                })
            })
        elseif v39 == nil then
            v53 = v39
        else
            table.sort(v39, function(p54, p55) --[[ Line: 299 ]]
                return p54.tag < p55.tag
            end)
            table.sort(v39, function(p56, p57) --[[ Line: 303 ]]
                return p56.score > p57.score
            end)
            local function v62(p58, p59) --[[ Line: 307 ]]
                --[[
                Upvalues:
                    [1] = u41
                    [2] = u10
                    [3] = u21
                --]]
                local v60 = {
                    ["ClanWarLeaderboardType"] = u41,
                    ["Placement"] = p59 + 1,
                    ["ClanId"] = p58.clanId
                }
                local v61 = p58.icon
                v60.Icon = v61 == nil and "" or v61
                v60.Name = p58.tag
                v60.Division = p58.division
                v60.Tag = p58.tag
                v60.Score = p58.score
                v60.Medals = p58.medals
                v60.Border = p58.border
                return u10.createElement(u21, v60)
            end
            v53 = table.create(#v39)
            for v63, v64 in v39 do
                v53[v63] = v62(v64, v63 - 1, v39)
            end
        end
        local v65 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(1, u41 == u16.WEEKLY and 0.64 or 0.8),
                ["Position"] = UDim2.fromScale(0, 0.1)
            }
        }
        local v66 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v67 = #v66
        if v53.elements == nil and (v53.props == nil or v53.component == nil) then
            for v68, v69 in v53 do
                v66[v67 + v68] = v69
            end
        else
            v66[v67 + 1] = v53
        end
        v49[v52 + 1] = u10.createElement(u3, v65, v66)
        return u10.createElement(u7, v47, v49)
    end)
}