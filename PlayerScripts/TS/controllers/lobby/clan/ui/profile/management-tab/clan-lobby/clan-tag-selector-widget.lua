-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DividerComponent = v1.DividerComponent;
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local WidgetComponent = v1.WidgetComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color");
local ChatTagColorDefinition = v4.ChatTagColorDefinition;
local ClanChatTagColorOptions = v4.ClanChatTagColorOptions;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanTagSelectorWidget = v3.new(u2)(function(u5, p6) -- Line: 18
        -- upvalues: ClanChatTagColorOptions (copy), ChatTagColorDefinition (copy), Theme (copy), u2 (copy), ScaleComponent (copy), Flamework (copy), ColorUtil (copy), Empty (copy), DividerComponent (copy), KnitClient (copy), AutoCanvasScrollingFrame (copy), WidgetComponent (copy)
        local useEffect = p6.useEffect;
        local myClan = u5.store.Clans.myClan;

        if myClan ~= nil then
            myClan = myClan.tag;
        end;

        local u7, u8 = p6.useState(myClan == nil and "CLAN" or myClan);

        local function v9() -- Line: 30
            -- upvalues: u5 (copy), u8 (copy)
            local myClan2 = u5.store.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = myClan2.tag;
            end;

            u8(myClan2 == nil and "CLAN" or myClan2);
        end;

        local myClan2 = u5.store.Clans.myClan;

        if myClan2 ~= nil then
            myClan2 = myClan2.tag;
        end;

        useEffect(v9, { myClan2 });
        local myClan3 = u5.store.Clans.myClan;

        if myClan3 ~= nil then
            myClan3 = myClan3.chatTagColors;
        end;

        local v10 = myClan3 == nil and {} or myClan3;
        local u11 = {};

        for _, v in v10 do
            local v12 = u11[v.chatTagColorOption];

            if v12 == nil or v12 < v.expiresAt then
                u11[v.chatTagColorOption] = v.expiresAt;
            end;
        end;

        local v13 = { ClanChatTagColorOptions.Default };

        for _, v in v10 do
            local v14 = v.chatTagColorOption ~= ClanChatTagColorOptions.Default;

            if v14 then
                local v15 = table.find(v13, v.chatTagColorOption) ~= nil;
                v14 = not v15;
            end;

            if v14 then
                table.insert(v13, v.chatTagColorOption);
            end;
        end;

        local function u22(p16) -- Line: 77
            -- upvalues: ChatTagColorDefinition (ref), ClanChatTagColorOptions (ref), u11 (copy)
            local name = ChatTagColorDefinition[p16].name;

            if p16 == ClanChatTagColorOptions.Default then
                return name;
            end;

            local v17 = u11[p16];

            if v17 == nil then
                return name;
            end;

            local v18 = v17 - os.time();

            if v18 <= 0 then
                return name .. " (expired)";
            end;

            local function _(p19) -- Line: 92
                local v20 = math.round(p19 / 86400);

                return tostring(v20) .. "d";
            end;

            local v21 = math.round(v18 / 86400);

            return name .. "\n(" .. (tostring(v21) .. "d") .. " left)";
        end;

        local function _() -- Line: 98
            -- upvalues: u5 (copy), ClanChatTagColorOptions (ref)
            local myClan4 = u5.store.Clans.myClan;

            if myClan4 ~= nil then
                myClan4 = myClan4.selectedChatTagColor;
            end;

            if myClan4 and os.time() < myClan4.expiresAt then
                return myClan4.chatTagColorOption;
            end;

            return ClanChatTagColorOptions.Default;
        end;

        local v23 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = Theme.widgetSize
        };
        local v24 = { u2.createElement(ScaleComponent, {
                MaximumSize = Vector2.new(Theme.widgetSize.X.Offset * 1.3, Theme.widgetSize.Y.Offset * 1.3),
                ScreenPadding = Vector2.new(24, 24)
            }) };
        local v25 = {
            ClipsDescendents = false,
            Title = "Clan Profile",
            AppId = u5.AppId,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),

            OnClose = function() -- Line: 130, Name: OnClose
                -- upvalues: Flamework (ref), u5 (copy)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AppId);
            end,

            ContentUIPadding = u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 0),
                PaddingBottom = UDim.new(0, 0),
                PaddingLeft = UDim.new(0, 0),
                PaddingRight = UDim.new(0, 0)
            })
        };
        local v26 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u2.createElement("TextLabel", {
                Text = "Select Clan Tag Color",
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.1),
                AnchorPoint = Vector2.new(0.5, 0),
                TextYAlignment = Enum.TextYAlignment.Center,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) }), u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.new(0.85, 0, 0, 6)
            }, { u2.createElement(DividerComponent, {
                    Position = UDim2.fromOffset(0, -10)
                }) }) };

        local function v52(u27) -- Line: 172
            -- upvalues: ChatTagColorDefinition (ref), u5 (copy), ClanChatTagColorOptions (ref), ColorUtil (ref), u2 (ref), KnitClient (ref), Flamework (ref), u7 (copy), u22 (copy)
            local v28 = ChatTagColorDefinition[u27];
            local v29 = {
                AutoButtonColor = false,
                BorderSizePixel = 0
            };
            local myClan4 = u5.store.Clans.myClan;

            if myClan4 ~= nil then
                myClan4 = myClan4.selectedChatTagColor;
            end;

            local v30;

            if myClan4 and os.time() < myClan4.expiresAt then
                v30 = myClan4.chatTagColorOption;
            else
                v30 = ClanChatTagColorOptions.Default;
            end;

            local v31;

            if v30 == u27 then
                v31 = ColorUtil.brighten(Color3.fromRGB(35, 35, 40), 0.1);
            else
                v31 = Color3.fromRGB(35, 35, 40);
            end;

            v29.BackgroundColor3 = v31;

            v29[u2.Event.MouseButton1Click] = function() -- Line: 178
                -- upvalues: u5 (ref), KnitClient (ref), u27 (copy), Flamework (ref)
                if u5.store.Clans.myClanId == nil then
                    return nil;
                end;

                KnitClient.Controllers.ClanController:selectClanChatTagColor(u5.store.Clans.myClanId, u27):andThen(function(p32) -- Line: 183
                    -- upvalues: Flamework (ref)
                    if not p32.success then
                        local v33 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController");
                        local v34 = {};
                        local errorMessage = p32.errorMessage;
                        v34.message = errorMessage == nil and "An unknown error occurred" or errorMessage;
                        v33:sendErrorNotification(v34);
                    end;
                end);
            end;

            v29.ClipsDescendants = true;
            local v35 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }) };
            local v36 = #v35;
            local v37 = false;
            local myClan5 = u5.store.Clans.myClan;

            if myClan5 ~= nil then
                myClan5 = myClan5.selectedChatTagColor;
            end;

            local v38;

            if myClan5 and os.time() < myClan5.expiresAt then
                v38 = myClan5.chatTagColorOption;
            else
                v38 = ClanChatTagColorOptions.Default;
            end;

            if v38 == u27 then
                v37 = u2.createElement("UIStroke", {
                    Thickness = 3,
                    Color = ColorUtil.WHITE
                });
            end;

            if v37 then
                v35[v36 + 1] = v37;
            end;

            local v39 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1)
            };
            local v40 = { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 4)
                }) };
            local v41 = #v40;
            local v42 = {
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0.5, 0)
            };
            local v43 = {};
            local v44 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.64),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            };
            local v45 = { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 4)
                }) };
            local v46 = v28.kind == "Gradient";

            if v46 then
                local v47 = {
                    Color = v28.gradient
                };
                local rotation = v28.rotation;
                v47.Rotation = rotation == nil and 0 or rotation;
                v46 = u2.createElement("UIGradient", v47);
            end;

            local v48 = {
                BackgroundTransparency = 1,
                TextSize = 20,
                LayoutOrder = 1,
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.new(0, 0, 1, 0),
                Text = "[" .. u7 .. "]",
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            };
            local v49;

            if v28.kind == "Color" then
                v49 = v28.color;
            else
                v49 = Color3.fromRGB(255, 255, 255);
            end;

            v48.TextColor3 = v49;
            v48.TextXAlignment = Enum.TextXAlignment.Center;
            v48.TextYAlignment = Enum.TextYAlignment.Center;
            local v50 = {};
            local v51 = #v50;

            if v46 then
                v50[v51 + 1] = v46;
            end;

            v45[#v45 + 1] = u2.createElement("TextLabel", v48, v50);
            v43[#v43 + 1] = u2.createElement("Frame", v44, v45);
            v40[v41 + 1] = u2.createElement("Frame", v42, v43);
            v40[v41 + 2] = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                RichText = true,
                LayoutOrder = 2,
                Size = UDim2.new(1, -8, 0.35, 0),
                Text = u22(u27),
                TextYAlignment = Enum.TextYAlignment.Top,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MinTextSize = 8,
                    MaxTextSize = 14
                }) });
            v35[#v35 + 1] = u2.createElement("Frame", v39, v40);

            return u2.createElement("ImageButton", v29, v35);
        end;

        local v53 = table.create(#v13);

        for i, v in v13 do
            v53[i] = v52(v, i - 1, v13);
        end;

        local v54 = {
            ScrollingFrameProps = {
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.9, 0.75)
            }
        };
        local v55 = { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4)
            }), u2.createElement("UIGridLayout", {
                FillDirection = "Horizontal",
                FillDirectionMaxCells = 10,
                HorizontalAlignment = "Center",
                CellSize = UDim2.new(0.2, 0, 0, 80),
                CellPadding = UDim2.new(0, 10, 0, 10)
            }) };
        local v56 = #v55;

        for i, v in v53 do
            v55[v56 + i] = v;
        end;

        v26[#v26 + 1] = u2.createElement(AutoCanvasScrollingFrame, v54, v55);
        v24[#v24 + 1] = u2.createElement(WidgetComponent, v25, v26);

        return u2.createElement("Frame", v23, v24);
    end)
};