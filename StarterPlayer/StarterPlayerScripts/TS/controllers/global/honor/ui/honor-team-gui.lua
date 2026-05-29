local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent, "honor-player-card-gui").HonorPlayerCardGUI
local u9 = v1.import(script, script.Parent, "honor-team-header-gui").HonorTeamHeaderGUI
return {
    ["HonorTeamGUI"] = v6.new(u5)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u9
            [3] = u3
            [4] = u7
            [5] = u8
            [6] = u4
        --]]
        local _ = p11.useState
        local v12 = {
            ["AutomaticSize"] = "Y",
            ["BorderSizePixel"] = 4,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0),
            ["LayoutOrder"] = u10.LayoutOrder
        }
        local v13 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 8)
            }), u5.createElement(u9, {
                ["Team"] = u10.Team
            }) }
        local _ = #v13
        local v14 = {}
        local v15 = #v14
        local v16 = u10.Players
        table.move(v16, 1, #v16, v15 + 1, v14)
        local function v22(p17, p18) --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u7
                [3] = u10
                [4] = u5
                [5] = u8
            --]]
            if not u3.isHoarceKat() and u7.LocalPlayer.UserId == p17.userId then
                return nil
            end
            local v19 = u10.HonoredPlayers
            local v20 = p17.userId
            local v21 = table.find(v19, v20) ~= nil
            return u5.createElement(u8, {
                ["DisableAnimation"] = true,
                ["Player"] = p17,
                ["Index"] = p18,
                ["IsHonored"] = v21,
                ["Disabled"] = u10.Disabled
            })
        end
        local v23 = 0
        local v24 = {}
        for v25, v26 in v14 do
            local v27 = v22(v26, v25 - 1, v14)
            if v27 ~= nil then
                v23 = v23 + 1
                v24[v23] = v27
            end
        end
        local v28 = {
            ["AutomaticSize"] = "Y",
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v29 = { u5.createElement("UIGridLayout", {
                ["FillDirectionMaxCells"] = 10,
                ["CellPadding"] = UDim2.new(0, 8, 0, 8),
                ["CellSize"] = UDim2.new(0, 90, 0, 120),
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v30 = #v29
        for v31, v32 in v24 do
            v29[v30 + v31] = v32
        end
        v13["HonorPlayerListGUI_" .. u10.Team.id] = u5.createElement(u4, v28, v29)
        return u5.createFragment({
            ["HonorTeamGUI_" .. u10.Team.id] = u5.createElement("Frame", v12, v13)
        })
    end)
}