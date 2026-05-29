local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "armor-trim", "ui", "armor-trim-player-viewport").ArmorTrimPlayerViewport
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank")
local u10 = v9.ArmorTrimEffectRank
local u11 = v9.ArmorTrimEffectRankMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "progress", "armor-trim-progress-util").ArmorTrimProgressUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u15 = v1.import(script, script.Parent.Parent, "kit-details-button").KitDetailsButton
return {
    ["KitDetailsArmorTrimButton"] = v6.new(u5)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u4
            [3] = u10
            [4] = u11
            [5] = u2
            [6] = u8
            [7] = u14
            [8] = u12
            [9] = u3
            [10] = u5
            [11] = u7
            [12] = u15
        --]]
        local _ = p17.useState
        local v18 = u16.store.ArmorTrim.selectedArmorTrimConfigs[u16.SelectedKit]
        local v19 = u16.store.ArmorTrim.allKitProgress[u16.SelectedKit]
        local v20
        if v19 == nil then
            v20 = v19
        else
            v20 = nil
            for v21, v22 in v19 do
                local _ = v21 - 1
                local v23 = v22.trim
                local v24
                if v18 == nil then
                    v24 = v18
                else
                    v24 = v18.type
                end
                if v23 == v24 == true then
                    v20 = v22
                    break
                end
            end
        end
        local v25 = u16.store.ArmorTrim.selectedArmorTrimConfigs[u16.SelectedKit]
        if v19 ~= nil then
            v19 = nil
            for v26, v27 in v19 do
                local _ = v26 - 1
                local v28 = v27.trim
                local v29
                if v25 == nil then
                    v29 = v25
                else
                    v29 = v25.type
                end
                if v28 == v29 == true then
                    v19 = v27
                    break
                end
            end
        end
        local v30 = u13
        local v31
        if v19 == nil then
            v31 = v19
        else
            v31 = v19.xpEarned
        end
        local v32 = v31 == nil and 0 or v31
        local v33 = v30.getTier(v32)
        local v34 = u4.values(u10)
        table.sort(v34, function(p35, p36) --[[ Line: 77 ]]
            return p35 < p36
        end)
        local v37 = #v34 - 1
        local v38 = v34[math.min(v37, v33) + 1]
        local v39 = u11
        local v40
        if v38 == nil then
            v40 = u10.T1
        else
            v40 = v38
        end
        local v41 = v39[v40]
        local v42 = u13.getXpAtTier(v33)
        local v43 = u13.getXpAtTier(v33 + 1)
        local v44 = u13.getXpAtTier
        local v45 = u13.getMaxTier
        local v46 = math.min(v43, v44(v45())) - v42
        local v47 = {}
        for v48, v49 in u16 do
            v47[v48] = v49
        end
        v47.SelectedKit = nil
        v47.store = nil
        local v50 = {}
        for v51, v52 in v47 do
            v50[v51] = v52
        end
        v50.Title = "ARMOR TRIM"
        v50.Subtitle = "VIEW"
        function v50.OnClick() --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u8
                [3] = u16
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u8.ARMOR_TRIM_APP, {
                ["SelectedKit"] = u16.SelectedKit
            })
        end
        local v53
        if v19 == nil then
            v53 = v19
        else
            v53 = v19.xpEarned
        end
        local v54
        if v53 == 0 or (v53 ~= v53 or not v53) then
            v54 = nil
        else
            v54 = (v19.xpEarned - v42) / v46
        end
        v50.Progress = v54
        local v55 = {}
        local v56 = #v55
        local v57 = {
            ["ButtonMode"] = "NONE",
            ["BackgroundTransparency"] = 0,
            ["SelectedKit"] = u14.NONE,
            ["Size"] = UDim2.fromScale(1, 0.7),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(87, 87, 87)
        }
        local v58
        if v25 == nil then
            v58 = v25
        else
            v58 = v25.type
        end
        if v58 == nil then
            v58 = u12.TRIM_1
        end
        v57.ArmorTrimType = v58
        v57.ArmorTrimEffectRank = v38
        v57.Rotate = false
        v57.ViewportProps = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v59 = {
            ["armorSet"] = "IRON"
        }
        local v60
        if v25 == nil then
            v60 = v25
        else
            v60 = v25.color
        end
        local v61
        if v60 then
            v61 = Color3.new(v25.color.r, v25.color.g, v25.color.b)
        else
            v61 = u3.WHITE
        end
        v59.armorTrimColor = v61
        v57.StartingSelection = v59
        v55[v56 + 1] = u5.createElement(u7, v57, { u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u5.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["TextStrokeTransparency"] = 0,
                ["TextTransparency"] = 0.25,
                ["ZIndex"] = 100,
                ["Size"] = UDim2.fromScale(1, 0.35),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.8),
                ["Text"] = v41.text,
                ["TextColor3"] = u3.WHITE,
                ["TextStrokeColor3"] = u3.BLACK,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }) })
        return u5.createElement(u15, v50, v55)
    end)
}