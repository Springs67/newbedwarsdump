-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    SoulTarget = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), TweenService (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local u5 = u1.createRef();
        useEffect(function() -- Line: 11
            -- upvalues: u5 (copy), TweenService (ref)
            local v6 = u5:getValue();

            if not v6 then
                return nil;
            end;

            local u7 = TweenService:Create(v6, TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                Rotation = 360
            });
            u7:Play();

            return function() -- Line: 23
                -- upvalues: u7 (copy)
                u7:Destroy();
            end;
        end, {});

        return u1.createElement("BillboardGui", {
            AlwaysOnTop = true,
            Size = UDim2.new(9, 9, 9, 9)
        }, { u1.createElement("ImageLabel", {
                [u1.Ref] = u5,
                Image = "rbxassetid://138374575750845",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Visible = true,
                ScaleType = Enum.ScaleType.Fit
            }) });
    end)
};