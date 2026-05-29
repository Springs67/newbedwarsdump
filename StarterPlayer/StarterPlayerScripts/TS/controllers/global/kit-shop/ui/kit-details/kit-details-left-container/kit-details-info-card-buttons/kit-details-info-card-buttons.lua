local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u17 = v1.import(script, script.Parent, "buttons", "kit-details-armor-trim-button").KitDetailsArmorTrimButton
local u18 = v1.import(script, script.Parent, "buttons", "kit-details-contract-button").KitDetailsContractButton
return {
    ["KitDetailsInfoCardButtons"] = v9.new(u8)(function(u19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u12
            [4] = u16
            [5] = u11
            [6] = u13
            [7] = u15
            [8] = u8
            [9] = u17
            [10] = u18
            [11] = u6
            [12] = u2
            [13] = u10
            [14] = u4
            [15] = u14
        --]]
        local _ = p20.useState
        local _ = p20.useMemo
        local _ = p20.useEffect
        local v21
        if u19.SelectedBundle then
            v21 = false
        else
            v21 = not u5.isHoarceKat() and u7.Controllers.UnlockController:isKitUnlocked(u19.SelectedKit or u12.NONE)
            if v21 then
                v21 = u16.isLobbyServer()
            end
            if v21 then
                local v22 = u11.BLACK_LISTED_ARMOR_TRIM_KITS
                local v23 = u19.SelectedKit or u12.NONE
                local v24 = table.find(v22, v23) ~= nil
                v21 = not v24
            end
        end
        local v25 = false
        local v26 = false
        if u19.SelectedKit ~= u12.NONE then
            v25 = u13(u19.SelectedKit).lore and true or v25
            local v27 = u15[u19.SelectedKit] ~= nil
            if v27 then
                local v28 = u15[u19.SelectedKit]
                if v28 ~= nil then
                    v28 = v28.disabled
                end
                v27 = not v28
            end
            if v27 then
                v26 = true
            end
        end
        local v29 = {}
        for v30, v31 in u19 do
            v29[v30] = v31
        end
        v29.SelectedKit = nil
        v29.store = nil
        local v32 = {}
        for v33, v34 in v29 do
            v32[v33] = v34
        end
        local v35 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.075, 0)
            }) }
        local v36 = #v35
        if v21 then
            v21 = u8.createElement(u17, {
                ["SelectedKit"] = u19.SelectedKit,
                ["store"] = u19.store,
                ["Size"] = UDim2.fromScale(0.325, 1)
            })
        end
        if v21 then
            v35[v36 + 1] = v21
        end
        local v37 = #v35
        if v26 then
            v26 = u8.createElement(u18, {
                ["SelectedKit"] = u19.SelectedKit,
                ["store"] = u19.store,
                ["Size"] = UDim2.fromScale(0.325, 1)
            })
        end
        if v26 then
            v35[v37 + 1] = v26
        end
        local v38 = #v35
        if v25 then
            v25 = u8.createElement(u6, {
                ["Size"] = UDim2.fromScale(0.2, 1)
            }, { u8.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 3)
                }), u8.createElement("TextButton", {
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["BackgroundColor3"] = Color3.fromRGB(45, 45, 45),
                    ["Text"] = "",
                    [u8.Event.Activated] = function() --[[ Line: 107 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u10
                            [3] = u19
                        --]]
                        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u10.LORE, {
                            ["SelectedKit"] = u19.SelectedKit
                        })
                    end
                }, { u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 4)
                    }), u8.createElement("Frame", {
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["BackgroundColor3"] = u4.WHITE
                    }, { u8.createElement("UIGradient", {
                            ["Rotation"] = -90,
                            ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 0.9) })
                        }), u8.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0, 4)
                        }) }), u8.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0.8, 0.8),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Image"] = u14.SCROLL_SOLID,
                        ["ScaleType"] = Enum.ScaleType.Fit
                    }, { u8.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) }) }), u8.createElement(u6, {
                    ["Size"] = UDim2.fromScale(1, 0.1)
                }) })
        end
        if v25 then
            v35[v38 + 1] = v25
        end
        return u8.createElement(u6, v32, v35)
    end)
}