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
local UIGlitchEffect = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "glitch-effect", "ui-glitch-effect").UIGlitchEffect;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local EnchantRuneWheel = RuntimeLib.import(script, script.Parent.Parent, "enchant-table-right", "enchant-rune-wheel").EnchantRuneWheel;
local EnchantTableUIUtil = RuntimeLib.import(script, script.Parent.Parent, "enchant-table-ui-util").EnchantTableUIUtil;

return {
    EnchantPopUp = v3.new(u2)(function(u4, p5) -- Line: 16
        -- upvalues: u2 (copy), EnchantTableUIUtil (copy), ItemType (copy), RuntimeLib (copy), TweenService (copy), DeviceUtil (copy), KnitClient (copy), UIGlitchEffect (copy), SlideIn (copy), Empty (copy), EnchantRuneWheel (copy), ColorUtil (copy)
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        local v7 = u4.ThemeColor or EnchantTableUIUtil.getThemeColor(u4.EnchantTableType);
        local u8 = u4.EnchantTableType == ItemType.ENCHANT_TABLE_GLITCHED;
        useEffect(function() -- Line: 21
            -- upvalues: u6 (copy), RuntimeLib (ref), TweenService (ref), DeviceUtil (ref), KnitClient (ref)
            local u9 = u6:getValue();
            local u10 = nil;
            local u11 = true;

            if u9 then
                RuntimeLib.Promise.delay(4):andThen(function() -- Line: 27
                    -- upvalues: u11 (ref), TweenService (ref), u9 (copy), u10 (ref), DeviceUtil (ref), KnitClient (ref)
                    if not u11 then
                        return nil;
                    end;

                    local v12 = TweenService:Create(u9, TweenInfo.new(0.35), {
                        Position = UDim2.fromScale(0.5, -0.2)
                    });
                    v12:Play();
                    u10 = v12.Completed:Connect(function() -- Line: 35
                        -- upvalues: DeviceUtil (ref), KnitClient (ref)
                        if not DeviceUtil.isHoarceKat() then
                            KnitClient.Controllers.EnchantTableController:unmountEnchantPopup();
                        end;
                    end);
                end);
            end;

            return function() -- Line: 43
                -- upvalues: u11 (ref), u10 (ref)
                u11 = false;

                if u10 then
                    u10:Disconnect();
                end;
            end;
        end, {});

        local function v13() -- Line: 50
            -- upvalues: u8 (copy), u2 (ref), UIGlitchEffect (ref), u4 (copy)
            if u8 then
                return u2.createElement(UIGlitchEffect, {}, { u2.createElement("ImageLabel", {
                        ScaleType = "Fit",
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.8, 0.8),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Image = u4.EnchantImage
                    }) });
            end;

            return u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ZIndex = 2,
                Size = UDim2.fromScale(0.8, 0.8),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = u4.EnchantImage
            });
        end;

        local function _() -- Line: 74
            -- upvalues: u8 (copy), u4 (copy)
            if u8 then
                return "Glitched " .. u4.EnchantName;
            end;

            return u4.EnchantName;
        end;

        local createElement = u2.createElement;
        local v14 = {
            ResetOnSpawn = false
        };
        local v15 = {};
        local createElement2 = u2.createElement;
        local v16 = {};
        local v17 = {};
        local createElement3 = u2.createElement;
        local v18 = {
            Position = UDim2.fromScale(0.5, 0.2),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.25, 0.25),
            [u2.Ref] = u6
        };
        local v19 = {};
        local v20 = u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        });
        local v21 = u2.createElement(EnchantRuneWheel, {
            RuneTransparency = 0,
            Color = v7,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        });
        local v22 = v13();
        local createElement4 = u2.createElement;
        local v23 = {
            AutomaticSize = "X",
            BackgroundTransparency = 0.3,
            ZIndex = 3,
            Size = UDim2.fromScale(0.75, 0.18),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.85),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v24 = {};
        local v25 = u2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0.005, 0),
            PaddingRight = UDim.new(0.005, 0)
        });
        local v26 = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        });
        local createElement5 = u2.createElement;
        local v27 = {
            TextScaled = true,
            RichText = true,
            TextXAlignment = "Center",
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            ZIndex = 4,
            Size = UDim2.fromScale(1, 0.65),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v28;

        if u8 then
            v28 = "Glitched " .. u4.EnchantName;
        else
            v28 = u4.EnchantName;
        end;

        v27.Text = "<b>" .. v28 .. "</b>";
        v27.TextColor3 = ColorUtil.WHITE;
        v24[1], v24[2], v24[3] = v25, v26, createElement5("TextLabel", v27, { u2.createElement("UITextSizeConstraint", {
        MaxTextSize = 16
    }) });
        v19[1], v19[2], v19[3], v19[4] = v20, v21, v22, createElement4("Frame", v23, v24);
        v17[1] = createElement3(Empty, v18, v19);
        v15[1] = createElement2(SlideIn, v16, v17);

        return createElement("ScreenGui", v14, v15);
    end)
};