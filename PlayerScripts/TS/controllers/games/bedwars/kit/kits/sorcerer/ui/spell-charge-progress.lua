-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local SorcererBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sorcerer-balance").SorcererBalance;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    SpellChargeComponent = v2.new(u1)(function(u4, p5) -- Line: 12
        -- upvalues: Workspace (copy), SorcererBalance (copy), ClientSyncEvents (copy), RunService (copy), u1 (copy), ProgressBar (copy), Theme (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(0);
        useEffect(function() -- Line: 16
            -- upvalues: Workspace (ref), SorcererBalance (ref), ClientSyncEvents (ref), u4 (copy), RunService (ref), u7 (copy)
            local u8 = Workspace:GetServerTimeNow();
            local v9 = SorcererBalance.getSorcererTierData(SorcererBalance.HIGHEST_TIER);
            local u10 = u8 + ClientSyncEvents.CastTimeModifierCheck:fire(v9.secCharge).castTime - u8;
            local castTime = ClientSyncEvents.CastTimeModifierCheck:fire(SorcererBalance.getSorcererTierData(u4.maxTier).secCharge).castTime;
            local u11 = castTime / ClientSyncEvents.CastTimeModifierCheck:fire(v9.secCharge).castTime;
            local u12 = nil;
            u12 = RunService.Heartbeat:Connect(function(p13) -- Line: 24
                -- upvalues: Workspace (ref), u8 (copy), castTime (copy), u7 (ref), u11 (copy), u12 (ref), u10 (copy)
                local v14 = Workspace:GetServerTimeNow() - u8;

                if castTime <= v14 then
                    u7(u11);
                    u12:Disconnect();
                end;

                u7((math.clamp(v14 / u10, 0, 1)));
            end);

            return function() -- Line: 33
                -- upvalues: u12 (ref)
                u12:Disconnect();
            end;
        end, {});

        return u1.createElement(ProgressBar, {
            GradientRotation = 0,
            AcceptZero = true,
            Pills = 3,
            DividerTransparency = 0.5,
            Size = Theme.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            Progress = v6,
            BarGradient = ColorSequence.new(Color3.fromRGB(250, 171, 255), Color3.fromRGB(235, 23, 255))
        });
    end)
};