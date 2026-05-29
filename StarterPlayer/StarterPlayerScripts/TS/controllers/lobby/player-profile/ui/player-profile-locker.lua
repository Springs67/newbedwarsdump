local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.TabsComponent
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab")
local u14 = v13.LockerTab
local u15 = v13.LockerTabOrder
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u19 = v1.import(script, script.Parent.Parent.Parent, "locker", "ui", "locker-items-grid").LockerItemsGrid
local u20 = v1.import(script, script.Parent.Parent.Parent, "locker", "ui", "locker-util").LockerUtil
local u21 = v1.import(script, script.Parent, "player-profile-empty").PlayerProfileEmpty
return {
    ["PlayerProfileLocker"] = v7.new(u6)(function(p22, p23) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u16
            [4] = u12
            [5] = u17
            [6] = u9
            [7] = u8
            [8] = u14
            [9] = u20
            [10] = u3
            [11] = u18
            [12] = u6
            [13] = u5
            [14] = u15
            [15] = u4
            [16] = u21
            [17] = u19
        --]]
        local v24 = p23.useState
        local _ = p23.useEffect
        local v25 = {
            ["inventory"] = {},
            ["record"] = {}
        }
        local v26 = {
            ["selectedKillEffect"] = u11.NONE,
            ["killEffects"] = p22.ProfileData.locker.killEffects,
            ["selectedEmotes"] = { u10.BED_BREAK },
            ["emotes"] = p22.ProfileData.locker.emotes,
            ["selectedTitle"] = u16.NONE,
            ["titles"] = p22.ProfileData.locker.titles,
            ["selectedLobbyGadget"] = u12.NONE,
            ["lobbyGadgets"] = p22.ProfileData.locker.lobbyGadgets,
            ["selectedWinEffect"] = u17.NONE,
            ["winEffects"] = p22.ProfileData.locker.winEffects,
            ["selectedBreakBedEffect"] = u9.NONE,
            ["breakBedEffects"] = p22.ProfileData.locker.breakBedEffect,
            ["featuredBadges"] = { u8.NONE },
            ["badges"] = {},
            ["bedSkin"] = p22.ProfileData.equipped.bedSkin,
            ["bedSkins"] = p22.ProfileData.locker.bedSkins,
            ["itemSkins"] = {},
            ["selectedItemSkins"] = {},
            ["limitedReward"] = {}
        }
        local v27, u28 = v24(u14.TITLES)
        local v29, v30 = v24(nil)
        local v31 = u20.buildElementGrid(v27, v26, nil, true)
        local v32 = u3.isSmallScreen() and 0.14 or 0.1
        local v33 = 1 - v32
        local v34 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u18.backgroundPrimary
        }
        local v35 = p22.FrameProps
        if v35 then
            for v36, v37 in v35 do
                v34[v36] = v37
            end
        end
        local v38 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v39 = #v38
        local v40 = 0
        local v41 = {}
        local v42 = {
            ["Value"] = v27
        }
        for v43, v44 in u5.values(u14) do
            local _ = v43 - 1
            local v45 = v44 ~= u14.CONSUMABLES and {
                ["value"] = v44,
                ["text"] = v44,
                ["layoutOrder"] = u15[v44]
            } or nil
            if v45 ~= nil then
                v40 = v40 + 1
                v41[v40] = v45
            end
        end
        v42.Tabs = v41
        function v42.OnChange(p46) --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            u28(p46.value)
        end
        v42.FrameProps = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, v32, 0),
            ["BackgroundColor3"] = u18.backgroundTertiary
        }
        v38[v39 + 1] = u6.createElement(u4, v42, { u6.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.1, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0)
            }) })
        local v47
        if #v31 == 0 then
            v47 = u6.createElement(u21, {
                ["Size"] = UDim2.fromScale(1, v33),
                ["Text"] = "No " .. string.lower(v27) .. " owned."
            })
        else
            local v48 = {
                ["Size"] = UDim2.fromScale(0.95, v33) - UDim2.fromScale(0, 0.1),
                ["Tab"] = v27,
                ["ConsumableInventory"] = v25.inventory,
                ["MinSize"] = Vector2.new(0, 0),
                ["MaxSize"] = Vector2.new((1 / 0), (1 / 0)),
                ["Elements"] = v31,
                ["EquippedElement"] = v29,
                ["SetElement"] = v30,
                ["LayoutOrder"] = 2,
                ["ViewOnly"] = true,
                ["SearchBarHeight"] = u3.isSmallScreen() and 20 or nil,
                ["SearchBarPadding"] = u3.isSmallScreen() and 5 or nil
            }
            v47 = u6.createElement(u19, v48)
        end
        v38[v39 + 2] = v47
        return u6.createElement("Frame", v34, v38)
    end)
}