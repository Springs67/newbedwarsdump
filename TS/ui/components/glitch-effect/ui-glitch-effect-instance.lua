-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    UIGlitchEffectInstance = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: u2 (copy), DeviceUtil (copy), TweenService (copy), Empty (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        useEffect(function() -- Line: 13
            -- upvalues: u6 (copy), u4 (copy), DeviceUtil (ref), TweenService (ref)
            local u7 = u6:getValue();

            if not u7 then
                return nil;
            end;

            local Position = u7.Position;
            local u8 = true;
            local u9 = Random.new();
            local AnimationConfig = u4.AnimationConfig;

            if AnimationConfig ~= nil then
                AnimationConfig = AnimationConfig.DisableRandomMovement;
            end;

            if not AnimationConfig then
                local u10 = DeviceUtil.isSmallScreen() and { -4, 4 } or { -9, 9 };
                task.spawn(function() -- Line: 27
                    -- upvalues: Position (copy), u9 (copy), u10 (copy), u7 (copy), u8 (ref)
                    while true do
                        local v11 = Position;

                        if v11 ~= nil then
                            v11 = v11 + UDim2.fromOffset(u9:NextNumber(u10[1], u10[2]), u9:NextNumber(u10[1], u10[2]));
                        end;

                        if v11 == nil then
                            v11 = u7.Position;
                        end;

                        u7.Position = v11;
                        local v12 = u8 and task.wait(u9:NextNumber(1, 2));

                        if v12 == 0 or (v12 ~= v12 or not v12) then
                            return;
                        end;
                    end;
                end);
            end;

            local AnimationConfig2 = u4.AnimationConfig;

            if AnimationConfig2 ~= nil then
                AnimationConfig2 = AnimationConfig2.DisableRandomTransparency;
            end;

            if not AnimationConfig2 then
                local u13 = u4.Element.props.BackgroundTransparency == 1;
                task.spawn(function() -- Line: 51
                    -- upvalues: u9 (copy), u7 (copy), u13 (copy), u8 (ref)
                    while true do
                        local u14 = u9:NextNumber();

                        local function _(p15) -- Line: 56
                            -- upvalues: u14 (copy), u13 (ref)
                            if not p15:IsA("GuiObject") then
                                return nil;
                            end;

                            if p15:IsA("TextLabel") then
                                p15.TextTransparency = u14;
                            end;

                            if p15:IsA("ImageLabel") then
                                p15.ImageTransparency = u14;
                            end;

                            if not u13 then
                                p15.BackgroundTransparency = u14;
                            end;
                        end;

                        for i, child in u7:GetChildren() do
                            local _ = i - 1;

                            if child:IsA("GuiObject") then
                                if child:IsA("TextLabel") then
                                    child.TextTransparency = u14;
                                end;

                                if child:IsA("ImageLabel") then
                                    child.ImageTransparency = u14;
                                end;

                                if not u13 then
                                    child.BackgroundTransparency = u14;
                                end;
                            end;
                        end;

                        local v16 = u8 and task.wait(u9:NextNumber(0.2, 1));

                        if v16 == 0 or (v16 ~= v16 or not v16) then
                            return;
                        end;
                    end;
                end);
            end;

            local AnimationConfig3 = u4.AnimationConfig;

            if AnimationConfig3 ~= nil then
                AnimationConfig3 = AnimationConfig3.DisableRandomSpaz;
            end;

            if not AnimationConfig3 then
                task.spawn(function() -- Line: 83
                    -- upvalues: DeviceUtil (ref), TweenService (ref), Position (copy), u9 (copy), u7 (copy), u8 (ref)
                    local v17 = DeviceUtil.isSmallScreen() and { -4, 4 } or { -9, 9 };

                    while true do
                        local v18 = TweenInfo.new(0.05, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 6, true);
                        local v19 = {};
                        local v20 = Position;

                        if v20 ~= nil then
                            v20 = v20 + UDim2.fromOffset(u9:NextNumber(v17[1], v17[2]), u9:NextNumber(v17[1], v17[2]));
                        end;

                        if v20 == nil then
                            v20 = u7.Position;
                        end;

                        v19.Position = v20;
                        TweenService:Create(u7, v18, v19):Play();
                        local v21 = u8 and task.wait(u9:NextNumber(1, 2));

                        if v21 == 0 or (v21 ~= v21 or not v21) then
                            return;
                        end;
                    end;
                end);
            end;

            local function _() -- Line: 107
                -- upvalues: u8 (ref)
                u8 = false;
            end;
        end, {});

        return u2.createElement(Empty, {
            Size = UDim2.fromScale(1, 1),
            [u2.Ref] = u6
        }, { u4.Element });
    end)
};