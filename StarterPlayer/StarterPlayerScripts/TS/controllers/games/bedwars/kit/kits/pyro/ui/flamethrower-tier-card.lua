local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.LineButton
local u5 = v2.LineFrame
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "flamethrower-upgrade").getFlamethrowerUpgradeMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
return {
    ["FlamethrowerTierCard"] = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
            [3] = u9
            [4] = u7
            [5] = u3
            [6] = u5
            [7] = u4
            [8] = u12
            [9] = u6
        --]]
        local _ = p14.useState
        local v15 = u13.UpgradeMap[u13.Upgrade]
        local v16 = (v15 == nil and -1 or v15) + 1
        local v17 = u10(u13.Upgrade)
        local v18
        if v16 < #v17.tiers then
            v18 = v17.tiers[v16 + 1]
        else
            v18 = nil
        end
        local v19 = false
        local v20
        if v18 then
            local v21 = u11
            local v22 = u9.LocalPlayer
            local v23
            if v18 == nil then
                v23 = v18
            else
                v23 = v18.currency
            end
            local v24
            if v18 == nil then
                v24 = v18
            else
                v24 = v18.price
            end
            v20 = v21.hasEnough(v22, v23, v24)
        else
            v20 = v18
        end
        local v25 = v20 and true or v19
        local v26 = u13.Locked and v16 + 1 == 4 and true or false
        local v27 = u7.createElement
        local v28 = "Frame"
        local v29 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = u13.Size,
            ["Position"] = u13.Position,
            ["AnchorPoint"] = u13.AnchorPoint
        }
        local v30 = {}
        local v31 = u7.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder"
        })
        local v32 = u7.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.18867924528301888)
        }, { u7.createElement("TextLabel", {
                ["Font"] = "RobotoCondensed",
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Bottom",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.6, 0.9),
                ["Position"] = UDim2.fromScale(0, 0),
                ["Text"] = "<b>" .. v17.name .. ":</b>  Tier " .. tostring(v16),
                ["TextColor3"] = u3.WHITE
            }) })
        local v33 = u7.createElement
        local v34 = "Frame"
        local v35 = {
            ["BackgroundTransparency"] = 0.5,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.9270440251572327),
            ["BackgroundColor3"] = u3.hexColor(0)
        }
        local v36 = {}
        local v37 = u7.createElement
        local v38 = u5
        local v39 = {
            ["BorderWidthPixels"] = 2,
            ["BorderTransparency"] = 1,
            ["BorderColor3"] = u3.WHITE,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v40 = {}
        local v41 = u7.createElement("UIListLayout", {
            ["SortOrder"] = "LayoutOrder",
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center"
        })
        local v42 = u7.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.5)
        }, { u7.createElement("TextLabel", {
                ["Font"] = "RobotoCondensed",
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Center",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Text"] = not v18 and "" or v18.name,
                ["Size"] = UDim2.fromScale(0.95, 0.45),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["TextColor3"] = u3.WHITE
            }) })
        local v43 = u7.createElement
        local v44 = "Frame"
        local v45 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.5)
        }
        local v46 = {}
        local v47 = u7.createElement
        local v48 = u4
        local v49 = {
            ["Size"] = UDim2.fromScale(0.95, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Color3"] = u3.hexColor(16727624)
        }
        local v50
        if v18 then
            if v26 then
                v50 = "LOCKED"
            else
                local v51 = v18.price
                v50 = tostring(v51) .. " " .. string.upper(v18.currency) .. (v18.price == 1 and "" or "S")
            end
        else
            v50 = "MAXED"
        end
        v49.Text = v50
        function v49.OnClick() --[[ Line: 126 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u13
                [3] = u6
            --]]
            u12.Client:Get("UpgradeFlamethrower"):CallServerAsync(u13.Upgrade):andThen(function(p52) --[[ Line: 128 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u13
                --]]
                if p52 then
                    u6.Controllers.FlamethrowerController:upgrade()
                    u13.SetUpgrades(p52)
                end
            end)
        end
        if v25 then
            if v18 == nil then
                v25 = false
            else
                v25 = not v26
            end
        end
        v49.Enabled = v25
        __set_list(v46, 1, {v47(v48, v49)})
        __set_list(v40, 1, {v41, v42, v43(v44, v45, v46)})
        __set_list(v36, 1, {v37(v38, v39, v40)})
        __set_list(v30, 1, {v31, v32, v33(v34, v35, v36)})
        return v27(v28, v29, v30)
    end)
}