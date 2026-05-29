local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.Empty
local u6 = v3.ImageId
local u7 = v3.ShineEffect
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").Party
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = v1.import(script, script.Parent.Parent, "hotbar-button").HotbarButton
local u15 = v1.import(script, script.Parent.Parent, "kit", "hotbar-kit-button").HotbarKitButton
local u16 = v1.import(script, script.Parent.Parent, "kit", "hotbar-kit-viewport").HotbarKitViewport
local u17 = v1.import(script, script.Parent, "hotbar-party-button").HotbarPartyButton
local u18 = v1.import(script, script.Parent, "hotbar-party-member-list").HotbarPartyMemberList
local v19 = u9.Component:extend("HotbarPartySection")
function v19.init(_) --[[ Line: 23 ]] end
function v19.render(u20) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u5
        [4] = u14
        [5] = u11
        [6] = u2
        [7] = u10
        [8] = u7
        [9] = u6
        [10] = u13
        [11] = u12
        [12] = u18
        [13] = u17
        [14] = u8
        [15] = u15
        [16] = u16
    --]]
    local v21 = #u20.props.store.Party.members + 1
    local v22 = #u20.props.store.PartyInvites.incomingInvites
    local v23 = v22 <= 0 and "Invites" or "Invites (" .. tostring(v22) .. ")"
    local v24 = u9.createElement
    local v25 = "Frame"
    local v26 = {
        ["BorderSizePixel"] = 1,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, u4.isSmallScreen() and 0.95 or 0.82),
        ["Position"] = UDim2.fromScale(0.5, -0.2),
        ["AnchorPoint"] = Vector2.new(0.5, 1)
    }
    local v27 = {}
    local v29 = u9.createElement(u5, {
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0, u4.isSmallScreen() and -0.65 or -0.7)
    }, {
        u9.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Bottom",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.03, 0)
        }),
        u9.createElement(u14, {
            ["Text"] = "Battle Pass",
            ["AspectRatio"] = 4.469387755102041,
            ["LayoutOrder"] = 0,
            ["Icon"] = u11.BATTLE_PASS_SEASON_ICON,
            ["IconSize"] = UDim2.fromScale(0.6, 0.6),
            ["OnClick"] = function() --[[ Name: OnClick, Line 55 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u10
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u10.BATTLEPASS, {})
            end,
            ["BackgroundColor"] = Color3.fromRGB(22, 103, 198)
        }, { u9.createElement(u7) }),
        u9.createElement(u14, {
            ["Text"] = "Missions",
            ["AspectRatio"] = 4.469387755102041,
            ["LayoutOrder"] = 1,
            ["Icon"] = u6.SCROLL_SOLID,
            ["OnClick"] = function() --[[ Name: OnClick, Line 67 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u10
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u10.MISSIONS, {})
            end,
            ["BackgroundColor"] = u13.backgroundSuccess
        }),
        u9.createElement(u14, {
            ["Text"] = "Locker",
            ["AspectRatio"] = 3.4693877551020407,
            ["LayoutOrder"] = 2,
            ["Icon"] = u6.BOX_OPEN_SLOID,
            ["OnClick"] = function() --[[ Name: OnClick, Line 77 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u10
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u10.LOCKER, {})
            end,
            ["BackgroundColor"] = Color3.fromRGB(69, 84, 247)
        }),
        u9.createElement(u14, {
            ["Text"] = "Clan",
            ["AspectRatio"] = 3.4693877551020407,
            ["LayoutOrder"] = 3,
            ["Icon"] = u12.CLAN,
            ["OnClick"] = function() --[[ Name: OnClick, Line 87 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u2
                    [3] = u10
                --]]
                local v28 = u20.props.store.Clans.myClanId
                if v28 == "" or not v28 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u10.CLAN_MENU, {})
                else
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u10.CLAN_PROFILE, {
                        ["ClanId"] = u20.props.store.Clans.myClanId
                    })
                end
            end,
            ["BackgroundColor"] = Color3.fromRGB(69, 84, 247)
        })
    })
    local v30 = u9.createElement
    local v31 = u5
    local v32 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v33 = {}
    local v34 = u9.createElement(u18, {
        ["LayoutOrder"] = 1,
        ["store"] = u20.props.store,
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.fromScale(0, 0.5)
    })
    local v35 = u9.createElement
    local v36 = u5
    local v37 = {
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.8, 1)
    }
    local v38 = {}
    local v39 = u9.createElement("UIListLayout", {
        ["FillDirection"] = "Horizontal",
        ["VerticalAlignment"] = "Bottom",
        ["HorizontalAlignment"] = "Center",
        ["SortOrder"] = "LayoutOrder"
    })
    local v40 = u9.createElement
    local v41 = u17
    local v42 = {
        ["LayoutOrder"] = 1
    }
    local v43
    if v21 > 1 then
        local v44 = tostring(v21)
        local v45 = u8.MAX_SIZE
        v43 = "Party (" .. v44 .. "/" .. tostring(v45) .. ")"
    else
        v43 = "Create Party"
    end
    v42.Text = v43
    v42.Image = u6.PARTY
    function v42.OnClick() --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u10.PARTY, {})
    end
    __set_list(v38, 1, {v39, v40(v41, v42), u9.createElement(u5, {
    ["LayoutOrder"] = 2,
    ["Size"] = UDim2.fromScale(0.03, 0)
}), u9.createElement(u17, {
    ["LayoutOrder"] = 3,
    ["Text"] = v23,
    ["Image"] = u6.BELL,
    ["OnClick"] = function() --[[ Name: OnClick, Line 136 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u10.PARTY_INVITES, {})
    end
}), u9.createElement(u5, {
    ["LayoutOrder"] = 4,
    ["Size"] = UDim2.fromScale(0.03, 0)
}), u9.createElement(u15, {
    ["LayoutOrder"] = 5,
    ["store"] = u20.props.store
})})
    __set_list(v33, 1, {v34, v35(v36, v37, v38), u9.createElement(u16, {
    ["store"] = u20.props.store,
    ["AnchorPoint"] = Vector2.new(1, 1),
    ["Position"] = UDim2.fromScale(1, 1)
})})
    __set_list(v27, 1, {v29, v30(v31, v32, v33)})
    return v24(v25, v26, v27)
end
return {
    ["HotbarPartySection"] = v19
}