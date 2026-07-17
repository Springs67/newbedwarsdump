-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local Checkbox = v1.Checkbox;
local ColorUtil = v1.ColorUtil;
local DividerComponent = v1.DividerComponent;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "bw-player-render");
local BWPlayerRender = v6.BWPlayerRender;
local PlayerRenderFallbackMode = v6.PlayerRenderFallbackMode;
local AuditTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").AuditTag;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

local function u11() -- Line: 18
    -- upvalues: u2 (copy), AuditTag (copy)
    local v7 = u2.values(AuditTag);

    local function _(p8, p9) -- Line: 20
        p8[p9] = true;

        return p8;
    end;

    local v10 = {};

    for i = 1, #v7 do
        local _ = i - 1;
        v10[v7[i]] = true;
    end;

    return v10;
end;

local v50 = v4.new(u3)(function(p12, p13) -- Line: 33
    -- upvalues: u11 (copy), AuditTag (copy), u3 (copy), Theme (copy), u2 (copy), Checkbox (copy), Empty (copy), DividerComponent (copy), ColorUtil (copy), BWPlayerRender (copy), PlayerRenderFallbackMode (copy), AutoCanvasScrollingFrame (copy)
    local u14, u15 = p13.useState((u11()));

    local function u17(p16) -- Line: 36
        -- upvalues: AuditTag (ref)
        if p16 == AuditTag.COMMAND then
            return Color3.fromRGB(61, 145, 255);
        end;

        if p16 == AuditTag.HOST_PANEL then
            return Color3.fromRGB(255, 125, 69);
        end;

        return Color3.fromRGB(0, 0, 0);
    end;

    local v18 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v19 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Left",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 6)
        }) };
    local v20 = {
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0.075)
    };
    local v21 = {
        TabTitle = u3.createElement("TextLabel", {
            AutomaticSize = "X",
            Text = "<b>AUDIT LOG</b>",
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.2, 1),
            TextColor3 = Theme.textPrimary
        }, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = 20
            }) })
    };
    local _ = #v21;
    local v22 = u2.values(AuditTag);

    local function v27(u23, p24) -- Line: 86
        -- upvalues: u3 (ref), Checkbox (ref), u14 (copy), u15 (copy)
        return u3.createElement(Checkbox, {
            AspectRatio = 3,
            Size = UDim2.fromScale(0.15, 0.75),
            Value = u14[u23],

            SetValue = function(p25) -- Line: 90, Name: SetValue
                -- upvalues: u14 (ref), u23 (copy), u15 (ref)
                local v26 = {};

                for i, v in u14 do
                    v26[i] = v;
                end;

                v26[u23] = p25;
                u15(v26);
            end,

            Text = "<b>" .. string.gsub(string.upper(u23), "_", " ") .. "</b>",
            LayoutOrder = p24 + 2
        });
    end;

    local v28 = table.create(#v22);

    for i, v in v22 do
        v28[i] = v27(v, i - 1, v22);
    end;

    local v29 = {
        Position = UDim2.fromScale(0.2, 0),
        Size = UDim2.fromScale(0.8, 1)
    };
    local v30 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Right",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.05, 0)
        }) };
    local v31 = #v30;

    for i, v in v28 do
        v30[v31 + i] = v;
    end;

    v21.TagFilters = u3.createElement(Empty, v29, v30);
    v19.Header = u3.createElement(Empty, v20, v21);
    v19[#v19 + 1] = u3.createElement(DividerComponent, {
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 0, 1),
        BarColor = {
            Transparency = 0.9
        }
    });
    local v32 = {
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 0.925, -12)
    };
    local v33 = {
        u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Left",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 2)
        }),
        Columns = u3.createElement(Empty, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.065)
        }, {
            u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }),
            u3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.025, 0),
                PaddingRight = UDim.new(0.025, 0)
            }),
            u3.createElement("TextLabel", {
                Text = "Time",
                TextXAlignment = "Left",
                TextTransparency = 0.3,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(0.075, 0, 0.5, 0),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }),
            u3.createElement("TextLabel", {
                Text = "Operation",
                TextXAlignment = "Left",
                TextTransparency = 0.3,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.new(0.525, 0, 0.5, 0),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }),
            u3.createElement("TextLabel", {
                Text = "Tag",
                TextXAlignment = "Left",
                TextTransparency = 0.3,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Size = UDim2.new(0.075, 0, 0.5, 0),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }),
            u3.createElement("TextLabel", {
                Text = "Executor",
                TextXAlignment = "Left",
                TextTransparency = 0.3,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Size = UDim2.new(0.225, 0, 0.5, 0),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            })
        })
    };

    local function _(p34) -- Line: 209
        -- upvalues: u14 (copy)
        return u14[p34.tag];
    end;

    local v35 = 0;
    local v36 = {};

    for i, v in p12.AuditLog do
        local _ = i - 1;

        if u14[v.tag] == true then
            v35 = v35 + 1;
            v36[v35] = v;
        end;
    end;

    local function v45(p37, p38) -- Line: 222
        -- upvalues: u3 (ref), BWPlayerRender (ref), PlayerRenderFallbackMode (ref), ColorUtil (ref), Empty (ref), u17 (copy)
        local executor = p37.executor;

        if executor then
            local v39 = {
                LayoutOrder = 4,
                Size = UDim2.fromScale(0.225, 1)
            };
            local v40 = { u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Left",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 4)
                }), u3.createElement(BWPlayerRender, {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 2,
                    ZIndex = 20,
                    FallbackMode = PlayerRenderFallbackMode.KIT,
                    Size = UDim2.new(1, 0, 0.6, 0),
                    PlayerUserId = p37.executor.userId
                }, { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }), u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }) };
            local _ = #v40;
            local v41 = {
                Size = UDim2.new(0.7, 0, 0.5, 0)
            };
            local executor2 = p37.executor;

            if executor2 ~= nil then
                executor2 = executor2.displayName;
            end;

            v41.Text = executor2;
            v41.TextXAlignment = "Left";
            v41.FontFace = Font.fromName("Roboto", Enum.FontWeight.Medium);
            v41.TextColor3 = ColorUtil.WHITE;
            v41.TextScaled = true;
            v41.BackgroundTransparency = 1;
            v41.LayoutOrder = 3;
            v40.Executor = u3.createElement("TextLabel", v41);
            executor = u3.createFragment({
                Executor = u3.createElement(Empty, v39, v40)
            });
        end;

        local v42 = {
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 25),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = p38 % 2 == 0 and 1 or 0.9,
            LayoutOrder = p37.time
        };
        local v43 = {
            u3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.025, 0),
                PaddingRight = UDim.new(0.025, 0)
            }),
            u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }),
            Time = u3.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextTransparency = 0.3,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(0.075, 0, 0.5, 0),
                Text = DateTime.fromUnixTimestamp(p37.time):FormatLocalTime("LTS", "en-us"),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                TextColor3 = ColorUtil.WHITE
            }),
            Change = u3.createElement("TextLabel", {
                TextXAlignment = "Left",
                RichText = true,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.new(0.525, 0, 0.5, 0),
                Text = p37.message,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                TextColor3 = ColorUtil.WHITE
            }),
            Tag = u3.createElement("Frame", {
                BackgroundTransparency = 0.3,
                BorderSizePixel = 1,
                LayoutOrder = 3,
                Size = UDim2.new(0.075, 0, 0.5, 0),
                BackgroundColor3 = u17(p37.tag)
            }, {
                Tag = u3.createElement("TextLabel", {
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0.8, 0, 0.7, 0),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Text = string.gsub(string.upper(p37.tag), "_", " "),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = ColorUtil.WHITE
                }),
                u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                })
            })
        };
        local v44 = #v43;

        if executor then
            v43[v44 + 1] = executor;
        end;

        return u3.createFragment({
            ["AuditEntry_" .. tostring(p37.time)] = u3.createElement("Frame", v42, v43)
        });
    end;

    local v46 = table.create(#v36);

    for i, v in v36 do
        v46[i] = v45(v, i - 1, v36);
    end;

    local v47 = {
        ScrollingFrameProps = {
            LayoutOrder = 3,
            BackgroundTransparency = 0.9,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0.92, -4),
            BackgroundColor3 = ColorUtil.BLACK
        }
    };
    local v48 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0)
        }) };
    local v49 = #v48;

    for i, v in v46 do
        v48[v49 + i] = v;
    end;

    v33[#v33 + 1] = u3.createElement(AutoCanvasScrollingFrame, v47, v48);
    v19.Content = u3.createElement(Empty, v32, v33);

    return u3.createElement(Empty, v18, v19);
end);

return {
    HostPanelAuditLogTab = v5.connect(function(p51, p52) -- Line: 380
        local v53 = {};

        for i, v in p52 do
            v53[i] = v;
        end;

        v53.AuditLog = p51.CustomMatch.hostPanelAuditLog;

        return v53;
    end)(v50)
};