local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DropdownComponent
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-meta").GameMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta")
local u12 = v11.getQueueMeta
local u13 = v11.QueueMeta
local u14 = v1.import(script, script.Parent, "queue-stats").QueueStatsDisplay
local u15 = v1.import(script, script.Parent, "section-title").SectionTitle
local u16 = {}
local v17 = u6.values(u10)
local function v24(p18) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u16
    --]]
    local v19 = {}
    for v20, v21 in u6.entries(u13) do
        local _ = v20 - 1
        local v22 = v21[1]
        local v23 = v21[2]
        if not v23.disableMatchStatsProgression then
            if p18 == v23.game then
                table.insert(v19, v22)
            end
        end
    end
    u16[p18] = v19
end
for v25, v26 in v17 do
    v24(v26, v25 - 1, v17)
end
return {
    ["QueueStatsSection"] = v8.new(u7)(function(p27, p28) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u15
            [4] = u3
            [5] = u9
            [6] = u6
            [7] = u16
            [8] = u4
            [9] = u5
            [10] = u12
            [11] = u14
        --]]
        local v29, u30 = p28.useState(u10.BEDWARS)
        local v31 = {
            ["Size"] = UDim2.fromScale(1, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v32 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 20)
            }), u7.createElement(u15, {
                ["title"] = "Queue Stats",
                ["SectionDivider"] = true
            }) }
        local v33 = #v32
        local v34 = {
            ["ZIndex"] = 10,
            ["Size"] = UDim2.new(1, 0, 0, 30)
        }
        local v35 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }), u7.createElement("TextLabel", {
                ["Text"] = "Choose Game Type",
                ["TextSize"] = 16,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.5, 1),
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            }) }
        local v36 = #v35
        local v37 = {
            ["OnSurfaceGui"] = true,
            ["Size"] = UDim2.new(0.5, 0, 1, 0),
            ["DefaultItem"] = {
                ["text"] = u9[v29].title,
                ["value"] = v29
            }
        }
        local v38 = 0
        local v39 = {}
        for v40, v41 in u6.keys(u16) do
            local _ = v40 - 1
            local v42 = u16[v41]
            if v42 ~= nil then
                v42 = #v42 == 0
            end
            if not v42 == true then
                v38 = v38 + 1
                v39[v38] = v41
            end
        end
        table.sort(v39)
        local function v49(p43, p44) --[[ Line: 114 ]]
            --[[
            Upvalues:
                [1] = u9
            --]]
            local v45 = {
                ["text"] = u9[p44].title,
                ["value"] = p44
            }
            local v46 = {}
            local v47 = #v46
            local v48 = #p43
            table.move(p43, 1, v48, v47 + 1, v46)
            v46[v47 + v48 + 1] = v45
            return v46
        end
        local v50 = {}
        for v51 = 1, #v39 do
            v50 = v49(v50, v39[v51], v51 - 1, v39)
        end
        v37.Items = v50
        function v37.OnItemSelected(p52) --[[ Line: 135 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            u30(p52)
        end
        v35[v36 + 1] = u7.createElement(u4, v37)
        v32[v33 + 1] = u7.createElement(u5, v34, v35)
        local v53 = u16[v29]
        if v53 ~= nil then
            local v54 = 0
            local v55 = {}
            for v56, v57 in v53 do
                local _ = v56 - 1
                if u12(v57).game == v29 == true then
                    v54 = v54 + 1
                    v55[v54] = v57
                end
            end
            local function v60(p58, p59) --[[ Line: 155 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                return u12(p58).title < u12(p59).title
            end
            table.sort(v55, v60)
            local v61 = 0
            v53 = {}
            for v62, v63 in v55 do
                local _ = v62 - 1
                local v64
                if u12(v63).disableMatchStatsProgression then
                    v64 = nil
                else
                    v64 = u7.createElement(u14, {
                        ["store"] = p27.store,
                        ["QueueType"] = v63,
                        ["Queues"] = p27.Queues
                    })
                end
                if v64 ~= nil then
                    v61 = v61 + 1
                    v53[v61] = v64
                end
            end
        end
        if v53 then
            for v65, v66 in v53 do
                v32[v33 + 1 + v65] = v66
            end
        end
        return u7.createElement(u5, v31, v32)
    end)
}