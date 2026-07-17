-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HostPanelSetting = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-setting").HostPanelSetting;
local HostPanelTextBox = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox;
local TextBoxCharacterCounter = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "gift", "ui", "gifting", "gifting-form", "text-box-character-counter").TextBoxCharacterCounter;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanCreateForm = v3.new(u2)(function(p4, p5) -- Line: 20
        -- upvalues: u2 (copy), ClanUtil (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), DeviceUtil (copy), Players (copy), HostPanelSetting (copy), HostPanelTextBox (copy), Empty (copy), TextBoxCharacterCounter (copy), ColorUtil (copy), Theme (copy), BedwarsImageId (copy), ButtonComponent (copy)
        local useState = p5.useState;
        local v6 = u2.createRef();
        local u7, v8 = useState("");
        local u9, v10 = useState("");
        local u11, v12 = useState("");
        local v13, u14 = useState(false);
        local v15, u16 = useState("");

        local function v18() -- Line: 28
            -- upvalues: u7 (copy), u16 (copy), u9 (copy), ClanUtil (ref), u14 (copy), KnitClient (ref), u11 (copy), SoundManager (ref), GameSound (ref)
            if u7 == "" then
                u16("Your clan must have a name.");

                return nil;
            end;

            if u9 == "" then
                u16("Your clan must have tag.");

                return nil;
            end;

            if #u9 < ClanUtil.CLAN_TAG_MIN_CHAR_LIMIT then
                u16("Your clan tag must be at least " .. tostring(ClanUtil.CLAN_TAG_MIN_CHAR_LIMIT) .. " characters.");

                return nil;
            end;

            u14(true);
            u16("");
            KnitClient.Controllers.ClanController:submitClanCreateForm({
                name = u7,
                tag = u9,
                introduction = u11
            }):andThen(function(p17) -- Line: 47
                -- upvalues: u14 (ref), u16 (ref), SoundManager (ref), GameSound (ref)
                u14(false);
                local errorMessage = p17.errorMessage;

                if errorMessage ~= "" and errorMessage then
                    u16(p17.errorMessage);
                    SoundManager:createSound(GameSound.ERROR_NOTIFICATION);
                end;
            end);
        end;

        if not DeviceUtil.isHoarceKat() then
            ClanUtil.hasClanPass(Players.LocalPlayer);
        end;

        local v19 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v20 = {};
        local v21 = #v20;
        local v22 = {
            Size = UDim2.fromScale(1, 0.8)
        };
        local v23 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }),
            u2.createElement(HostPanelSetting, {
                Name = "Name*",
                Hint = "(Max " .. tostring(ClanUtil.CLAN_NAME_CHAR_LIMIT) .. " Characters)"
            }, { u2.createElement(HostPanelTextBox, {
                    PlaceholderText = "Your clan name",
                    MaxCharacters = ClanUtil.CLAN_NAME_CHAR_LIMIT,
                    OnFocusLost = v8
                }) }),
            u2.createElement(HostPanelSetting, {
                Name = "Tag*",
                Hint = "(" .. tostring(ClanUtil.CLAN_TAG_MIN_CHAR_LIMIT) .. "-" .. tostring(ClanUtil.CLAN_TAG_MAX_CHAR_LIMIT) .. " Characters)"
            }, { u2.createElement(HostPanelTextBox, {
                    PlaceholderText = "Your clan tag",
                    MaxCharacters = ClanUtil.CLAN_TAG_MAX_CHAR_LIMIT,
                    OnFocusLost = v10
                }) }),
            u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.45)
            }, { u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0.05, 0)
                }), u2.createElement(HostPanelTextBox, {
                    Size = UDim2.fromScale(1, 0.9),
                    MaxCharacters = ClanUtil.CLAN_INTRO_CHAR_LIMIT,
                    PlaceholderText = "Please enter an introduction for players viewing your clan. This can be changed later.",
                    Label = "Clan Introduction <font transparency=\".3\">(Optional)</font>",
                    OnFocusLost = v12,
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    TextYAlignment = "Top",
                    MultiLine = true,
                    [u2.Ref] = v6
                }, {
                    uipadding = u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 10),
                        PaddingBottom = UDim.new(0, 10),
                        PaddingLeft = UDim.new(0, 10),
                        PaddingRight = UDim.new(0, 10)
                    }),
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    })
                }), u2.createElement(TextBoxCharacterCounter, {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    Size = UDim2.new(1, 0, 0, 0),
                    TextXAlignment = Enum.TextXAlignment.Right,
                    TextBox = v6,
                    MaxCharCount = ClanUtil.CLAN_INTRO_CHAR_LIMIT
                }) })
        };
        local v24 = #v23;
        local v25;

        if v15 == "" then
            v25 = false;
        else
            v25 = u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.1),
                BackgroundColor3 = ColorUtil.hexColor(16735324)
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }), u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    BackgroundTransparency = 1,
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(1, 0),
                    Text = "<b>Error:</b> " .. v15,
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }) });
        end;

        if v25 then
            v23[v24 + 1] = v25;
        end;

        v20[v21 + 1] = u2.createElement(Empty, v22, v23);
        local v26 = {
            Size = UDim2.fromScale(1, 0.2),
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 1)
        };
        local v27 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Bottom",
                Padding = UDim.new(0, 6)
            }) };
        local v28 = {
            Selectable = false,
            Size = UDim2.new(1, 0, 0, 50),
            BackgroundColor3 = Theme.backgroundSuccess,
            OnClick = v18,
            Loading = v13
        };
        local v29 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 10)
            }) };
        local v30 = #v29;
        local v31 = not v13 and u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScaleType = "Fit",
            SizeConstraint = "RelativeYY",
            Image = BedwarsImageId.CLAN,
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(0.65, 0.55),
            AnchorPoint = Vector2.new(1, 0.5)
        });

        if v31 then
            v29[v30 + 1] = v31;
        end;

        v29[#v29 + 1] = u2.createElement("TextLabel", {
            AutomaticSize = "X",
            SizeConstraint = "RelativeXX",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            RichText = true,
            Font = "Roboto",
            TextXAlignment = "Left",
            Text = "<b>" .. (v13 and "Loading" or "Create Clan") .. "</b>",
            Size = UDim2.fromScale(0, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 20
            }) });
        v27[#v27 + 1] = u2.createElement(ButtonComponent, v28, v29);
        v20[v21 + 2] = u2.createElement(Empty, v26, v27);

        return u2.createElement(Empty, v19, v20);
    end)
};