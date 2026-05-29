local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class").BedwarsClass
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-meta").BedBreakEffectMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-meta").WinEffectMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u19 = v1.import(script, script.Parent.Parent.Parent, "stats-board", "ui", "section-title").SectionTitle
local u20 = v1.import(script, script.Parent, "equipped-row").EquippedRow
return {
    ["CurrentlyEquipped"] = v7.new(u6)(function(p21, p22) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u10
            [3] = u11
            [4] = u15
            [5] = u13
            [6] = u17
            [7] = u8
            [8] = u6
            [9] = u5
            [10] = u19
            [11] = u20
            [12] = u12
            [13] = u16
            [14] = u14
            [15] = u18
            [16] = u3
            [17] = u4
        --]]
        local _ = p22.useState
        local v23 = p21.ProfileData.equipped
        local v24 = u9(v23.activeKit)
        local v25 = v24.kitClass
        if v25 == nil then
            v25 = u10.MISC
        end
        local v26 = u11(v25)
        local v27 = u11(u10.FIGHTER).imageId
        local v28 = u15[v23.selectedKillEffect]
        local v29 = u13[v23.selectedBedBreakEffect]
        local v30 = u17[v23.selectedWinEffect]
        local v31
        if v23.bedSkin then
            v31 = u8(v23.bedSkin)
        else
            v31 = nil
        end
        local v32 = {
            ["Size"] = p21.Size or UDim2.fromScale(1, 1),
            ["LayoutOrder"] = p21.LayoutOrder
        }
        local v33 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u6.createElement(u5, {
                ["Padding"] = {
                    ["Right"] = 10,
                    ["Left"] = 10,
                    ["Top"] = 10,
                    ["Bottom"] = 0
                }
            }), u6.createElement(u19, {
                ["title"] = "Equipped",
                ["SectionDivider"] = true
            }) }
        local v34 = #v33
        local v35 = {
            ["ScrollingFrameProps"] = {
                ["Size"] = UDim2.fromScale(1, 0.9)
            }
        }
        local v36 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }) }
        local _ = #v36
        local v37 = {
            ["LayoutOrder"] = 3
        }
        local v38
        if v24 == nil then
            v38 = v24
        else
            v38 = v24.renderImage
        end
        v37.Image = v38
        if v25 ~= u10.MISC then
            v27 = v26.imageId
        end
        v37.Icon = v27
        v37.Type = "Kit"
        if v24 ~= nil then
            v24 = v24.name
        end
        v37.Name = v24
        v37.None = false
        v36.KitRow = u6.createElement(u20, v37)
        local v39 = {
            ["LayoutOrder"] = 0
        }
        local v40
        if v28 == nil then
            v40 = v28
        else
            v40 = v28.image
        end
        v39.Image = v40 == nil and "" or v40
        v39.Icon = u12.HUD_KILLS_ICON
        v39.Type = "Kill Effect"
        if v28 ~= nil then
            v28 = v28.name
        end
        v39.Name = v28
        v39.None = v23.selectedKillEffect == u16.NONE
        v36.KillEffectRow = u6.createElement(u20, v39)
        local v41 = {
            ["LayoutOrder"] = 2
        }
        local v42
        if v29 == nil then
            v42 = v29
        else
            v42 = v29.image
        end
        v41.Image = v42 == nil and "" or v42
        v41.Icon = u12.HUD_BEDS_ICON
        v41.Type = "Bed Break Effect"
        if v29 ~= nil then
            v29 = v29.name
        end
        v41.Name = v29
        v41.None = v23.selectedBedBreakEffect == u14.NONE
        v36.BedBreakEffectRow = u6.createElement(u20, v41)
        local v43 = {
            ["LayoutOrder"] = 3
        }
        local v44
        if v30 == nil then
            v44 = v30
        else
            v44 = v30.image
        end
        v43.Image = v44 == nil and "" or v44
        v43.Icon = u12.TROPHY_SOLID
        v43.Type = "Win Effect"
        if v30 ~= nil then
            v30 = v30.name
        end
        v43.Name = v30
        v43.None = v23.selectedWinEffect == u18.NONE
        v36.WinEffectRow = u6.createElement(u20, v43)
        local v45 = {
            ["LayoutOrder"] = 4
        }
        local v46
        if v31 == nil then
            v46 = v31
        else
            v46 = v31.renderImage
        end
        v45.Image = v46 == nil and "" or v46
        v45.Icon = u12.HUD_BEDS_ICON
        v45.Type = "Bed Skin"
        local v47
        if v31 == nil then
            v47 = v31
        else
            v47 = v31.name
        end
        v45.Name = v47 == nil and "" or v47
        v45.None = v31 == nil
        v36.BedSkinRow = u6.createElement(u20, v45)
        v33[v34 + 1] = u6.createElement(u3, v35, v36)
        return u6.createElement(u4, v32, v33)
    end)
}