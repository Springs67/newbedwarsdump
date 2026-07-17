-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local MatchDraftBanBox = RuntimeLib.import(script, script.Parent, "match-draft-ban-box").MatchDraftBanBox;
local MatchDraftPlayerCard = RuntimeLib.import(script, script.Parent, "match-draft-player-card").MatchDraftPlayerCard;

return {
    MatchDraftPlayerRow = v3.new(u2)(function(u4, p5) -- Line: 10
        -- upvalues: u2 (copy), u1 (copy), TweenService (copy), MatchDraftPlayerCard (copy), Empty (copy), MatchDraftBanBox (copy)
        local useEffect = p5.useEffect;
        local HighlightConfig = u4.HighlightConfig;

        if HighlightConfig ~= nil then
            HighlightConfig = HighlightConfig.Mode;
        end;

        local v6 = (HighlightConfig == nil and "LEFT" or HighlightConfig) == "LEFT";
        local v7 = v6 and 1 or 0;
        local u8 = u2.createRef();

        local function v13() -- Line: 23
            -- upvalues: u4 (copy), u8 (copy), u1 (ref), TweenService (ref)
            local HighlightConfig2 = u4.HighlightConfig;

            if HighlightConfig2 ~= nil then
                HighlightConfig2 = HighlightConfig2.DisableAnimation;
            end;

            if HighlightConfig2 then
                return nil;
            end;

            local u9 = u8:getValue();

            if not u9 then
                return nil;
            end;

            local u10 = u1.new();
            local u11 = TweenService:Create(u9, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Transparency = 0
            });
            local u12 = TweenService:Create(u9, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Transparency = 0.75
            });
            u10:GiveTask(u11.Completed:Connect(function() -- Line: 42
                -- upvalues: u10 (copy), u12 (copy)
                u10:GiveTask(task.delay(0.5, function() -- Line: 43
                    -- upvalues: u12 (ref)
                    u12:Play();
                end));
            end));
            u10:GiveTask(function() -- Line: 47
                -- upvalues: u11 (copy)
                u11:Cancel();
                u11:Destroy();
            end);
            u10:GiveTask(u12.Completed:Connect(function() -- Line: 51
                -- upvalues: u10 (copy), u11 (copy)
                u10:GiveTask(task.delay(0.5, function() -- Line: 52
                    -- upvalues: u11 (ref)
                    u11:Play();
                end));
            end));
            u10:GiveTask(function() -- Line: 56
                -- upvalues: u12 (copy)
                u12:Cancel();
                u12:Destroy();
            end);
            u11:Play();

            return function() -- Line: 61
                -- upvalues: u10 (copy), u9 (copy)
                u10:Destroy();
                u9.Transparency = 0;
            end;
        end;

        local HighlightConfig2 = u4.HighlightConfig;

        if HighlightConfig2 ~= nil then
            HighlightConfig2 = HighlightConfig2.DisableAnimation;
        end;

        local HighlightConfig3 = u4.HighlightConfig;

        if HighlightConfig3 ~= nil then
            HighlightConfig3 = HighlightConfig3.Color;
        end;

        local HighlightConfig4 = u4.HighlightConfig;

        if HighlightConfig4 ~= nil then
            HighlightConfig4 = HighlightConfig4.Hide;
        end;

        local HighlightConfig5 = u4.HighlightConfig;

        if HighlightConfig5 ~= nil then
            HighlightConfig5 = HighlightConfig5.Mode;
        end;

        useEffect(v13, {
            HighlightConfig2,
            HighlightConfig3,
            HighlightConfig4,
            HighlightConfig5
        });
        local v14 = {
            Size = u4.Size or UDim2.fromScale(1, 0.18),
            LayoutOrder = u4.LayoutOrder
        };
        local v15 = {};
        local v16 = #v15;
        local HighlightConfig6 = u4.HighlightConfig;

        if HighlightConfig6 ~= nil then
            HighlightConfig6 = HighlightConfig6.Hide;
        end;

        local v17 = not HighlightConfig6;

        if v17 then
            local v18 = {
                Size = UDim2.fromScale(2, 1),
                AnchorPoint = Vector2.new(v7, 0),
                Position = UDim2.fromScale(v7, 0)
            };
            local HighlightConfig7 = u4.HighlightConfig;

            if HighlightConfig7 ~= nil then
                HighlightConfig7 = HighlightConfig7.Color;
            end;

            if HighlightConfig7 == nil then
                HighlightConfig7 = Color3.fromRGB(255, 255, 255);
            end;

            v18.BackgroundColor3 = HighlightConfig7;
            v18[u2.Ref] = u8;
            v17 = u2.createElement("Frame", v18, { u2.createElement("UIGradient", {
                    Rotation = v6 and 180 or 0,
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.5),
                        NumberSequenceKeypoint.new(0.5, 0.5),
                        NumberSequenceKeypoint.new(0.6, 1),
                        NumberSequenceKeypoint.new(1, 1)
                    })
                }) });
        end;

        local v19 = {
            Size = UDim2.fromScale(0.825, 1)
        };
        local v20 = {};
        local v21 = #v20;

        if v17 then
            v20[v21 + 1] = v17;
        end;

        v20[#v20 + 1] = u2.createElement(MatchDraftPlayerCard, {
            Size = UDim2.fromScale(1, 1),
            CardData = u4.CardData
        });
        v15[v16 + 1] = u2.createElement(Empty, v19, v20);
        local v22 = not u4.HideBanBox and u2.createElement(MatchDraftBanBox, {
            Size = UDim2.fromScale(0.175, 0.85),
            Position = UDim2.fromScale(0.87, 0.45),
            AnchorPoint = Vector2.new(0, 0.5),
            BanData = u4.BanData
        });

        if v22 then
            v15[v16 + 2] = v22;
        end;

        return u2.createFragment({
            MatchDraftPlayerRow = u2.createElement(Empty, v14, v15)
        });
    end)
};