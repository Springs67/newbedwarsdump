local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DropdownComponent
local u4 = v2.Empty
local u5 = v2.TextInputComponent
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-constants").ServerBrowserConstants
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-types").LiveServerVisibilityMode
local v14 = v6.values(v13)
local u15 = table.create(#v14)
for v16, v17 in v14 do
    local _ = v16 - 1
    u15[v16] = {
        ["text"] = string.upper(v17),
        ["value"] = v17
    }
end
local v18 = 0
local u19 = {}
for v20, v21 in v6.values(v11) do
    local _ = v20 - 1
    local v22 = u10(v21)
    local v23 = v22.disableInCustom ~= true and {
        ["text"] = v22.title,
        ["value"] = v21
    } or nil
    if v23 ~= nil then
        v18 = v18 + 1
        u19[v18] = v23
    end
end
table.sort(u19, function(p24, p25) --[[ Line: 51 ]]
    return p24.text < p25.text
end)
return {
    ["CreateMatchGameSettings"] = v8.new(u7)(function(u26, p27) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u9
            [3] = u4
            [4] = u3
            [5] = u15
            [6] = u19
            [7] = u10
            [8] = u12
            [9] = u5
        --]]
        local _ = p27.useState
        local v28 = u7.createRef()
        local v29 = u26.GameInfo
        if v29 ~= nil then
            v29 = v29.thumbnail
        end
        local v30
        if v29 == "" or not v29 then
            v30 = v29
        else
            v30 = not u9.startsWith(v29, "rbxassetid://")
        end
        if v30 ~= "" and v30 then
            local _ = "rbxassetid://" .. v29
        end
        local v31 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["ZIndex"] = 1000,
            ["Size"] = UDim2.new(1, 0, 0, 42)
        }
        local v32 = u26.FrameProps
        if v32 then
            for v33, v34 in v32 do
                v31[v33] = v34
            end
        end
        local v40 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }), u7.createElement(u4, {
                ["AutomaticSize"] = "X",
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 1000,
                ["Size"] = UDim2.fromScale(0, 1)
            }, { u7.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Text"] = "<b>VISIBILITY</b>",
                    ["RichText"] = true,
                    ["TextTransparency"] = 0.1,
                    ["TextSize"] = 14,
                    ["Size"] = UDim2.new(1, 0, 0, 14),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextColor3"] = Color3.new(1, 1, 1),
                    ["Font"] = Enum.Font.Roboto
                }), u7.createElement(u3, {
                    ["MaxItemsPerDisplay"] = 8,
                    ["ExtraButtonWidth"] = 100,
                    ["Size"] = UDim2.fromOffset(100, 28),
                    ["Position"] = UDim2.new(0, 0, 0, 20),
                    ["DefaultItem"] = u15[2],
                    ["Items"] = u15,
                    ["OnItemSelected"] = function(p35) --[[ Name: OnItemSelected, Line 112 ]]
                        --[[
                        Upvalues:
                            [1] = u26
                        --]]
                        local v36 = u26
                        local v37 = {}
                        for v38, v39 in u26.GameInfo do
                            v37[v38] = v39
                        end
                        v37.visibilityMode = p35
                        v36.SetGameInfo(v37)
                    end
                }) }) }
        local v41 = #v40
        local v42
        if u26.SubTab == "official_maps" then
            local v43 = u7.createFragment
            local v44 = {}
            local v45 = u7.createElement
            local v46 = u4
            local v47 = {
                ["AutomaticSize"] = "X",
                ["ZIndex"] = 2,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(0, 0, 1, 0)
            }
            local v48 = { (u7.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Text"] = "<b>SELECT A GAMEMODE</b>",
                    ["RichText"] = true,
                    ["TextTransparency"] = 0.1,
                    ["TextSize"] = 14,
                    ["Size"] = UDim2.new(1, 0, 0, 14),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextColor3"] = Color3.new(1, 1, 1),
                    ["Font"] = Enum.Font.Roboto
                })) }
            local v49 = u7.createElement
            local v50 = u3
            local v53 = {
                ["MaxItemsPerDisplay"] = 8,
                ["Position"] = UDim2.fromOffset(0, 22),
                ["DefaultItem"] = {
                    ["text"] = u26.SelectedGamemode.metadata.title,
                    ["value"] = u26.SelectedGamemode.metadata.title
                },
                ["Items"] = u19,
                ["OnItemSelected"] = function(p51) --[[ Name: OnItemSelected, Line 152 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u26
                    --]]
                    local v52 = u10(p51)
                    if not v52 then
                        return nil
                    end
                    u26.SetSelectedGamemode({
                        ["queueType"] = p51,
                        ["metadata"] = v52
                    })
                end
            }
            v48.GamemodeDropdown = v49(v50, v53)
            v44.SelectGamemodeSection = v45(v46, v47, v48)
            v42 = v43(v44)
        else
            v42 = false
        end
        if v42 then
            v40[v41 + 1] = v42
        end
        local v54 = #v40
        local v55 = {
            ["AutomaticSize"] = "X",
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0, 1)
        }
        local v56 = { u7.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["Text"] = "<b>GAME NAME</b>",
                ["RichText"] = true,
                ["TextTransparency"] = 0.1,
                ["TextSize"] = 14,
                ["Size"] = UDim2.new(1, 0, 0, 14),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = Color3.new(1, 1, 1),
                ["Font"] = Enum.Font.Roboto
            }) }
        local v57 = #v56
        local v58 = {}
        local v59 = {
            ["PlaceholderText"] = "",
            ["Position"] = UDim2.new(0, 0, 0, 20),
            ["Size"] = UDim2.fromOffset(300, 28)
        }
        local v60 = u26.GameInfo
        if v60 ~= nil then
            v60 = v60.title
        end
        v59.Text = v60
        v59.TextXAlignment = Enum.TextXAlignment.Left
        v59.ClearTextOnFocus = false
        v58.TextBox = v59
        v58.ClearTextOnEnter = false
        function v58.OnFocusLost(p61) --[[ Line: 214 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            local v62 = u26
            local v63 = {}
            for v64, v65 in u26.GameInfo do
                v63[v64] = v65
            end
            v63.title = p61
            return v62.SetGameInfo(v63)
        end
        v58.MaxCharacters = u12.GAME_NAME_MAX_CHARS
        v58[u7.Ref] = v28
        v56[v57 + 1] = u7.createElement(u5, v58)
        v40[v54 + 1] = u7.createElement(u4, v55, v56)
        return u7.createFragment({
            ["CreateMatchGameSettings"] = u7.createElement("Frame", v31, v40)
        })
    end)
}