-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    HonorPlayerCardGUI = v3.new(u2)(function(u4, p5) -- Line: 16
        -- upvalues: u2 (copy), BedwarsKitMeta (copy), BedwarsImageId (copy), DeviceUtil (copy), Players (copy), BedwarsKit (copy), KnitClient (copy), Empty (copy), ColorUtil (copy), Padding (copy), ClientStore (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6 = u2.createRef();
        local u7 = u2.createRef();
        local u8, u9 = useState(nil);

        local function v15() -- Line: 22
            -- upvalues: u2 (ref), u8 (copy), BedwarsKitMeta (ref), BedwarsImageId (ref)
            local createFragment = u2.createFragment;
            local v10 = {};
            local createElement = u2.createElement;
            local v11 = {
                BackgroundTransparency = 0.35,
                Size = UDim2.fromScale(0.35, 0.35),
                Position = UDim2.fromScale(1, 0),
                AnchorPoint = Vector2.new(1, 0),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            };
            local v12 = { (u2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })) };
            local createElement2 = u2.createElement;
            local v13 = {
                ScaleType = "Crop",
                BackgroundTransparency = 1,
                LayoutOrder = 1
            };
            local v14;

            if u8 then
                v14 = BedwarsKitMeta[u8].renderImage;
            else
                v14 = BedwarsImageId.X;
            end;

            v13.Image = v14;
            v13.Size = UDim2.fromScale(0.875, 0.875);
            v13.Position = UDim2.fromScale(0.5, 0.5);
            v13.AnchorPoint = Vector2.new(0.5, 0.5);
            v12.PlayerKitImage = createElement2("ImageLabel", v13, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
            v10.PlayerKitFrame = createElement("Frame", v11, v12);

            return createFragment(v10);
        end;

        useEffect(function() -- Line: 50
            -- upvalues: u7 (copy), DeviceUtil (ref), BedwarsImageId (ref), Players (ref), u4 (copy), u9 (copy), BedwarsKit (ref), KnitClient (ref)
            local v16 = u7:getValue();

            if v16 then
                if DeviceUtil.isHoarceKat() then
                    v16.Image = BedwarsImageId.QUESTION_MARK_SOLID;
                else
                    v16.Image = Players:GetUserThumbnailAsync(u4.Player.userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352);
                end;
            end;

            if DeviceUtil.isHoarceKat() then
                u9(BedwarsKit.AERY);

                return;
            end;

            local v17 = Players:GetPlayerByUserId(u4.Player.userId);

            if v17 then
                u9((KnitClient.Controllers.KitController:getPrimaryActiveKit(v17)));
            end;
        end, {});
        local createFragment = u2.createFragment;
        local v18 = {};
        local createElement = u2.createElement;
        local v19 = {
            Size = UDim2.new(1, 0, 1, 0),
            SizeConstraint = "RelativeYY",
            [u2.Ref] = v6,
            BackgroundColor3 = ColorUtil.WHITE,
            BackgroundTransparency = 0,
            LayoutOrder = u4.Index
        };
        local v20 = {
            u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 0.75
            }),
            u2.createElement("UIListLayout", {
                Padding = UDim.new(0),
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            TopSection = u2.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.7)
            }, {
                u2.createElement(Padding, {
                    Padding = UDim.new(0.05, 0)
                }),
                PlayerAvatar = u2.createElement("ImageLabel", {
                    [u2.Ref] = u7,
                    Size = UDim2.fromScale(1, 0.78),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.fromScale(0.5, 0),
                    BackgroundColor3 = ColorUtil.BLACK,
                    BackgroundTransparency = 0.7,
                    ScaleType = Enum.ScaleType.Crop,
                    LayoutOrder = 1
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), u2.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }) }),
                u2.createElement(v15),
                DisplayName = u2.createElement("TextLabel", {
                    TextScaled = true,
                    TextYAlignment = "Bottom",
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    AutoLocalize = false,
                    Size = UDim2.fromScale(1, 0.45),
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.fromScale(0.5, 1),
                    Text = u4.Player.displayName,
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = Color3.new(1, 1, 1)
                }, { u2.createElement("UIStroke", {
                        Transparency = 0.3
                    }) })
            })
        };
        local v21 = "GiveHonorButton_" .. tostring(u4.Player.userId);
        local createElement2 = u2.createElement;
        local v22 = {
            Size = UDim2.fromScale(1, 0.3)
        };
        local v23;

        if u4.IsHonored then
            v23 = Color3.fromRGB(72, 168, 120);
        elseif u4.Disabled then
            v23 = Color3.fromRGB(66, 66, 66);
        else
            v23 = Color3.fromRGB(212, 213, 235);
        end;

        v22.BackgroundColor3 = v23;
        v22.BorderSizePixel = 0;
        v22.LayoutOrder = 2;
        v22.BackgroundTransparency = (u4.IsHonored or u4.Disabled) and 0.3 or 0;

        v22[u2.Event.Activated] = function() -- Line: 140
            -- upvalues: u4 (copy), DeviceUtil (ref), ClientStore (ref), KnitClient (ref)
            if u4.Disabled or u4.IsHonored then
                return nil;
            end;

            if DeviceUtil.isHoarceKat() then
                ClientStore:dispatch({
                    type = "GameAddHonoredPlayer",
                    userId = u4.Player.userId
                });

                return;
            end;

            KnitClient.Controllers.HonorController:honorPlayer(u4.Player.userId);
        end;

        v22.Interactable = not (u4.Disabled or u4.IsHonored);
        local v24 = { (u2.createElement("UICorner")) };
        local createElement3 = u2.createElement;
        local v25 = {
            BackgroundTransparency = 1,
            Image = BedwarsImageId.THUMBS_UP
        };
        local v26;

        if u4.IsHonored then
            v26 = Color3.fromRGB(99, 255, 143);
        else
            v26 = Color3.fromRGB(26, 26, 26);
        end;

        v25.ImageColor3 = v26;
        v25.Size = UDim2.new(0.8, 0, 0.8, 0);
        v25.AnchorPoint = Vector2.new(0.5, 0.5);
        v25.Position = UDim2.fromScale(0.5, 0.5);
        v25.ImageTransparency = (u4.IsHonored or u4.Disabled) and 0.6 or 0;
        v24.HonorImage = createElement3("ImageLabel", v25, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v20[v21] = createElement2("ImageButton", v22, v24);
        v18.HonorPlayerCard = createElement(Empty, v19, v20);

        return createFragment(v18);
    end)
};