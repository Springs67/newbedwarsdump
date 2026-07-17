-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local CLUE_TO_TEXTURE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "constants", "halloween-graveyard-scene-constants").CLUE_TO_TEXTURE;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u3 = UDim2.fromScale(0.5, -0.5);
local u4 = UDim2.fromScale(0.5, 0.065);

return {
    ClueDiscovered = v2.new(u1)(function(u5, p6) -- Line: 14
        -- upvalues: u1 (copy), CLUE_TO_TEXTURE (copy), TweenService (copy), u4 (copy), u3 (copy), Theme (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = u1.createRef();
        local u8 = u1.createRef();
        useEffect(function() -- Line: 21
            -- upvalues: u5 (copy), u7 (copy), u8 (copy), CLUE_TO_TEXTURE (ref), TweenService (ref), u4 (ref), u3 (ref)
            local u14 = u5.clueDiscoveredSignal:Connect(function(p9) -- Line: 23
                -- upvalues: u7 (ref), u8 (ref), CLUE_TO_TEXTURE (ref), TweenService (ref), u4 (ref), u3 (ref)
                local u10 = u7:getValue();
                local v11 = u8:getValue();

                if not (u10 and v11) then
                    return nil;
                end;

                v11.Image = CLUE_TO_TEXTURE[p9];
                local v12 = TweenService:Create(u10, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    Position = u4
                });
                v12:Play();
                local u13 = nil;
                u13 = v12.Completed:Connect(function() -- Line: 38
                    -- upvalues: u13 (ref), TweenService (ref), u10 (copy), u3 (ref)
                    u13:Disconnect();
                    task.delay(2, function() -- Line: 40
                        -- upvalues: TweenService (ref), u10 (ref), u3 (ref)
                        TweenService:Create(u10, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            Position = u3
                        }):Play();
                    end);
                end);
            end);

            return function() -- Line: 47
                -- upvalues: u14 (copy)
                u14:Disconnect();
            end;
        end, {});

        return u1.createElement("ScreenGui", {
            ResetOnSpawn = true
        }, {
            ScreenContainer = u1.createElement("Frame", {
                BorderSizePixel = 0,
                Transparency = 1,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            }, {
                ClueContainer = u1.createElement("Frame", {
                    [u1.Ref] = u7,
                    Size = UDim2.fromScale(0.365, 0.075),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = u3,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Theme.Gray,
                    Transparency = 0.5
                }, {
                    u1.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 3)
                    }),
                    u1.createElement("UIStroke", {
                        Thickness = 2,
                        Color = Color3.fromRGB(255, 255, 255)
                    }),
                    ClueIcon = u1.createElement("ImageLabel", {
                        [u1.Ref] = u8,
                        Size = UDim2.fromScale(0.14, 0.14),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        ScaleType = Enum.ScaleType.Fit,
                        SizeConstraint = Enum.SizeConstraint.RelativeXX,
                        Position = UDim2.fromScale(0.1, 0.5),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Image = "",
                        ImageColor3 = Color3.new(0, 700, 700)
                    }),
                    ClueText = u1.createElement("TextLabel", {
                        Text = "Clue Discovered",
                        RichText = true,
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.575, 0.5),
                        Size = UDim2.fromScale(0.7, 0.8),
                        Font = Enum.Font.RobotoMono,
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    })
                })
            })
        });
    end)
};