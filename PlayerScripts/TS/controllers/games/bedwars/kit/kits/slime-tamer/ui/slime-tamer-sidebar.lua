-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "slime-tamer", "slime-util");
local SlimeMeta = v5.SlimeMeta;
local SlimeType = v5.SlimeType;
local u6 = Color3.fromRGB(122, 207, 69);

return {
    SlimeTamerSidebar = v4.new(u3)(function(u7, p8) -- Line: 18
        -- upvalues: u3 (copy), u2 (copy), DeviceUtil (copy), SlimeType (copy), SlimeMeta (copy), ColorUtil (copy), u6 (copy), TooltipContainer (copy), AutoSizedText (copy)
        local useState = p8.useState;
        local useEffect = p8.useEffect;
        local u9 = u3.createRef();
        local u10, u11 = useState(0);
        local u12, u13 = useState(0);
        local u14, u15 = useState(0);
        local u16, u17 = useState(0);
        local u18, u19 = useState(0);
        local u20, u21 = useState(0);
        local u22, u23 = useState(0);
        local u24, u25 = useState(0);
        useEffect(function() -- Line: 30
            -- upvalues: u9 (copy), u2 (ref), DeviceUtil (ref), u7 (copy), SlimeType (ref), u13 (copy), u11 (copy), u15 (copy), u17 (copy), u21 (copy), u19 (copy), u23 (copy), u25 (copy)
            if not u9:getValue() then
                return nil;
            end;

            local u26 = u2.new();

            if not DeviceUtil.isHoarceKat() then
                for _, v in u7.tamedSlimeData do
                    local u27 = v:GetAttribute("SlimeType");
                    local v28 = v:GetAttribute("Friendship");

                    if u27 == SlimeType.VOID then
                        u13(v28);
                    elseif u27 == SlimeType.HEALING then
                        u11(v28);
                    elseif u27 == SlimeType.STICKY then
                        u15(v28);
                    elseif u27 == SlimeType.FROSTY then
                        u17(v28);
                    end;

                    u26:GiveTask(v:GetAttributeChangedSignal("Friendship"):Connect(function() -- Line: 61
                        -- upvalues: v (copy), u27 (copy), SlimeType (ref), u13 (ref), u11 (ref), u15 (ref), u17 (ref)
                        local v29 = v:GetAttribute("Friendship");

                        if u27 == SlimeType.VOID then
                            u13(v29);

                            return;
                        end;

                        if u27 == SlimeType.HEALING then
                            u11(v29);

                            return;
                        end;

                        if u27 == SlimeType.STICKY then
                            u15(v29);

                            return;
                        end;

                        if u27 ~= SlimeType.FROSTY then
                            return;
                        end;

                        u17(v29);
                    end));
                    local v30 = v:GetAttribute("Buff");

                    if u27 == SlimeType.VOID then
                        u21(v30);
                    elseif u27 == SlimeType.HEALING then
                        u19(v30);
                    elseif u27 == SlimeType.STICKY then
                        u23(v30);
                    elseif u27 == SlimeType.FROSTY then
                        u25(v30);
                    end;

                    u26:GiveTask(v:GetAttributeChangedSignal("Buff"):Connect(function() -- Line: 103
                        -- upvalues: v (copy), u27 (copy), SlimeType (ref), u21 (ref), u19 (ref), u23 (ref), u25 (ref)
                        local v31 = v:GetAttribute("Buff");

                        if u27 == SlimeType.VOID then
                            u21(v31);

                            return;
                        end;

                        if u27 == SlimeType.HEALING then
                            u19(v31);

                            return;
                        end;

                        if u27 == SlimeType.STICKY then
                            u23(v31);

                            return;
                        end;

                        if u27 ~= SlimeType.FROSTY then
                            return;
                        end;

                        u25(v31);
                    end));
                end;
            end;

            return function() -- Line: 127
                -- upvalues: DeviceUtil (ref), u26 (copy)
                if not DeviceUtil.isHoarceKat() then
                    u26:DoCleaning();
                end;
            end;
        end, {});
        local v32 = {};
        local v33 = {
            Transparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.2, 0.34),
            Position = UDim2.fromScale(0.025, DeviceUtil.isMobileControls() and 0.25 or 0.3)
        };
        local v34 = {};
        local v35 = {
            Image = "rbxassetid://15185871843",
            ImageTransparency = 0.3,
            BorderSizePixel = 3,
            BackgroundTransparency = 1,
            ScaleType = "Crop",
            ImageColor3 = Color3.fromRGB(63, 128, 59),
            Size = UDim2.fromScale(0.5, 1)
        };
        local v36 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), u3.createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0.1,
                Color = Color3.fromRGB(50, 104, 49)
            }) };
        local _ = #v36;
        local v37 = {
            [u3.Ref] = u9,
            Size = UDim2.fromScale(1, 0.95),
            Position = UDim2.fromScale(0.5, 0.495),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = false
        };
        local v38 = { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 0.3333333333333333
            }), u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Padding = UDim.new(0.02)
            }) };
        local v39 = #v38;
        local v40 = {
            ResetOnSpawn = false
        };

        for i, v in (function() -- Line: 189
            -- upvalues: u10 (copy), u12 (copy), u14 (copy), u16 (copy), u18 (copy), u20 (copy), u22 (copy), u24 (copy), SlimeMeta (ref), u7 (copy), u3 (ref), ColorUtil (ref), u6 (ref), TooltipContainer (ref), AutoSizedText (ref)
            local v41 = {
                u10,
                u12,
                u14,
                u16
            };
            local v42 = {
                u18,
                u20,
                u22,
                u24
            };
            local v43 = false;
            local v44 = 0;
            local v45 = {};

            while true do
                if v43 then
                    v44 = v44 + 1;
                else
                    v43 = true;
                end;

                if v44 >= 4 then
                    return v45;
                end;

                local v46 = v41[v44 + 1];
                local v47 = v42[v44 + 1];
                local v48 = SlimeMeta[v44];
                local v49 = table.find(u7.tamedSlimes, v44) ~= nil;

                if v49 then
                    local createFragment = u3.createFragment;
                    local v50 = {};
                    local v51 = "SlotDetails_" .. tostring(v44);
                    local createElement = u3.createElement;
                    local v52 = {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(0, 0),
                        Position = UDim2.fromScale(1.05, 0),
                        Size = UDim2.fromScale(0.4, 1)
                    };
                    local v53 = {};
                    local v54 = "Outline_" .. tostring(v44);
                    local createElement2 = u3.createElement;
                    local v55 = {
                        Image = "rbxassetid://15310207144",
                        ImageTransparency = 0.1,
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        ZIndex = 12
                    };
                    local v56;

                    if v46 == 100 then
                        v56 = Color3.fromRGB(171, 41, 28);
                    else
                        v56 = Color3.fromRGB(50, 104, 49);
                    end;

                    v55.ImageColor3 = v56;
                    v55.ScaleType = Enum.ScaleType.Fit;
                    v55.AnchorPoint = Vector2.new(0.5, 0);
                    v55.Position = UDim2.fromScale(0.5, 0.5);
                    v55.Size = UDim2.fromScale(1, 0.5);
                    v53[v54] = createElement2("ImageLabel", v55);
                    local v57 = "SlimeFriendship_" .. tostring(v44);
                    local createElement3 = u3.createElement;
                    local v58 = {
                        Image = "rbxassetid://15293239499",
                        ImageTransparency = 0.15,
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        ZIndex = 11,
                        ImageColor3 = ColorUtil.WHITE,
                        ScaleType = Enum.ScaleType.Fit,
                        AnchorPoint = Vector2.new(0.5, 0),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(1, 0.5)
                    };
                    local v59 = {};
                    local createElement4 = u3.createElement;
                    local v60 = {
                        Rotation = -90
                    };
                    local v61;

                    if v46 == 100 then
                        v61 = ColorSequence.new(Color3.fromRGB(194, 52, 39));
                    else
                        v61 = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, ColorUtil.WHITE),
                            ColorSequenceKeypoint.new(0.5, ColorUtil.WHITE),
                            ColorSequenceKeypoint.new(0.5001, Color3.fromRGB(20, 20, 20)),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
                        });
                    end;

                    v60.Color = v61;
                    v60.Offset = Vector2.new(0, 0.5 - v46 / 100);
                    v59[1] = createElement4("UIGradient", v60);
                    v53[v57] = createElement3("ImageLabel", v58, v59);
                    v50[v51] = createElement("Frame", v52, v53);
                    v49 = createFragment(v50);
                end;

                local v62 = {
                    BackgroundTransparency = 0.3,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(0.75, 0.24),
                    BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                };
                local v63 = {};
                local v64 = u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                });
                local createElement = u3.createElement;
                local v65 = {
                    Transparency = 0.1,
                    Thickness = u7.selectedSlimeType == v44 and 2 or 1
                };
                local v66;

                if u7.selectedSlimeType == v44 then
                    v66 = u6;
                else
                    v66 = Color3.fromRGB(50, 104, 49);
                end;

                v65.Color = v66;
                v63[1], v63[2] = v64, createElement("UIStroke", v65);
                local v67 = #v63;

                if v49 then
                    v63[v67 + 1] = v49;
                end;

                local _ = #v63;
                local v68 = v48 ~= nil;

                if v68 then
                    local v69 = {};
                    local image = v48.image;
                    v69.Image = image == nil and "" or image;
                    local v70;

                    if table.find(u7.tamedSlimes, v44) == nil then
                        v70 = ColorUtil.BLACK;
                    else
                        v70 = nil;
                    end;

                    v69.ImageColor3 = v70;
                    v69.ImageTransparency = table.find(u7.tamedSlimes, v44) == nil and 0.6 or 0;
                    v69.ScaleType = Enum.ScaleType.Fit;
                    v69.AnchorPoint = Vector2.new(0.5, 0.5);
                    v69.Position = UDim2.fromScale(0.5, 0.5);
                    v69.Size = UDim2.fromScale(0.9, 0.9);
                    v69.BorderSizePixel = 0;
                    v69.BackgroundTransparency = 1;
                    v69.ZIndex = 11;
                    local createFragment = u3.createFragment;
                    local v71 = {};
                    local createElement2 = u3.createElement;
                    local v72 = {};
                    local createElement3 = u3.createElement;
                    local v73 = {};
                    local v74 = u3.createElement(AutoSizedText, {
                        TextSize = 16,
                        Text = v48.name,
                        Font = Enum.Font.SourceSansBold,
                        TextColor3 = v48.color,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Limits = Vector2.new(300, 60)
                    });
                    local v75 = u3.createElement(AutoSizedText, {
                        TextSize = 14,
                        Text = v48.description,
                        Font = Enum.Font.SourceSansSemibold,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Limits = Vector2.new(300, 60)
                    });
                    local createElement4 = u3.createElement;
                    local v76 = {
                        TextSize = 14
                    };
                    local buffDescription = v48.buffDescription;
                    local v77 = math.round(v47 * 100);
                    local v78 = tostring(v77);
                    local v79 = math.round(v48.maxBuffPercent * 100);
                    v76.Text = buffDescription .. ": " .. v78 .. "% (Max: " .. tostring(v79) .. "%)";
                    v76.Font = Enum.Font.SourceSansSemibold;
                    v76.TextXAlignment = Enum.TextXAlignment.Left;
                    v76.Limits = Vector2.new(300, 60);
                    v73[1], v73[2], v73[3] = v74, v75, createElement4(AutoSizedText, v76);
                    v72[1] = createElement3(TooltipContainer, {}, v73);
                    v71.SlimeImage = createElement2("ImageLabel", v69, v72);
                    v68 = createFragment(v71);
                end;

                local v80 = {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1)
                };
                local v81 = { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }) };
                local v82 = #v81;

                if v68 then
                    v81[v82 + 1] = v68;
                end;

                v63["SlotContent_" .. tostring(v44)] = u3.createElement("Frame", v80, v81);
                local v83 = u3.createFragment({
                    ["Slot_" .. tostring(v44)] = u3.createElement("Frame", v62, v63)
                });
                table.insert(v45, v83);
            end;
        end)() do
            v38[v39 + i] = v;
        end;

        v36.SlimeContainer = u3.createElement("Frame", v37, v38);
        v34.OuterContainer = u3.createElement("ImageLabel", v35, v36);
        v34[#v34 + 1] = u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 0.75
        });
        v32[#v32 + 1] = u3.createElement("Frame", v33, v34);

        return u3.createFragment({
            SlimeTamerGUI = u3.createElement("ScreenGui", v40, v32)
        });
    end)
};