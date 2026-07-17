-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    GlitchedTextLabel = v2.new(u1)(function(u3, p4) -- Line: 7
        -- upvalues: u1 (copy), DeviceUtil (copy), TweenService (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local u5 = u1.createRef();
        useEffect(function() -- Line: 11
            -- upvalues: u5 (copy), u3 (copy), DeviceUtil (ref), TweenService (ref)
            local u6 = u5:getValue();

            if not u6 then
                return nil;
            end;

            local u7 = true;
            local u8 = Random.new();
            local AnimationConfig = u3.AnimationConfig;

            if AnimationConfig ~= nil then
                AnimationConfig = AnimationConfig.DisableRandomMovement;
            end;

            if not AnimationConfig then
                local u9 = DeviceUtil.isSmallScreen() and { -4, 4 } or { -9, 9 };
                task.spawn(function() -- Line: 24
                    -- upvalues: u3 (ref), u8 (copy), u9 (copy), u6 (copy), u7 (ref)
                    while true do
                        local Position = u3.TextLabelProps.Position;

                        if Position ~= nil then
                            Position = Position + UDim2.fromOffset(u8:NextNumber(u9[1], u9[2]), u8:NextNumber(u9[1], u9[2]));
                        end;

                        if Position == nil then
                            Position = u6.Position;
                        end;

                        u6.Position = Position;
                        local v10 = u7 and task.wait(u8:NextNumber(1, 2));

                        if v10 == 0 or (v10 ~= v10 or not v10) then
                            return;
                        end;
                    end;
                end);
            end;

            local AnimationConfig2 = u3.AnimationConfig;

            if AnimationConfig2 ~= nil then
                AnimationConfig2 = AnimationConfig2.DisableRandomTransparency;
            end;

            if not AnimationConfig2 then
                task.spawn(function() -- Line: 47
                    -- upvalues: u6 (copy), u8 (copy), u7 (ref)
                    while true do
                        u6.TextTransparency = u8:NextNumber();
                        local v11 = u7 and task.wait(u8:NextNumber(0.2, 1));

                        if v11 == 0 or (v11 ~= v11 or not v11) then
                            return;
                        end;
                    end;
                end);
            end;

            local AnimationConfig3 = u3.AnimationConfig;

            if AnimationConfig3 ~= nil then
                AnimationConfig3 = AnimationConfig3.DisableRandomSpaz;
            end;

            if not AnimationConfig3 then
                task.spawn(function() -- Line: 61
                    -- upvalues: DeviceUtil (ref), TweenService (ref), u3 (ref), u8 (copy), u6 (copy), u7 (ref)
                    local v12 = DeviceUtil.isSmallScreen() and { -4, 4 } or { -9, 9 };

                    while true do
                        local v13 = TweenInfo.new(0.05, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 6, true);
                        local v14 = {};
                        local Position = u3.TextLabelProps.Position;

                        if Position ~= nil then
                            Position = Position + UDim2.fromOffset(u8:NextNumber(v12[1], v12[2]), u8:NextNumber(v12[1], v12[2]));
                        end;

                        if Position == nil then
                            Position = u6.Position;
                        end;

                        v14.Position = Position;
                        TweenService:Create(u6, v13, v14):Play();
                        local v15 = u7 and task.wait(u8:NextNumber(1, 2));

                        if v15 == 0 or (v15 ~= v15 or not v15) then
                            return;
                        end;
                    end;
                end);
            end;

            local function _() -- Line: 85
                -- upvalues: u7 (ref)
                u7 = false;
            end;
        end, {});
        local v16 = {};

        for i, v in u3.TextLabelProps do
            v16[i] = v;
        end;

        v16[u1.Ref] = u5;
        v16.BackgroundTransparency = 1;

        return u1.createElement("TextLabel", v16);
    end)
};