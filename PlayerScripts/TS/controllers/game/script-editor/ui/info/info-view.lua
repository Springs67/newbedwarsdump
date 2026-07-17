-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RoadmapCard = RuntimeLib.import(script, script.Parent, "roadmap-card").RoadmapCard;

return {
    InfoView = v4.new(u3)(function(p5, p6) -- Line: 10
        -- upvalues: u3 (copy), u2 (copy), ColorUtil (copy), Empty (copy), RoadmapCard (copy)
        local useEffect = p6.useEffect;
        local v7, u8 = p6.useState(1);
        local u9 = u3.createRef();
        useEffect(function() -- Line: 15
            -- upvalues: u2 (ref), u9 (copy), u8 (copy)
            local u10 = u2.new();
            local u11 = u9:getValue();

            if u11 then
                u10:GiveTask(u11:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 19
                    -- upvalues: u8 (ref), u11 (copy)
                    u8(u11.AbsoluteSize.X / 1285);
                end));
            end;

            return function() -- Line: 23
                -- upvalues: u10 (copy)
                u10:DoCleaning();
            end;
        end, {});

        return u3.createElement("ImageButton", {
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundTransparency = 1,
            [u3.Ref] = u9
        }, {
            ContentPanel = u3.createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.7610894941634241, 0.9008620689655172),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, {
                u3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    Padding = UDim.new(0.02033492822966507, 0)
                }),
                u3.createElement("TextLabel", {
                    Text = "🍊 BedWars Scripting",
                    LineHeight = 1.05,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.05980861244019139),
                    TextSize = 50 * v7,
                    FontFace = Font.new("Arial", Enum.FontWeight.Light),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top
                }),
                u3.createElement("TextLabel", {
                    Text = "Write scripts to create anything you want within BedWars. Scripts are written in Lua, the same language used to write Roblox scripts. Scripts will run automatically when the map loads.",
                    LineHeight = 1.05,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1.05,
                    TextWrapped = true,
                    Size = UDim2.fromScale(1, 0.07177033492822966),
                    TextSize = 30 * v7,
                    FontFace = Font.new("Arial", Enum.FontWeight.Light),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top
                }),
                u3.createElement(Empty, {
                    LayoutOrder = 2
                }),
                u3.createElement(Empty, {
                    LayoutOrder = 2.05
                }),
                u3.createElement("TextLabel", {
                    Text = "📝️ Docs",
                    LineHeight = 1.05,
                    BackgroundTransparency = 1,
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(1, 0.05980861244019139),
                    TextSize = 45 * v7,
                    FontFace = Font.new("Arial", Enum.FontWeight.Light),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top
                }),
                u3.createElement("TextLabel", {
                    LineHeight = 1.05,
                    BackgroundTransparency = 1,
                    LayoutOrder = 3.05,
                    RichText = true,
                    TextWrapped = true,
                    Text = "Learn what you can build at " .. ColorUtil.richTextColorWrap(ColorUtil.hexColor(16738428), "docs.easy.gg/scripting"),
                    Size = UDim2.fromScale(1, 0.039473684210526314),
                    TextSize = 30 * v7,
                    FontFace = Font.new("Arial", Enum.FontWeight.Light),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top
                }),
                u3.createElement(Empty, {
                    LayoutOrder = 4
                }),
                u3.createElement(Empty, {
                    LayoutOrder = 4.05
                }),
                u3.createElement("TextLabel", {
                    Text = "🗺️ Roadmap",
                    LineHeight = 1.05,
                    BackgroundTransparency = 1,
                    LayoutOrder = 5,
                    Size = UDim2.fromScale(1, 0.05980861244019139),
                    TextSize = 45 * v7,
                    FontFace = Font.new("Arial", Enum.FontWeight.Light),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top
                }),
                RoadmapFrame = u3.createElement("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 5.05,
                    Size = UDim2.fromScale(1, 0.5095693779904307)
                }, {
                    u3.createElement("UIGridLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                        CellSize = UDim2.fromScale(0.4611451942740286, 0.2934272300469484)
                    }),
                    u3.createElement(RoadmapCard, {
                        title = "VSCode Plugin",
                        description = "Write code with auto-complete. Scripts will sync to your BedWars editor.",
                        image = "rbxassetid://14462027309",
                        LayoutOrder = 1,
                        fontSizeScale = v7
                    }),
                    u3.createElement(RoadmapCard, {
                        title = "API Expansion",
                        description = "We are constantly adding more services to use.",
                        image = "rbxassetid://14461990296",
                        LayoutOrder = 2,
                        fontSizeScale = v7
                    }),
                    u3.createElement(RoadmapCard, {
                        title = "Game Browser",
                        description = "A way for players to join running matches of hosted maps.",
                        image = "rbxassetid://14461989855",
                        LayoutOrder = 3,
                        fontSizeScale = v7
                    }),
                    u3.createElement(RoadmapCard, {
                        title = "Lua Syntax Highlight",
                        description = "Support Lua syntax highlighting for in-game code editor.",
                        image = "rbxassetid://14461990090",
                        LayoutOrder = 4,
                        fontSizeScale = v7
                    }),
                    u3.createElement(RoadmapCard, {
                        title = "Creative Tools",
                        description = "Access to fly, better world edit, and block protection.",
                        image = "rbxassetid://14462332087",
                        LayoutOrder = 4,
                        fontSizeScale = v7
                    })
                })
            })
        });
    end)
};