local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, script.Parent, "roadmap-card").RoadmapCard
return {
    ["InfoView"] = v7.new(u6)(function(_, p9) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u3
            [4] = u4
            [5] = u8
        --]]
        local v10 = p9.useState
        local v11 = p9.useEffect
        local v12, u13 = v10(1)
        local u14 = u6.createRef()
        v11(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u14
                [3] = u13
            --]]
            local u15 = u5.new()
            local u16 = u14:getValue()
            if u16 then
                u15:GiveTask(u16:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 19 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                        [2] = u16
                    --]]
                    u13(u16.AbsoluteSize.X / 1285)
                end))
            end
            return function() --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15:DoCleaning()
            end
        end, {})
        local v17 = u6.createElement
        local v18 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            [u6.Ref] = u14
        }
        local v19 = {}
        local v20 = u6.createElement
        local v21 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.7610894941634241, 0.9008620689655172),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v22 = {
            u6.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["Padding"] = UDim.new(0.02033492822966507, 0)
            }),
            u6.createElement("TextLabel", {
                ["Text"] = "\240\159\141\138 BedWars Scripting",
                ["LineHeight"] = 1.05,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.05980861244019139),
                ["TextSize"] = 50 * v12,
                ["FontFace"] = Font.new("Arial", Enum.FontWeight.Light),
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            }),
            u6.createElement("TextLabel", {
                ["Text"] = "Write scripts to create anything you want within BedWars. Scripts are written in Lua, the same language used to write Roblox scripts. Scripts will run automatically when the map loads.",
                ["LineHeight"] = 1.05,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1.05,
                ["TextWrapped"] = true,
                ["Size"] = UDim2.fromScale(1, 0.07177033492822966),
                ["TextSize"] = 30 * v12,
                ["FontFace"] = Font.new("Arial", Enum.FontWeight.Light),
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            }),
            u6.createElement(u4, {
                ["LayoutOrder"] = 2
            }),
            u6.createElement(u4, {
                ["LayoutOrder"] = 2.05
            }),
            u6.createElement("TextLabel", {
                ["Text"] = "\240\159\147\157\239\184\143 Docs",
                ["LineHeight"] = 1.05,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(1, 0.05980861244019139),
                ["TextSize"] = 45 * v12,
                ["FontFace"] = Font.new("Arial", Enum.FontWeight.Light),
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            }),
            u6.createElement("TextLabel", {
                ["LineHeight"] = 1.05,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3.05,
                ["RichText"] = true,
                ["TextWrapped"] = true,
                ["Text"] = "Learn what you can build at " .. u3.richTextColorWrap(u3.hexColor(16738428), "docs.easy.gg/scripting"),
                ["Size"] = UDim2.fromScale(1, 0.039473684210526314),
                ["TextSize"] = 30 * v12,
                ["FontFace"] = Font.new("Arial", Enum.FontWeight.Light),
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            }),
            u6.createElement(u4, {
                ["LayoutOrder"] = 4
            }),
            u6.createElement(u4, {
                ["LayoutOrder"] = 4.05
            }),
            u6.createElement("TextLabel", {
                ["Text"] = "\240\159\151\186\239\184\143 Roadmap",
                ["LineHeight"] = 1.05,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 5,
                ["Size"] = UDim2.fromScale(1, 0.05980861244019139),
                ["TextSize"] = 45 * v12,
                ["FontFace"] = Font.new("Arial", Enum.FontWeight.Light),
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            }),
            ["RoadmapFrame"] = u6.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 5.05,
                ["Size"] = UDim2.fromScale(1, 0.5095693779904307)
            }, {
                u6.createElement("UIGridLayout", {
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["CellSize"] = UDim2.fromScale(0.4611451942740286, 0.2934272300469484)
                }),
                u6.createElement(u8, {
                    ["title"] = "VSCode Plugin",
                    ["description"] = "Write code with auto-complete. Scripts will sync to your BedWars editor.",
                    ["image"] = "rbxassetid://14462027309",
                    ["LayoutOrder"] = 1,
                    ["fontSizeScale"] = v12
                }),
                u6.createElement(u8, {
                    ["title"] = "API Expansion",
                    ["description"] = "We are constantly adding more services to use.",
                    ["image"] = "rbxassetid://14461990296",
                    ["LayoutOrder"] = 2,
                    ["fontSizeScale"] = v12
                }),
                u6.createElement(u8, {
                    ["title"] = "Game Browser",
                    ["description"] = "A way for players to join running matches of hosted maps.",
                    ["image"] = "rbxassetid://14461989855",
                    ["LayoutOrder"] = 3,
                    ["fontSizeScale"] = v12
                }),
                u6.createElement(u8, {
                    ["title"] = "Lua Syntax Highlight",
                    ["description"] = "Support Lua syntax highlighting for in-game code editor.",
                    ["image"] = "rbxassetid://14461990090",
                    ["LayoutOrder"] = 4,
                    ["fontSizeScale"] = v12
                }),
                u6.createElement(u8, {
                    ["title"] = "Creative Tools",
                    ["description"] = "Access to fly, better world edit, and block protection.",
                    ["image"] = "rbxassetid://14462332087",
                    ["LayoutOrder"] = 4,
                    ["fontSizeScale"] = v12
                })
            })
        }
        v19.ContentPanel = v20("Frame", v21, v22)
        return v17("ImageButton", v18, v19)
    end)
}