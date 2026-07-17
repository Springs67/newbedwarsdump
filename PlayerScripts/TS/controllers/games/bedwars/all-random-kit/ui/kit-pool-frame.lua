-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CircularProgress = v1.CircularProgress;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local KitPoolFrameHighlight = RuntimeLib.import(script, script.Parent, "kit-pool-frame-highlight").KitPoolFrameHighlight;

return {
    KitPoolFrame = v4.new(u3)(function(u5, p6) -- Line: 13
        -- upvalues: u3 (copy), Workspace (copy), u2 (copy), getBedwarsKitMeta (copy), ColorUtil (copy), KitPoolFrameHighlight (copy), CircularProgress (copy), Empty (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local _ = p6.useMemo;
        local u7 = u3.createRef();
        useEffect(function() -- Line: 18
            -- upvalues: u7 (copy), u5 (copy), Workspace (ref), u2 (ref)
            local u8 = u7:getValue();

            if not u8 then
                return nil;
            end;

            if u5.CooldownExpireTime == nil or u5.CooldownExpireTime - Workspace:GetServerTimeNow() <= 0 then
                return nil;
            end;

            local u9 = u2.new();
            local ImageTransparency = u8.ImageTransparency;
            u8.ImageTransparency = 0.5;
            u9:GiveTask(function() -- Line: 29
                -- upvalues: u8 (copy), ImageTransparency (copy)
                u8.ImageTransparency = ImageTransparency;
            end);
            task.delay(u5.CooldownExpireTime - Workspace:GetServerTimeNow(), function() -- Line: 32
                -- upvalues: u9 (copy)
                return u9:DoCleaning();
            end);

            return function() -- Line: 35
                -- upvalues: u9 (copy)
                u9:DoCleaning();
            end;
        end, { u5.CooldownExpireTime });
        local v10;

        if u5.Kit then
            v10 = getBedwarsKitMeta(u5.Kit);
        else
            v10 = nil;
        end;

        local v11 = {};
        local FrameProps = u5.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v11[i] = v;
            end;
        end;

        local v12 = { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.05, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }) };
        local v13 = {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v14 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.05, 0)
            }) };
        local v15 = #v14;
        local v16;

        if u5.Kit == nil then
            v16 = false;
        else
            v16 = u3.createElement(KitPoolFrameHighlight, {}, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.05, 0)
                }) });
        end;

        if v16 then
            v14[v15 + 1] = v16;
        end;

        local v17 = {
            [u3.Ref] = u7,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1
        };

        if v10 ~= nil then
            v10 = v10.renderImage;
        end;

        v17.Image = v10;
        v17.ScaleType = Enum.ScaleType.Fit;
        v17.BorderSizePixel = 0;
        v17[u3.Event.MouseButton1Click] = u5.OnClick;
        local v18 = {};
        local v19 = #v18;
        local v20;

        if u5.CooldownExpireTime == nil or u5.CooldownExpireTime - Workspace:GetServerTimeNow() <= 0 then
            v20 = false;
        else
            v20 = u3.createElement(CircularProgress, {
                Transparency = 0.3,
                Duration = u5.CooldownExpireTime - Workspace:GetServerTimeNow(),
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            });
        end;

        if v20 then
            v18[v19 + 1] = v20;
        end;

        v14[#v14 + 1] = u3.createElement("ImageButton", v17, v18);
        v12[#v12 + 1] = u3.createElement("Frame", v13, v14);

        return u3.createElement(Empty, v11, v12);
    end)
};