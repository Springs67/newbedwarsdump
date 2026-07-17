-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local SoulBrokerConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "soul-broker", "soul-broker-constants").SoulBrokerConstants;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    SoulLinkIndicator = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: u1 (copy), TweenService (copy), BedwarsImageId (copy), SoulBrokerConstants (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local u5 = u1.createRef();
        useEffect(function() -- Line: 12
            -- upvalues: u5 (copy), TweenService (ref)
            local v6 = u5:getValue();

            if not v6 then
                return nil;
            end;

            local u7 = TweenService:Create(v6, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Rotation = 0,
                Size = UDim2.fromScale(1, 1)
            });
            u7:Play();

            return function() -- Line: 23
                -- upvalues: u7 (copy)
                u7:Destroy();
            end;
        end, {});
        local createElement = u1.createElement;
        local v8 = {
            AlwaysOnTop = true,
            Size = UDim2.fromOffset(25, 25)
        };
        local v9 = {};
        local createElement2 = u1.createElement;
        local v10 = {
            [u1.Ref] = u5,
            Size = UDim2.fromScale(2, 2),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v11;

        if p3.IsEnemy then
            v11 = BedwarsImageId.SOUL_LINK_ICON;
        else
            v11 = BedwarsImageId.SHIELD;
        end;

        v10.Image = v11;
        v10.BackgroundTransparency = 1;
        v10.BorderSizePixel = 0;
        local v12;

        if p3.IsEnemy then
            v12 = nil;
        else
            v12 = SoulBrokerConstants.SOUL_LINK_COLOR;
        end;

        v10.ImageColor3 = v12;
        v10.ZIndex = 1;
        v10.Rotation = 45;
        v9[1] = createElement2("ImageLabel", v10);

        return createElement("BillboardGui", v8, v9);
    end)
};