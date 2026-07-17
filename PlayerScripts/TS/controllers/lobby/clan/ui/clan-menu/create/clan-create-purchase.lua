-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Gamepass = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MarketplaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil;

return {
    ClanCreatePurchase = v3.new(u2)(function(p4, p5) -- Line: 15
        -- upvalues: MarketplaceUtil (copy), Gamepass (copy), KnitClient (copy), u2 (copy), Empty (copy), BedwarsImageId (copy), Theme (copy), ColorUtil (copy), ButtonComponent (copy), ImageId (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(0);
        useEffect(function() -- Line: 19
            -- upvalues: MarketplaceUtil (ref), Gamepass (ref), u7 (copy)
            MarketplaceUtil.getGamePassProductInfoAsync(Gamepass.CLAN_CREATE_PASS):andThen(function(p8) -- Line: 21
                -- upvalues: u7 (ref)
                local v9;

                if p8 == nil then
                    v9 = p8;
                else
                    v9 = p8.PriceInRobux;
                end;

                if v9 == nil then
                    return nil;
                end;

                if p8 ~= nil then
                    p8 = p8.PriceInRobux;
                end;

                u7(p8);
            end):catch(function() -- Line: 35
            end);
        end, {});

        local function v10() -- Line: 37
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.ClanController:promptClanPassPurchase();
        end;

        return u2.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.9)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                Padding = UDim.new(0, 20)
            }),
            u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.3),
                Image = BedwarsImageId.CLAN
            }),
            u2.createElement(Empty, {
                AutomaticSize = "Y",
                Size = UDim2.fromScale(1, 0)
            }, { u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Center",
                    Padding = UDim.new(0, 6)
                }), u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    Text = "<b>CLAN PASS</b>",
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    BackgroundTransparency = 1,
                    TextXAlignment = "Center",
                    Size = UDim2.fromScale(1, 0),
                    TextColor3 = Theme.textPrimary
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 24
                    }) }), u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    Text = "Purchase the Clan Pass to create a clan",
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextTransparency = 0.4,
                    BackgroundTransparency = 1,
                    TextXAlignment = "Center",
                    Size = UDim2.fromScale(1, 0),
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 20
                    }) }) }),
            u2.createElement(ButtonComponent, {
                Selectable = false,
                Size = UDim2.new(0.8, 0, 0, 50),
                BackgroundColor3 = Theme.backgroundSuccess,
                OnClick = v10
            }, { u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Center",
                    Padding = UDim.new(0, 10)
                }), u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ScaleType = "Fit",
                    SizeConstraint = "RelativeYY",
                    Image = ImageId.ROBUX,
                    ImageColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.fromScale(0.65, 0.55),
                    AnchorPoint = Vector2.new(1, 0.5)
                }), u2.createElement("TextLabel", {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    Text = "<b>" .. tostring(v6) .. "</b>",
                    Size = UDim2.fromScale(1, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }) })
        });
    end)
};