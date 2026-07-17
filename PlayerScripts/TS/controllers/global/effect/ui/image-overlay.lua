-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    ImageOverlay = v2.new(u1)(function(u3, p4) -- Line: 6
        -- upvalues: u1 (copy), TweenService (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local u5 = u1.createRef();
        useEffect(function() -- Line: 10
            -- upvalues: u5 (copy), TweenService (ref), u3 (copy)
            local v6 = u5:getValue();

            if not v6 then
                return nil;
            end;

            local FadeInDuration = u3.FadeInDuration;
            local v7 = TweenInfo.new(FadeInDuration == nil and 1 or FadeInDuration, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut);
            local v8 = {};
            local FrameTransparency = u3.FrameTransparency;
            v8.ImageTransparency = FrameTransparency == nil and 0 or FrameTransparency;
            TweenService:Create(v6, v7, v8):Play();
            local FadeOutDelay = u3.FadeOutDelay;

            if FadeOutDelay ~= 0 and (FadeOutDelay == FadeOutDelay and FadeOutDelay) then
                local FadeOutDuration = u3.FadeOutDuration;
                local u9 = TweenService:Create(v6, TweenInfo.new(FadeOutDuration == nil and 1 or FadeOutDuration, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                    ImageTransparency = 1
                });
                task.delay(u3.FadeOutDelay, function() -- Line: 40
                    -- upvalues: u9 (copy)
                    u9:Play();
                end);
            end;

            return function() -- Line: 44
            end;
        end, {});
        local v10 = {};

        for i, v in u3 do
            v10[i] = v;
        end;

        v10.Image = nil;
        v10.FadeOutDelay = nil;
        v10.FadeInDuration = nil;
        v10.FadeOutDuration = nil;
        v10.FrameTransparency = nil;
        local v11 = {};
        local v12 = {
            [u1.Ref] = u5,
            Size = UDim2.fromScale(1, 1),
            Image = u3.Image,
            BackgroundTransparency = 1,
            ImageTransparency = 1,
            BorderSizePixel = 0
        };
        local v13 = {
            IgnoreGuiInset = true
        };

        for i, v in v10 do
            v12[i] = v;
        end;

        v11[#v11 + 1] = u1.createElement("ImageLabel", v12);

        return u1.createElement("ScreenGui", v13, v11);
    end)
};