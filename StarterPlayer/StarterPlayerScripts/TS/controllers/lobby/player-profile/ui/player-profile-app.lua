local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.CircularSpinner
local u6 = v3.DarkBackground
local u7 = v3.DeviceUtil
local u8 = v3.EmptyButton
local u9 = v3.IconButton
local u10 = v3.ScaleComponent
local u11 = v3.SlideIn
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = v1.import(script, script.Parent, "player-profile-achievements").PlayerProfileAchievements
local u19 = v1.import(script, script.Parent, "player-profile-equipped").PlayerProfileEquipped
local u20 = v1.import(script, script.Parent, "player-profile-header").PlayerProfileHeader
local u21 = v1.import(script, script.Parent, "player-profile-kits").PlayerProfileKits
local u22 = v1.import(script, script.Parent, "player-profile-locker").PlayerProfileLocker
local u23 = v1.import(script, script.Parent, "player-profile-match-history").PlayerProfileMatchHistory
local u24 = v1.import(script, script.Parent, "player-profile-stats").PlayerProfileStats
local u25 = v1.import(script, script.Parent, "player-profile-tab-button").PlayerProfileTabButton
local v26 = {}
local u27 = setmetatable({}, {
    ["__index"] = v26
})
u27.STATS = "STATS"
v26.STATS = "STATS"
u27.KITS = "KITS"
v26.KITS = "KITS"
u27.LOCKER = "LOCKER"
v26.LOCKER = "LOCKER"
u27.EQUIPPED = "EQUIPPED"
v26.EQUIPPED = "EQUIPPED"
u27.MATCH_HISTORY = "MATCH_HISTORY"
v26.MATCH_HISTORY = "MATCH_HISTORY"
u27.ACHIEVEMENTS = "ACHIEVEMENTS"
v26.ACHIEVEMENTS = "ACHIEVEMENTS"
local function v81(u28, p29) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u7
        [3] = u15
        [4] = u12
        [5] = u6
        [6] = u10
        [7] = u9
        [8] = u16
        [9] = u2
        [10] = u17
        [11] = u20
        [12] = u25
        [13] = u4
        [14] = u24
        [15] = u21
        [16] = u22
        [17] = u19
        [18] = u23
        [19] = u18
        [20] = u5
        [21] = u8
        [22] = u11
    --]]
    local v30 = p29.useState
    local _ = p29.useEffect
    local v31, u32 = v30(u28.DefaultTab or u27.STATS)
    local v33 = u7.isSmallScreen() and 0.08 or 0.05
    local v34 = 1 - (v33 + 0.2)
    local v35 = u28.ProfileData or u28.store.Lobby.currentlyViewingProfileData
    local v36 = u15.CurrentCamera
    if v36 ~= nil then
        v36 = v36.ViewportSize
    end
    local v37 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = true,
        ["ResetOnSpawn"] = false
    }
    local v38 = { u12.createElement(u6, {
            ["IgnoreClickDuration"] = 0.4,
            ["AppId"] = u28.AppId,
            ["OnClick"] = function() --[[ Name: OnClick, Line 69 ]]
                return true
            end
        }) }
    local v39 = #v38
    local v40 = {}
    local v41 = #v40
    local v42 = {
        ["Modal"] = true,
        ["Size"] = UDim2.fromOffset(800, 700),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.fromScale(0.5, 0.05)
    }
    local v43 = {}
    local v44 = #v43
    local v45 = {}
    local v46 = math
    local v47
    if v36 == nil then
        v47 = v36
    else
        v47 = v36.X
    end
    local v48
    if v47 == 0 or (v47 ~= v47 or not v47) then
        v48 = (1 / 0)
    else
        local v49
        if v36 == nil then
            v49 = v36
        else
            v49 = v36.X
        end
        v48 = v49 * 0.9
    end
    local v50 = v46.min(1600, v48)
    local v51 = math
    local v52
    if v36 == nil then
        v52 = v36
    else
        v52 = v36.Y
    end
    local v53
    if v52 == 0 or (v52 ~= v52 or not v52) then
        v53 = (1 / 0)
    else
        if v36 ~= nil then
            v36 = v36.Y
        end
        v53 = v36 * 0.9
    end
    v45.MaximumSize = Vector2.new(v50, (v51.min(1400, v53)))
    v43[v44 + 1] = u12.createElement(u10, v45)
    v43[v44 + 2] = u12.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 1.1428571428571428
    })
    v43[v44 + 3] = u12.createElement(u9, {
        ["Size"] = UDim2.new(0, 40, 0, 40),
        ["Image"] = u16.X,
        ["Position"] = UDim2.new(1, -4, 0, 4),
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["OnClick"] = function() --[[ Name: OnClick, Line 130 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u28
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u28.AppId)
        end,
        ["IconProps"] = {
            ["ZIndex"] = 100,
            ["ImageTransparency"] = 0.2
        },
        ["ImageColor3"] = Color3.fromRGB(255, 255, 255)
    })
    local v54 = {
        ["BorderSizePixel"] = 0,
        ["ClipsDescendants"] = false,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = u17.backgroundPrimary
    }
    local v55 = { u12.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.05, 0)
        }), u12.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }), u12.createElement(u20, {
            ["ProfileData"] = v35,
            ["FrameProps"] = {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.2)
            }
        }) }
    local v56 = #v55
    local v57 = {
        ["LayoutOrder"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, v33),
        ["BackgroundColor3"] = u17.backgroundTertiary
    }
    local v58 = {}
    local v59 = #v58
    local v60 = {
        ["ScrollingFrameProps"] = {
            ["ScrollingDirection"] = Enum.ScrollingDirection.X
        }
    }
    local v61 = {
        u12.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }),
        ["StatsTab"] = u12.createElement(u25, {
            ["LayoutOrder"] = 0,
            ["Text"] = "STATS",
            ["OnClick"] = function() --[[ Name: OnClick, Line 182 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u27
                --]]
                u32(u27.STATS)
            end,
            ["Tab"] = u27.STATS,
            ["ActiveTab"] = v31
        }),
        ["KitsTab"] = u12.createElement(u25, {
            ["LayoutOrder"] = 2,
            ["Text"] = "KITS",
            ["OnClick"] = function() --[[ Name: OnClick, Line 191 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u27
                --]]
                u32(u27.KITS)
            end,
            ["Tab"] = u27.KITS,
            ["ActiveTab"] = v31
        }),
        ["LockerTab"] = u12.createElement(u25, {
            ["LayoutOrder"] = 3,
            ["Text"] = "LOCKER",
            ["OnClick"] = function() --[[ Name: OnClick, Line 200 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u27
                --]]
                u32(u27.LOCKER)
            end,
            ["Tab"] = u27.LOCKER,
            ["ActiveTab"] = v31
        }),
        ["AchievementsTab"] = u12.createElement(u25, {
            ["LayoutOrder"] = 4,
            ["Text"] = "ACHIEVEMENTS",
            ["Size"] = UDim2.fromScale(u7.isSmallScreen() and 0.2 or 0.15, 1),
            ["OnClick"] = function() --[[ Name: OnClick, Line 210 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u27
                --]]
                u32(u27.ACHIEVEMENTS)
            end,
            ["Tab"] = u27.ACHIEVEMENTS,
            ["ActiveTab"] = v31
        }),
        ["MatchHistoryTab"] = u12.createElement(u25, {
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(u7.isSmallScreen() and 0.2 or 0.18, 1),
            ["OnClick"] = function() --[[ Name: OnClick, Line 220 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u27
                --]]
                u32(u27.MATCH_HISTORY)
            end,
            ["Tab"] = u27.MATCH_HISTORY,
            ["Text"] = u7.isSmallScreen() and "MATCHES" or "MATCH HISTORY",
            ["ActiveTab"] = v31
        })
    }
    local v62 = #v61
    local v63 = u7.isSmallScreen()
    if v63 then
        v63 = u12.createFragment({
            ["EquippedTab"] = u12.createElement(u25, {
                ["LayoutOrder"] = 1,
                ["Text"] = "EQUIPPED",
                ["OnClick"] = function() --[[ Name: OnClick, Line 232 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                        [2] = u27
                    --]]
                    u32(u27.EQUIPPED)
                end,
                ["Tab"] = u27.EQUIPPED,
                ["ActiveTab"] = v31
            })
        })
    end
    if v63 then
        v61[v62 + 1] = v63
    end
    v58[v59 + 1] = u12.createElement(u4, v60, v61)
    v55.PlayerProfileTabList = u12.createElement("Frame", v57, v58)
    local v64
    if v35 then
        local v65 = {
            ["LayoutOrder"] = 2,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, v34),
            ["BackgroundColor3"] = u17.backgroundPrimary
        }
        local v66 = {}
        local v67 = #v66
        local v68
        if v31 == u27.STATS then
            v68 = u12.createElement(u24, {
                ["ProfileData"] = v35,
                ["store"] = u28.store
            })
        else
            v68 = false
        end
        if v68 then
            v66[v67 + 1] = v68
        end
        local v69 = #v66
        local v70
        if v31 == u27.KITS then
            v70 = u12.createElement(u21, {
                ["store"] = u28.store,
                ["ProfileData"] = v35
            })
        else
            v70 = false
        end
        if v70 then
            v66[v69 + 1] = v70
        end
        local v71 = #v66
        local v72
        if v31 == u27.LOCKER then
            v72 = u12.createElement(u22, {
                ["ProfileData"] = v35
            })
        else
            v72 = false
        end
        if v72 then
            v66[v71 + 1] = v72
        end
        local v73 = #v66
        local v74
        if v31 == u27.EQUIPPED then
            v74 = u12.createElement(u19, {
                ["ProfileData"] = v35,
                ["store"] = u28.store
            })
        else
            v74 = false
        end
        if v74 then
            v66[v73 + 1] = v74
        end
        local v75 = #v66
        local v76
        if v31 == u27.MATCH_HISTORY then
            v76 = u12.createElement(u23, {
                ["ProfileData"] = v35,
                ["store"] = u28.store
            })
        else
            v76 = false
        end
        if v76 then
            v66[v75 + 1] = v76
        end
        local v77 = #v66
        local v78
        if v31 == u27.ACHIEVEMENTS then
            v78 = u12.createElement(u18, {
                ["ProfileData"] = v35,
                ["store"] = u28.store
            })
        else
            v78 = false
        end
        if v78 then
            v66[v77 + 1] = v78
        end
        v64 = u12.createFragment({
            ["PlayerProfileContent"] = u12.createElement("Frame", v65, v66)
        })
    else
        v64 = v35
    end
    if v64 then
        v55[v56 + 1] = v64
    end
    local v79 = #v55
    local v80 = not v35
    if v80 then
        v80 = u12.createFragment({
            ["PlayerProfileLoading"] = u12.createElement("Frame", {
                ["LayoutOrder"] = 2,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, v34),
                ["BackgroundColor3"] = u17.backgroundPrimary
            }, { u12.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(0.9, 0.9),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["BackgroundColor3"] = u17.backgroundSecondary
                }, {
                    u12.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Vertical,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder
                    }),
                    u12.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.05, 0)
                    }),
                    u12.createElement("TextLabel", {
                        ["Text"] = "Loading...",
                        ["TextSize"] = 18,
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.2),
                        ["TextColor3"] = u17.textPrimary,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        ["TextXAlignment"] = Enum.TextXAlignment.Center,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }),
                    u12.createElement(u5, {
                        ["Size"] = UDim2.fromScale(1, 0.2)
                    }, { u12.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) })
                }) })
        })
    end
    if v80 then
        v55[v79 + 1] = v80
    end
    v43[v44 + 4] = u12.createElement("Frame", v54, v55)
    v40[v41 + 1] = u12.createElement(u8, v42, v43)
    v38[v39 + 1] = u12.createElement(u11, {}, v40)
    return u12.createElement("ScreenGui", v37, v38)
end
local v82 = v13.new(u12)(v81)
return {
    ["PlayerProfileTab"] = u27,
    ["PlayerProfileApp"] = v14.connect(function(p83, p84) --[[ Line: 362 ]]
        local v85 = {}
        for v86, v87 in p84 do
            v85[v86] = v87
        end
        v85.store = p83
        return v85
    end)(v82)
}