-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sorcerer-balance");
local SorcererBalance = v4.SorcererBalance;
local SorcererTier = v4.SorcererTier;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    SorcererKit = v3.new(u2)(function(u5, p6) -- Line: 18
        -- upvalues: SorcererBalance (copy), SorcererTier (copy), Players (copy), DeviceUtil (copy), u2 (copy), ColorUtil (copy), Empty (copy), BedwarsImageId (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7, u8 = useState(0);
        local u9, u10 = useState(0);
        local u11, u12 = useState(SorcererBalance.getSorcererTierData(SorcererTier.TIER_2).numTotalCrystalsReq);
        local u13, u14 = useState(SorcererBalance.getSorcererTier(Players.LocalPlayer));
        local u15 = SorcererBalance.getSorcererTierData(u13);
        local v16;

        if u15.nextTier then
            v16 = SorcererBalance.getSorcererTierData(u15.nextTier);
        else
            v16 = nil;
        end;

        useEffect(function() -- Line: 29
            -- upvalues: DeviceUtil (ref), Players (ref), SorcererBalance (ref), u13 (copy), u12 (copy), u14 (copy), u8 (copy), u10 (copy)
            local u17, u18;

            if DeviceUtil.isHoarceKat() then
                u17 = nil;
                u18 = nil;
            else
                u17 = Players.LocalPlayer:GetAttributeChangedSignal("CrystalsCollected"):Connect(function() -- Line: 34
                    -- upvalues: Players (ref), SorcererBalance (ref), u13 (ref), u12 (ref), u14 (ref), u8 (ref)
                    local v19 = Players.LocalPlayer:GetAttribute("CrystalsCollected");
                    local v20 = SorcererBalance.getSorcererTier(Players.LocalPlayer);
                    local v21 = SorcererBalance.getSorcererTierData(v20);
                    local nextTier = v21.nextTier;

                    if u13 ~= v20 then
                        if nextTier then
                            u12(SorcererBalance.getSorcererTierData(nextTier).numTotalCrystalsReq - v21.numTotalCrystalsReq);
                        else
                            u12(0);
                        end;

                        u14(v20);
                    end;

                    if not nextTier then
                        u8(1);

                        return;
                    end;

                    local v22 = SorcererBalance.getSorcererTierData(nextTier).numTotalCrystalsReq - v21.numTotalCrystalsReq;
                    u8((math.min((((v19 == 0 or (v19 ~= v19 or not v19)) and 0 or v19) - v21.numTotalCrystalsReq) / v22, 1)));
                end);
                u18 = Players.LocalPlayer:GetAttributeChangedSignal("SpellCharges"):Connect(function() -- Line: 59
                    -- upvalues: Players (ref), u10 (ref)
                    local v23 = Players.LocalPlayer:GetAttribute("SpellCharges");
                    u10((v23 == 0 or (v23 ~= v23 or not v23)) and 0 or v23);
                end);
            end;

            return function() -- Line: 69
                -- upvalues: DeviceUtil (ref), u17 (ref), u18 (ref)
                if not DeviceUtil.isHoarceKat() then
                    u17:Disconnect();
                    u18:Disconnect();
                end;
            end;
        end, {});
        local v24 = {
            ResetOnSpawn = false
        };
        local v25 = {};
        local v26 = {
            Transparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.25, 0.4),
            Position = UDim2.fromScale(0.025, DeviceUtil.isMobileControls() and 0.25 or 0.3)
        };
        local v27 = {};
        local v28 = {
            BorderSizePixel = 0,
            ImageTransparency = 0.7,
            BackgroundTransparency = 0.7,
            BackgroundColor3 = Color3.fromRGB(222, 171, 38),
            Size = UDim2.fromScale(0.5, 1)
        };
        local v29 = {};
        local v30 = #v29;

        if v16 then
            v16 = u2.createFragment({
                nextMagicCircleIcon = u2.createFragment({
                    nextMagicCircleIcon = u2.createElement("ImageLabel", {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Image = v16.abilityIcon,
                        Size = UDim2.fromScale(0.34, 0.11),
                        Position = UDim2.fromScale(0.035, 0.05)
                    })
                }),
                u2.createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 0,
                    ZIndex = 2,
                    Text = tostring(u15.nextTier),
                    TextColor3 = ColorUtil.BLACK,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    Size = UDim2.fromScale(0.2, 0.06),
                    Position = UDim2.fromScale(0.11, 0.075),
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    BackgroundColor3 = Color3.fromRGB(250, 20, 255)
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(90, 90)
                    }) })
            });
        end;

        if v16 then
            v29[v30 + 1] = v16;
        end;

        local v31 = #v29;
        local v32 = {
            Transparency = 0.2,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.175, 0.65),
            Position = UDim2.fromScale(0.2, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(33, 33, 33)
        };
        local v33 = {};
        local v34 = {
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0)
        };
        local v35 = {};
        local v36 = #v35;

        for i, v in (function() -- Line: 147
            -- upvalues: u11 (copy), u2 (ref)
            local v37 = false;
            local v38 = 0;
            local v39 = {};

            while true do
                if v37 then
                    v38 = v38 + 1;
                else
                    v37 = true;
                end;

                if v38 >= u11 - 1 then
                    return v39;
                end;

                local v40 = u2.createFragment({
                    Divider = u2.createElement("Frame", {
                        BackgroundTransparency = 0.2,
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        Size = UDim2.fromScale(1, 0.01),
                        AnchorPoint = Vector2.new(0.5, 0),
                        Position = UDim2.fromScale(0.5, (v38 + 1) / u11),
                        BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    })
                });
                table.insert(v39, v40);
            end;
        end)() do
            v35[v36 + i] = v;
        end;

        v33.PillDividersWrapper = u2.createElement(Empty, v34, v35);
        local v41 = {};
        local progress = u5.progress;

        if progress == nil then
            progress = 1 * v7;
        end;

        v41.Size = UDim2.fromScale(1, progress);
        v41.Position = UDim2.fromScale(0, 1);
        v41.AnchorPoint = Vector2.new(0, 1);
        v41.BackgroundColor3 = Color3.fromRGB(255, 0, 230);
        v41.Transparency = 0.1;
        v41.BorderSizePixel = 0;
        v33.InnerProgressBar = u2.createElement("Frame", v41, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }) });
        v33[#v33 + 1] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        });
        v29.OuterProgressBar = u2.createElement("Frame", v32, v33);
        v29.currentMagicCircleIcon = u2.createElement("ImageLabel", {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Image = u15.abilityIcon,
            Size = UDim2.fromScale(0.34, 0.11),
            Position = UDim2.fromScale(0.035, 0.85)
        });
        v29[v31 + 1] = u2.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 0,
            ZIndex = 2,
            Text = tostring(u13),
            TextColor3 = ColorUtil.BLACK,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            Size = UDim2.fromScale(0.2, 0.06),
            Position = UDim2.fromScale(0.11, 0.875),
            FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            BackgroundColor3 = Color3.fromRGB(250, 20, 255)
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(90, 90)
            }) });
        local v42 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Size = UDim2.fromScale(0.6, 0.86),
            Position = UDim2.fromScale(0.6, 0.5),
            AnchorPoint = Vector2.new(0.4, 0.5)
        };
        local v43 = {};
        local v44 = #v43;

        for i, v in (function() -- Line: 235
            -- upvalues: SorcererBalance (ref), u15 (copy), BedwarsImageId (ref), u5 (copy), u9 (copy), u2 (ref)
            local v45 = SorcererBalance.getSorcererTierData(SorcererBalance.HIGHEST_TIER);
            local v46 = false;
            local v47 = 1;
            local v48 = {};

            while true do
                if v46 then
                    v47 = v47 + 1;
                else
                    v46 = true;
                end;

                if v47 > v45.maxSpellCharges then
                    return v48;
                end;

                local v49 = {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 0.17),
                    BackgroundColor3 = Color3.fromRGB(33, 33, 33),
                    Visible = v47 <= u15.maxSpellCharges,
                    LayoutOrder = v45.maxSpellCharges - v47
                };
                local v50 = {};
                local _ = #v50;
                local v51 = {
                    BorderSizePixel = 100,
                    BackgroundTransparency = 1,
                    Image = BedwarsImageId.ALCHEMY_CRYSTAL_EMPTY_SLOT,
                    ScaleType = Enum.ScaleType.Fit,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    Visible = v47 <= u15.maxSpellCharges,
                    BorderColor3 = Color3.fromRGB(33, 33, 33)
                };
                local v52 = {};
                local _ = #v52;
                local v53 = {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.49, 0.52),
                    Size = UDim2.fromScale(0.98, 0.96)
                };
                local v54 = {};
                local _ = #v54;
                local v55 = {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    Image = BedwarsImageId.ALCHEMY_CRYSTAL,
                    ScaleType = Enum.ScaleType.Fit,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1)
                };
                local spellCharges = u5.spellCharges;

                if spellCharges == nil then
                    spellCharges = u9;
                end;

                v55.Visible = v47 <= spellCharges;
                v54.CrystalBackground = u2.createElement("ImageLabel", v55);
                v52["ActiveCrystalSlot" .. tostring(u15.maxSpellCharges - v47)] = u2.createElement("Frame", v53, v54);
                v50.CrystalBackground = u2.createElement("ImageLabel", v51, v52);
                local v56 = u2.createFragment({
                    ["InactiveCrystalSlot" .. tostring(v45.maxSpellCharges - v47)] = u2.createElement("Frame", v49, v50)
                });
                table.insert(v48, v56);
            end;
        end)() do
            v43[v44 + i] = v;
        end;

        local v57 = #v43;
        v43[v57 + 1] = u2.createElement("TextLabel", {
            Text = "Charges",
            TextScaled = true,
            BackgroundTransparency = 1,
            TextColor3 = ColorUtil.BLACK,
            AutomaticSize = Enum.AutomaticSize.XY,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Bottom,
            FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(0.8, 0.05),
            LayoutOrder = SorcererBalance.getSorcererTierData(SorcererBalance.HIGHEST_TIER).maxSpellCharges + 1
        });
        v43[v57 + 2] = u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.01),
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        v29.CrystalContainer = u2.createElement("Frame", v42, v43);
        v29[v31 + 2] = u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 0.3333333333333333
        });
        v29[v31 + 3] = u2.createElement("UIStroke", {
            Thickness = 1,
            Transparency = 0.5,
            Color = Color3.fromRGB(255, 255, 0)
        });
        v29[v31 + 4] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        });
        v27.OuterContainer = u2.createElement("ImageLabel", v28, v29);
        v27[#v27 + 1] = u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 0.75
        });
        v25[#v25 + 1] = u2.createElement("Frame", v26, v27);

        return u2.createFragment({
            SpellScreenGUI = u2.createElement("ScreenGui", v24, v25)
        });
    end)
};