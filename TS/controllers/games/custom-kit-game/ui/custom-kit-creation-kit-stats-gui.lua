-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local TextInputComponent = v1.TextInputComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CustomKitConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-constants").CustomKitConstants;
local CustomKitUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil;
local CustomKitCreation_AbilitySlot = RuntimeLib.import(script, script.Parent, "custom-kit-creation-ability-slot").CustomKitCreation_AbilitySlot;
local CustomKitCreation_StatSlot = RuntimeLib.import(script, script.Parent, "custom-kit-creation-stat-slot").CustomKitCreation_StatSlot;

return {
    CustomKitCreation_KitStatsGUI = v5.new(u4)(function(u6, p7) -- Line: 16
        -- upvalues: u3 (copy), u2 (copy), u4 (copy), CustomKitCreation_AbilitySlot (copy), CustomKitUtil (copy), DeviceUtil (copy), Empty (copy), TextInputComponent (copy), CustomKitConstants (copy), CustomKitCreation_StatSlot (copy), AutoCanvasScrollingFrame (copy)
        local useEffect = p7.useEffect;
        local u8, u9 = p7.useState(u6.CurrentKit);
        local u10 = u3.new();
        useEffect(function() -- Line: 21
            -- upvalues: u10 (copy)
            return function() -- Line: 22
                -- upvalues: u10 (ref)
                u10:DoCleaning();
            end;
        end, {});

        local function _(p11) -- Line: 30
            -- upvalues: u6 (copy), u8 (copy)
            u6.OnAbilityClicked(p11);
            u6.OnPointsChanged(u8);
        end;

        local function u17(u12) -- Line: 34
            -- upvalues: u8 (copy), u9 (copy), u6 (copy)
            local function _(p13, p14) -- Line: 36
                -- upvalues: u12 (copy)
                return p14 ~= u12;
            end;

            local v15 = 0;
            local v16 = {};

            for i, v in u8.abilities do
                if i - 1 ~= u12 == true then
                    v15 = v15 + 1;
                    v16[v15] = v;
                end;
            end;

            u8.abilities = v16;
            u9(u8);
            u6.OnDeleteAbilityClicked(u12);
            u6.OnPointsChanged(u8);
        end;

        local v18 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v19 = {};
        local v20 = u2.entries(u8.abilities);

        local function v23(p21, u22) -- Line: 60
            -- upvalues: u4 (ref), CustomKitCreation_AbilitySlot (ref), CustomKitUtil (ref), u8 (copy), u6 (copy), u17 (copy)
            local _ = p21[1];
            local _ = p21[2];

            return u4.createElement(CustomKitCreation_AbilitySlot, {
                Index = 0,
                LayoutOrder = u22 + 100,
                Ability = CustomKitUtil.getAbilityInSlot(u8, u22),

                OnClicked = function() -- Line: 67, Name: OnClicked
                    -- upvalues: u22 (copy), u6 (ref), u8 (ref)
                    u6.OnAbilityClicked(u22);
                    u6.OnPointsChanged(u8);
                end,

                OnDeleteClicked = function() -- Line: 70, Name: OnDeleteClicked
                    -- upvalues: u17 (ref), u22 (copy), u6 (ref)
                    u17(u22);
                    u6.OnChangesMade();
                end
            });
        end;

        local v24 = table.create(#v20);

        for i, v in v20 do
            v24[i] = v23(v, i - 1, v20);
        end;

        local v25 = {
            WaitForAbsoluteSize = true,
            AdditionalSpace = 50,
            ScrollingFrameProps = {
                Size = UDim2.fromScale(1, 1),
                ScrollingDirection = Enum.ScrollingDirection.Y
            }
        };
        local v27 = {
            u4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 0),
                PaddingBottom = UDim.new(0, 10),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }),
            u4.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 8)
            }),
            CustomKitCreation_KitStats_NameLabel = u4.createElement("TextLabel", {
                AutomaticSize = "X",
                Text = "NAME",
                TextTransparency = 0,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = -100,
                Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 30 or 45),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextSize = DeviceUtil.isSmallScreen() and 18 or 24,
                TextXAlignment = Enum.TextXAlignment.Left
            }),
            u4.createElement(Empty, {
                LayoutOrder = -99,
                Size = UDim2.new(1, 0, 0, 45)
            }, {
                CustomKitCreation_KitStats_NameInput = u4.createElement(TextInputComponent, {
                    MaxCharacters = 20,
                    TextBox = {
                        PlaceholderText = "Kit Name",
                        ClearTextOnFocus = false,
                        Size = UDim2.fromScale(1, 1),
                        Text = u6.CurrentKit.name,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextSize = DeviceUtil.isSmallScreen() and 24 or 28
                    },

                    OnFocusLost = function(p26) -- Line: 129, Name: OnFocusLost
                        -- upvalues: u6 (copy)
                        u6.CurrentKit.name = p26;
                        u6.OnNameChanged(u6.CurrentKit);
                        u6.OnChangesMade();
                    end
                }, { u4.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.02, 0),
                        PaddingBottom = UDim.new(0.02, 0),
                        PaddingLeft = UDim.new(0.02, 0),
                        PaddingRight = UDim.new(0.02, 0)
                    }) })
            }),
            CustomKitCreation_KitStats_Label1 = u4.createElement("TextLabel", {
                AutomaticSize = "X",
                Text = "ABILITY",
                TextTransparency = 0,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 30 or 45),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextSize = DeviceUtil.isSmallScreen() and 18 or 24,
                TextXAlignment = Enum.TextXAlignment.Left
            })
        };
        local v28 = #v27;

        for i, v in v24 do
            v27[v28 + i] = v;
        end;

        local v29 = #v27;
        local v30;

        if #u8.abilities < CustomKitConstants.MaxAbilities then
            v30 = u4.createElement(CustomKitCreation_AbilitySlot, {
                Index = 0,
                LayoutOrder = 200,
                Ability = nil,

                OnClicked = function() -- Line: 167, Name: OnClicked
                    -- upvalues: u8 (copy), u6 (copy)
                    u6.OnAbilityClicked(#u8.abilities);
                    u6.OnPointsChanged(u8);
                    u6.OnChangesMade();
                end,

                OnDeleteClicked = function() -- Line: 171, Name: OnDeleteClicked
                    -- upvalues: u17 (copy), u8 (copy), u6 (copy)
                    u17(#u8.abilities);
                    u6.OnChangesMade();
                end
            });
        else
            v30 = false;
        end;

        if v30 then
            v27[v29 + 1] = v30;
        end;

        local v31 = #v27;
        v27.CustomKitCreation_KitStats_Label2 = u4.createElement("TextLabel", {
            AutomaticSize = "X",
            Text = "STATS",
            TextTransparency = 0,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 300,
            Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 30 or 45),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextSize = DeviceUtil.isSmallScreen() and 18 or 24,
            TextXAlignment = Enum.TextXAlignment.Left
        });
        local v32 = u2.entries(u8.stats);

        local function v39(p33, p34) -- Line: 194
            -- upvalues: u4 (ref), CustomKitCreation_StatSlot (ref), CustomKitConstants (ref), u8 (copy), CustomKitUtil (ref), u9 (copy), u6 (copy)
            local v35 = p33[1];
            local u36 = p33[2];

            return u4.createElement(CustomKitCreation_StatSlot, {
                LayoutOrder = 400 + ((table.find(CustomKitConstants.StatOrder, v35) or 0) - 1),
                CustomKit = u8,
                StatType = v35,
                StatLevel = u36,

                OnDecreaseStatLevelClick = function(p37) -- Line: 202, Name: OnDecreaseStatLevelClick
                    -- upvalues: CustomKitUtil (ref), u8 (ref), u36 (copy), u9 (ref), u6 (ref)
                    if CustomKitUtil.canDecreaseStat(u8, p37, u36) then
                        u8.stats[p37] = u36 - 1;
                        u9(u8);
                        u6.OnPointsChanged(u8);
                        u6.OnChangesMade();
                    end;
                end,

                OnIncreaseStatLevelClick = function(p38) -- Line: 213, Name: OnIncreaseStatLevelClick
                    -- upvalues: CustomKitUtil (ref), u8 (ref), u36 (copy), u9 (ref), u6 (ref)
                    if CustomKitUtil.canIncreaseStat(u8, p38, u36) then
                        u8.stats[p38] = u36 + 1;
                        u9(u8);
                        u6.OnPointsChanged(u8);
                        u6.OnChangesMade();
                    end;
                end
            });
        end;

        local v40 = table.create(#v32);

        for i, v in v32 do
            v40[i] = v39(v, i - 1, v32);
        end;

        for i, v in v40 do
            v27[v31 + i] = v;
        end;

        v19[#v19 + 1] = u4.createElement(AutoCanvasScrollingFrame, v25, v27);

        return u4.createFragment({
            CustomKitCreation_KitStatsGUI = u4.createElement(Empty, v18, v19)
        });
    end)
};