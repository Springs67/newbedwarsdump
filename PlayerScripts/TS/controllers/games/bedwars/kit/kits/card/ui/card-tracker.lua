-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local UILayers = v1.UILayers;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "card", "card-util");
local CardConstants = v4.CardConstants;
local CardUpgrades = v4.CardUpgrades;
local CardUtil = v4.CardUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local CardSelectionApp = RuntimeLib.import(script, script.Parent, "card-selection").CardSelectionApp;
local u5 = Color3.fromHex("fcfbf8");
local u6 = nil;

local function v67(p7, p8) -- Line: 27
    -- upvalues: u2 (copy), Flamework (copy), CardUtil (copy), DeviceUtil (copy), default (copy), TweenService (copy), CardConstants (copy), CardUpgrades (copy), ColorUtil (copy), u5 (copy), u6 (ref)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local u9 = u2.createRef();
    local u10 = u2.createRef();
    local v11 = (Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("KitSecondary") or {})[1];

    if v11 ~= nil then
        v11 = v11.Name;
    end;

    local u12 = false;
    local u13 = 0;
    local u14 = {};
    local v15, u16 = useState(u12);
    local v17, u18 = useState(u13);
    local v19, u20 = useState(u14);
    local cardProgress = p7.cardProgress;

    if cardProgress == nil then
        cardProgress = v17;
    end;

    local v21 = CardUtil.getProgressPercent(cardProgress);
    local cardProgress2 = p7.cardProgress;

    if cardProgress2 ~= nil then
        v17 = cardProgress2;
    end;

    local u22 = CardUtil.getTierFromProgress(v17);
    local u23 = p7.cardUpgrades or v19;
    useEffect(function() -- Line: 63
        -- upvalues: u9 (copy), u10 (copy), DeviceUtil (ref), default (ref), u12 (ref), u16 (copy), u13 (ref), u18 (copy), u14 (ref), u20 (copy), TweenService (ref)
        local v24 = u9:getValue();

        if not v24 then
            return nil;
        end;

        local v25 = u10:getValue();

        if not v25 then
            return nil;
        end;

        local u26, u27, u28;

        if DeviceUtil.isHoarceKat() then
            u26 = nil;
            u27 = nil;
            u28 = nil;
        else
            u27 = default.Client:WaitFor("CardUpgradeUpdate"):expect():Connect(function(p29) -- Line: 77
                -- upvalues: u12 (ref), u16 (ref)
                u12 = p29.upgradeAvailable;
                u16(u12);
            end);
            u26 = default.Client:WaitFor("CardProgressUpdate"):expect():Connect(function(p30) -- Line: 81
                -- upvalues: u13 (ref), u18 (ref)
                u13 = p30.progress;
                u18(u13);
            end);
            u28 = default.Client:WaitFor("CardUpgradeUpdate"):expect():Connect(function(p31) -- Line: 85
                -- upvalues: u14 (ref), u20 (ref)
                u14 = p31.upgrades;
                u20(u14);
            end);
        end;

        local function _(p32) -- Line: 93
            return p32.Name == "CardIcon";
        end;

        local v33 = 0;
        local v34 = {};
        local u35 = {};

        for i, descendant in v24:GetDescendants() do
            local _ = i - 1;

            if descendant.Name == "CardIcon" == true then
                v33 = v33 + 1;
                v34[v33] = descendant;
            end;
        end;

        local function v38(p36) -- Line: 107
            -- upvalues: TweenService (ref), u35 (copy)
            local v37 = TweenService:Create(p36, TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                Rotation = 360
            });
            table.insert(u35, v37);
            v37:Play();
        end;

        for i, v in v34 do
            v38(v, i - 1, v34);
        end;

        local v39 = TweenService:Create(v25, TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
            Rotation = 360
        });
        table.insert(u35, v39);
        v39:Play();

        return function() -- Line: 125
            -- upvalues: DeviceUtil (ref), u26 (ref), u27 (ref), u28 (ref), u35 (copy)
            if not DeviceUtil.isHoarceKat() then
                u26:Disconnect();
                u27:Disconnect();
                u28:Disconnect();
            end;

            local function _(p40) -- Line: 131
                return p40:Destroy();
            end;

            for i, v in u35 do
                local _ = i - 1;
                v:Destroy();
            end;
        end;
    end, {});
    local v41 = {};
    local v42 = {
        Transparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.2, 0.34),
        Position = UDim2.fromScale(0.025, DeviceUtil.isMobileControls() and 0.25 or 0.3)
    };
    local v43 = {
        ContainerGlow = u2.createElement("ImageLabel", {
            Image = "rbxassetid://13835817025",
            BorderSizePixel = 0,
            ImageTransparency = 0.7,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.5, 1),
            Position = UDim2.fromScale(-0.025, -0.04)
        }, { u2.createElement("UIScale", {
                Scale = 1.05
            }), u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 0.3541666666666667
            }) })
    };
    local v44 = #v43;
    local v45 = {
        Image = "rbxassetid://13835816889",
        BorderSizePixel = 0,
        ImageTransparency = 0.7,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 1)
    };
    local v46 = {};
    local v47 = #v46;
    local v48 = {
        [u2.Ref] = u9,
        Size = UDim2.fromScale(0.5, 0.9),
        Position = UDim2.fromScale(0.37, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true
    };
    local v49 = {};
    local v50 = #v49;
    local v51 = {
        ResetOnSpawn = false
    };

    for i, v in (function() -- Line: 188
        -- upvalues: CardConstants (ref), CardUpgrades (ref), u23 (copy), u2 (ref), ColorUtil (ref), u5 (ref), u22 (copy)
        local v52 = false;
        local v53 = 1;
        local v54 = {};

        while true do
            if v52 then
                v53 = v53 + 1;
            else
                v52 = true;
            end;

            if v53 > CardConstants.MAX_TIER then
                return v54;
            end;

            local v55 = CardUpgrades[u23[v53 - 1 + 1]];
            local v56 = {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.75, 0.19),
                BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            };
            local v57 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }) };
            local _ = #v57;
            local v58 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1)
            };
            local v59 = {};
            local v60 = v55 ~= nil;

            if v60 then
                local v61 = {};
                local image = v55.image;
                v61.Image = image == nil and "" or image;
                v61.ImageColor3 = v55.color or ColorUtil.WHITE;
                v61.ScaleType = Enum.ScaleType.Fit;
                v61.AnchorPoint = Vector2.new(0.5, 0.5);
                v61.Position = UDim2.fromScale(0.5, 0.5);
                v61.Size = UDim2.fromScale(0.9, 0.9);
                v61.BorderSizePixel = 0;
                v61.BackgroundTransparency = 1;
                v61.ZIndex = 11;
                v60 = u2.createFragment({
                    CardImage = u2.createElement("ImageLabel", v61)
                });
            end;

            local v62 = {
                BorderSizePixel = 0,
                BackgroundTransparency = 1
            };
            local v63;

            if v55 then
                v63 = u5;
            else
                v63 = ColorUtil.WHITE;
            end;

            v62.ImageColor3 = v63;
            v62.Image = v55 and "rbxassetid://13840759492" or "rbxassetid://13618318240";
            v62.ScaleType = Enum.ScaleType.Fit;
            v62.AnchorPoint = Vector2.new(0.5, 0.5);
            v62.Position = UDim2.fromScale(0.5, 0.5);
            v62.Size = UDim2.fromScale(0.9, 0.9);
            v62.Visible = v53 <= u22;
            local v64 = {
                CardIcon = u2.createElement("ImageLabel", {
                    Image = "rbxassetid://13618323195",
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ZIndex = 10,
                    ImageTransparency = v55 and 1 or 0,
                    ScaleType = Enum.ScaleType.Fit,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.9, 0.9)
                })
            };
            local v65 = #v64;

            if v60 then
                v64[v65 + 1] = v60;
            end;

            v59.CardBackground = u2.createElement("ImageLabel", v62, v64);
            v59[#v59 + 1] = u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            });
            v57["ActiveCardSlot" .. tostring(CardConstants.MAX_TIER - v53)] = u2.createElement("Frame", v58, v59);
            local v66 = u2.createFragment({
                ["InactiveCardSlot" .. tostring(CardConstants.MAX_TIER - v53)] = u2.createElement("Frame", v56, v57)
            });
            table.insert(v54, v66);
        end;
    end)() do
        v49[v50 + i] = v;
    end;

    v49[#v49 + 1] = u2.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0.01)
    });
    v46.CardContainer = u2.createElement("Frame", v48, v49);
    v46.OuterProgressBar = u2.createElement("Frame", {
        Transparency = 0.2,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.175, 0.875),
        Position = UDim2.fromScale(0.8, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    }, {
        InnerProgressBar = u2.createElement("Frame", {
            Transparency = 0.1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.5, 0.97 * (CardConstants.MAX_TIER <= u22 and 1 or v21)),
            Position = UDim2.fromScale(0.25, 0.985),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = Color3.fromRGB(255, 122, 0)
        }),
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        })
    });
    v46[v47 + 1] = u2.createElement("UIAspectRatioConstraint", {
        AspectRatio = 0.3333333333333333
    });
    v46[v47 + 2] = u2.createElement("UIStroke", {
        Thickness = 1,
        Transparency = 0.5,
        Color = Color3.fromRGB(255, 255, 0)
    });
    v46[v47 + 3] = u2.createElement("UICorner", {
        CornerRadius = UDim.new(0, 4)
    });
    v43.OuterContainer = u2.createElement("ImageLabel", v45, v46);
    v43[v44 + 1] = u2.createElement("ImageButton", {
        Image = "rbxassetid://13817404630",
        Size = UDim2.fromScale(1, 0.25),
        Position = UDim2.fromScale(-0.04, 1.0250000000000001),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,

        [u2.Event.Activated] = function() -- Line: 331
            -- upvalues: u6 (ref)
            u6();
        end,

        Visible = v15
    }, { u2.createElement("UIScale", {
            Scale = 1.05
        }), u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 4.8
        }) });
    v43[v44 + 2] = u2.createElement("ImageLabel", {
        Image = "rbxassetid://13817364372",
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0.25),
        Position = UDim2.fromScale(0, 1.05),
        Visible = v15
    }, {
        CardIcon = u2.createElement("ImageLabel", {
            [u2.Ref] = u10,
            Image = "rbxassetid://13618323195",
            Size = UDim2.fromScale(0.1, 0.5),
            Position = UDim2.fromScale(0.12, 0.49),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ZIndex = 10
        }, { u2.createElement("UIScale", {
                Scale = 4
            }) }),
        u2.createElement("TextLabel", {
            Font = "Roboto",
            RichText = true,
            TextScaled = true,
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            ZIndex = 11,
            Size = UDim2.fromScale(0.1, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.12, 0.49),
            Text = "<b>" .. (v11 == nil and "" or v11) .. "</b>",
            TextColor3 = Color3.fromRGB(255, 217, 115),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 20)
            }) }),
        u2.createElement("TextLabel", {
            Text = "<b>CHOOSE UPGRADE</b>",
            Font = "Roboto",
            RichText = true,
            TextScaled = true,
            TextTransparency = 0.1,
            BackgroundTransparency = 1,
            BorderSizePixel = 2,
            ZIndex = 11,
            Size = UDim2.fromScale(0.8, DeviceUtil.isMobileControls() and 0.5 or 0.4),
            Position = UDim2.fromScale(0.2, 0.35),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center
        }),
        u2.createElement("UIStroke", {
            Thickness = 1,
            Transparency = 0.5,
            Color = Color3.fromRGB(255, 255, 0)
        }),
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        }),
        u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 4.8
        })
    });
    v43[v44 + 3] = u2.createElement("UIAspectRatioConstraint", {
        AspectRatio = 0.75
    });
    v41[#v41 + 1] = u2.createElement("Frame", v42, v43);

    return u2.createFragment({
        CardScreenGUI = u2.createElement("ScreenGui", v51, v41)
    });
end;

u6 = function() -- Line: 423, Name: openCardMenu
    -- upvalues: Flamework (copy), CardSelectionApp (copy), UILayers (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "CardSelection",
        app = CardSelectionApp,
        layer = UILayers.MAIN
    }, {
        AppId = "CardSelection"
    });
end;

return {
    openCardMenu = u6,
    CardKit = v3.new(u2)(v67)
};