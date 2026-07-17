-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local NewsMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "news", "news-types").NewsMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    Issue1Reader = v4.new(u3)(function(u5, p6) -- Line: 13
        -- upvalues: NewsMeta (copy), u3 (copy), u2 (copy), TweenService (copy), SoundManager (copy), GameSound (copy), BedwarsImageId (copy), Empty (copy)
        local useEffect = p6.useEffect;
        local v7 = NewsMeta[u5.SelectedNews];
        local u8, u9 = p6.useState(0);
        local u10 = u3.createRef();
        useEffect(function() -- Line: 20
            -- upvalues: u10 (copy), u2 (ref), TweenService (ref)
            local v11 = u10:getValue();

            if not v11 then
                return nil;
            end;

            local u12 = u2.new();
            local u13 = TweenService:Create(v11, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Rotation = -5,
                Size = UDim2.fromScale(1.05, 1.5)
            });
            local u14 = TweenService:Create(v11, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Rotation = 0,
                Size = UDim2.fromScale(1, 1)
            });
            u12:GiveTask(v11.MouseEnter:Connect(function() -- Line: 34
                -- upvalues: u13 (copy)
                u13:Play();
            end));
            u12:GiveTask(v11.MouseLeave:Connect(function() -- Line: 37
                -- upvalues: u14 (copy)
                u14:Play();
            end));

            return function() -- Line: 40
                -- upvalues: u12 (copy)
                u12:DoCleaning();
            end;
        end, { u8 });

        local function v15() -- Line: 44
            -- upvalues: SoundManager (ref), GameSound (ref), u5 (copy)
            SoundManager:playSound(GameSound.UI_CLICK_2);
            u5.SetSelectedNews(nil);
        end;

        local function v16() -- Line: 48
            -- upvalues: u9 (copy), u8 (copy)
            u9((u8 + 1) % 2);
        end;

        local v17 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 1)
        };
        local v18 = {};
        local v19 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Image = v7.pageAssetIds[u8 + 1],
            Size = UDim2.fromScale(1, 1),
            ScaleType = Enum.ScaleType.Fit,
            BackgroundTransparency = 1,
            [u3.Event.MouseButton1Click] = v16
        };
        local v20 = {};
        local v21 = #v20;
        local v22;

        if u8 == 1 then
            v22 = u3.createElement("ImageLabel", {
                Image = "rbxassetid://96742516481304",
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                [u3.Ref] = u10
            }, { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1.2828752642706132
                }) });
        else
            v22 = false;
        end;

        if v22 then
            v20[v21 + 1] = v22;
        end;

        local v23 = #v20;
        v20[v23 + 1] = u3.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.05),
            Position = UDim2.fromScale(0, 0.03)
        }, {
            GoBackIcon = u3.createElement("ImageButton", {
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0.05, 0.5),
                Image = BedwarsImageId.HOME,
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                ScaleType = Enum.ScaleType.Fit,
                ImageTransparency = 0.2,
                BackgroundTransparency = 1,
                [u3.Event.Activated] = v15
            })
        });
        v20.NextPageIcon = u3.createElement("ImageButton", {
            Size = UDim2.fromScale(0.05, 0.1),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            Image = BedwarsImageId.TRIANGLE_ARROW_RIGHT,
            ScaleType = Enum.ScaleType.Fit,
            ImageTransparency = 0.2,
            BackgroundTransparency = 1,
            [u3.Event.Activated] = v16
        });
        v20[v23 + 2] = u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1.2828752642706132
        });
        v18[#v18 + 1] = u3.createElement("ImageButton", v19, v20);

        return u3.createFragment({
            NewsReader = u3.createElement(Empty, v17, v18)
        });
    end)
};