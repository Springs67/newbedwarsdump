-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BundleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    BundleSideButton = v4.new(u3)(function(p6, p7) -- Line: 17
        -- upvalues: u3 (copy), BundleMeta (copy), u2 (copy), RunService (copy), TweenService (copy), Flamework (copy), BedwarsAppIds (copy), Padding (copy), Empty (copy), BedwarsImageId (copy), Countdown (copy)
        local _ = p7.useState;
        local useEffect = p7.useEffect;
        local u8 = u3.createRef();
        local u9 = u3.createRef();
        local u10 = u3.createRef();
        local u11 = u3.createRef();
        local v12 = BundleMeta[p6.BundleType];
        useEffect(function() -- Line: 25
            -- upvalues: u8 (copy), u9 (copy), u2 (ref), RunService (ref)
            local u13 = u8:getValue();
            local u14 = u9:getValue();

            if not (u13 and u14) then
                return nil;
            end;

            local u15 = u2.new();
            u15:GiveTask(RunService.Heartbeat:Connect(function(p16) -- Line: 32
                -- upvalues: u13 (copy), u14 (copy)
                u13.Rotation = u13.Rotation + 0.5;
                u14.Rotation = u14.Rotation - 0.25;
            end));

            return function() -- Line: 36
                -- upvalues: u15 (copy)
                u15:DoCleaning();
            end;
        end, {});
        useEffect(function() -- Line: 40
            -- upvalues: u10 (copy), u11 (copy), u2 (ref), TweenService (ref)
            local v17 = u10:getValue();

            if not (v17 and u11:getValue()) then
                return nil;
            end;

            local u18 = u2.new();
            local u19 = TweenService:Create(v17, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Rotation = 5,
                Size = UDim2.fromScale(1.1, 1.1),
                Position = UDim2.new(0.5, 0, 0.3, 0)
            });
            local u20 = TweenService:Create(v17, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Rotation = 0,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.35)
            });
            u18:GiveTask(v17.MouseEnter:Connect(function() -- Line: 73
                -- upvalues: u19 (copy)
                u19:Play();
            end));
            u18:GiveTask(v17.MouseLeave:Connect(function() -- Line: 76
                -- upvalues: u20 (copy)
                u20:Play();
            end));

            return function() -- Line: 89
                -- upvalues: u18 (copy)
                u18:DoCleaning();
            end;
        end, {});
        local v21 = {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v22 = {
            u3.createElement("ImageButton", {
                [u3.Ref] = u10,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.35),
                AnchorPoint = Vector2.new(0.5, 0.5),

                [u3.Event.Activated] = function() -- Line: 104
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.STORE_MENU_APP, {});
                end,

                BackgroundTransparency = 1
            }, {
                u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }),
                u3.createElement(Padding, {
                    Padding = UDim.new(0.1, 0)
                }),
                Image = u3.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1)
                }, { u3.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        ZIndex = 1,
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(1, 1),
                        Image = v12.image
                    }) }),
                BackgroundEffectsContainer = u3.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1)
                }, { u3.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        ZIndex = 0,
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(1.5, 1.5),
                        Image = BedwarsImageId.SOLID_BLURRED_CIRCLE
                    }), u3.createElement("ImageLabel", {
                        [u3.Ref] = u8,
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(2.2, 2.2),
                        Image = BedwarsImageId.SOLID_BLURRED_12_POINT_STAR,
                        BackgroundTransparency = 1,
                        ZIndex = 0
                    }), u3.createElement("ImageLabel", {
                        [u3.Ref] = u9,
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(2.2, 2.2),
                        Image = BedwarsImageId.SOLID_BLURRED_7_POINT_STAR,
                        BackgroundTransparency = 1,
                        ZIndex = 0
                    }) })
            }),
            TextContainer = u3.createElement("Frame", {
                [u3.Ref] = u11,
                Position = UDim2.fromScale(0.5, 0.7),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(0.7, 0.25),
                BackgroundColor3 = Color3.fromRGB(255, 55, 6),
                ZIndex = 2
            }, {
                u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.05, 0)
                }),
                u3.createElement("UIStroke", {
                    Color = Color3.fromRGB(255, 179, 52)
                }),
                u3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0.05, 0),
                    PaddingRight = UDim.new(0.05, 0),
                    PaddingBottom = UDim.new(0.05, 0),
                    PaddingTop = UDim.new(0.05, 0)
                }),
                u3.createElement("TextLabel", {
                    ZIndex = 2,
                    BackgroundTransparency = 1,
                    Text = "Limited Offer!",
                    TextScaled = true,
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.new(Font.fromEnum(Enum.Font.FredokaOne).Family, Enum.FontWeight.Bold)
                })
            })
        };
        local v23 = #v22;
        local v24;

        if p6.EndTime == nil then
            v24 = false;
        else
            v24 = u3.createElement(Countdown, {
                EndTime = p6.EndTime,
                TextLabel = {
                    ZIndex = 3,
                    TextStrokeTransparency = 0.3,
                    TextScaled = true,
                    Size = UDim2.fromScale(1.25, 0.22),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextStrokeColor3 = Color3.fromRGB(20, 0, 28),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.fromScale(0.5, 0.8)
                },
                CountdownConfig = {
                    seconds = false,
                    minutes = true,
                    hours = true,
                    days = true
                }
            });
        end;

        if v24 then
            v22[v23 + 1] = v24;
        end;

        return u3.createFragment({
            BundleSideButton = u3.createElement(Empty, v21, v22)
        });
    end)
};