local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DropdownComponent
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, script.Parent, "searchbar").Searchbar
return {
    ["DropdownSearchbar"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u7
            [4] = u4
        --]]
        local u10, u11 = p9.useState(u8.DropdownItems[1].value)
        local v12 = {
            ["Size"] = u8.Size or UDim2.fromScale(1, 1)
        }
        local v13 = u8.FrameProps
        if v13 then
            for v14, v15 in v13 do
                v12[v14] = v15
            end
        end
        local v16 = {}
        local v17 = #v16
        local v20 = {
            ["MaxItemsPerDisplay"] = 8,
            ["Size"] = UDim2.fromScale(0.2, 1),
            ["Position"] = UDim2.fromOffset(0, 0),
            ["DefaultItem"] = u8.DropdownItems[1],
            ["BackgroundColor3"] = Color3.fromRGB(21, 21, 38),
            ["Items"] = u8.DropdownItems,
            ["OnItemSelected"] = function(p18) --[[ Name: OnItemSelected, Line 29 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u8
                --]]
                u11(p18)
                local v19 = u8.OnDropdownValueChange
                if v19 ~= nil then
                    v19(p18)
                end
            end
        }
        local v21 = u8.DropdownProps
        if v21 then
            for v22, v23 in v21 do
                v20[v22] = v23
            end
        end
        v16[v17 + 1] = u5.createElement(u3, v20)
        local v24 = {
            ["PlaceHolderText"] = "SEARCH"
        }
        local v25 = u8.Searchbar
        if v25 ~= nil then
            v25 = v25.Size
        end
        v24.Position = UDim2.new(not v25 and 0.2 or 1 - u8.Searchbar.Size.X.Scale, 0, 0, 0)
        function v24.OnFocusLost(p26, p27, p28) --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u10
            --]]
            u8.OnFocusLost(p26, p27, u10, p28)
        end
        local v29 = u8.Searchbar
        if v29 then
            for v30, v31 in v29 do
                v24[v30] = v31
            end
        end
        v16[v17 + 2] = u5.createElement(u7, v24)
        return u5.createFragment({
            ["DropdownSearchbar"] = u5.createElement(u4, v12, v16)
        })
    end)
}