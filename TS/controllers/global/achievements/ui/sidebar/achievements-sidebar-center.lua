-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local AchievementId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId;
local AchievementUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil;
local getGameMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-meta").getGameMeta;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AchievementIcon = RuntimeLib.import(script, script.Parent.Parent, "achievement-icon").AchievementIcon;
local KitVarietyProgress = RuntimeLib.import(script, script.Parent.Parent, "progress", "kit-variety", "kit-variety-progress").KitVarietyProgress;

return {
    AchievementsSidebarCenter = v3.new(u2)(function(u4, p5) -- Line: 19
        -- upvalues: AchievementUtil (copy), AchievementId (copy), u2 (copy), AchievementIcon (copy), DeviceUtil (copy), ColorUtil (copy), getQueueMeta (copy), AutoSizedText (copy), TooltipContainer (copy), BedwarsImageId (copy), Theme (copy), getGameMeta (copy), KitVarietyProgress (copy), Empty (copy)
        local _ = p5.useState;
        local AchievementId2 = u4.AchievementId;
        local AchievementMeta = u4.AchievementMeta;
        local v6 = "";

        if AchievementId2 then
            local v7 = u4.ProfileData.achievementProgressValues[AchievementId2];

            if v7 ~= 0 and (v7 == v7 and v7) then
                v6 = AchievementUtil.getProgressString(AchievementId2, v7);
            end;
        end;

        local v8 = (u4.AchievementId == AchievementId.KIT_VARIETY_1 or u4.AchievementId == AchievementId.KIT_VARIETY_2) and true or u4.AchievementId == AchievementId.KIT_VARIETY_3;
        local v9 = {
            Size = UDim2.fromScale(1, 0.96)
        };
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v9[i] = v;
            end;
        end;

        local v10 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0.05, 0)
            }), u2.createElement(AchievementIcon, {
                Darkened = false,
                Id = u4.AchievementId,
                Simple = DeviceUtil.isSmallScreen(),
                FrameProps = {
                    LayoutOrder = 0,
                    Size = UDim2.fromScale(1, 0.4)
                }
            }) };
        local _ = #v10;
        local v11;

        if AchievementMeta == nil then
            v11 = AchievementMeta;
        else
            v11 = AchievementMeta.title;
        end;

        local v12 = v11 ~= nil and u2.createFragment({
            AchievementTitle = u2.createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                TextWrapped = true,
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 0.2),
                Text = AchievementMeta.title,
                FontFace = Font.fromName("LuckiestGuy", Enum.FontWeight.Regular),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Center
            }, { u2.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new((1 / 0), DeviceUtil.isSmallScreen() and 20 or 35)
                }) })
        });
        local v13 = {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.55),
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1)
        };
        local v14 = { u2.createElement("UIListLayout", {
                Padding = UDim.new(0.03, 0),
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }) };
        local v15 = #v14;

        if v12 then
            v14[v15 + 1] = v12;
        end;

        local v16 = #v14;
        local v17 = {
            Size = UDim2.fromScale(1, 0.3)
        };
        local v18;

        if AchievementMeta == nil then
            v18 = AchievementMeta;
        else
            local goal = AchievementMeta.goal;

            if goal ~= nil then
                goal = goal.value;
            end;

            v18 = AchievementMeta.description(goal == nil and 0 or goal);
        end;

        v17.Text = tostring(v18);
        v17.TextScaled = true;
        v17.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v17.TextColor3 = ColorUtil.WHITE;
        v17.BackgroundTransparency = 1;
        v17.TextWrapped = true;
        v17.TextXAlignment = Enum.TextXAlignment.Center;
        v17.LayoutOrder = 1;
        v14.AchievementDesc = u2.createElement("TextLabel", v17, { u2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new((1 / 0), 60)
            }), u2.createElement("UITextSizeConstraint", {
                MaxTextSize = DeviceUtil.isSmallScreen() and 20 or 30
            }) });
        local v19;

        if AchievementMeta == nil then
            v19 = AchievementMeta;
        else
            v19 = AchievementMeta.details;
        end;

        local v20 = v19 ~= nil;

        if v20 then
            local v21 = {
                Size = UDim2.fromScale(1, 0.2)
            };
            local v22;

            if AchievementMeta == nil then
                v22 = AchievementMeta;
            else
                v22 = AchievementMeta.details;
            end;

            v21.Text = v22;
            v21.TextScaled = true;
            v21.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular);
            v21.RichText = true;
            v21.TextColor3 = ColorUtil.WHITE;
            v21.TextTransparency = 0.3;
            v21.BackgroundTransparency = 1;
            v21.TextWrapped = true;
            v21.TextXAlignment = Enum.TextXAlignment.Center;
            v21.LayoutOrder = 2;
            v20 = u2.createFragment({
                AchievementDetails = u2.createElement("TextLabel", v21)
            });
        end;

        if v20 then
            v14[v16 + 1] = v20;
        end;

        local v23 = #v14;
        local v24;

        if AchievementMeta == nil then
            v24 = AchievementMeta;
        else
            v24 = AchievementMeta.queues;
        end;

        local v25 = v24 ~= nil;

        if not v25 then
            local v26;

            if AchievementMeta == nil then
                v26 = AchievementMeta;
            else
                v26 = AchievementMeta.games;
            end;

            v25 = v26 ~= nil;
        end;

        if v25 then
            local v27;

            if AchievementMeta == nil then
                v27 = AchievementMeta;
            else
                v27 = AchievementMeta.queues;
            end;

            local v28 = v27 ~= nil;

            if v28 then
                local v29 = {};
                local v30 = {};
                local v31;

                if AchievementMeta == nil then
                    v31 = AchievementMeta;
                else
                    local queues = AchievementMeta.queues;

                    local function _(p32) -- Line: 193
                        -- upvalues: getQueueMeta (ref)
                        return getQueueMeta(p32).title;
                    end;

                    local v33 = table.create(#queues);

                    for i, v in queues do
                        local _ = i - 1;
                        v33[i] = getQueueMeta(v).title;
                    end;

                    v31 = table.concat(v33, ", ");
                end;

                v30.Text = "Applicable queues: <b>" .. v31 .. "</b>";
                v30.Font = Enum.Font.SourceSans;
                v30.RichText = true;
                v30.TextSize = 16;
                v30.Limits = Vector2.new(280, 60);
                v29[#v29 + 1] = u2.createElement(AutoSizedText, v30);
                v28 = u2.createElement(TooltipContainer, {}, v29);
            end;

            local v34 = {
                BackgroundTransparency = 1,
                ImageTransparency = 0.3,
                LayoutOrder = 3,
                Size = UDim2.fromScale(1, 0.1),
                Image = BedwarsImageId.INFO_ICON,
                ImageColor3 = Theme.textPrimary
            };
            local v35 = { u2.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, 16)
                }), u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) };
            local v36 = #v35;

            if v28 then
                v35[v36 + 1] = v28;
            end;

            local v37 = #v35;
            local v38;

            if AchievementMeta == nil then
                v38 = AchievementMeta;
            else
                v38 = AchievementMeta.games;
            end;

            local v39 = v38 ~= nil;

            if v39 then
                local v40 = {};
                local v41 = {};
                local v42;

                if AchievementMeta == nil then
                    v42 = AchievementMeta;
                else
                    local games = AchievementMeta.games;

                    local function _(p43) -- Line: 245
                        -- upvalues: getGameMeta (ref)
                        return getGameMeta(p43).title;
                    end;

                    local v44 = table.create(#games);

                    for i, v in games do
                        local _ = i - 1;
                        v44[i] = getGameMeta(v).title;
                    end;

                    v42 = table.concat(v44, ", ");
                end;

                v41.Text = "Applicable game modes: <b>" .. v42 .. "</b>";
                v41.Font = Enum.Font.SourceSans;
                v41.RichText = true;
                v41.TextSize = 16;
                v41.Limits = Vector2.new(280, 60);
                v40[#v40 + 1] = u2.createElement(AutoSizedText, v41);
                v39 = u2.createElement(TooltipContainer, {}, v40);
            end;

            if v39 then
                v35[v37 + 1] = v39;
            end;

            v25 = u2.createFragment({
                AchievementGameQueueInfo = u2.createElement("ImageLabel", v34, v35)
            });
        end;

        if v25 then
            v14[v23 + 1] = v25;
        end;

        local _ = #v14;
        local v45 = {
            LayoutOrder = 4,
            Size = UDim2.fromScale(1, 0.2)
        };
        local v46 = { u2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new((1 / 0), 40)
            }) };
        local v47 = #v46;

        if v8 then
            v8 = u2.createElement(KitVarietyProgress, {
                FrameProps = {
                    Size = UDim2.fromScale(1, 1)
                },
                ProfileData = u4.ProfileData
            });
        end;

        if v8 then
            v46[v47 + 1] = v8;
        end;

        local v48 = #v46;
        local v49;

        if v6 == "" then
            v49 = false;
        else
            v49 = u2.createElement("TextLabel", {
                TextScaled = true,
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                LayoutOrder = 4,
                Size = UDim2.fromScale(1, 1),
                Text = v6,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Center
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 24
                }) });
        end;

        if v49 then
            v46[v48 + 1] = v49;
        end;

        local v50 = #v46;
        local v51;

        if AchievementMeta == nil then
            v51 = AchievementMeta;
        else
            v51 = AchievementMeta.sub;
        end;

        if v51 then
            local sub = AchievementMeta.sub;

            local function v69(p52, p53) -- Line: 321
                -- upvalues: AchievementUtil (ref), u4 (copy), u2 (ref), BedwarsImageId (ref), ColorUtil (ref), Empty (ref)
                local v54 = AchievementUtil.getMeta(p52);
                local v55 = u4.ProfileData.achievements[p52];
                local v56 = {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 40),
                    LayoutOrder = p53
                };
                local v57 = { u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        Padding = UDim.new(0, 5),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }) };
                local v58 = #v57;
                local v59 = {
                    LayoutOrder = 0,
                    Size = UDim2.fromScale(0.15, 1)
                };
                local v60 = {};
                local v61 = {};
                local v62;

                if v55 == nil then
                    v62 = v55;
                else
                    v62 = v55.achieved;
                end;

                local v63;

                if v62 then
                    v63 = UDim2.fromScale(0.7, 1);
                else
                    v63 = UDim2.fromScale(1, 1);
                end;

                v61.Size = v63;
                local v64;

                if v55 == nil then
                    v64 = v55;
                else
                    v64 = v55.achieved;
                end;

                local v65;

                if v64 then
                    v65 = BedwarsImageId.CHECK_SOLID;
                else
                    v65 = BedwarsImageId.X;
                end;

                v61.Image = v65;
                local v66;

                if v55 == nil then
                    v66 = v55;
                else
                    v66 = v55.achieved;
                end;

                local v67;

                if v66 then
                    v67 = ColorUtil.WHITE;
                else
                    v67 = ColorUtil.BLACK;
                end;

                v61.ImageColor3 = v67;

                if v55 ~= nil then
                    v55 = v55.achieved;
                end;

                v61.ImageTransparency = v55 and 0 or 0.5;
                v61.BackgroundTransparency = 1;
                v61.ScaleType = Enum.ScaleType.Fit;
                v61.AnchorPoint = Vector2.new(0.5, 0.5);
                v61.Position = UDim2.fromScale(0.5, 0.5);
                v60[#v60 + 1] = u2.createElement("ImageLabel", v61, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) });
                v57[v58 + 1] = u2.createElement(Empty, v59, v60);
                local v68 = {
                    Size = UDim2.fromScale(0.85, 1) - UDim2.fromOffset(0, 5)
                };
                local goal = v54.goal;

                if goal ~= nil then
                    goal = goal.value;
                end;

                v68.Text = v54.description(goal == nil and 0 or goal);
                v68.TextScaled = true;
                v68.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
                v68.TextColor3 = ColorUtil.WHITE;
                v68.BackgroundTransparency = 1;
                v68.TextXAlignment = Enum.TextXAlignment.Left;
                v68.LayoutOrder = 1;
                v57[v58 + 2] = u2.createElement("TextLabel", v68);

                return u2.createElement("Frame", v56, v57);
            end;

            local v70 = table.create(#sub);

            for i, v in sub do
                v70[i] = v69(v, i - 1, sub);
            end;

            local v71 = {
                LayoutOrder = 4,
                Size = UDim2.fromScale(1, 1)
            };
            local v72 = { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    Padding = UDim.new(0, 5),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }) };
            local v73 = #v72;

            for i, v in v70 do
                v72[v73 + i] = v;
            end;

            v51 = u2.createElement(Empty, v71, v72);
        end;

        if v51 then
            v46[v50 + 1] = v51;
        end;

        v14.AchievementProgress = u2.createElement(Empty, v45, v46);
        v10.AchievementInfo = u2.createElement("Frame", v13, v14);

        return u2.createFragment({
            SidebarCenter = u2.createElement(Empty, v9, v10)
        });
    end)
};