-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local EnchantRuneWheel = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "enchant-table", "ui", "enchant-table-right", "enchant-rune-wheel").EnchantRuneWheel;

return {
    RewardPopUp = v3.new(u2)(function(p4, p5) -- Line: 13
        -- upvalues: u2 (copy), RuntimeLib (copy), TweenService (copy), DeviceUtil (copy), KnitClient (copy), SlideIn (copy), Empty (copy), EnchantRuneWheel (copy), ColorUtil (copy)
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        local image = p4.image;
        local v7 = Color3.fromRGB(255, 255, 255);
        local tier = p4.tier;

        if tier == 0 then
            v7 = Color3.fromRGB(255, 255, 255);
        elseif tier == 1 then
            v7 = Color3.fromRGB(71, 255, 0);
        elseif tier == 2 then
            v7 = Color3.fromRGB(0, 110, 255);
        elseif tier == 3 then
            v7 = Color3.fromRGB(255, 82, 0);
        end;

        useEffect(function() -- Line: 37
            -- upvalues: u6 (copy), RuntimeLib (ref), TweenService (ref), DeviceUtil (ref), KnitClient (ref)
            local u8 = u6:getValue();
            local u9 = nil;
            local u10 = true;

            if u8 then
                RuntimeLib.Promise.delay(1):andThen(function() -- Line: 43
                    -- upvalues: u10 (ref), TweenService (ref), u8 (copy), u9 (ref), DeviceUtil (ref), KnitClient (ref)
                    if not u10 then
                        return nil;
                    end;

                    local v11 = TweenService:Create(u8, TweenInfo.new(0.35), {
                        Position = UDim2.fromScale(0.5, -0.2)
                    });
                    v11:Play();
                    u9 = v11.Completed:Connect(function() -- Line: 51
                        -- upvalues: DeviceUtil (ref), KnitClient (ref)
                        if not DeviceUtil.isHoarceKat() then
                            KnitClient.Controllers.MysteriousBoxController:unmountItemPopup();
                        end;
                    end);
                end);
            end;

            return function() -- Line: 59
                -- upvalues: u10 (ref), u9 (ref)
                u10 = false;

                if u9 then
                    u9:Disconnect();
                end;
            end;
        end, {});

        local function v12() -- Line: 66
            -- upvalues: u2 (ref), image (copy)
            return u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ZIndex = 2,
                Size = UDim2.fromScale(0.8, 0.8),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = image
            });
        end;

        return u2.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u2.createElement(SlideIn, {}, { u2.createElement(Empty, {
                    Position = UDim2.fromScale(0.5, 0.2),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(0.25, 0.25),
                    [u2.Ref] = u6
                }, {
                    u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }),
                    u2.createElement(EnchantRuneWheel, {
                        RuneTransparency = 0,
                        Color = v7,
                        Size = UDim2.fromScale(1, 1),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5)
                    }),
                    v12(),
                    u2.createElement("Frame", {
                        AutomaticSize = "X",
                        BackgroundTransparency = 0.3,
                        ZIndex = 3,
                        Size = UDim2.fromScale(0.75, 0.18),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.85),
                        BackgroundColor3 = ColorUtil.BLACK
                    }, { u2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0.005, 0),
                            PaddingRight = UDim.new(0.005, 0)
                        }), u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 6)
                        }), u2.createElement("TextLabel", {
                            TextScaled = true,
                            RichText = true,
                            TextXAlignment = "Center",
                            TextYAlignment = "Center",
                            BackgroundTransparency = 1,
                            ZIndex = 4,
                            Size = UDim2.fromScale(1, 0.65),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Text = "<b>" .. p4.name .. "</b>",
                            TextColor3 = ColorUtil.WHITE
                        }, { u2.createElement("UITextSizeConstraint", {
                                MaxTextSize = 16
                            }) }) })
                }) }) });
    end)
};