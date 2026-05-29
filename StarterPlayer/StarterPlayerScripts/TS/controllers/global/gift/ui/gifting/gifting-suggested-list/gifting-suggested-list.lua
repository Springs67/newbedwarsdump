local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.StringUtil
local u5 = v2.TabsComponent
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u11 = v1.import(script, script.Parent.Parent, "gift-ui-types").SuggestedPlayerListTabs
local u12 = v1.import(script, script.Parent, "gifting-suggested-list-element").GiftingSuggestedListElement
return {
    ["GiftingSuggestedList"] = v8.new(u7)(function(u13, p14) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u7
            [4] = u6
            [5] = u4
            [6] = u5
            [7] = u9
            [8] = u12
            [9] = u3
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local u17, u18 = v15(u13.SuggestedPlayerListTab)
        local u19, u20 = v15({})
        local v21, u22 = v15({})
        v16(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u11
                [3] = u13
                [4] = u22
                [5] = u20
            --]]
            if u17 == u11.SERVER and u13.PlayersInServer then
                local v23 = u13.PlayersInServer
                local v24 = table.create(#v23)
                for v25, v26 in v23 do
                    local _ = v25 - 1
                    v24[v25] = {
                        ["key"] = v26.name,
                        ["aliases"] = { v26.displayName, v26.name }
                    }
                end
                u22(v24)
                u20(u13.PlayersInServer)
            elseif u17 == u11.FRIENDS and u13.Friends then
                local v27 = u13.Friends
                local v28 = table.create(#v27)
                for v29, v30 in v27 do
                    local _ = v29 - 1
                    v28[v29] = {
                        ["key"] = v30.name,
                        ["aliases"] = { v30.name }
                    }
                end
                u22(v28)
                u20(u13.Friends)
            end
        end, { u13.Friends, u13.PlayersInServer, u17 })
        local function v40(p31, p32) --[[ Line: 75 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u17
                [3] = u11
                [4] = u13
                [5] = u19
            --]]
            if p31 == "" then
                local v33 = u20
                local v34 = {}
                if u17 == u11.SERVER then
                    if u13.PlayersInServer then
                        v34 = u13.PlayersInServer
                    end
                elseif u17 == u11.FRIENDS and u13.Friends then
                    v34 = u13.Friends
                end
                v33(v34)
                return nil
            end
            local v35 = 0
            local v36 = {}
            for v37, v38 in u19 do
                local _ = v37 - 1
                local v39 = v38.name
                if table.find(p32, v39) ~= nil == true then
                    v35 = v35 + 1
                    v36[v35] = v38
                end
            end
            u20(v36)
        end
        local v41 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = u13.Size,
            ["BackgroundColor3"] = u10.backgroundTertiary
        }
        local v42 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 10)
            }), u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }), u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 12),
                ["PaddingBottom"] = UDim.new(0, 12),
                ["PaddingRight"] = UDim.new(0, 16),
                ["PaddingLeft"] = UDim.new(0, 16)
            }) }
        local v43 = #v42
        local v44 = u6.values(u11)
        local v45 = table.create(#v44)
        local v46 = {
            ["Value"] = u17
        }
        for v47, v48 in v44 do
            local _ = v47 - 1
            v45[v47] = {
                ["value"] = v48,
                ["text"] = u4.capitalizeFirstLetter(v48)
            }
        end
        v46.Tabs = v45
        function v46.OnChange(p49) --[[ Line: 142 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18(p49.value)
        end
        v46.FrameProps = {
            ["LayoutOrder"] = 1
        }
        v42[v43 + 1] = u7.createElement(u5, v46)
        v42[v43 + 2] = u7.createElement("Frame", {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 28),
            ["BackgroundColor3"] = u10.backgroundPrimary
        }, { u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 4),
                ["PaddingBottom"] = UDim.new(0, 4),
                ["PaddingRight"] = UDim.new(0, 8),
                ["PaddingLeft"] = UDim.new(0, 0)
            }), u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }), u7.createElement(u9, {
                ["BackgroundTransparency"] = 1,
                ["InputText"] = "",
                ["PlaceHolderText"] = "Username",
                ["LayoutOrder"] = 2,
                ["AutoLocalize"] = false,
                ["Items"] = v21,
                ["Size"] = UDim2.new(0.85, 0, 0, 28),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["OnTextChange"] = v40
            }) })
        table.sort(u19, function(p50, p51) --[[ Line: 178 ]]
            return p50.name < p51.name
        end)
        if u19 ~= nil then
            local v52 = 0
            u19 = {}
            for v53, v54 in u19 do
                local v55
                if v53 - 1 >= 50 then
                    v55 = nil
                else
                    v55 = u7.createElement(u12, {
                        ["OfflineDisplayPlayer"] = v54,
                        ["SetSelectedUser"] = u13.SetSelectedUser
                    })
                end
                if v55 ~= nil then
                    v52 = v52 + 1
                    u19[v52] = v55
                end
            end
        end
        local v56 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 1, -70)
            }
        }
        local v57 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v58 = #v57
        for v59, v60 in u19 do
            v57[v58 + v59] = v60
        end
        v42[v43 + 3] = u7.createElement(u3, v56, v57)
        return u7.createElement("Frame", v41, v42)
    end)
}