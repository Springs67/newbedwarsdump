-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local EmptyButton = v1.EmptyButton;
local ShineEffect = v1.ShineEffect;
local ShineEffectVariation = v1.ShineEffectVariation;
local TooltipContainer = v1.TooltipContainer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local TweenService = v4.TweenService;
local MapDataUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-data-util").MapDataUtil;
local getMapMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta").getMapMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EnvironmentPreset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset;

local function joinWithAnd(p5) -- Line: 24
    local v6 = #p5;

    if v6 == 0 then
        return nil;
    end;

    if v6 == 1 then
        return p5[1];
    end;

    local v7 = p5[1];
    local v8 = false;
    local v9 = 1;

    while true do
        if v8 then
            v9 = v9 + 1;
        else
            v8 = true;
        end;

        if v9 >= v6 then
            return v7;
        end;

        local v10;

        if v9 == v6 - 1 then
            v10 = ", & " .. p5[v9 + 1];
        else
            v10 = ", " .. p5[v9 + 1];
        end;

        v7 = v7 .. v10;
    end;
end;

return {
    PregameVotingCard = v3.new(u2)(function(u11, p12) -- Line: 50
        -- upvalues: DeviceUtil (copy), ColorUtil (copy), getMapMeta (copy), MapDataUtil (copy), u2 (copy), BedwarsImageId (copy), EnvironmentPreset (copy), TweenService (copy), KnitClient (copy), ShineEffect (copy), ShineEffectVariation (copy), AutoSizedText (copy), TooltipContainer (copy), Empty (copy), joinWithAnd (copy), Players (copy), Theme (copy), EmptyButton (copy)
        local useState = p12.useState;
        local useEffect = p12.useEffect;
        local useMemo = p12.useMemo;
        local u13, u14 = useState(u11.Selected ~= nil);
        local u15, u16 = useState((DeviceUtil.isMobileControls() or DeviceUtil.isSmallScreen()) and true or false);
        local v17, u18 = useState(ColorUtil.WHITE);
        local v19 = u11.voteState[u11.votingOptionIndex + 1];
        local mapName = v19.pregameVotingOption.mapName;
        local u20 = getMapMeta(mapName);
        local v21 = MapDataUtil.getMapDisplayName(mapName);
        local v22 = MapDataUtil.getMapImage(mapName);
        local v23 = MapDataUtil.getMapCredits(mapName);
        local voterUserIds = v19.voterUserIds;
        local u24 = u2.createRef();
        local u25 = u2.createRef();
        local u26 = u2.createRef();
        local u27 = u2.createRef();
        local v30 = useMemo(function() -- Line: 69
            -- upvalues: mapName (copy), BedwarsImageId (ref), u20 (copy), EnvironmentPreset (ref)
            local v28 = {};

            if mapName == "to4_Halloween-Map-2025" then
                table.insert(v28, {
                    image = BedwarsImageId.STAR_SOLID,
                    tooltip = {
                        name = "Special Event Map"
                    }
                });
            end;

            local v29 = u20;

            if v29 ~= nil then
                v29 = v29.environment;

                if v29 ~= nil then
                    v29 = v29.preset;
                end;
            end;

            if v29 == EnvironmentPreset.Night then
                table.insert(v28, {
                    image = BedwarsImageId.CRESCENT_MOON_ICON,
                    tooltip = {
                        name = "Night Time"
                    }
                });

                return v28;
            end;

            if v29 ~= EnvironmentPreset.Winter then
                return v28;
            end;

            table.insert(v28, {
                image = BedwarsImageId.SNOWFLAKE_ICON,
                tooltip = {
                    name = "Winter"
                }
            });

            return v28;
        end, { u20 });
        useEffect(function() -- Line: 111
            -- upvalues: u24 (copy), u11 (copy), TweenService (ref), u13 (copy)
            local v31 = u24:getValue();

            if not v31 then
                return nil;
            end;

            local v32 = u11.winHighlightIndex == u11.votingOptionIndex;
            TweenService:Create(v31, TweenInfo.new(0.1, Enum.EasingStyle.Circular), {
                Transparency = v32 and 0 or (u11.winHighlightIndex == nil and (u13 and not u11.rouletteMode) and 0 or 1)
            }):Play();
        end, { u13, u11.winHighlightIndex, u11.rouletteMode });
        useEffect(function() -- Line: 122
            -- upvalues: u27 (copy), u15 (copy), TweenService (ref)
            local v33 = u27:getValue();

            if not v33 then
                return nil;
            end;

            if u15 then
                TweenService:Create(v33, TweenInfo.new(0.3), {
                    Position = UDim2.fromScale(0, 0.7)
                }):Play();

                return;
            end;

            TweenService:Create(v33, TweenInfo.new(0.3), {
                Position = UDim2.fromScale(0, 1)
            }):Play();
        end, { u15 });
        useEffect(function() -- Line: 137
            -- upvalues: u26 (copy), u11 (copy), TweenService (ref), u16 (copy)
            local v34 = u26:getValue();

            if not v34 then
                return nil;
            end;

            local v35 = u11.winHighlightIndex == u11.votingOptionIndex;
            local winHighlightIndex = u11.winHighlightIndex;

            if winHighlightIndex ~= 0 and (winHighlightIndex == winHighlightIndex and winHighlightIndex) then
                winHighlightIndex = not v35;
            end;

            if winHighlightIndex ~= 0 and (winHighlightIndex == winHighlightIndex and winHighlightIndex) then
                TweenService:Create(v34, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                    BackgroundTransparency = 0.7
                }):Play();
            end;

            local winHighlightIndex2 = u11.winHighlightIndex;

            if winHighlightIndex2 == 0 or winHighlightIndex2 ~= winHighlightIndex2 then
                v35 = winHighlightIndex2;
            elseif not winHighlightIndex2 then
                v35 = winHighlightIndex2;
            end;

            if v35 ~= 0 and (v35 == v35 and v35) then
                u16(true);
            end;
        end, { u11.winHighlightIndex });
        useEffect(function() -- Line: 161
            -- upvalues: u11 (copy), u14 (copy)
            if not u11.Selected then
                u14(false);
            end;
        end, { u11.Selected });
        useEffect(function() -- Line: 166
            -- upvalues: ColorUtil (ref), u11 (copy), u18 (copy)
            local WHITE = ColorUtil.WHITE;

            if u11.winHighlightIndex == u11.votingOptionIndex then
                WHITE = Color3.fromRGB(255, 227, 110);
            elseif u11.Selected then
                WHITE = Color3.fromRGB(115, 255, 115);
            end;

            u18(WHITE);
        end, { u11.winHighlightIndex, u11.votingOptionIndex, u11.Selected });
        local v36 = {
            [u2.Ref] = u26,
            LayoutOrder = u11.votingOptionIndex,
            Size = UDim2.fromScale(1, 1),
            Selectable = true,

            [u2.Event.MouseButton1Click] = function() -- Line: 180
                -- upvalues: u11 (copy), DeviceUtil (ref), KnitClient (ref)
                if u11.rouletteMode then
                    return nil;
                end;

                local OnClick = u11.OnClick;

                if OnClick ~= nil then
                    OnClick();
                end;

                if not DeviceUtil.isHoarceKat() then
                    KnitClient.Controllers.PregameVotingController:voteForPregameOption(u11.votingOptionIndex);
                end;
            end,

            [u2.Event.MouseEnter] = function() -- Line: 192
                -- upvalues: u16 (copy), u11 (copy), u14 (copy)
                u16(true);

                if u11.rouletteMode then
                    return nil;
                end;

                u14(true);
            end,

            [u2.Event.MouseLeave] = function() -- Line: 199
                -- upvalues: u11 (copy), u16 (copy), u14 (copy)
                if u11.winHighlightIndex ~= u11.votingOptionIndex then
                    u16(false);
                end;

                if not (u11.Selected or u11.rouletteMode) then
                    u14(false);
                end;
            end
        };
        local v37 = { u2.createElement(ShineEffect, {
                Loop = false,
                OnHover = true,
                Color = ColorUtil.WHITE,
                Variation = ShineEffectVariation.solid
            }) };
        local v38 = #v37;
        local v39 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            Size = UDim2.fromScale(1, 0.25),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v40 = {
            u2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                FillDirection = Enum.FillDirection.Horizontal
            }),
            u2.createElement("UIGradient", {
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 1) })
            }),
            u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10)
            }),
            u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                Size = UDim2.fromScale(0.7, 0.5),
                Text = v21,
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            })
        };

        local function v49(p41) -- Line: 247
            -- upvalues: u2 (ref), AutoSizedText (ref), TooltipContainer (ref)
            local v42 = p41.tooltip ~= nil;

            if v42 then
                local v43 = { u2.createElement(AutoSizedText, {
                        TextSize = 26,
                        Text = p41.tooltip.name,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }) };
                local v44 = #v43;
                local v45;

                if p41.tooltip.description == nil then
                    v45 = false;
                else
                    v45 = u2.createElement(AutoSizedText, {
                        TextSize = 24,
                        Text = p41.tooltip.description,
                        Font = Enum.Font.SourceSans,
                        TextColor3 = Color3.fromRGB(191, 191, 191),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Limits = Vector2.new(300, 150)
                    });
                end;

                if v45 then
                    v43[v44 + 1] = v45;
                end;

                v42 = u2.createElement(TooltipContainer, {}, v43);
            end;

            local v46 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.5, 0.5),
                Image = p41.image,
                ImageColor3 = p41.color,
                ScaleType = Enum.ScaleType.Fit
            };
            local v47 = { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) };
            local v48 = #v47;

            if v42 then
                v47[v48 + 1] = v42;
            end;

            return u2.createElement("ImageLabel", v46, v47);
        end;

        local v50 = table.create(#v30);

        for i, v in v30 do
            v50[i] = v49(v, i - 1, v30);
        end;

        local v51 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.3, 1)
        };
        local v52 = { u2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 10)
            }), u2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 10)
            }) };
        local v53 = #v52;

        for i, v in v50 do
            v52[v53 + i] = v;
        end;

        v40[#v40 + 1] = u2.createElement(Empty, v51, v52);
        v37.Header = u2.createElement("Frame", v39, v40);
        v37.BackgroundMapImage = u2.createElement("ImageLabel", {
            ZIndex = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Image = v22,
            ScaleType = Enum.ScaleType.Crop
        }, { u2.createElement("UIStroke", {
                Thickness = 2,
                Color = v17,
                [u2.Ref] = u24
            }, { u2.createElement("UIGradient", {
                    Rotation = -90,
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                }) }) });
        local v54 = {
            Size = UDim2.fromScale(1, 0.08),
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 0.98)
        };
        local v55 = { u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10)
            }) };
        local _ = #v55;
        local v56 = {
            Size = UDim2.fromScale(0.85, 1),
            Font = Enum.Font.Gotham,
            TextColor3 = ColorUtil.WHITE
        };
        local v57;

        if v23 then
            local function _(p58) -- Line: 353
                return tostring(p58);
            end;

            local v59 = table.create(#v23);

            for i, v in v23 do
                local _ = i - 1;
                v59[i] = tostring(v);
            end;

            local v60 = joinWithAnd(v59);
            v57 = "By " .. tostring(v60);
        else
            v57 = "";
        end;

        v56.Text = v57;
        v56.TextScaled = true;
        v56.TextXAlignment = "Left";
        v56.TextTransparency = 0.2;
        v56.BackgroundTransparency = 1;
        v55.MapCredits = u2.createElement("TextLabel", v56);
        v37[v38 + 1] = u2.createElement(Empty, v54, v55);
        local v61;

        if u20 == nil then
            v61 = u20;
        else
            v61 = u20.description;
        end;

        local v62 = v61 ~= nil;

        if v62 then
            local v63 = {
                ClipsDescendants = true,
                Size = UDim2.fromScale(1, 1)
            };
            local v64 = {};
            local v65 = {
                [u2.Ref] = u27,
                Size = UDim2.fromScale(1, 0.3),
                BackgroundColor3 = ColorUtil.BLACK,
                BorderSizePixel = 0,
                Position = UDim2.fromScale(0, 1)
            };
            local v66 = { u2.createElement("UIGradient", {
                    Rotation = -90,
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 1) })
                }), u2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0.1, 0),
                    PaddingRight = UDim.new(0.1, 0),
                    PaddingBottom = UDim.new(0.3, 0)
                }) };
            local v67 = {
                TextStrokeTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Font = Enum.Font.Gotham,
                TextColor3 = ColorUtil.WHITE
            };

            if u20 ~= nil then
                u20 = u20.description;
            end;

            v67.Text = u20;
            v67.BackgroundTransparency = 1;
            v67.TextWrapped = true;
            v67.TextScaled = true;
            v66[#v66 + 1] = u2.createElement("TextLabel", v67);
            v64[#v64 + 1] = u2.createElement("Frame", v65, v66);
            v62 = u2.createFragment({
                MapDescriptionContainer = u2.createElement(Empty, v63, v64)
            });
        end;

        if v62 then
            v37[v38 + 2] = v62;
        end;

        local function v109(p68, p69, p70) -- Line: 428
            -- upvalues: u11 (copy), DeviceUtil (ref), Players (ref), u2 (ref), ColorUtil (ref), u25 (copy), Theme (ref)
            local function _(p71, p72) -- Line: 430
                -- upvalues: u11 (ref)
                return p72 < u11.votingOptionIndex;
            end;

            local v73 = 0;
            local v74 = {};

            for i, v in u11.voteState do
                if i - 1 < u11.votingOptionIndex == true then
                    v73 = v73 + 1;
                    v74[v73] = v;
                end;
            end;

            local function _(p75, p76) -- Line: 443
                return #p75.voterUserIds;
            end;

            local v77 = table.create(#v74);

            for i, v in v74 do
                local _ = i - 1;
                v77[i] = #v.voterUserIds;
            end;

            local v78;

            if #v77 > 0 then
                local function _(p79, p80) -- Line: 455
                    return p79 + p80;
                end;

                if #v77 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
                end;

                v78 = v77[1];

                for i = 2, #v77 do
                    local _ = i - 1;
                    v78 = v78 + v77[i];
                end;
            else
                v78 = 0;
            end;

            local u81 = 0;
            local v82 = false;
            local v83 = 0;

            while true do
                if true then
                    if v82 then
                        u81 = u81 + 1;
                    else
                        v82 = true;
                    end;
                end;

                if u81 >= #u11.voteState then
                    break;
                end;

                local voteState = u11.voteState;

                local function _(p84, p85) -- Line: 488
                    return #p84.voterUserIds;
                end;

                local v86 = table.create(#voteState);

                for i, v in voteState do
                    local _ = i - 1;
                    v86[i] = #v.voterUserIds;
                end;

                local function _(p87, p88, p89) -- Line: 497
                    -- upvalues: u81 (ref)
                    if u81 < p89 then
                        return p87;
                    end;

                    return p87 + p88;
                end;

                if #v86 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
                end;

                local v90 = v86[1];

                for i = 2, #v86 do
                    local v91 = v86[i];

                    if u81 >= i - 1 then
                        v90 = v90 + v91;
                    end;
                end;

                if u11.rouletteSelectedVoterIndex - v90 < 0 then
                    v83 = u81;
                    break;
                end;

                u81 = u81;
            end;

            local v92 = u11.rouletteSelectedVoterIndex - v78;
            local v93 = #p70 > 11;
            local v94 = #p70 - 11;
            local v95;

            if v93 then
                v95 = p69 == 10;
            else
                v95 = v93;
            end;

            if v93 and p69 >= 11 then
                return nil;
            end;

            local v96;

            if DeviceUtil.isHoarceKat() then
                v96 = false;
            else
                v96 = p68 == Players.LocalPlayer.UserId;
            end;

            local v97 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.10964912280701754, 1)
            };
            local v98 = { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) };
            local v99 = {
                BackgroundTransparency = 0.1,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.WHITE
            };
            local v100;

            if v95 then
                v100 = nil;
            else
                v100 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(p68) .. "&w=48&h=48";
            end;

            v99.Image = v100;
            local v101 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) };
            local v102 = #v101;
            local v103 = not u11.rouletteMode;

            if v103 then
                local createElement = u2.createElement;
                local v104 = {
                    [u2.Ref] = u25,
                    Thickness = 2
                };
                local v105;

                if v96 then
                    v105 = Theme.mcGreen;
                else
                    v105 = ColorUtil.WHITE;
                end;

                v104.Color = v105;
                v104.Transparency = v96 and 0 or 0.3;
                v103 = createElement("UIStroke", v104);
            end;

            if v103 then
                v101[v102 + 1] = v103;
            end;

            local v106 = #v101;
            local v107;

            if u11.Selected == nil then
                v107 = false;
            else
                v107 = u11.rouletteMode;

                if v107 then
                    if (v92 == p69 or v92 >= 11 and (v92 < v94 + 11 and p69 == 10)) and v83 == u11.votingOptionIndex then
                        v107 = u2.createElement("UIStroke", {
                            [u2.Ref] = u25,
                            Thickness = 3,
                            Color = ColorUtil.BLACK,
                            Transparency = 0
                        });
                    else
                        v107 = false;
                    end;
                end;
            end;

            if v107 then
                v101[v106 + 1] = v107;
            end;

            local v108 = #v101;

            if v95 then
                v95 = u2.createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Font = "SourceSansBold",
                    Size = UDim2.fromScale(0.8, 0.8),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = Theme.Gray,
                    Text = "+" .. tostring(#p70 - 11 + 1)
                });
            end;

            if v95 then
                v101[v108 + 1] = v95;
            end;

            v98[#v98 + 1] = u2.createElement("ImageLabel", v99, v101);

            return u2.createElement("Frame", v97, v98);
        end;

        local v110 = 0;
        local v111 = {};

        for i, v in voterUserIds do
            local v112 = v109(v, i - 1, voterUserIds);

            if v112 ~= nil then
                v110 = v110 + 1;
                v111[v110] = v112;
            end;
        end;

        local v113 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.9, 0.1),
            Position = UDim2.fromScale(0.9835886214442013, 0.99),
            AnchorPoint = Vector2.new(1, 0.5)
        };
        local v114 = { u2.createElement("UIListLayout", {
                SortOrder = "LayoutOrder",
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Center",
                Padding = UDim.new(0.03)
            }) };
        local v115 = #v114;

        for i, v in v111 do
            v114[v115 + i] = v;
        end;

        v37[#v37 + 1] = u2.createElement("Frame", v113, v114);

        return u2.createFragment({
            ["PreGameVotingCard_" .. mapName] = u2.createElement(EmptyButton, v36, v37)
        });
    end)
};