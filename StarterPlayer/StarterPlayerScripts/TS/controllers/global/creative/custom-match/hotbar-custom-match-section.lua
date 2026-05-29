local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Button
local u5 = v3.ColorUtil
local u6 = v3.Empty
local u7 = v3.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto")
local u19 = v18.HostPanelToggle
local u20 = v18.HostPanelToggleValue
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-types").LiveServerVisibilityMode
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weapon-util")
local u27 = v26.KitWithCustomWeapon
local u28 = v26.WeaponType
local u29 = v1.import(script, script.Parent.Parent.Parent, "hotbar", "ui", "kit", "hotbar-kit-viewport").HotbarKitViewport
local u30 = v1.import(script, script.Parent.Parent.Parent, "hotbar", "ui", "weapon-selection", "weapon-viewport").WeaponViewport
local u31 = v1.import(script, script.Parent, "custom-match-start-button").CustomMatchStartButton
local u32 = v1.import(script, script.Parent, "custom-match-team-button").CustomMatchTeamButton
local v77 = v10.new(u9)(function(u33, p34) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u16
        [3] = u12
        [4] = u13
        [5] = u17
        [6] = u27
        [7] = u4
        [8] = u15
        [9] = u8
        [10] = u2
        [11] = u14
        [12] = u29
        [13] = u30
        [14] = u28
        [15] = u21
        [16] = u5
        [17] = u22
        [18] = u25
        [19] = u7
        [20] = u24
        [21] = u20
        [22] = u19
        [23] = u31
        [24] = u23
        [25] = u6
        [26] = u32
    --]]
    local _ = p34.useState
    if u33.QueueType == nil then
        return u9.createFragment()
    end
    local u35 = u16(u33.QueueType)
    local v36 = not u12.LocalPlayer and true or u12.LocalPlayer.UserId == u33.HostUserId
    local v37 = u27[u13:getState().Bedwars.kit or u17.NONE] == nil
    local v38 = u13:getState().Bedwars.weapon
    local v39 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 0.5),
        ["Position"] = UDim2.fromScale(0.5, -0.2),
        ["AnchorPoint"] = Vector2.new(0.5, 1)
    }
    local v40 = {}
    local v41 = #v40
    local v42 = {
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0, -1.2)
    }
    local v43 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.02, 0)
        }) }
    local v44 = #v43
    local v45 = not u35.noKits
    if v45 then
        v45 = u9.createElement(u4, {
            ["Text"] = "<b>KITS</b>",
            ["LayoutOrder"] = 10,
            ["OnClick"] = function() --[[ Name: OnClick, Line 73 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u15
                    [3] = u8
                    [4] = u2
                    [5] = u14
                    [6] = u13
                --]]
                if u35.game == u15.COMBINED_KIT then
                    u8.Controllers.CombinedKitDraftController:mountUI()
                else
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.KIT_DETAILS_APP, {
                        ["SelectedKit"] = u13:getState().Bedwars.kit
                    })
                end
            end,
            ["Size"] = UDim2.fromScale(0.28, 1)
        }, { u9.createElement(u29, {
                ["store"] = u33.store,
                ["Size"] = UDim2.fromScale(1.5, 1.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.02, 0.48)
            }), u9.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.795918367346939,
                ["DominantAxis"] = "Height"
            }) })
    end
    if v45 then
        v43[v44 + 1] = v45
    end
    local v46 = #v43
    local v47 = u35.enableWeapons
    if v47 then
        local v48 = {
            ["LayoutOrder"] = 10,
            ["Text"] = v37 and "<b>Weapons</b>" or "<b>Unavailable For Kit</b>",
            ["OnClick"] = function() --[[ Name: OnClick, Line 104 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u14
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.WEAPON_SELECTION_APP, {})
            end,
            ["Size"] = UDim2.fromScale(0.28, 1),
            ["Interactable"] = v37
        }
        local v49 = {}
        local v50 = #v49
        if v37 then
            local v51 = u9.createElement
            local v52 = u30
            local v53 = {
                ["WeaponType"] = v38 or u28.SWORD,
                ["Size"] = UDim2.fromScale(0.4, 1.75),
                ["Position"] = UDim2.fromScale(-0.1, -0.8)
            }
            local v54
            if v37 then
                v54 = nil
            else
                v54 = u21.BLOCK_ICON
            end
            v53.image = v54
            v37 = v51(v52, v53)
        end
        if v37 then
            v49[v50 + 1] = v37
        end
        v49[#v49 + 1] = u9.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 3.795918367346939,
            ["DominantAxis"] = "Height"
        })
        v47 = u9.createElement(u4, v48, v49)
    end
    if v47 then
        v43[v46 + 1] = v47
    end
    local v55 = #v43
    if v36 then
        local v56 = {}
        local v57 = u9.createElement
        local v58 = u4
        local v59 = {
            ["LayoutOrder"] = 3
        }
        local v60 = "<b>SERVER VISIBILITY: <font color=\""
        local v61 = u5.richTextColor
        local v62
        if u33.VisibilityMode == u22.PUBLIC then
            v62 = u25.mcGreen
        else
            v62 = u25.mcRed
        end
        v59.Text = v60 .. v61(v62) .. "\">" .. string.upper(u33.VisibilityMode) .. "</font></b>"
        v59.Size = UDim2.fromScale(2, 1)
        function v59.OnClick() --[[ Line: 139 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u24
                [3] = u33
                [4] = u22
                [5] = u20
                [6] = u8
                [7] = u19
            --]]
            u7:playSound(u24.UI_CLICK)
            local v63
            if u33.VisibilityMode == u22.PUBLIC then
                v63 = u20.OFF
            else
                v63 = u20.ON
            end
            u8.Controllers.CustomMatchController:setToggle(u19.GameVisibilityMode, v63)
        end
        v59.BackgroundColor3 = u25.backgroundSecondary
        __set_list(v56, 1, {v57(v58, v59, { u9.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 8,
        ["DominantAxis"] = "Height"
    }) }), u9.createElement(u31, {
    ["LayoutOrder"] = 3
})})
        local v64 = #v56
        local v65 = {}
        local v66 = u33.CustomMatchJoinCode
        if v66 ~= nil then
            v66 = string.upper(v66)
        end
        v65.Text = "Join Code: " .. tostring(v66)
        v65.Size = UDim2.fromScale(1, 1)
        function v65.OnClick() --[[ Line: 164 ]] end
        v65.BackgroundColor3 = u25.backgroundTertiary
        v65.LayoutOrder = 4
        v56[v64 + 1] = u9.createElement(u4, v65, { u9.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 4
            }) })
        v36 = u9.createFragment(v56)
    end
    if v36 then
        v43[v55 + 1] = v36
    end
    v43[#v43 + 1] = u9.createElement(u4, {
        ["Text"] = "<b>LOBBY</b>",
        ["LayoutOrder"] = 5,
        ["BackgroundColor3"] = u25.mcRed,
        ["Size"] = UDim2.fromScale(0.4, 1),
        ["OnClick"] = function() --[[ Name: OnClick, Line 182 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23.Client:Get("TeleportToLobby"):SendToServer()
        end
    }, { u9.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 3.795918367346939,
            ["DominantAxis"] = "Height"
        }) })
    v40[v41 + 1] = u9.createElement(u6, v42, v43)
    local v67 = u33.Teams
    local v68 = table.create(#v67)
    for v69, v70 in v67 do
        local v71 = v69 - 1
        v68[v69] = u9.createElement(u32, {
            ["AppId"] = "CustomMatchTeamButton_" .. v70.id,
            ["Team"] = v70,
            ["QueueMeta"] = u35,
            ["LayoutOrder"] = v71
        })
    end
    local v72 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v73 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.02, 0)
        }), u9.createElement(u4, {
            ["Text"] = "<b>EVENLY SPLIT TEAMS</b>",
            ["LayoutOrder"] = -2,
            ["Size"] = UDim2.fromScale(1, 1),
            ["OnClick"] = function() --[[ Name: OnClick, Line 222 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u24
                    [3] = u8
                --]]
                u7:playSound(u24.UI_CLICK)
                u8.Controllers.CustomMatchController:autoSplitTeams()
            end,
            ["BackgroundColor3"] = u25.backgroundSecondary
        }, { u9.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 4,
                ["DominantAxis"] = "Height"
            }) }), u9.createElement(u32, {
            ["AppId"] = "CustomMatchTeamButton_spectators",
            ["Team"] = nil,
            ["LayoutOrder"] = -1,
            ["QueueMeta"] = u35
        }) }
    local v74 = #v73
    for v75, v76 in v68 do
        v73[v74 + v75] = v76
    end
    v40[v41 + 2] = u9.createElement(u6, v72, v73)
    return u9.createElement("Frame", v39, v40)
end)
return {
    ["HotbarCustomMatchSection"] = v11.connect(function(p78, p79) --[[ Line: 249 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u22
        --]]
        local v80 = {}
        for v81, v82 in p79 do
            v80[v81] = v82
        end
        v80.store = p78
        v80.Teams = p78.Game.teams
        v80.QueueType = p78.Game.queueType
        local v83 = p78.Game.customMatch
        if v83 ~= nil then
            v83 = v83.hostUserId
        end
        v80.HostUserId = v83
        local v84 = p78.Game.customMatch
        if v84 ~= nil then
            v84 = v84.joinCode
        end
        v80.CustomMatchJoinCode = v84
        local v85
        if p78.CustomMatch.generalToggles.GameVisibilityMode == u20.ON then
            v85 = u22.PUBLIC
        else
            v85 = u22.PRIVATE
        end
        v80.VisibilityMode = v85
        return v80
    end)(v77)
}