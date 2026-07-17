-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local TweenService = v5.TweenService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getPvpArenaAugmentCategoryMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-category-meta").getPvpArenaAugmentCategoryMeta;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-meta");
local getPvPArenaAugmentDescription = v6.getPvPArenaAugmentDescription;
local getPvPArenaAugmentMeta = v6.getPvPArenaAugmentMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PvPArenaAugmentIcon = RuntimeLib.import(script, script.Parent, "pvp-arena-augment-icon").PvPArenaAugmentIcon;

return {
    PvPArenaAugmentCard = v4.new(u3)(function(u7, p8) -- Line: 24
        -- upvalues: getPvPArenaAugmentMeta (copy), getPvpArenaAugmentCategoryMeta (copy), u3 (copy), u2 (copy), DeviceUtil (copy), UIUtil (copy), SoundManager (copy), TweenService (copy), Theme (copy), ClientStore (copy), Players (copy), KnitClient (copy), PvPArenaAugmentIcon (copy), ColorUtil (copy), GameSound (copy), getPvPArenaAugmentDescription (copy), Empty (copy)
        local useState = p8.useState;
        local useEffect = p8.useEffect;
        local v9 = getPvPArenaAugmentMeta(u7.Augment);
        local v10 = getPvpArenaAugmentCategoryMeta(v9.augmentCategory);
        local u11, u12 = useState(false);
        local v13 = string.upper(v9.displayName);
        local title = v10.title;
        local u14 = u3.createRef();
        local u15 = u3.createRef();
        local u16 = u3.createRef();
        useEffect(function() -- Line: 35
            -- upvalues: u2 (ref), u16 (copy), DeviceUtil (ref), UIUtil (ref), u7 (copy), SoundManager (ref)
            local u17 = u2.new();
            local v18 = u16:getValue();

            if v18 then
                if DeviceUtil.isGamepadControls() then
                    UIUtil:selectGui(v18);
                end;

                local u19 = UIUtil:setContainerTransparency(v18, 1, {
                    onCleanUpTweenInfo = TweenInfo.new(0.3)
                });
                local u20 = task.delay(u7.CardNumber * 0.33, function() -- Line: 46
                    -- upvalues: SoundManager (ref), u7 (ref), u19 (copy)
                    SoundManager:playSound("rbxassetid://10969529817", {
                        playbackSpeedMultiplier = 1 + u7.CardNumber * 0.3
                    });
                    u19:DoCleaning();
                end);
                u17:GiveTask(function() -- Line: 52
                    -- upvalues: u20 (copy)
                    if u20 then
                        task.cancel(u20);
                    end;
                end);
            end;

            return function() -- Line: 58
                -- upvalues: u17 (copy)
                u17:Destroy();
            end;
        end, {});
        useEffect(function() -- Line: 62
            -- upvalues: u14 (copy), u15 (copy), u7 (copy), u11 (copy), TweenService (ref)
            local v21 = u14:getValue();
            local v22 = u15:getValue();

            if not (v21 and v22) then
                return nil;
            end;

            if u7.Active or u7.SelectedAugment then
                return nil;
            end;

            if u11 then
                TweenService:Create(v22, TweenInfo.new(0.3), {
                    Transparency = 0
                }):Play();
                TweenService:Create(v21, TweenInfo.new(0.3), {
                    Offset = Vector2.new(0, 0)
                }):Play();

                return;
            end;

            TweenService:Create(v22, TweenInfo.new(0.3), {
                Transparency = 1
            }):Play();
            TweenService:Create(v21, TweenInfo.new(0.3), {
                Offset = Vector2.new(-0.1, 0)
            }):Play();
        end, { u11 });
        local v23 = {
            AnchorPoint = Vector2.new(0.5, 0),
            Position = u7.Position,
            Size = UDim2.fromScale(1, 0.30158730158730157),
            BackgroundColor3 = Theme.Gray,
            BackgroundTransparency = 1,
            Active = true,

            [u3.Event.MouseButton1Click] = function() -- Line: 95
                -- upvalues: u7 (copy), DeviceUtil (ref), ClientStore (ref), Players (ref), KnitClient (ref)
                if u7.SelectedAugment then
                    return nil;
                end;

                if not u7.OnClickEnabled then
                    return nil;
                end;

                if DeviceUtil.isHoarceKat() then
                    ClientStore:dispatch({
                        type = "BedwarsSetPvPArenaAugmentSelection",
                        userId = Players.LocalPlayer.UserId,
                        augment = u7.Augment
                    });

                    return;
                end;

                KnitClient.Controllers.PvpArenaAugmentSelectionController:selectAugment(u7.Augment);
            end,

            [u3.Ref] = u16
        };
        local v24 = { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.939655172413793
            }), u3.createElement(PvPArenaAugmentIcon, {
                Augment = u7.Augment,
                FrameProps = {
                    Size = UDim2.fromScale(0.2844638949671772, 1)
                }
            }) };
        local v25 = {
            Size = UDim2.fromScale(0.8743169398907104, 0.8836206896551724),
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            BackgroundColor3 = ColorUtil.WHITE,
            BorderSizePixel = 0,

            [u3.Event.MouseEnter] = function() -- Line: 132
                -- upvalues: SoundManager (ref), GameSound (ref), u12 (copy)
                SoundManager:playSound(GameSound.UI_HOVER);
                u12(true);
            end,

            [u3.Event.MouseLeave] = function() -- Line: 136
                -- upvalues: u12 (copy)
                u12(false);
            end
        };
        local v26 = {};
        local v27 = u3.createElement("UIStroke", {
            Transparency = u7.Active and 0 or 1,
            Thickness = 2,
            Color = ColorUtil.WHITE,
            [u3.Ref] = u15
        });
        local createElement = u3.createElement;
        local v28 = {
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v10.hexagonOutlineGradient.Keypoints[2].Value), ColorSequenceKeypoint.new(0.25, ColorUtil.hexColor(0)), ColorSequenceKeypoint.new(1, ColorUtil.hexColor(0)) }),
            Transparency = NumberSequence.new(0.2, 0.4),
            Rotation = -20
        };
        local v29;

        if u7.Active then
            v29 = Vector2.new(0, 0);
        else
            v29 = Vector2.new(-0.1, 0);
        end;

        v28.Offset = v29;
        v28[u3.Ref] = u14;
        v26[1], v26[2] = v27, createElement("UIGradient", v28);
        local _ = #v26;
        local v30 = title ~= nil;

        if v30 then
            local v31 = {
                TextXAlignment = "Right",
                TextYAlignment = "Center",
                Size = UDim2.fromScale(0.27, 0.18),
                Position = UDim2.fromScale(0.9744, 0.03902439024390244),
                AnchorPoint = Vector2.new(1, 0)
            };
            local v32;

            if title == nil then
                v32 = title;
            else
                v32 = string.upper(title.displayName);
            end;

            v31.Text = "<b>" .. v32 .. "</b>";
            v31.RichText = true;
            v31.TextSize = 28;
            v31.Font = "SourceSansItalic";

            if title ~= nil then
                title = title.color;
            end;

            if title == nil then
                title = ColorUtil.WHITE;
            end;

            v31.TextColor3 = title;
            v31.BackgroundTransparency = 1;
            v30 = u3.createElement("TextLabel", v31);
        end;

        local v33 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.78125, 1),
            Position = UDim2.fromScale(0.20625, 0.5),
            AnchorPoint = Vector2.new(0, 0.5)
        };
        local v34 = { u3.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                RichText = true,
                TextScaled = true,
                Font = "SourceSansBold",
                BackgroundTransparency = 1,
                TextTransparency = 0.1,
                Size = UDim2.fromScale(0.7, 0.25),
                Position = UDim2.fromScale(0, 0.05),
                Text = "<b>" .. v13 .. "</b>",
                TextColor3 = ColorUtil.WHITE
            }) };
        local v35 = #v34;

        if v30 then
            v34[v35 + 1] = v30;
        end;

        v34[#v34 + 1] = u3.createElement("TextLabel", {
            TextSize = 28,
            TextWrapped = true,
            TextXAlignment = "Left",
            TextYAlignment = "Top",
            RichText = true,
            TextTransparency = 0.1,
            Font = "SourceSans",
            LineHeight = 0.85,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.9, 0.5),
            Position = UDim2.fromScale(0.0448, 0.4),
            Text = getPvPArenaAugmentDescription(u7.Augment),
            TextColor3 = Color3.fromRGB(232, 232, 232)
        });
        v34.VerticalDivider = u3.createElement("Frame", {
            BackgroundTransparency = 0.6,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.008, 0.5),
            Position = UDim2.fromScale(0, 0.4),
            BackgroundColor3 = ColorUtil.BLACK
        });
        v26.InfoFrame = u3.createElement(Empty, v33, v34);
        v24[#v24 + 1] = u3.createElement("Frame", v25, v26);

        return u3.createFragment({
            CardFrame = u3.createElement("ImageButton", v23, v24)
        });
    end)
};