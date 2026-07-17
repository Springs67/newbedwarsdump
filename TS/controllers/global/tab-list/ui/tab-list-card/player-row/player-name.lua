-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local PlayerLevelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local tabListLayout = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = 0;

local function v53(u5, p6) -- Line: 22
    -- upvalues: Players (copy), DeviceUtil (copy), KnitClient (copy), PlayerLevelUtil (copy), u4 (ref), GamePlayerUtil (copy), ClientStore (copy), getQueueMeta (copy), ColorUtil (copy), tabListLayout (copy), BedwarsKitMeta (copy), u2 (copy), Empty (copy), TooltipContainer (copy), AutoSizedText (copy), Theme (copy), BedwarsImageId (copy)
    local useEffect = p6.useEffect;
    local _, u7 = p6.useState(nil);
    local u8 = Players:GetPlayerByUserId(u5.Player.userId);
    local u11 = (function() -- Line: 28
        -- upvalues: DeviceUtil (ref), u8 (copy), KnitClient (ref)
        if DeviceUtil.isHoarceKat() or not u8 then
            return nil;
        end;

        local v9 = KnitClient.Controllers.PermissionController:hasAnyPermissions({ "anticheat_mod", "admin", "artist" });
        local v10 = KnitClient.Controllers.MatchController:getPlayerParty(u8);

        if not v9 then
            return nil;
        end;

        if v10 and #v10.members > 1 then
            return v10.displayId;
        end;

        return nil;
    end)();
    local u12 = DeviceUtil.isHoarceKat() and "CLAN" or "";
    local u13 = not DeviceUtil.isHoarceKat() and 0 or PlayerLevelUtil.PlayerLevelRank[u4 % #PlayerLevelUtil.PlayerLevelRank + 1].levelCutoff;

    if DeviceUtil.isHoarceKat() then
        u4 = u4 + 1;
    end;

    if u8 then
        u13 = GamePlayerUtil.getGamePlayer(u8):getLevel();
        local v14 = GamePlayerUtil.getGamePlayer(u8):getClanTag();
        u12 = v14 == nil and "" or v14;
    end;

    local u15 = u13 < 0 and "[?]" or "[" .. tostring(u13) .. "]";
    local queueType = ClientStore:getState().Game.queueType;
    local v16;

    if queueType then
        v16 = getQueueMeta(queueType).noKits == true;
    else
        v16 = false;
    end;

    local WHITE = ColorUtil.WHITE;
    useEffect(function() -- Line: 67
        -- upvalues: u5 (copy), u7 (copy)
        local ContentTransparency = u5.ContentTransparency;

        if ContentTransparency ~= 0 and (ContentTransparency == ContentTransparency and ContentTransparency) then
            u7(u5.ContentTransparency);
        end;
    end, { u5.ContentTransparency });
    local Kits = u5.Kits;
    local v17 = Kits ~= nil and #Kits or Kits;
    local u18 = tabListLayout.columns.left.avatar.width * (v17 == nil and 1 or v17);

    local function v30() -- Line: 83
        -- upvalues: u5 (copy), BedwarsKitMeta (ref), u2 (ref), Empty (ref), TooltipContainer (ref), AutoSizedText (ref), Theme (ref), BedwarsImageId (ref), u18 (copy), tabListLayout (ref)
        local v19;

        if u5.Kits then
            local Kits2 = u5.Kits;

            local function v23(p20, p21) -- Line: 87
                -- upvalues: BedwarsKitMeta (ref), u2 (ref), Empty (ref), u5 (ref), TooltipContainer (ref), AutoSizedText (ref), Theme (ref)
                local v22 = BedwarsKitMeta[p20];

                return u2.createElement(Empty, {
                    ClipsDescendants = true,
                    Size = UDim2.fromScale(1, 1)
                }, {
                    u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }),
                    PlayerKitImage = u2.createElement("ImageLabel", {
                        BorderSizePixel = 0,
                        ScaleType = "Crop",
                        BackgroundTransparency = 1,
                        Image = v22.renderImage,
                        Size = UDim2.fromScale(1.25, 1.25),
                        Position = UDim2.fromScale(0.5, 0),
                        AnchorPoint = Vector2.new(0.5, 0),
                        ImageTransparency = u5.ContentTransparency,
                        LayoutOrder = p21
                    }),
                    u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                            TextSize = 22,
                            Text = v22.name,
                            Font = Enum.Font.SourceSansBold,
                            TextColor3 = Theme.mcAqua,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Limits = Vector2.new(300, 60)
                        }), u2.createElement(AutoSizedText, {
                            Text = "Kit",
                            TextSize = 18,
                            Font = Enum.Font.SourceSans,
                            TextColor3 = Theme.mcAqua,
                            Limits = Vector2.new(300, 60)
                        }), u2.createElement(AutoSizedText, {
                            TextSize = 18,
                            RichText = true,
                            Text = v22.description,
                            Font = Enum.Font.SourceSans,
                            TextColor3 = Color3.fromRGB(191, 191, 191),
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Limits = Vector2.new(300, 500)
                        }) })
                });
            end;

            local v24 = table.create(#Kits2);

            for i, v in Kits2 do
                v24[i] = v23(v, i - 1, Kits2);
            end;

            local v25 = {};
            local v26 = #v25;

            for i, v in v24 do
                v25[v26 + i] = v;
            end;

            v19 = u2.createFragment(v25);
        else
            local v27 = {
                Image = BedwarsImageId.X
            };
            local ContentTransparency = u5.ContentTransparency;
            v27.ImageTransparency = ContentTransparency == nil and 0.3 or ContentTransparency;
            v27.BorderSizePixel = 0;
            v27.ScaleType = "Crop";
            v27.BackgroundTransparency = 1;
            v27.Size = UDim2.fromScale(0.8, 0.8);
            v27.AnchorPoint = Vector2.new(0.5, 0.5);
            v27.Position = UDim2.fromScale(0.5, 0.5);
            v19 = u2.createFragment({
                NoKitImage = u2.createElement("ImageLabel", v27, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                            Text = "No Kit Equipped",
                            TextSize = 22,
                            Font = Enum.Font.SourceSansBold,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Limits = Vector2.new(300, 60)
                        }), u2.createElement(AutoSizedText, {
                            Text = "Kit",
                            TextSize = 18,
                            Font = Enum.Font.SourceSans,
                            TextColor3 = Color3.fromRGB(191, 191, 191),
                            Limits = Vector2.new(300, 60)
                        }) }) })
            });
        end;

        local v28 = {
            BorderSizePixel = 0,
            ClipsDescendants = true,
            LayoutOrder = 1,
            Size = UDim2.new(0, u18, 1, 0),
            BackgroundTransparency = tabListLayout.bgTransparency.playerRow,
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v29 = {
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            [#v29 + 1] = v19
        };

        return u2.createFragment({
            PlayerKitFrame = u2.createElement("Frame", v28, v29)
        });
    end;

    local function v48() -- Line: 206
        -- upvalues: u18 (copy), tabListLayout (ref), Theme (ref), u2 (ref), Empty (ref), u11 (copy), ColorUtil (ref), PlayerLevelUtil (ref), u13 (ref), u5 (copy), u15 (copy), WHITE (copy), u12 (ref), u8 (copy), GamePlayerUtil (ref), BedwarsImageId (ref)
        local v31 = {
            BorderSizePixel = 0,
            LayoutOrder = 2,
            Size = UDim2.new(1, -u18, 1, 0),
            BackgroundTransparency = tabListLayout.bgTransparency.playerRow,
            BackgroundColor3 = Theme.backgroundSecondary
        };
        local v32 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }), u2.createElement(Empty, {
                Size = UDim2.new(tabListLayout.columns.left.players.leftPadding, 0, 1, 0)
            }) };
        local v33 = {
            Size = UDim2.new(tabListLayout.columns.left.totalWidth, 0, 1, 0)
        };
        local v34 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8)
            }) };
        local v35 = {
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v36 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4)
            }) };
        local v37 = #v36;
        local v38;

        if u11 == nil then
            v38 = false;
        else
            v38 = u2.createFragment({
                PartyIdContainer = u2.createElement("Frame", {
                    Size = UDim2.new(0.06, 0, 0.9, 0),
                    BackgroundColor3 = ColorUtil.WHITE
                }, {
                    u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }),
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }),
                    PartyId = u2.createElement("TextLabel", {
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.8, 0.8),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Text = u11,
                        TextColor3 = ColorUtil.BLACK,
                        Font = Enum.Font.GothamBold
                    })
                })
            });
        end;

        if v38 then
            v36[v37 + 1] = v38;
        end;

        local v39 = #v36;
        local v40 = PlayerLevelUtil.getLevelMeta(u13);

        if v40 ~= nil then
            v40 = v40.gradient;
        end;

        if v40 then
            v40 = u2.createElement("UIGradient", {
                Color = PlayerLevelUtil.getLevelMeta(u13).gradient
            });
        end;

        local v41 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutoLocalize = false,
            RichText = true,
            TextScaled = true,
            AutomaticSize = "X",
            Font = "ArialBold",
            LayoutOrder = 2,
            Size = UDim2.new(0, 0, 0.8, 0),
            TextTransparency = u5.ContentTransparency,
            Text = "<font color=\"" .. ColorUtil.richTextColor(PlayerLevelUtil.getLevelColor(u13)) .. "\">" .. u15 .. "</font>",
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextColor3 = WHITE
        };
        local v42 = {};
        local v43 = #v42;

        if v40 then
            v42[v43 + 1] = v40;
        end;

        v42[#v42 + 1] = u2.createElement("UITextSizeConstraint", {
            MaxTextSize = 16
        });
        v36.PlayerLevel = u2.createElement("TextLabel", v41, v42);
        local v44 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 0, 0.8, 0),
            TextTransparency = u5.ContentTransparency
        };
        local v45;

        if u12 == "" or not u12 then
            v45 = "";
        else
            local ContentTransparency = u5.ContentTransparency;
            v45 = "<font transparency=\"" .. tostring(ContentTransparency == nil and 0.3 or ContentTransparency) .. "\" color=\"#ffffff\">[" .. u12 .. "]</font>";
        end;

        local v46;

        if u8 then
            v46 = GamePlayerUtil.getGamePlayer(u8):getDisplayName();
        else
            v46 = u5.Player.displayName;
        end;

        v44.Text = v45 .. " " .. v46;
        v44.AutoLocalize = false;
        v44.TextXAlignment = Enum.TextXAlignment.Left;
        v44.TextYAlignment = Enum.TextYAlignment.Center;
        v44.TextTruncate = Enum.TextTruncate.AtEnd;
        v44.RichText = true;
        v44.TextScaled = true;
        v44.AutomaticSize = "X";
        v44.Font = "ArialBold";
        v44.TextColor3 = WHITE;
        v44.LayoutOrder = 2;
        v36.PlayerName = u2.createElement("TextLabel", v44, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 16
            }) });
        local v47 = u5.IsEarlyLeave and u2.createFragment({
            EarlyLeaveIcon = u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                BorderSizePixel = 0,
                ImageTransparency = 0.2,
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Image = BedwarsImageId.DOOR_OPEN_SOLID_ICON,
                Size = UDim2.fromOffset(16, 16),
                ImageColor3 = Color3.fromRGB(255, 59, 59)
            })
        });

        if v47 then
            v36[v39 + 1] = v47;
        end;

        v34[#v34 + 1] = u2.createElement(Empty, v35, v36);
        v32[#v32 + 1] = u2.createElement(Empty, v33, v34);

        return u2.createFragment({
            PlayerNameContainer = u2.createElement("Frame", v31, v32)
        });
    end;

    local v49 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.new(tabListLayout.columns.left.totalWidth, 0, 1, 0)
    };
    local v50 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 0)
        }) };
    local v51 = #v50;
    local v52 = not v16 and u2.createElement(v30);

    if v52 then
        v50[v51 + 1] = v52;
    end;

    v50[#v50 + 1] = u2.createElement(v48);

    return u2.createElement("Frame", v49, v50);
end;

return {
    PlayerName = v3.new(u2)(v53)
};