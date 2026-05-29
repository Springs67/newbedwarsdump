local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.DropdownComponent
local u6 = v2.Empty
local u7 = v2.OfflinePlayerUtil
local u8 = v2.SoundManager
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "menu", "menu-component").MenuComponent
local v14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role")
local u15 = v14.CustomMatchRole
local u16 = v14.CustomMatchRoleAttribute
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u22 = u1.import(script, script.Parent.Parent, "components", "host-panel-textbox").HostPanelTextBox
return {
    ["HostPanelPlayerRow"] = v11.new(u10)(function(u23, p24) --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u16
            [3] = u15
            [4] = u4
            [5] = u9
            [6] = u1
            [7] = u12
            [8] = u8
            [9] = u20
            [10] = u19
            [11] = u18
            [12] = u21
            [13] = u10
            [14] = u3
            [15] = u6
            [16] = u17
            [17] = u22
            [18] = u5
            [19] = u13
        --]]
        local v25 = p24.useState
        local v26 = p24.useEffect
        local v27, u28 = v25("")
        local v29 = u7.getPlayer(u23.OfflinePlayer)
        local v30 = u23.store.Game.customMatch
        if v30 ~= nil then
            v30 = v30.hostUserId
        end
        local v31 = v30 == u23.OfflinePlayer.userId
        local v32
        if v29 then
            v32 = v29:GetAttribute(u16) == u15.COHOST
        else
            v32 = false
        end
        local v33, u34 = v25({
            ["map"] = {
                ["Red"] = {
                    ["text"] = "<font color=\"#E32743\">Red</font>",
                    ["value"] = "Red"
                },
                ["Blue"] = {
                    ["text"] = "<font color=\"#49B4F2\">Blue</font>",
                    ["value"] = "Blue"
                }
            },
            ["dropDownItems"] = {
                {
                    ["text"] = "<font color=\"#E32743\">Red</font>",
                    ["value"] = "Red"
                },
                {
                    ["text"] = "<font color=\"#49B4F2\">Blue</font>",
                    ["value"] = "Blue"
                }
            }
        })
        local v35 = {}
        for v36, v37 in u23 do
            v35[v36] = v37
        end
        local v38 = v35.Team
        local v39 = v38 == nil and "Spectator" or v38
        v26(function() --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u9
                [3] = u34
                [4] = u23
                [5] = u28
                [6] = u1
                [7] = u12
            --]]
            local u40 = true
            if u4.isHoarceKat() then
                return nil
            end
            local v41 = u9.Controllers.TeamController:getTeamDropdown(true)
            if v41 and v41.dropDownItems then
                u34({
                    ["map"] = v41.map,
                    ["dropDownItems"] = v41.dropDownItems
                })
            end
            local v42 = u9.Controllers.CustomMatchController.playerAvatarImages[u23.OfflinePlayer.userId]
            if v42 == "" or not v42 then
                u1.Promise.defer(function() --[[ Line: 82 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                        [2] = u23
                        [3] = u40
                        [4] = u28
                        [5] = u9
                    --]]
                    local v43, v44 = u12:GetUserThumbnailAsync(u23.OfflinePlayer.userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                    if v44 and u40 then
                        u28(v43)
                        local v45 = u9.Controllers.CustomMatchController.playerAvatarImages
                        v45[u23.OfflinePlayer.userId] = v43
                        return v45
                    end
                end)
            else
                u28(v42)
            end
            return function() --[[ Line: 93 ]]
                --[[
                Upvalues:
                    [1] = u40
                --]]
                u40 = false
            end
        end, {})
        local function v47() --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u20
                [3] = u7
                [4] = u23
                [5] = u19
            --]]
            u8:playSound(u20.UI_CLICK)
            local v46 = u7.getPlayer(u23.OfflinePlayer)
            if v46 then
                u19.Client:Get("BanPlayer"):CallServerAsync(v46)
            end
        end
        local function v48() --[[ Line: 118 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u20
                [3] = u9
                [4] = u23
            --]]
            u8:playSound(u20.UI_CLICK)
            u9.Controllers.CustomMatchController:toggleCohost(u23.OfflinePlayer)
        end
        local v49 = {
            {
                ["text"] = "Blacklist",
                ["callback"] = function() --[[ Line: 107 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u20
                        [3] = u9
                        [4] = u23
                    --]]
                    u8:playSound(u20.UI_CLICK)
                    u9.Controllers.CustomMatchController:blacklistPlayer(u23.OfflinePlayer)
                end
            }
        }
        local v50 = u23.store.Game.customMatch
        if v50 ~= nil then
            v50 = v50.hostUserId
        end
        local v51 = u12.LocalPlayer
        if v51 ~= nil then
            v51 = v51.UserId
        end
        if v50 == v51 then
            local v52 = {
                ["text"] = (v32 and "Remove" or "Give") .. " Cohost",
                ["callback"] = v48
            }
            table.insert(v49, v52)
        end
        if u23.HasGameBanPermission then
            table.insert(v49, {
                ["text"] = "Game Ban",
                ["callback"] = v47
            })
        end
        local v53 = ""
        if v31 then
            v53 = u18.CROWN_SOLID
        elseif v32 then
            v53 = u18.SAFETY_HELMET_SOLID
        end
        local v54 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(1, 0, 0, 40),
            ["BackgroundColor3"] = u21.backgroundPrimary,
            ["LayoutOrder"] = u23.Index
        }
        local v55 = {}
        local v56 = #v55
        local v57 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v58 = { u10.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.15, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0),
                ["PaddingLeft"] = UDim.new(0.03, 0),
                ["PaddingRight"] = UDim.new(0.03, 0)
            }), u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 12)
            }) }
        local v59 = #v58
        local v60 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.4, 1)
        }
        local v61 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }), u10.createElement("ImageLabel", {
                ["LayoutOrder"] = 1,
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = v27
            }, { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(100, 0)
                }) }) }
        local v62 = #v61
        local v63 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.76, 1)
        }
        local v64 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v65 = #v64
        local v66 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.55)
        }
        local v67 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            }) }
        local v68 = #v67
        local v69
        if v53 == "" then
            v69 = false
        else
            v69 = u10.createFragment({
                ["RankIcon"] = u10.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = v53
                })
            })
        end
        if v69 then
            v67[v68 + 1] = v69
        end
        v67[#v67 + 1] = u10.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["AutoLocalize"] = false,
            ["Position"] = UDim2.fromScale(0, 0),
            ["Size"] = UDim2.fromScale(v53 == "" and 1 or 0.8, 1),
            ["Text"] = "<b>" .. u23.OfflinePlayer.displayName .. "</b>",
            ["TextColor3"] = u3.WHITE
        }, { u10.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 18
            }) })
        v64[v65 + 1] = u10.createElement(u6, v66, v67)
        v64[v65 + 2] = u10.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["AutoLocalize"] = false,
            ["Size"] = UDim2.fromScale(1, 0.4),
            ["Text"] = "@" .. u23.OfflinePlayer.name,
            ["TextColor3"] = u3.WHITE
        }, { u10.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }) })
        v61[v62 + 1] = u10.createElement(u6, v63, v64)
        v58[v59 + 1] = u10.createElement(u6, v60, v61)
        local v70 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0.6, -12, 1, 0)
        }
        local v71 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Right",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v72 = #v71
        local v73 = {
            ["Size"] = UDim2.fromScale(0.25, 1)
        }
        local v74
        if u4.isHoarceKat() then
            v74 = "100"
        else
            local v75 = u17:getEntity(u7.getPlayer(u23.OfflinePlayer))
            if v75 ~= nil then
                v75 = v75:getMaxHealth()
            end
            local v76 = tostring(v75)
            v74 = v76 == nil and "nil" or v76
        end
        v73.Text = v74
        v73.NumbersOnly = true
        function v73.OnFocusLost(p77) --[[ Line: 316 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u9
            --]]
            local v78 = tonumber(p77)
            if v78 ~= 0 and (v78 == v78 and v78) then
                local v79 = u23.OfflinePlayer
                u9.Controllers.CustomMatchController:setPlayerMaxHealth(v79, v78)
            end
        end
        v73.LayoutOrder = 1
        v71.Health = u10.createElement(u22, v73)
        if v33 then
            local v80 = {
                ["Size"] = UDim2.fromScale(0.25, 1),
                ["DefaultItem"] = v33.map[v39]
            }
            local v81 = v33.map[v39]
            if v81 ~= nil then
                v81 = v81.text
            end
            v80.PlaceholderText = v81 == nil and "" or v81
            v80.Items = v33.dropDownItems
            function v80.OnItemSelected(p82) --[[ Line: 340 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u8
                    [3] = u20
                    [4] = u9
                --]]
                local v83 = u23.OfflinePlayer
                u8:playSound(u20.UI_CLICK)
                local v84 = u9.Controllers.TeamController:getTeamById(p82)
                if v84 then
                    u9.Controllers.CustomMatchController:setPlayerTeam(v83, v84.name)
                end
            end
            v80.LayoutOrder = 2
            v33 = u10.createElement(u5, v80)
        end
        v71[v72 + 1] = v33
        v71[#v71 + 1] = u10.createElement(u13, {
            ["ButtonText"] = "Actions",
            ["LayoutOrder"] = 3,
            ["Items"] = v49,
            ["Size"] = UDim2.new(0.25, 0, 1, 0)
        })
        v58[v59 + 2] = u10.createElement(u6, v70, v71)
        v55[v56 + 1] = u10.createElement(u6, v57, v58)
        return u10.createFragment({
            ["HostPanelPlayerRow"] = u10.createElement("Frame", v54, v55)
        })
    end)
}