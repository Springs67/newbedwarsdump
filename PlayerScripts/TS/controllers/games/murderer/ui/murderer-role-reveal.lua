-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local TweenService = v6.TweenService;
local MurderGameRole = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murder-game-roles").MurderGameRole;
local MurderGameConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderGameConstants;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    MurdererRoleReveal = v5.new(u4)(function(u7, p8) -- Line: 18
        -- upvalues: u4 (copy), u3 (copy), Theme (copy), TweenService (copy), MurderGameRole (copy), SoundManager (copy), GameSound (copy), MurderGameConstants (copy), Empty (copy), ColorUtil (copy), u2 (copy), Players (copy)
        local _ = p8.useState;
        local useEffect = p8.useEffect;
        local u9 = u4.createRef();
        local u10 = u4.createRef();
        local u11 = u4.createRef();
        useEffect(function() -- Line: 24
            -- upvalues: u9 (copy), u10 (copy), u11 (copy), u3 (ref), Theme (ref), TweenService (ref), u7 (copy), MurderGameRole (ref), SoundManager (ref), GameSound (ref), MurderGameConstants (ref)
            local v12 = u9:getValue();
            local v13 = u10:getValue();
            local v14 = u11:getValue();

            if not (v12 and (v13 and v14)) then
                return nil;
            end;

            local u15 = u3("CanvasGroup", {
                GroupTransparency = 1,
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.2, 0.2),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.3),
                BackgroundColor3 = Theme.Gray,
                Parent = v14,
                Children = { v12, u3("UIPadding", {
                        PaddingBottom = UDim.new(0, 8),
                        PaddingTop = UDim.new(0, 8),
                        PaddingLeft = UDim.new(0, 8),
                        PaddingRight = UDim.new(0, 8)
                    }), u3("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }) }
            });
            local u16 = u3("CanvasGroup", {
                GroupTransparency = 1,
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.2, 0.2),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundColor3 = Theme.Gray,
                Parent = v14,
                Children = { v13, u3("UIPadding", {
                        PaddingBottom = UDim.new(0, 8),
                        PaddingTop = UDim.new(0, 8),
                        PaddingLeft = UDim.new(0, 8),
                        PaddingRight = UDim.new(0, 8)
                    }), u3("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }) }
            });
            TweenService:Create(u15, TweenInfo.new(0.6), {
                GroupTransparency = 0,
                Position = UDim2.fromScale(0.5, 0.2)
            }):Play();

            if u7.Role == MurderGameRole.CIVILIAN or MurderGameRole.SHERIFF then
                SoundManager:playSound(GameSound.INFECTED_INITIAL_SPREAD);
            else
                SoundManager:playSound(GameSound.CLUE_DISCOVERED);
            end;

            task.delay(1, function() -- Line: 79
                -- upvalues: TweenService (ref), u16 (copy)
                TweenService:Create(u16, TweenInfo.new(0.6), {
                    GroupTransparency = 0,
                    Position = UDim2.fromScale(0.5, 0.45)
                }):Play();
            end);
            task.delay(MurderGameConstants.ROLE_REVEAL_DISPLAY_DURATION - 0.5, function() -- Line: 86
                -- upvalues: TweenService (ref), u15 (copy), u16 (copy)
                TweenService:Create(u15, TweenInfo.new(0.4), {
                    GroupTransparency = 1
                }):Play();
                TweenService:Create(u16, TweenInfo.new(0.4), {
                    GroupTransparency = 1
                }):Play();
            end);
        end, {});
        local v17 = {
            DisplayOrder = 10,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            [u4.Ref] = u11
        };
        local v18 = { u4.createElement(Empty, {
                Size = UDim2.fromScale(1, 1),
                [u4.Ref] = u9
            }, { u4.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Center",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.05, 0)
                }), u4.createElement("TextLabel", {
                    Text = "<b>YOU ARE A</b>",
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.9, 0.25),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    TextColor3 = ColorUtil.WHITE
                }), u4.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.9, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Text = "<b>" .. string.upper(u7.Role) .. "</b>",
                    TextColor3 = MurderGameConstants:getRoleColor(u7.Role)
                }) }) };
        local v19 = u2.values(MurderGameConstants.ROLE_INSTRUCTIONS[u7.Role]);

        local function v21(p20) -- Line: 140
            -- upvalues: u4 (ref), ColorUtil (ref)
            return u4.createElement("TextLabel", {
                TextXAlignment = "Center",
                TextTransparency = 0.2,
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.9, 0.15),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Text = "<b>- " .. p20 .. "</b>",
                TextColor3 = ColorUtil.WHITE
            }, { u4.createElement("UITextSizeConstraint", {
                    MaxTextSize = 16
                }) });
        end;

        local v22 = table.create(#v19);

        for i, v in v19 do
            v22[i] = v21(v, i - 1, v19);
        end;

        local v23 = {
            Size = UDim2.fromScale(1, 1),
            [u4.Ref] = u10
        };
        local v24 = { u4.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }), u4.createElement("TextLabel", {
                Text = "<b>INSTRUCTIONS:</b>",
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.9, 0.2),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                TextColor3 = ColorUtil.WHITE
            }) };
        local v25 = #v24;

        for i, v in v22 do
            v24[v25 + i] = v;
        end;

        local createElement = u4.createElement;
        local v26 = {
            TextXAlignment = "Center",
            TextTransparency = 0.2,
            TextScaled = true,
            RichText = true,
            BackgroundTransparency = 1,
            LayoutOrder = 4,
            Size = UDim2.fromScale(0.9, 0.15),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v27 = ColorUtil.richTextColor(Theme.mcRed);
        local v28;

        if #Players:GetPlayers() >= 8 then
            v28 = "are " .. tostring(2) .. " murderers";
        else
            v28 = "is " .. tostring(1) .. " murderer";
        end;

        v26.Text = "<b>- <font color=\"" .. v27 .. "\">There " .. v28 .. "</font> 🗡️</b>";
        v26.TextColor3 = ColorUtil.WHITE;
        v24[#v24 + 1] = createElement("TextLabel", v26, { u4.createElement("UITextSizeConstraint", {
                MaxTextSize = 16
            }) });
        v18[#v18 + 1] = u4.createElement(Empty, v23, v24);

        return u4.createFragment({
            MurdererRoleReveal = u4.createElement("ScreenGui", v17, v18)
        });
    end)
};