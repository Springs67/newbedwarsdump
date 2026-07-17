-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local MatchDraftTeamCard = RuntimeLib.import(script, script.Parent, "match-draft-team-card").MatchDraftTeamCard;

return {
    MatchDraftTeamCardRow = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: u2 (copy), u1 (copy), TweenService (copy), MatchDraftTeamCard (copy), Empty (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();

        local function v11() -- Line: 13
            -- upvalues: u4 (copy), u6 (copy), u1 (ref), TweenService (ref)
            local HighlightConfig = u4.HighlightConfig;

            if HighlightConfig ~= nil then
                HighlightConfig = HighlightConfig.DisableAnimation;
            end;

            if HighlightConfig then
                return nil;
            end;

            local u7 = u6:getValue();

            if not u7 then
                return nil;
            end;

            local u8 = u1.new();
            local u9 = TweenService:Create(u7, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Transparency = 0
            });
            local u10 = TweenService:Create(u7, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Transparency = 0.75
            });
            u8:GiveTask(u9.Completed:Connect(function() -- Line: 32
                -- upvalues: u8 (copy), u10 (copy)
                u8:GiveTask(task.delay(0.5, function() -- Line: 33
                    -- upvalues: u10 (ref)
                    u10:Play();
                end));
            end));
            u8:GiveTask(function() -- Line: 37
                -- upvalues: u9 (copy)
                u9:Cancel();
                u9:Destroy();
            end);
            u8:GiveTask(u10.Completed:Connect(function() -- Line: 41
                -- upvalues: u8 (copy), u9 (copy)
                u8:GiveTask(task.delay(0.5, function() -- Line: 42
                    -- upvalues: u9 (ref)
                    u9:Play();
                end));
            end));
            u8:GiveTask(function() -- Line: 46
                -- upvalues: u10 (copy)
                u10:Cancel();
                u10:Destroy();
            end);
            u9:Play();

            return function() -- Line: 51
                -- upvalues: u8 (copy), u7 (copy)
                u8:Destroy();
                u7.Transparency = 0;
            end;
        end;

        local HighlightConfig = u4.HighlightConfig;

        if HighlightConfig ~= nil then
            HighlightConfig = HighlightConfig.DisableAnimation;
        end;

        local HighlightConfig2 = u4.HighlightConfig;

        if HighlightConfig2 ~= nil then
            HighlightConfig2 = HighlightConfig2.Color;
        end;

        local HighlightConfig3 = u4.HighlightConfig;

        if HighlightConfig3 ~= nil then
            HighlightConfig3 = HighlightConfig3.Hide;
        end;

        useEffect(v11, { HighlightConfig, HighlightConfig2, HighlightConfig3 });
        local v12 = {
            Size = u4.Size or UDim2.fromScale(1, 0.18),
            LayoutOrder = u4.LayoutOrder
        };
        local v13 = {};
        local HighlightConfig4 = u4.HighlightConfig;

        if HighlightConfig4 ~= nil then
            HighlightConfig4 = HighlightConfig4.Hide;
        end;

        local v14 = not HighlightConfig4;

        if v14 then
            local v15 = {
                Size = UDim2.fromScale(1.75, 1),
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.fromScale(0, 0)
            };
            local HighlightConfig5 = u4.HighlightConfig;

            if HighlightConfig5 ~= nil then
                HighlightConfig5 = HighlightConfig5.Color;
            end;

            if HighlightConfig5 == nil then
                HighlightConfig5 = Color3.fromRGB(255, 255, 255);
            end;

            v15.BackgroundColor3 = HighlightConfig5;
            v15[u2.Ref] = u6;
            v14 = u2.createElement("Frame", v15, { u2.createElement("UIGradient", {
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.5),
                        NumberSequenceKeypoint.new(0.5, 0.5),
                        NumberSequenceKeypoint.new(0.6, 1),
                        NumberSequenceKeypoint.new(1, 1)
                    })
                }) });
        end;

        local v16 = {
            Size = UDim2.fromScale(0.825, 1)
        };
        local v17 = {};
        local v18 = #v17;

        if v14 then
            v17[v18 + 1] = v14;
        end;

        local v19 = {
            Size = UDim2.fromScale(1, 1)
        };

        for i, v in u4.CardData do
            v19[i] = v;
        end;

        v17[#v17 + 1] = u2.createElement(MatchDraftTeamCard, v19);
        v13[#v13 + 1] = u2.createElement(Empty, v16, v17);

        return u2.createFragment({
            MatchDraftTeamCardRow = u2.createElement(Empty, v12, v13)
        });
    end)
};