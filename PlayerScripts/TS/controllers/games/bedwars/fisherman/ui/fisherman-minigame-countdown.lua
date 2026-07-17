-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local FishermanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "fisherman", "fisherman-util").FishermanUtil;

return {
    FishermanMinigameCountdown = v2.new(u1)(function(u3, p4) -- Line: 7
        -- upvalues: FishermanUtil (copy), u1 (copy), ColorUtil (copy)
        local useEffect = p4.useEffect;
        local Duration = u3.Duration;

        if Duration == nil then
            Duration = FishermanUtil.minigameDuration;
        end;

        local u5, u6 = p4.useState(Duration);
        useEffect(function() -- Line: 15
            -- upvalues: u3 (copy), FishermanUtil (ref), u5 (copy), u6 (copy)
            local u7 = true;
            task.spawn(function() -- Line: 17
                -- upvalues: u3 (ref), FishermanUtil (ref), u7 (ref), u5 (ref), u6 (ref)
                local Duration2 = u3.Duration;

                if Duration2 == nil then
                    Duration2 = FishermanUtil.minigameDuration;
                end;

                while u7 and not u3.GameOver do
                    if Duration2 == 0 then
                        local Duration3 = u3.Duration;

                        if Duration3 == nil then
                            Duration3 = FishermanUtil.minigameDuration;
                        end;

                        u3.HandleRanOutOfTime(Duration3 - u5);
                        u7 = false;
                    end;

                    local v8;

                    if u7 and not u3.GameOver then
                        v8 = Duration2 - 1;
                        u6(Duration2);
                    else
                        v8 = Duration2;
                    end;

                    task.wait(1);
                    Duration2 = v8;
                end;
            end);

            return function() -- Line: 41
                -- upvalues: u7 (ref)
                u7 = false;
            end;
        end, { u3.GameOver });

        return u1.createFragment({
            CountdownTimer = u1.createElement("TextLabel", {
                AutomaticSize = "X",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextYAlignment = "Center",
                TextScaled = true,
                RichText = true,
                LayoutOrder = 1,
                AnchorPoint = Vector2.new(1, 0),
                Position = UDim2.fromScale(1, 0),
                Size = UDim2.fromScale(0, 1),
                BackgroundColor3 = ColorUtil.BLACK,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                Text = "⌛ " .. tostring(u5)
            }, { u1.createElement("UIStroke", {
                    Transparency = 0.2,
                    Thickness = 1,
                    Color = ColorUtil.BLACK
                }) })
        });
    end)
};