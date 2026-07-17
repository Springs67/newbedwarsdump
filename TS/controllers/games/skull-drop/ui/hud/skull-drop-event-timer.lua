-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    SkullDropEventTimer = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: DeviceUtil (copy), default (copy), u2 (copy), Countdown (copy), ColorUtil (copy), Theme (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(nil);
        useEffect(function() -- Line: 15
            -- upvalues: DeviceUtil (ref), default (ref), u7 (copy)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local u9 = default.Client:Get("SkullDropEventTimer"):Connect(function(p8) -- Line: 19
                -- upvalues: u7 (ref)
                u7(p8);
            end);

            return function() -- Line: 22
                -- upvalues: u9 (copy)
                u9:Disconnect();
            end;
        end, {});
        local v10 = {
            BackgroundTransparency = 0.15,
            LayoutOrder = 2,
            Size = p4.Size or UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(28, 28, 28)
        };
        local v11 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.35, 0)
            }) };
        local v12 = #v11;
        local v13;

        if v6 == nil then
            v13 = false;
        else
            v13 = u2.createElement(Countdown, {
                PostText = "s</font></b>",
                PreText = v6.name .. ": <b><font color=\"" .. ColorUtil.richTextColor(Theme.mcYellow) .. "\">",
                EndTime = v6.startTime,
                CountdownConfig = {
                    days = false,
                    hours = false,
                    minutes = false,
                    seconds = true
                },
                TextLabel = {
                    BackgroundTransparency = 1,
                    RichText = true,
                    TextScaled = true,
                    Size = UDim2.fromScale(0.9, 0.6),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = ColorUtil.WHITE
                }
            });
        end;

        if v13 then
            v11[v12 + 1] = v13;
        end;

        return u2.createFragment({
            SkullDropEventTimer = u2.createElement("Frame", v10, v11)
        });
    end)
};