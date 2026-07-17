-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local CornerFiller = v1.CornerFiller;
local Empty = v1.Empty;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getBattlePassMetadata = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    BattlePassInfoCard = v3.new(u2)(function(u4, p5) -- Line: 13
        -- upvalues: getBattlePassMetadata (copy), u2 (copy), ColorUtil (copy), BattlePassUtils (copy), Theme (copy), StringUtil (copy), Empty (copy), CornerFiller (copy)
        local _ = p5.useState;
        local v6 = getBattlePassMetadata(u4.battlepass);
        local endDate = v6.endDate;
        local v7 = endDate - os.time() <= 86400;

        local function v14(p8) -- Line: 19
            -- upvalues: u2 (ref), ColorUtil (ref), BattlePassUtils (ref), u4 (copy), Theme (ref)
            local createFragment = u2.createFragment;
            local v9 = {};
            local createElement = u2.createElement;
            local v10 = {
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
                LayoutOrder = 2,
                AnchorPoint = p8.AnchorPoint,
                Position = p8.Position,
                Size = p8.Size or UDim2.new(1, 0, 0.1, 0),
                BackgroundColor3 = ColorUtil.hexColor(5921943)
            };
            local v11 = { (u2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })) };
            local createElement2 = u2.createElement;
            local v12 = {
                BorderSizePixel = 0,
                BackgroundTransparency = 0
            };
            local new = UDim2.new;
            local v13 = BattlePassUtils.getCurrExperienceProgression(u4.store.BattlePass.experience, u4.store.BattlePass.level) / BattlePassUtils.getExperienceForLevel(u4.store.BattlePass.level + 1);
            v12.Size = new(math.min(v13, 1), 0, 1, 0);
            v12.BackgroundColor3 = Theme.textPrimary;
            v11.ProgressBar = createElement2("Frame", v12, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) });
            v9.ProgressBarWrapper = createElement("Frame", v10, v11);

            return createFragment(v9);
        end;

        local v15 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            AnchorPoint = u4.AnchorPoint,
            Position = u4.Position,
            Size = u4.Size,
            BackgroundColor3 = Theme.backgroundTertiary
        };
        local v16 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4)
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }) };
        local _ = #v16;
        local v17 = {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0.45, -2)
        };
        local v18 = {
            u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.175, 0),
                PaddingBottom = UDim.new(0.15, 0),
                PaddingLeft = UDim.new(0.04, 0),
                PaddingRight = UDim.new(0.04, 0)
            }),
            u2.createElement("UIListLayout", {
                SortOrder = "LayoutOrder",
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0.05, 0)
            }),
            BattlePassIcon = u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                ScaleType = "Fit",
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1),
                Image = BattlePassUtils.BATTLE_PASS_SEASON_ICON
            })
        };
        local _ = #v18;
        local v19 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.75, 1)
        };
        local v20 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0.05, 0)
            }) };
        local v21 = #v20;
        local v22 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0.5, -0.025)
        };
        local name = v6.name;

        if name == nil then
            local seasonNumber = v6.seasonNumber;
            name = (seasonNumber == 0 or (seasonNumber ~= seasonNumber or not seasonNumber)) and "" or "Season " .. tostring(v6.seasonNumber);
        end;

        v22.Text = name;
        v22.TextXAlignment = Enum.TextXAlignment.Left;
        v22.TextColor3 = ColorUtil.WHITE;
        v22.TextScaled = true;
        v22.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v20[v21 + 1] = u2.createElement("TextLabel", v22);
        v20[v21 + 2] = u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextTransparency = 0.3,
            TextScaled = true,
            RichText = true,
            Size = UDim2.new(1, 0, 0.5, -0.025),
            Text = StringUtil.fromNow(endDate, {
                hideIfZero = true,
                long = true,
                seconds = v7 and true or false,
                minutes = v7 and true or false
            }) .. "remaining",
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto
        });
        v18.SeasonInfoHeader = u2.createElement(Empty, v19, v20);
        v16.CardHeader = u2.createElement("Frame", v17, v18);
        local createElement = u2.createElement;
        local v23 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 0.55, -2),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v24 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), (u2.createElement(CornerFiller, {
                TopRight = true,
                TopLeft = true,
                ZIndex = 2
            })) };
        local createElement2 = u2.createElement;
        local v25 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v26 = {};
        local v27 = u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12),
            PaddingBottom = UDim.new(0, 12),
            PaddingLeft = UDim.new(0, 16),
            PaddingRight = UDim.new(0, 16)
        });
        local v28 = u2.createElement("UIListLayout", {
            SortOrder = "LayoutOrder",
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0.05, 0)
        });
        local v29 = u2.createElement(Empty, {
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0.4, 0)
        }, { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                Size = UDim2.new(0.5, 0, 1, 0),
                Text = "Lv. " .. tostring(u4.store.BattlePass.level),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Bottom,
                TextColor3 = Color3.new(1, 1, 1),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }), u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextTransparency = 0.3,
                TextScaled = true,
                Size = UDim2.new(0.5, 0, 1, 0),
                Text = "Lv. " .. tostring(u4.store.BattlePass.level + 1),
                TextXAlignment = Enum.TextXAlignment.Right,
                TextYAlignment = Enum.TextYAlignment.Bottom,
                TextColor3 = Color3.new(1, 1, 1),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }) });
        local v30 = u2.createElement(v14, {
            Size = UDim2.new(1, 0, 0.2, 0)
        });
        local createElement3 = u2.createElement;
        local v31 = {
            BackgroundTransparency = 1,
            TextTransparency = 0.3,
            TextScaled = true,
            LayoutOrder = 3,
            Size = UDim2.new(1, 0, 0.3, 0)
        };
        local v32 = BattlePassUtils.getCurrExperienceProgression(u4.store.BattlePass.experience, u4.store.BattlePass.level);
        local v33 = math.floor(v32);
        v31.Text = tostring(v33) .. " / " .. tostring(BattlePassUtils.getExperienceForLevel(u4.store.BattlePass.level + 1));
        v31.TextXAlignment = Enum.TextXAlignment.Right;
        v31.TextYAlignment = Enum.TextYAlignment.Bottom;
        v31.TextColor3 = Color3.new(1, 1, 1);
        v31.Font = Enum.Font.Roboto;
        v26[1], v26[2], v26[3], v26[4], v26[5] = v27, v28, v29, v30, createElement3("TextLabel", v31);
        v24.PersonalSeasonProgressContainer = createElement2(Empty, v25, v26);
        v16.CardContentWrapper = createElement("Frame", v23, v24);

        return u2.createFragment({
            BattlePassInfoCard = u2.createElement("Frame", v15, v16)
        });
    end)
};