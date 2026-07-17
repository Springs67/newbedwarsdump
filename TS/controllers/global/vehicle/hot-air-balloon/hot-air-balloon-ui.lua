-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local ProgressBar = v1.ProgressBar;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MoveMountUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "move-mount-ui").MoveMountUI;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;

return {
    HotAirBalloonUi = v4.new(u3)(function(u5, p6) -- Line: 14
        -- upvalues: u2 (copy), DeviceUtil (copy), KnitClient (copy), Flamework (copy), u3 (copy), MoveMountUI (copy), PlaceUtil (copy), ProgressBar (copy), Theme (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7, u8 = useState(u5.vehicleModel:GetAttribute("Health"));
        local v9, u10 = useState(u5.vehicleModel:GetAttribute("MaxHealth"));
        useEffect(function() -- Line: 19
            -- upvalues: u2 (ref), u5 (copy), u8 (copy), u10 (copy), DeviceUtil (ref), KnitClient (ref)
            local u11 = u2.new();
            u11:GiveTask(u5.vehicleModel:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 21
                -- upvalues: u8 (ref), u5 (ref)
                u8(u5.vehicleModel:GetAttribute("Health"));
            end));
            u11:GiveTask(u5.vehicleModel:GetAttributeChangedSignal("MaxHealth"):Connect(function() -- Line: 24
                -- upvalues: u10 (ref), u5 (ref)
                u10(u5.vehicleModel:GetAttribute("MaxHealth"));
            end));

            if DeviceUtil.isMobileControls() then
                KnitClient.Controllers.MobileUiController:toggleMountMovementControls(true);
                u11:GiveTask(function() -- Line: 29
                    -- upvalues: KnitClient (ref)
                    KnitClient.Controllers.MobileUiController:toggleMountMovementControls(false);
                end);
            end;

            return function() -- Line: 33
                -- upvalues: u11 (copy)
                u11:DoCleaning();
            end;
        end);
        local v12 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController").actionBarRef:getValue();
        local v13 = {};
        local v14 = #v13;
        local v15 = not DeviceUtil.isMobileControls() and u3.createElement(MoveMountUI);

        if v15 then
            v13[v14 + 1] = v15;
        end;

        local v16 = #v13;
        local v17;

        if PlaceUtil.isLobbyServer() or not v12 then
            v17 = nil;
        else
            v17 = u3.createElement(u3.Portal, {
                target = v12
            }, { u3.createElement(ProgressBar, {
                    AcceptZero = true,
                    LayoutOrder = 1,
                    Size = Theme.actionBarProgressBarSize,
                    Progress = v7 / v9,
                    BarGradient = ColorSequence.new(Color3.fromRGB(217, 51, 51), Color3.fromRGB(138, 38, 18))
                }) });
        end;

        if v17 then
            v13[v16 + 1] = v17;
        end;

        return u3.createFragment(v13);
    end)
};