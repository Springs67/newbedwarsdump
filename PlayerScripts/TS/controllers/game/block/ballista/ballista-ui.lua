-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v4.ContextActionService;
local Players = v4.Players;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    BallistaUI = v3.new(u2)(function(u5, p6) -- Line: 14
        -- upvalues: DeviceUtil (copy), ContextActionService (copy), KnitClient (copy), Players (copy), u2 (copy), Button (copy), Theme (copy), RuntimeLib (copy), Empty (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local v7 = DeviceUtil.isMobileControls();
        useEffect(function() -- Line: 18
            -- upvalues: ContextActionService (ref), KnitClient (ref), Players (ref), u5 (copy)
            ContextActionService:BindAction("ballista-exit", function(p8, p9, p10) -- Line: 19
                -- upvalues: KnitClient (ref), Players (ref), u5 (ref)
                if p9 == Enum.UserInputState.End then
                    KnitClient.Controllers.BallistaController:exitBallista(Players.LocalPlayer, u5.Ballista);
                end;
            end, false, unpack(u5.inputTypes));
        end, {});
        local v11 = {
            Size = u5.Size or UDim2.fromScale(1, 0.075)
        };
        local v12 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0),
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }),
            ExitButton = u2.createElement(Button, {
                Text = "<b>EXIT(X)</b>",
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.125, 1),
                BackgroundColor3 = Theme.backgroundSuccess,
                OnClick = RuntimeLib.async(function() -- Line: 40
                    -- upvalues: KnitClient (ref), Players (ref), u5 (copy)
                    KnitClient.Controllers.BallistaController:exitBallista(Players.LocalPlayer, u5.Ballista);
                end)
            })
        };
        local v13 = #v12;

        if v7 then
            v7 = u2.createFragment({
                FireButton = u2.createElement(Button, {
                    Text = "<b>FIRE</b>",
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.125, 1),
                    BackgroundColor3 = Theme.backgroundSuccess,
                    OnClick = RuntimeLib.async(function() -- Line: 52
                        -- upvalues: KnitClient (ref)
                        KnitClient.Controllers.BallistaController:fire();
                    end)
                })
            });
        end;

        if v7 then
            v12[v13 + 1] = v7;
        end;

        return u2.createElement(Empty, v11, v12);
    end)
};