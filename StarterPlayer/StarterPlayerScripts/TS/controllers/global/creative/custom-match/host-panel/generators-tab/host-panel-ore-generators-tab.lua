local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.DropdownComponent
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, script.Parent.Parent, "components", "host-panel-setting").HostPanelSetting
local u11 = v1.import(script, script.Parent.Parent, "components", "host-panel-textbox").HostPanelTextBox
local u12 = UDim2.new(1, 0, 0, 50)
return {
    ["HostPanelOreGeneratorsTab"] = v8.new(u7)(function(p13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u6
            [3] = u7
            [4] = u4
            [5] = u12
            [6] = u11
            [7] = u10
            [8] = u9
            [9] = u5
        --]]
        local v15 = p14.useState
        local v16 = u3.isHoarceKat() and {
            ["map"] = {
                ["Blue"] = {
                    ["text"] = "<font color=\"#49B4F2\">Blue</font>",
                    ["value"] = "1"
                },
                ["Red"] = {
                    ["text"] = "<font color=\"#E32743\">Red</font>",
                    ["value"] = "2"
                }
            },
            ["dropDownItems"] = {
                {
                    ["text"] = "<font color=\"#49B4F2\">Blue</font>",
                    ["value"] = "1"
                },
                {
                    ["text"] = "<font color=\"#E32743\">Red</font>",
                    ["value"] = "2"
                }
            }
        } or u6.Controllers.TeamController:getTeamDropdown()
        local u17, v18 = v15(p13.store.Game.teams[1].id)
        local v19 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v20 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = "Left",
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v21 = #v20
        if v16 then
            local v22 = {
                ["Size"] = UDim2.fromScale(0.4, 1),
                ["DefaultItem"] = v16.map[p13.store.Game.teams[1].name]
            }
            local v23 = v16.map[p13.store.Game.teams[1].name]
            if v23 ~= nil then
                v23 = v23.text
            end
            v22.PlaceholderText = v23
            v22.Items = v16.dropDownItems
            v22.OnItemSelected = v18
            v22.LayoutOrder = 1
            v16 = u7.createElement(u4, v22)
        end
        local v24 = {
            ["Name"] = "Team Generator Speed Multiplier",
            ["Hint"] = "(multiplier)",
            ["Size"] = u12
        }
        local v25 = {
            [#v25 + 1] = v16
        }
        local v26 = #v25
        local v27 = {
            ["Size"] = UDim2.fromScale(0.6, 1)
        }
        local v28 = p13.store.CustomMatch.teamGenerators[u17]
        local v29 = v28 == nil and 1 or v28
        v27.Text = tostring(v29)
        local v30 = p13.store.CustomMatch.teamGenerators[u17]
        local v31 = v30 == nil and 1 or v30
        v27.PlaceholderText = tostring(v31)
        v27.NumbersOnly = true
        function v27.OnFocusLost(p32) --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u17
            --]]
            local v33 = tonumber(p32)
            if v33 ~= 0 and (v33 == v33 and v33) then
                u6.Controllers.CustomMatchController:setTeamOreGenerators(v33, u17)
            end
        end
        v27.LayoutOrder = 2
        v25[v26 + 1] = u7.createElement(u11, v27)
        v20[v21 + 1] = u7.createElement(u10, v24, v25)
        local v34 = v21 + 2
        local v35 = u7.createElement
        local v36 = u10
        local v37 = {
            ["Name"] = "Emerald Generator Speed Multiplier",
            ["Hint"] = "(multiplier)",
            ["Size"] = u12
        }
        local v38 = {}
        local v39 = u7.createElement
        local v40 = u11
        local v41 = {
            ["NumbersOnly"] = true
        }
        local v42 = p13.store.CustomMatch.globalGenerators.emerald
        v41.Text = tostring(v42)
        local v43 = p13.store.CustomMatch.globalGenerators.emerald
        v41.PlaceholderText = tostring(v43)
        function v41.OnFocusLost(p44) --[[ Line: 118 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u6
            --]]
            local v45 = u9.EMERALD
            local v46 = tonumber(p44)
            if v46 ~= 0 and (v46 == v46 and v46) then
                u6.Controllers.CustomMatchController:setGlobalOreGenerators(v46, v45)
            end
        end
        __set_list(v38, 1, {v39(v40, v41)})
        v20[v34] = v35(v36, v37, v38)
        local v47 = v21 + 3
        local v48 = u7.createElement
        local v49 = u10
        local v50 = {
            ["Name"] = "Diamond Generator Speed Multiplier",
            ["Hint"] = "(multiplier)",
            ["Size"] = u12
        }
        local v51 = {}
        local v52 = u7.createElement
        local v53 = u11
        local v54 = {
            ["NumbersOnly"] = true
        }
        local v55 = p13.store.CustomMatch.globalGenerators.diamond
        v54.Text = tostring(v55)
        local v56 = p13.store.CustomMatch.globalGenerators.diamond
        v54.PlaceholderText = tostring(v56)
        function v54.OnFocusLost(p57) --[[ Line: 132 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u6
            --]]
            local v58 = u9.DIAMOND
            local v59 = tonumber(p57)
            if v59 ~= 0 and (v59 == v59 and v59) then
                u6.Controllers.CustomMatchController:setGlobalOreGenerators(v59, v58)
            end
        end
        __set_list(v51, 1, {v52(v53, v54)})
        v20[v47] = v48(v49, v50, v51)
        return u7.createElement(u5, v19, v20)
    end)
}