-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent, "lobby-hud", "lobby-play-menu", "lobby-play-menu-pages");
local LobbyPlayMenuPage = v5.LobbyPlayMenuPage;
local LobbyPlayMenuPageMeta = v5.LobbyPlayMenuPageMeta;

return {
    QueueSelectionQueueButton = v4.new(u3)(function(u6, p7) -- Line: 16
        -- upvalues: u3 (copy), UserInputService (copy), UIUtil (copy), u2 (copy), LobbyPlayMenuPageMeta (copy), LobbyPlayMenuPage (copy), ColorUtil (copy), Theme (copy), getQueueMeta (copy), DeviceUtil (copy)
        local _ = p7.useState;
        local useEffect = p7.useEffect;
        local u8 = u3.createRef();
        useEffect(function() -- Line: 20
            -- upvalues: UserInputService (ref), UIUtil (ref), u8 (copy)
            if UserInputService.GamepadEnabled then
                UIUtil:selectGui(u8:getValue());
            end;
        end, {});
        local v9 = u2.entries(LobbyPlayMenuPageMeta);

        local function v13(p10) -- Line: 26
            -- upvalues: u6 (copy), LobbyPlayMenuPage (ref)
            local function _(p11) -- Line: 30
                -- upvalues: u6 (ref)
                return p11.queueType == u6.QueueType;
            end;

            local v12 = nil;

            for i, v in p10[2].queueCardVariants do
                local _ = i - 1;

                if v.queueType == u6.QueueType == true then
                    v12 = v;
                    break;
                end;
            end;

            return v12 ~= nil and p10[1] ~= LobbyPlayMenuPage.WELCOME;
        end;

        local v14 = nil;

        for i, v in v9 do
            if v13(v, i - 1, v9) == true then
                v14 = v;
                break;
            end;
        end;

        local v15;

        if v14 then
            local _ = v14[1];

            local function _(p16) -- Line: 64
                -- upvalues: u6 (copy)
                return p16.queueType == u6.QueueType;
            end;

            v15 = nil;

            for i, v in v14[2].queueCardVariants do
                local _ = i - 1;

                if v.queueType == u6.QueueType == true then
                    v15 = v;
                    break;
                end;
            end;

            if v15 ~= nil then
                v15 = v15.cardProps;

                if v15 ~= nil then
                    v15 = v15.CardData;

                    if v15 ~= nil then
                        v15 = v15.title;
                    end;
                end;
            end;
        else
            v15 = nil;
        end;

        local v17 = {
            [u3.Ref] = u8,
            Size = UDim2.new(0.9, 0, 0, 50),
            BackgroundColor3 = ColorUtil.WHITE,
            BorderSizePixel = 0,
            Selectable = true,

            [u3.Event.Activated] = function() -- Line: 94
                -- upvalues: u6 (copy)
                u6.OnClick(u6.QueueType);
            end
        };
        local v18 = { u3.createElement("UIStroke", {
                Thickness = 1,
                Color = Theme.textPrimary
            }, { u3.createElement("UIGradient", {
                    Rotation = -90,
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                }) }), u3.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new(Color3.fromRGB(107, 112, 185), ColorUtil.darken(Color3.fromRGB(107, 112, 185), 0.8))
            }), u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local v19 = #v18;
        local v20 = {
            SizeConstraint = "RelativeXX",
            AutomaticSize = "Y",
            TextScaled = true,
            BackgroundTransparency = 1,
            RichText = true,
            Size = UDim2.fromScale(1, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.4),
            TextColor3 = ColorUtil.WHITE
        };

        if v15 == nil then
            v15 = getQueueMeta(u6.QueueType).title;
        end;

        v20.Text = v15;
        v18[v19 + 1] = u3.createElement("TextLabel", v20, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = DeviceUtil.isSmallScreen() and 12 or 14
            }) });
        v18[v19 + 2] = u3.createElement("TextLabel", {
            SizeConstraint = "RelativeXX",
            AutomaticSize = "Y",
            BackgroundTransparency = 1,
            TextScaled = true,
            Text = "[Click to play]",
            Size = UDim2.fromScale(1, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.7),
            TextColor3 = Color3.fromRGB(206, 206, 206)
        }, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = DeviceUtil.isSmallScreen() and 8 or 10
            }) });

        return u3.createElement("ImageButton", v17, v18);
    end)
};