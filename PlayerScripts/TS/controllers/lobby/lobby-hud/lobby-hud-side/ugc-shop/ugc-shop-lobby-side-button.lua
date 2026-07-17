-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local UgcMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-meta").UgcMeta;

return {
    UgcShopLobbySideButton = v3.new(u2)(function(u5, p6) -- Line: 13
        -- upvalues: UgcMeta (copy), u2 (copy), u1 (copy), RunService (copy), TweenService (copy), default (copy), Empty (copy), BedwarsImageId (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local v7 = UgcMeta[u5.UgcType];

        if not v7 then
            return u2.createFragment();
        end;

        local u8 = u2.createRef();
        local u9 = u2.createRef();
        local u10 = u2.createRef();
        local u11 = u2.createRef();
        useEffect(function() -- Line: 24
            -- upvalues: u8 (copy), u9 (copy), u1 (ref), RunService (ref)
            local u12 = u8:getValue();
            local u13 = u9:getValue();

            if not (u12 and u13) then
                return nil;
            end;

            local u14 = u1.new();
            u14:GiveTask(RunService.Heartbeat:Connect(function(p15) -- Line: 31
                -- upvalues: u12 (copy), u13 (copy)
                local v16 = u12;
                v16.Rotation = v16.Rotation + 10 * p15;
                local v17 = u13;
                v17.Rotation = v17.Rotation - 5 * p15;
            end));

            return function() -- Line: 35
                -- upvalues: u14 (copy)
                u14:DoCleaning();
            end;
        end, {});
        useEffect(function() -- Line: 39
            -- upvalues: u10 (copy), u11 (copy), u1 (ref), TweenService (ref)
            local v18 = u10:getValue();
            local v19 = u11:getValue();

            if not (v18 and v19) then
                return nil;
            end;

            local u20 = u1.new();
            local u21 = TweenService:Create(v18, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Rotation = 5,
                Size = UDim2.fromScale(1.1, 1.1),
                Position = UDim2.new(0.5, 0, 0.45, 0)
            });
            local u22 = TweenService:Create(v18, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Rotation = 0,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5)
            });
            local u23 = TweenService:Create(v19, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Rotation = 5,
                Size = UDim2.fromScale(0.77, 0.22)
            });
            local u24 = TweenService:Create(v19, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Rotation = -10,
                Size = UDim2.fromScale(0.7, 0.2)
            });
            u20:GiveTask(v18.MouseEnter:Connect(function() -- Line: 64
                -- upvalues: u21 (copy)
                u21:Play();
            end));
            u20:GiveTask(v18.MouseLeave:Connect(function() -- Line: 67
                -- upvalues: u22 (copy)
                u22:Play();
            end));
            u20:GiveTask(v18.MouseEnter:Connect(function() -- Line: 70
                -- upvalues: u23 (copy)
                u23:Play();
            end));
            u20:GiveTask(v18.MouseLeave:Connect(function() -- Line: 73
                -- upvalues: u24 (copy)
                u24:Play();
            end));

            return function() -- Line: 76
                -- upvalues: u20 (copy)
                u20:DoCleaning();
            end;
        end, {});
        local v25 = {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v26 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) };
        local v27 = {
            [u2.Ref] = u10,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),

            [u2.Event.Activated] = function() -- Line: 96
                -- upvalues: default (ref), u5 (copy)
                default.Client:Get("PurchaseUGCRequest"):SendToServer({
                    ugcType = u5.UgcType
                });
            end,

            BackgroundTransparency = 1
        };
        local v28 = {};
        local _ = #v28;
        local v29 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v30 = { u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 1,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                Image = v7.image.render
            }) };
        local v31 = #v30;
        local v32;

        if v7.image.stroke == nil then
            v32 = false;
        else
            v32 = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 0,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                Image = v7.image.stroke
            });
        end;

        if v32 then
            v30[v31 + 1] = v32;
        end;

        v28.KitImagesContainer = u2.createElement(Empty, v29, v30);
        v28.BackgroundEffectsContainer = u2.createElement(Empty, {
            Size = UDim2.fromScale(1, 1)
        }, { u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 0,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                Image = BedwarsImageId.SOLID_BLURRED_CIRCLE
            }), u2.createElement("ImageLabel", {
                [u2.Ref] = u8,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(1.5, 1.5),
                Image = BedwarsImageId.SOLID_BLURRED_12_POINT_STAR,
                BackgroundTransparency = 1,
                ZIndex = 0
            }), u2.createElement("ImageLabel", {
                [u2.Ref] = u9,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(1.5, 1.5),
                Image = BedwarsImageId.SOLID_BLURRED_7_POINT_STAR,
                BackgroundTransparency = 1,
                ZIndex = 0
            }) });
        v28.TextContainer = u2.createElement("Frame", {
            [u2.Ref] = u11,
            Position = UDim2.fromScale(0.7, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.7, 0.2),
            Rotation = -10,
            BackgroundColor3 = Color3.fromRGB(255, 55, 6)
        }, {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.05, 0)
            }),
            u2.createElement("UIStroke", {
                Color = Color3.fromRGB(255, 179, 52)
            }),
            u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.05, 0),
                PaddingTop = UDim.new(0.05, 0)
            }),
            u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = v7.limited and "LIMITED" or "UGC",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.new(Font.fromEnum(Enum.Font.FredokaOne).Family, Enum.FontWeight.Bold)
            })
        });
        v26[#v26 + 1] = u2.createElement("ImageButton", v27, v28);

        return u2.createFragment({
            UgcShopLobbySideButton = u2.createElement(Empty, v25, v26)
        });
    end)
};