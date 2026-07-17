-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local Empty = v1.Empty;
local TextInputComponent = v1.TextInputComponent;
local UIUtil = v1.UIUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    CustomMatchesCodeInputs = v3.new(u2)(function(u4, p5) -- Line: 13
        -- upvalues: u2 (copy), UserInputService (copy), UIUtil (copy), Empty (copy), TextInputComponent (copy), ButtonComponent (copy), RuntimeLib (copy), KnitClient (copy), Theme (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = "";
        local u7, u8 = useState(false);
        local u9, u10 = useState(false);
        local u11, u12 = useState("");
        local v13, u14 = useState("");
        local _, _ = useState("");
        local u15 = u2.createRef();
        useEffect(function() -- Line: 23
            -- upvalues: UserInputService (ref), UIUtil (ref), u15 (copy)
            if UserInputService.GamepadEnabled then
                UIUtil:selectGui(u15:getValue());
            end;
        end, {});
        local v16 = {
            AutomaticSize = "Y",
            Size = UDim2.new(1, 0, 0, 0)
        };
        local LayoutOrder = u4.LayoutOrder;
        v16.LayoutOrder = LayoutOrder == nil and 1 or LayoutOrder;
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v16[i] = v;
            end;
        end;

        return u2.createFragment({
            CodeInputsSection = u2.createElement("Frame", v16, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 0)
                }),
                JoinCodeContainer = u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    LayoutOrder = 1,
                    Size = UDim2.new(0.5, -1, 1, 0)
                }, { u2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0.05, 0),
                        PaddingRight = UDim.new(0.05, 0),
                        PaddingTop = UDim.new(0, 12),
                        PaddingBottom = UDim.new(0, 12)
                    }), u2.createElement(Empty, {
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.fromScale(0, 0.64),
                        Size = UDim2.fromOffset(136, 32)
                    }, { u2.createElement("TextLabel", {
                            BackgroundTransparency = 1,
                            Text = "<b>ENTER JOIN CODE</b>",
                            RichText = true,
                            TextTransparency = 0.1,
                            TextSize = 12,
                            Size = UDim2.new(1, 0, 0, 14),
                            Position = UDim2.new(0, 0, 0, -14),
                            TextXAlignment = Enum.TextXAlignment.Left,
                            TextColor3 = Color3.new(1, 1, 1),
                            Font = Enum.Font.Roboto
                        }), u2.createElement(TextInputComponent, {
                            MaxCharacters = 4,
                            TextBox = {
                                PlaceholderText = "EZGG",
                                ClearTextOnFocus = false,
                                Position = UDim2.fromScale(0, 0.11),
                                Size = UDim2.fromScale(1, 0.9)
                            },

                            OnFocusLost = function(p17) -- Line: 88, Name: OnFocusLost
                                -- upvalues: u6 (ref)
                                u6 = p17;

                                return u6;
                            end
                        }) }), u2.createElement(ButtonComponent, {
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.fromScale(1, 0.64),
                        Size = UDim2.fromOffset(115, 32),
                        Text = u9 and "JOINING MATCH..." or "JOIN MATCH",
                        BackgroundColor3 = Color3.fromRGB(100, 103, 167),

                        OnClick = function() -- Line: 101, Name: OnClick
                            -- upvalues: u9 (copy), u10 (copy), u4 (copy), u6 (ref), RuntimeLib (ref)
                            if u9 then
                                return nil;
                            end;

                            u10(true);
                            u4.OnJoinMatch(u6);
                            RuntimeLib.Promise.delay(5):andThen(function() -- Line: 108
                                -- upvalues: u10 (ref)
                                return u10(false);
                            end);
                        end,

                        Selectable = true,
                        CornerRadius = UDim.new(0, 3),
                        [u2.Ref] = u15
                    }) }),
                MapSaveCodeContainer = u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 3,
                    Size = UDim2.new(0.5, -1, 1, 0)
                }, {
                    u2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0.05, 0),
                        PaddingRight = UDim.new(0.05, 0),
                        PaddingTop = UDim.new(0, 12),
                        PaddingBottom = UDim.new(0, 12)
                    }),
                    u2.createElement(Empty, {
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.fromScale(0, 0.64),
                        Size = UDim2.fromOffset(136, 32)
                    }, { u2.createElement("TextLabel", {
                            BackgroundTransparency = 1,
                            Text = "<b>MAP CODE</b>",
                            RichText = true,
                            TextTransparency = 0.1,
                            TextSize = 12,
                            Size = UDim2.new(1, 0, 0, 14),
                            Position = UDim2.new(0, 0, 0, -14),
                            TextXAlignment = Enum.TextXAlignment.Left,
                            TextColor3 = Color3.new(1, 1, 1),
                            Font = Enum.Font.Roboto
                        }), u2.createElement(TextInputComponent, {
                            MaxCharacters = 18,
                            TextBox = {
                                PlaceholderText = "1234-ABCD-5678",
                                ClearTextOnFocus = false,
                                Position = UDim2.fromScale(0, 0.11),
                                Size = UDim2.fromScale(1, 0.9)
                            },

                            OnFocusLost = function(p18) -- Line: 153, Name: OnFocusLost
                                -- upvalues: u12 (copy)
                                return u12(p18);
                            end
                        }) }),
                    u2.createElement(ButtonComponent, {
                        Selectable = true,
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.fromScale(1, 0.64),
                        Size = UDim2.fromOffset(115, 32),
                        Text = u7 and "LOADING MAP..." or "LOAD MAP",
                        BackgroundColor3 = Color3.fromRGB(100, 103, 167),

                        OnClick = function() -- Line: 165, Name: OnClick
                            -- upvalues: u7 (copy), u11 (copy), u14 (copy), u8 (copy), KnitClient (ref), u4 (copy)
                            if u7 then
                                return nil;
                            end;

                            if #u11 < 12 then
                                u14("INVALID MAP CODE");
                                u8(false);

                                return nil;
                            end;

                            u8(true);
                            KnitClient.Controllers.CustomMatchController:getMapDisplayInfo(u11):andThen(function(p19) -- Line: 177
                                -- upvalues: u14 (ref), u4 (ref), u8 (ref)
                                u14("");

                                if p19.success then
                                    u4.OnCreateMatch(p19.data.queueType, p19.data.code, {
                                        isPublishedMap = true,
                                        mapName = p19.data.name,
                                        mapThumbnail = p19.data.image
                                    }):andThen(function(p20) -- Line: 185
                                        -- upvalues: u8 (ref)
                                        u8(false);
                                    end);

                                    return;
                                end;

                                u8(false);
                                u14(p19.errorMessage);
                            end);
                        end,

                        CornerRadius = UDim.new(0, 3)
                    }),
                    u2.createElement("TextLabel", {
                        AutomaticSize = "X",
                        TextXAlignment = "Right",
                        TextScaled = true,
                        RichText = true,
                        TextTransparency = 0.1,
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, 0, 0.5, 32),
                        Size = UDim2.new(0, 0, 0, 10),
                        Text = v13 == "" and "" or "<b>" .. v13 .. "</b>",
                        TextColor3 = Theme.mcRed
                    })
                })
            })
        });
    end)
};