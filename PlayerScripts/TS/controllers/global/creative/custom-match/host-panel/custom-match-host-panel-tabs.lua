-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    CustomMatchHostPanelTab = v4.new(u3)(function(u5, p6) -- Line: 13
        -- upvalues: u3 (copy), u2 (copy), DeviceUtil (copy), UIUtil (copy), ColorUtil (copy), SoundManager (copy), GameSound (copy), TweenService (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = u3.createRef();
        local u8 = u2.new();
        local u9 = u5.Tab == u5.ActiveTab;
        useEffect(function() -- Line: 19
            -- upvalues: u5 (copy), DeviceUtil (ref), u7 (copy), UIUtil (ref)
            if u5.GamepadShouldAutoSelect and DeviceUtil.isGamepadControls() then
                UIUtil:selectGui((u7:getValue()));
            end;
        end, {});

        return u3.createElement("TextButton", {
            Size = UDim2.new(0.8, 0, 0, 30),
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = u9 and 0.7 or 1,
            Font = "Roboto",
            Text = "<b>" .. u5.Name .. "</b>",
            TextColor3 = ColorUtil.WHITE,
            TextScaled = true,
            RichText = true,
            TextTransparency = u9 and 0 or 0.3,
            TextXAlignment = "Center",
            TextYAlignment = "Center",

            [u3.Event.Activated] = function() -- Line: 37
                -- upvalues: u5 (copy), SoundManager (ref), GameSound (ref)
                u5.SetTab(u5.Tab);
                SoundManager:playSound(GameSound.UI_CLICK);
            end,

            [u3.Event.MouseEnter] = function(p10) -- Line: 41
                -- upvalues: u9 (copy), u8 (copy), TweenService (ref)
                if u9 then
                    return nil;
                end;

                u8:DoCleaning();
                local u11 = TweenService:Create(p10, TweenInfo.new(0.12), {
                    BackgroundTransparency = 0.8
                });
                u11:Play();
                u8:GiveTask(function() -- Line: 50
                    -- upvalues: u11 (copy)
                    u11:Cancel();
                end);
            end,

            [u3.Event.MouseLeave] = function(p12) -- Line: 54
                -- upvalues: u9 (copy), u8 (copy), TweenService (ref)
                if u9 then
                    return nil;
                end;

                u8:DoCleaning();
                local u13 = TweenService:Create(p12, TweenInfo.new(0.12), {
                    BackgroundTransparency = u9 and 0.7 or 1
                });
                u13:Play();
                u8:GiveTask(function() -- Line: 63
                    -- upvalues: u13 (copy)
                    u13:Cancel();
                end);
            end,

            LayoutOrder = u5.LayoutOrder,
            [u3.Ref] = u7
        }, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0.15, 0),
                PaddingBottom = UDim.new(0.15, 0),
                PaddingLeft = UDim.new(0.15, 0),
                PaddingRight = UDim.new(0.15, 0)
            }), u3.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });
    end)
};