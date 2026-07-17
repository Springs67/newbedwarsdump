-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local GetTarmacAsset = v1.GetTarmacAsset;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local OutCubic = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutCubic;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "bw-player-render");
local BWPlayerRender = v5.BWPlayerRender;
local PlayerRenderFallbackMode = v5.PlayerRenderFallbackMode;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local RankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;

return {
    MatchDraftPlayerCard = v4.new(u3)(function(u6, p7) -- Line: 20
        -- upvalues: u3 (copy), DeviceUtil (copy), Players (copy), GamePlayerUtil (copy), default (copy), OutCubic (copy), u2 (copy), KnitClient (copy), RankMeta (copy), GetTarmacAsset (copy), ColorUtil (copy), BWPlayerRender (copy), PlayerRenderFallbackMode (copy), BedwarsKitMeta (copy)
        local useEffect = p7.useEffect;
        local v8, u9 = p7.useState(nil);
        local u10 = u3.createRef();
        local v11 = DeviceUtil.isHoarceKat() and true or u6.CardData.Player.userId == Players.LocalPlayer.UserId;
        local v12 = Players:GetPlayerByUserId(u6.CardData.Player.userId);
        local v13;

        if DeviceUtil.isHoarceKat() then
            v13 = u6.CardData.Player.displayName;
        elseif v12 then
            v13 = GamePlayerUtil.getGamePlayer(v12):getDisplayName();
        else
            v13 = nil;
        end;

        useEffect(function() -- Line: 28
            -- upvalues: u10 (copy), default (ref), OutCubic (ref)
            local u14 = u10:getValue();

            if u14 then
                default(0.2, OutCubic, function(p15) -- Line: 31
                    -- upvalues: u14 (copy)
                    u14.Position = p15;
                end, UDim2.fromScale(1.05, 0.1), UDim2.fromScale(1.05, 0.5));
            end;
        end, { u6.CardData.Kit });
        useEffect(function() -- Line: 36
            -- upvalues: u2 (ref), Players (ref), u6 (copy), KnitClient (ref), RankMeta (ref), GetTarmacAsset (ref), u9 (copy)
            local u16 = u2.new();
            u16:GiveTask(task.spawn(function() -- Line: 38
                -- upvalues: Players (ref), u6 (ref), KnitClient (ref), RankMeta (ref), GetTarmacAsset (ref), u9 (ref)
                if not Players:GetPlayerByUserId(u6.CardData.Player.userId) then
                    return nil;
                end;

                KnitClient.Controllers.RankController:getRanks({ u6.CardData.Player.userId }):andThen(function(p17) -- Line: 44
                    -- upvalues: u6 (ref), RankMeta (ref), GetTarmacAsset (ref), u9 (ref)
                    local function _(p18) -- Line: 46
                        -- upvalues: u6 (ref)
                        return p18.userId == u6.CardData.Player.userId;
                    end;

                    local v19 = nil;

                    for i, v in p17 do
                        local _ = i - 1;

                        if v.userId == u6.CardData.Player.userId == true then
                            v19 = v;
                            break;
                        end;
                    end;

                    if not v19 then
                        return nil;
                    end;

                    local v20;

                    if v19.rankDivision == nil then
                        v20 = GetTarmacAsset("NoImage").Image;
                    else
                        v20 = RankMeta[v19.rankDivision].image;
                    end;

                    u9(v20);
                end);
            end));

            return function() -- Line: 67
                -- upvalues: u16 (copy)
                u16:DoCleaning();
            end;
        end, { u6.CardData.Player.userId });
        local v21 = {
            ClipsDescendants = true,
            BorderSizePixel = 0,
            Size = u6.Size or UDim2.fromScale(1, 0.2),
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v22 = {};
        local createElement = u3.createElement;
        local v23 = {
            Rotation = 0
        };
        local new = ColorSequence.new;
        local v24;

        if u6.CardData.KitLockedIn then
            v24 = {};
            local v25 = ColorSequenceKeypoint.new(0, u6.CardData.TeamColor or Color3.fromRGB(62, 174, 255));
            local new2 = ColorSequenceKeypoint.new;
            local v26;

            if u6.CardData.TeamColor then
                v26 = ColorUtil.darken(u6.CardData.TeamColor, 0.6);
            else
                v26 = Color3.fromRGB(42, 113, 165);
            end;

            v24[1], v24[2] = v25, new2(1, v26);
        else
            v24 = {};
            local new2 = ColorSequenceKeypoint.new;
            local v27;

            if u6.CardData.TeamColor then
                v27 = ColorUtil.darken(u6.CardData.TeamColor, 0.3);
            else
                v27 = Color3.fromRGB(42, 113, 165);
            end;

            v24[1], v24[2] = new2(0, v27), ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15));
        end;

        v23.Color = new(v24);
        v22[1], v22[2] = createElement("UIGradient", v23), u3.createElement(BWPlayerRender, {
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    LayoutOrder = 1,
    FallbackMode = PlayerRenderFallbackMode.NONE,
    Size = UDim2.fromScale(1, 1),
    SizeConstraint = Enum.SizeConstraint.RelativeYY,
    PlayerUserId = u6.CardData.Player.userId
});
        local v28 = #v22;
        local v29;

        if u6.CardData.Kit == nil then
            v29 = false;
        else
            v29 = u3.createFragment({
                KitImage = u3.createElement("ImageLabel", {
                    Image = BedwarsKitMeta[u6.CardData.Kit].renderImage,
                    BorderSizePixel = 0,
                    ScaleType = Enum.ScaleType.Crop,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1.5, 1.5),
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.fromScale(1.05, 0.5),
                    ImageTransparency = u6.CardData.KitLockedIn and 0 or 0.4,
                    ZIndex = 1,
                    [u3.Ref] = u10
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) })
            });
        end;

        if v29 then
            v22[v28 + 1] = v29;
        end;

        local v30 = #v22;
        local v31;

        if v8 == nil then
            v31 = false;
        else
            v31 = u3.createElement("ImageLabel", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.8, 0.8),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = v8,
                ScaleType = Enum.ScaleType.Fit,
                SizeConstraint = Enum.SizeConstraint.RelativeYY
            }, { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
        end;

        if v31 then
            v22[v30 + 1] = v31;
        end;

        local _ = #v22;
        local v32 = {
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            ZIndex = 2,
            Size = UDim2.fromScale(1, 0.2),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v33 = {};
        local createElement2 = u3.createElement;
        local v34 = {
            TextScaled = true,
            AutoLocalize = false,
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ZIndex = 2,
            Size = UDim2.fromScale(0.48, 1),
            Position = UDim2.fromScale(0.02, 0),
            Text = v13
        };
        local v35;

        if v11 then
            v35 = Color3.fromRGB(255, 204, 92);
        else
            v35 = Color3.fromRGB(255, 255, 255);
        end;

        v34.TextColor3 = v35;
        v34.TextXAlignment = Enum.TextXAlignment.Left;
        v34.Font = Enum.Font.SourceSansBold;
        v33.PlayerName = createElement2("TextLabel", v34, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });
        local _ = #v33;
        local v36 = {
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(0.98, 0),
            Size = UDim2.fromScale(0.48, 1)
        };
        local ActionText = u6.CardData.ActionText;
        v36.Text = ActionText == nil and "" or ActionText;
        v36.TextColor3 = Color3.fromRGB(255, 255, 255);
        v36.TextXAlignment = Enum.TextXAlignment.Right;
        v36.TextScaled = true;
        v36.TextTransparency = u6.CardData.KitLockedIn and 0 or 0.25;
        v36.Font = Enum.Font.SourceSansBold;
        v36.AutoLocalize = false;
        v36.BorderSizePixel = 0;
        v36.BackgroundTransparency = 1;
        v36.ZIndex = 2;
        v33.KitOrActionName = u3.createElement("TextLabel", v36, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });
        v22.TextBackgroundBar = u3.createElement("Frame", v32, v33);

        return u3.createFragment({
            MatchDraftPlayerCard = u3.createElement("Frame", v21, v22)
        });
    end)
};