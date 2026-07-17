-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local Healthbar = RuntimeLib.import(script, script.Parent, "healthbar").Healthbar;
local getShieldColor = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-util").getShieldColor;

return {
    HEALTHBAR_SHIELD_COLOR = Color3.fromRGB(240, 240, 240),
    Shield = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: EntityUtil (copy), u1 (copy), WatchCharacter (copy), Players (copy), getShieldColor (copy), u2 (copy), Healthbar (copy)
        local _ = p5.useMemo;
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(0);
        useEffect(function() -- Line: 17
            -- upvalues: EntityUtil (ref), u7 (copy), u4 (copy), u1 (ref), WatchCharacter (ref), Players (ref)
            local v8 = EntityUtil:getLocalPlayerEntity();

            if v8 ~= nil then
                v8 = v8:getShield(u4.ShieldType);
            end;

            u7(v8 == nil and 0 or v8);
            local u9 = true;
            local u10 = u1.new();
            u10:GiveTask(WatchCharacter(function(p11, p12) -- Line: 31
                -- upvalues: Players (ref), EntityUtil (ref), u9 (ref), u10 (copy), u4 (ref), u7 (ref)
                if p11 == Players.LocalPlayer then
                    local u13 = EntityUtil:getLocalPlayerEntity();

                    if u13 and u9 then
                        u10:GiveTask(u13:onShieldChanged(u4.ShieldType):Connect(function() -- Line: 35
                            -- upvalues: u7 (ref), u13 (copy), u4 (ref)
                            local v14 = u13;

                            if v14 ~= nil then
                                v14 = v14:getShield(u4.ShieldType);
                            end;

                            u7(v14 == nil and 0 or v14);
                        end));
                    end;
                end;
            end));

            return function() -- Line: 50
                -- upvalues: u9 (ref), u10 (copy)
                u9 = false;
                u10:DoCleaning();
            end;
        end, { u4.ShieldType });
        local v15 = EntityUtil:getLocalPlayerEntity();
        local v16 = getShieldColor(u4.ShieldType);
        local v17 = math.max(v6, 0);
        local v18 = {};
        local v19 = UDim2;
        local v20 = math;

        if v15 ~= nil then
            v15 = v15:getMaxHealth();
        end;

        v18.Size = v19.fromScale(v20.min(1, v17 / ((v15 == nil and 100 or v15) + v17)), 1);
        v18.FillRatio = 1;
        v18.FillColor = v16;
        v18.BackgroundColor = ColorSequence.new(Color3.fromRGB(0, 0, 0));
        v18.BarTweenSpeed = 0.01;

        return u2.createElement(Healthbar, v18);
    end)
};