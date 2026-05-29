local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local v4 = v2.GetTarmacAsset
local u5 = v2.ImageGrid
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta").getMapMeta
local u9 = v4("NoImage")
return {
    ["CustomMatchesClassicMaps"] = v7.new(u6)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u8
            [3] = u6
            [4] = u3
            [5] = u5
        --]]
        local _ = p11.useState
        local v12 = p11.useEffect
        local v13 = u10.SelectedGamemode.metadata.maps
        local v14 = table.create(#v13)
        for v15, v16 in v13 do
            local _ = v15 - 1
            v14[v15] = v16.mapName
        end
        table.sort(v14)
        local function v22(p17) --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u8
            --]]
            local v18 = u9
            local v19 = string.split(p17, "_")[1]
            local v20 = u8(p17)
            if v20 ~= nil then
                v20 = v20.mapImage
            end
            local v21
            if v19 == "" then
                v21 = v19
            elseif v19 then
                v21 = v20
            else
                v21 = v19
            end
            if v21 ~= "" and v21 then
                v18 = v20[v19] or u9
            end
            return {
                ["asset"] = v18,
                ["alt"] = string.gsub(string.split(p17, "_")[2], "-", " "),
                ["id"] = p17
            }
        end
        local v23 = table.create(#v14)
        for v24, v25 in v14 do
            v23[v24] = v22(v25, v24 - 1, v14)
        end
        table.sort(v23, function(p26, p27) --[[ Line: 56 ]]
            if p26.id == "to4_Sandbox" then
                return true
            elseif p27.id == "to4_Sandbox" then
                return false
            else
                return p26.id < p27.id
            end
        end)
        local v28 = {
            ["alt"] = "Random",
            ["id"] = "",
            ["asset"] = u9
        }
        table.insert(v23, 1, v28)
        v12(function() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            u10.setMapInfo({
                ["queueType"] = u10.SelectedGamemode.queueType,
                ["selectedMap"] = {
                    ["name"] = "Random",
                    ["id"] = ""
                }
            })
        end, { u10.SelectedGamemode })
        local v29 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v30 = u10.FrameProps
        if v30 then
            for v31, v32 in v30 do
                v29[v31] = v32
            end
        end
        local v33 = u6.createFragment
        local v34 = {}
        local v35 = u6.createElement
        local v36 = u3
        local v37 = {}
        local v38 = u6.createElement
        local v39 = {
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["TextTransparency"] = 0.1,
            ["TextSize"] = 14,
            ["Size"] = UDim2.new(1, 0, 0, 14)
        }
        local v40 = #v23
        v39.Text = "<b>SELECT A MAP (" .. tostring(v40) .. ")</b>"
        v39.TextXAlignment = Enum.TextXAlignment.Left
        v39.TextColor3 = Color3.new(1, 1, 1)
        v39.Font = Enum.Font.Roboto
        __set_list(v37, 1, {(v38("TextLabel", v39))})
        v37[u10.SelectedGamemode.metadata.title] = u6.createElement(u5, {
            ["UpdateContainerSize"] = false,
            ["ToFriendlyCase"] = false,
            ["Size"] = UDim2.new(1, 0, 1, -10),
            ["Position"] = UDim2.fromOffset(0, 22),
            ["ScrollingDirection"] = Enum.ScrollingDirection.Y,
            ["Images"] = v23,
            ["OnSelectionChange"] = function(p41, p42, p43) --[[ Name: OnSelectionChange, Line 111 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                local v44 = u10.setMapInfo
                local v45 = {
                    ["queueType"] = u10.SelectedGamemode.queueType,
                    ["selectedMap"] = {
                        ["id"] = p41,
                        ["name"] = p42,
                        ["thumbnail"] = p43
                    }
                }
                v44(v45)
            end,
            ["ImageSize"] = UDim2.new(0.24, 0, 0, 86)
        })
        v34.CustomMatchesDefaultMaps = v35(v36, v29, v37)
        return v33(v34)
    end)
}