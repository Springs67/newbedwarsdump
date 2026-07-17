-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local GetTarmacAsset = v1.GetTarmacAsset;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "bw-player-render");
local BWPlayerRender = v5.BWPlayerRender;
local PlayerRenderFallbackMode = v5.PlayerRenderFallbackMode;
local RankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local PlayerVoteStroke = RuntimeLib.import(script, script.Parent, "player-vote-stroke").PlayerVoteStroke;

return {
    MatchDraftTeamPlayerIcon = v4.new(u3)(function(u6, p7) -- Line: 17
        -- upvalues: u2 (copy), Players (copy), KnitClient (copy), RankMeta (copy), GetTarmacAsset (copy), u3 (copy), BWPlayerRender (copy), PlayerRenderFallbackMode (copy), ColorUtil (copy), PlayerVoteStroke (copy), Empty (copy)
        local useEffect = p7.useEffect;
        local v8, u9 = p7.useState(nil);
        useEffect(function() -- Line: 21
            -- upvalues: u2 (ref), Players (ref), u6 (copy), KnitClient (ref), RankMeta (ref), GetTarmacAsset (ref), u9 (copy)
            local u10 = u2.new();
            u10:GiveTask(task.spawn(function() -- Line: 23
                -- upvalues: Players (ref), u6 (ref), KnitClient (ref), RankMeta (ref), GetTarmacAsset (ref), u9 (ref)
                if not Players:GetPlayerByUserId(u6.Player.userId) then
                    return nil;
                end;

                KnitClient.Controllers.RankController:getRanks({ u6.Player.userId }):andThen(function(p11) -- Line: 29
                    -- upvalues: u6 (ref), RankMeta (ref), GetTarmacAsset (ref), u9 (ref)
                    local function _(p12) -- Line: 31
                        -- upvalues: u6 (ref)
                        return p12.userId == u6.Player.userId;
                    end;

                    local v13 = nil;

                    for i, v in p11 do
                        local _ = i - 1;

                        if v.userId == u6.Player.userId == true then
                            v13 = v;
                            break;
                        end;
                    end;

                    if not v13 then
                        return nil;
                    end;

                    local v14;

                    if v13.rankDivision == nil then
                        v14 = GetTarmacAsset("NoImage").Image;
                    else
                        v14 = RankMeta[v13.rankDivision].image;
                    end;

                    u9(v14);
                end);
            end));

            return function() -- Line: 52
                -- upvalues: u10 (copy)
                u10:DoCleaning();
            end;
        end, { u6.Player.userId });
        local v15 = {
            Size = UDim2.fromScale(1, 1 / u6.TeamSize - 0.02)
        };
        local v16 = {};
        local v17 = u3.createElement("UIListLayout", {
            HorizontalFlex = "SpaceBetween",
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        local createElement = u3.createElement;
        local v18 = {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            ZIndex = 3,
            LayoutOrder = 1,
            FallbackMode = PlayerRenderFallbackMode.NONE,
            Size = UDim2.fromScale(1, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            PlayerUserId = u6.Player.userId,
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v19 = {};
        local v20 = u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        });
        local v21 = u3.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        });
        local createElement2 = u3.createElement;
        local v22 = {
            Blink = not u6.DidPlayerVote
        };
        local v23;

        if u6.DidPlayerVote then
            v23 = Color3.fromRGB(42, 113, 52);
        else
            v23 = ColorUtil.darken(ColorUtil.WHITE, 0.8);
        end;

        v22.Color = v23;
        v19[1], v19[2], v19[3] = v20, v21, createElement2(PlayerVoteStroke, v22);
        v16[1], v16[2] = v17, createElement(BWPlayerRender, v18, v19);
        local v24 = #v16;
        local v25;

        if v8 == nil then
            v25 = false;
        else
            v25 = u3.createElement("ImageLabel", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                ZIndex = 3,
                LayoutOrder = 2,
                Size = UDim2.fromScale(1.3, 1.3),
                Image = v8,
                ScaleType = Enum.ScaleType.Fit,
                SizeConstraint = Enum.SizeConstraint.RelativeYY
            }, { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
        end;

        if v25 then
            v16[v24 + 1] = v25;
        end;

        return u3.createElement(Empty, v15, v16);
    end)
};