-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v4.RunService;
local TweenService = v4.TweenService;

return {
    VignetteApp = v3.new(u2)(function(u5, p6) -- Line: 9
        -- upvalues: u2 (copy), u1 (copy), TweenService (copy), RunService (copy)
        local useEffect = p6.useEffect;
        local u7 = u2.createRef();
        useEffect(function() -- Line: 12
            -- upvalues: u7 (copy), u1 (ref), u5 (copy), TweenService (ref), RunService (ref)
            local u8 = u7:getValue();

            if not u8 then
                return nil;
            end;

            local u9 = u1.new();
            local u10 = u1.new();
            local u11 = false;
            local fadeInDuration = u5.fadeInDuration;
            u9:GiveTask(task.delay(fadeInDuration == nil and 0 or fadeInDuration, function() -- Line: 26
                -- upvalues: u11 (ref), u5 (ref), TweenService (ref), u8 (copy), u9 (copy), u10 (copy), RunService (ref)
                if u11 then
                    return nil;
                end;

                local fadeInDuration2 = u5.fadeInDuration;

                if fadeInDuration2 ~= 0 and (fadeInDuration2 == fadeInDuration2 and fadeInDuration2) then
                    fadeInDuration2 = u5.fadeInDuration > 0;
                end;

                if fadeInDuration2 ~= 0 and (fadeInDuration2 == fadeInDuration2 and fadeInDuration2) then
                    local transparencyFunction = u5.transparencyFunction;

                    if transparencyFunction ~= nil then
                        transparencyFunction = transparencyFunction.peakValue;
                    end;

                    if transparencyFunction == nil then
                        transparencyFunction = u5.transparency;
                    end;

                    if transparencyFunction ~= 0 and (transparencyFunction == transparencyFunction and transparencyFunction) then
                        transparencyFunction = transparencyFunction > 0;
                    end;

                    if transparencyFunction ~= 0 and (transparencyFunction == transparencyFunction and transparencyFunction) then
                        local fadeInDuration3 = u5.fadeInDuration;
                        local v12 = TweenInfo.new(fadeInDuration3 == nil and 0 or fadeInDuration3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut);
                        local v13 = {};
                        local transparencyFunction2 = u5.transparencyFunction;

                        if transparencyFunction2 ~= nil then
                            transparencyFunction2 = transparencyFunction2.peakValue;
                        end;

                        if transparencyFunction2 == nil then
                            transparencyFunction2 = u5.transparency;
                        end;

                        v13.ImageTransparency = transparencyFunction2;
                        local v14 = TweenService:Create(u8, v12, v13);
                        u9:GiveTask(v14);
                        v14:Play();
                        v14.Completed:Wait();
                    end;
                end;

                local transparency = u5.transparency;

                if transparency == 0 or (transparency ~= transparency or not transparency) then
                    if u5.transparencyFunction then
                        local u15 = 0;
                        u10:GiveTask(RunService.RenderStepped:Connect(function(p16) -- Line: 77
                            -- upvalues: u8 (ref), u5 (ref), u15 (ref)
                            u8.ImageTransparency = u5.transparencyFunction["function"](u15);
                            u15 = u15 + p16;
                        end));
                        u9:GiveTask(u10);
                    end;

                    return;
                end;

                u8.ImageTransparency = u5.transparency;
            end));
            u9:GiveTask(u5.signalDestroy:Connect(function() -- Line: 84
                -- upvalues: u9 (copy), u5 (ref), u11 (ref), u10 (copy), TweenService (ref), u8 (copy)
                u9:GiveTask(task.spawn(function() -- Line: 85
                    -- upvalues: u5 (ref), u11 (ref), u10 (ref), TweenService (ref), u8 (ref), u9 (ref)
                    local fadeOutDuration = u5.fadeOutDuration;

                    if fadeOutDuration ~= 0 and (fadeOutDuration == fadeOutDuration and fadeOutDuration) then
                        fadeOutDuration = u5.fadeOutDuration > 0;
                    end;

                    if fadeOutDuration == 0 or (fadeOutDuration ~= fadeOutDuration or not fadeOutDuration) then
                        u9:Destroy();

                        return;
                    end;

                    u11 = true;
                    u10:Destroy();
                    local v17 = TweenService:Create(u8, TweenInfo.new(u5.fadeOutDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        ImageTransparency = 1
                    });
                    v17:Play();
                    v17.Completed:Wait();
                    task.delay(u5.fadeOutDuration, function() -- Line: 98
                        -- upvalues: u9 (ref)
                        u9:Destroy();
                    end);
                end));
            end));

            return function() -- Line: 106
                -- upvalues: u9 (copy)
                u9:Destroy();
            end;
        end, {});
        local v18 = {};
        local _ = #v18;
        local v19 = {
            [u2.Ref] = u7,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local image = u5.image;
        v19.Image = image == nil and "rbxassetid://139778046372610" or image;
        v19.ImageColor3 = u5.color or Color3.fromRGB(255, 255, 255);
        v19.BackgroundTransparency = 1;
        v19.ImageTransparency = 1;
        v18.VignetteApp = u2.createElement("ImageLabel", v19);

        return u2.createElement("ScreenGui", {
            IgnoreGuiInset = true
        }, v18);
    end)
};