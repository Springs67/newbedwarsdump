-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    RoundButton = v4.new(u3)(function(u5, p6) -- Line: 12
        -- upvalues: u3 (copy), u2 (copy), TweenService (copy), ColorUtil (copy), SoundManager (copy), GameSound (copy), Empty (copy)
        local useEffect = p6.useEffect;
        local u7, u8 = p6.useState(false);
        local u9 = u3.createRef();
        local u10 = u3.createRef();
        useEffect(function() -- Line: 18
            -- upvalues: u5 (copy), u8 (copy)
            if u5.Hovered then
                u8(u5.Hovered);
            end;
        end, { u5.Hovered });
        useEffect(function() -- Line: 23
            -- upvalues: u9 (copy), u10 (copy), u2 (ref), TweenService (ref), u7 (copy)
            local v11 = u9:getValue();
            local v12 = u10:getValue();

            if not (v11 and v12) then
                return nil;
            end;

            local u13 = u2.new();
            local u14 = TweenService:Create(v11, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                Size = UDim2.fromScale(u7 and 1.05 or 1, u7 and 1.05 or 1)
            });
            u14:Play();
            u13:GiveTask(function() -- Line: 34
                -- upvalues: u14 (copy)
                u14:Cancel();
                u14:Destroy();
            end);
            local u15 = TweenService:Create(v12, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                Transparency = u7 and 0 or 0.5
            });
            u15:Play();
            u13:GiveTask(function() -- Line: 42
                -- upvalues: u15 (copy)
                u15:Cancel();
                u15:Destroy();
            end);

            return function() -- Line: 46
                -- upvalues: u13 (copy)
                u13:DoCleaning();
            end;
        end, { u7 });
        local v16 = {};

        for i, v in u5 do
            v16[i] = v;
        end;

        v16.Image = nil;
        v16.Hovered = nil;
        v16.OnClick = nil;
        v16.ImageButtonProps = nil;
        v16[u3.Children] = nil;
        local v17 = {};

        for i, v in v16 do
            v17[i] = v;
        end;

        v17.SizeConstraint = "RelativeYY";
        local v18 = {};
        local v19 = #v18;
        local v20 = u5[u3.Children];

        if v20 then
            for i, v in v20 do
                if type(i) == "number" then
                    v18[v19 + i] = v;
                else
                    v18[i] = v;
                end;
            end;
        end;

        local v21 = {
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = ColorUtil.BLACK,
            ImageTransparency = 1,
            Transparency = 0.5,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            [u3.Ref] = u9,
            [u3.Event.MouseButton1Click] = u5.OnClick,

            [u3.Event.MouseEnter] = function() -- Line: 89
                -- upvalues: SoundManager (ref), GameSound (ref), u8 (copy)
                SoundManager:playSound(GameSound.UI_HOVER);
                u8(true);
            end,

            [u3.Event.MouseLeave] = function() -- Line: 93
                -- upvalues: u8 (copy)
                u8(false);
            end,

            ZIndex = v16.ZIndex
        };
        local ImageButtonProps = u5.ImageButtonProps;

        if ImageButtonProps then
            for i, v in ImageButtonProps do
                v21[i] = v;
            end;
        end;

        v18[#v18 + 1] = u3.createElement("ImageButton", v21, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), u3.createElement("UIStroke", {
                Transparency = 0,
                Color = ColorUtil.WHITE,
                Thickness = 2,
                [u3.Ref] = u10
            }, { u3.createElement("UIGradient", {
                    Rotation = -90,
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 1) })
                }) }), u3.createElement("ImageLabel", {
                Transparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.65, 0.65),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = u5.Image,
                ScaleType = Enum.ScaleType.Fit,
                ZIndex = v16.ZIndex
            }) });

        return u3.createElement(Empty, v17, v18);
    end)
};