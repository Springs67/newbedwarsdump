-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local GamepadUIUtil = v1.GamepadUIUtil;
local ProgressBar = v1.ProgressBar;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v6.ContextActionService;
local RunService = v6.RunService;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v59 = v4.new(u3)(function(u7, p8) -- Line: 24
    -- upvalues: u3 (copy), u2 (copy), RunService (copy), ContextActionService (copy), getItemMeta (copy), BedwarsImageId (copy), ColorUtil (copy), Empty (copy), SoundManager (copy), GameSound (copy), ProgressBar (copy), DeviceUtil (copy), GamepadUIUtil (copy), SlideIn (copy)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local u9 = u3.createRef();
    local v10, u11 = useState(32);
    local v12, u13 = useState(0);
    useEffect(function() -- Line: 30
        -- upvalues: u2 (ref), u9 (copy), u11 (copy), RunService (ref), u13 (copy), u7 (copy), ContextActionService (ref)
        local u14 = u2.new();
        local u15 = u9:getValue();

        if u15 then
            u14:GiveTask(u15:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 35
                -- upvalues: u15 (copy), u11 (ref)
                u11((math.round(u15.AbsoluteSize.Y / 544 * 32)));
            end));
        end;

        u14:GiveTask(RunService.Heartbeat:Connect(function(u16) -- Line: 41
            -- upvalues: u13 (ref)
            u13(function(p17) -- Line: 42
                -- upvalues: u16 (copy)
                return p17 + u16;
            end);
        end));
        local u18 = true;
        u14:GiveTask(function() -- Line: 47
            -- upvalues: u18 (ref)
            u18 = false;
        end);
        task.delay(15, function() -- Line: 50
            -- upvalues: u18 (ref), u7 (ref)
            if not u18 then
                return nil;
            end;

            u7.closeMenu();
        end);
        ContextActionService:BindAction("close-item-catalog-popup", function(p19, p20, p21) -- Line: 58
            -- upvalues: u7 (ref)
            if p20 ~= Enum.UserInputState.Begin then
                return nil;
            end;

            u7.closeMenu();
        end, false, Enum.KeyCode.ButtonB);
        u14:GiveTask(function() -- Line: 64
            -- upvalues: ContextActionService (ref)
            ContextActionService:UnbindAction("close-item-catalog-popup");
        end);

        return function() -- Line: 67
            -- upvalues: u14 (copy)
            u14:DoCleaning();
        end;
    end, {});
    local v22 = getItemMeta(u7.itemType);
    local tierDescription = v22.tierUpgradeElements[u7.tierLevel].tierDescription;
    local STAR_SOLID = BedwarsImageId.STAR_SOLID;
    local v23 = false;
    local v24 = 0;
    local v25 = {};

    while true do
        if v23 then
            v24 = v24 + 1;
        else
            v23 = true;
        end;

        if v24 >= u7.tierLevel then
            break;
        end;

        local v26 = u3.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = STAR_SOLID,
            Size = UDim2.fromScale(0.5, 1)
        });
        table.insert(v25, v26);
    end;

    local v27 = false;
    local v28 = 0;
    local v29 = {};

    while true do
        if v27 then
            v28 = v28 + 1;
        else
            v27 = true;
        end;

        if v28 >= #tierDescription then
            local v30 = {};
            local v31 = {
                StartPosition = UDim2.fromScale(0.1, 0)
            };
            local v32 = {};
            local v33 = {
                Size = UDim2.fromScale(0.25751421608448416, 0.35393623942745606),
                Position = UDim2.fromScale(0.9853777416734363, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                Image = "rbxassetid://15114739252",
                ImageTransparency = 0.8,
                BackgroundTransparency = 0.25,
                BackgroundColor3 = ColorUtil.BLACK,
                ScaleType = Enum.ScaleType.Crop,
                [u3.Ref] = u9
            };
            local v34 = {
                u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1.1654411764705883
                }),
                u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.04, 0)
                }),
                u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.007886435331230283, 0)
                }),
                u3.createElement(Empty, {
                    LayoutOrder = 0
                }),
                u3.createElement("ImageLabel", {
                    Image = "rbxassetid://15114724417",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.7586750788643533, 0.17463235294117646)
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 5.063157894736842
                    }), u3.createElement("TextLabel", {
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        Text = "Tier Upgrade",
                        Size = UDim2.fromScale(0.5446985446985447, 0.5789473684210527),
                        TextColor3 = ColorUtil.hexColor(16771765),
                        Font = Enum.Font.ArialBold,
                        Position = UDim2.fromScale(0.5, 0.05263157894736842),
                        AnchorPoint = Vector2.new(0.5, 0)
                    }) })
            };
            local v35 = #v34;
            local v36 = {
                LayoutOrder = 2,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.3602941176470588)
            };
            local v37 = {};
            local v38 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.7760252365930599, 0.8520408163265306),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            };
            local v39 = { u3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.026813880126182965),
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), u3.createElement("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.3394308943089431, 1),
                    Position = UDim2.fromScale(0, 0.5),
                    AnchorPoint = Vector2.new(0, 0.5)
                }, {
                    u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }),
                    u3.createElement("Frame", {
                        BackgroundTransparency = 0.85,
                        Size = UDim2.fromScale(0.718562874251497, 0.718562874251497),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = ColorUtil.BLACK
                    }, { u3.createElement("UIStroke", {
                            Thickness = 1,
                            Color = Color3.fromRGB(64, 186, 235)
                        }) }),
                    u3.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        ImageTransparency = 0.5,
                        Image = v22.image,
                        Size = UDim2.fromScale(1, 1),
                        Position = UDim2.fromScale(0.02, 0.02),
                        ImageColor3 = ColorUtil.BLACK
                    }),
                    u3.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        Image = v22.image,
                        Size = UDim2.fromScale(1, 1)
                    })
                }) };
            local v40 = {
                LayoutOrder = 2,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.7032520325203252, 0.718562874251497)
            };
            local v41 = { u3.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    Text = v22.displayName,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Size = UDim2.fromScale(1, 0.2833333333333333),
                    TextColor3 = ColorUtil.hexColor(16318462),
                    Font = Enum.Font.ArialBold
                }) };
            local v42 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0)
            };
            local v43 = { u3.createElement("UIGridLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Center",
                    CellSize = UDim2.fromScale(0.18, 0.9),
                    CellPadding = UDim2.fromScale(0.02)
                }) };
            local v44 = #v43;

            for i, v in v25 do
                v43[v44 + i] = v;
            end;

            v41[#v41 + 1] = u3.createElement("Frame", v42, v43);
            v39[#v39 + 1] = u3.createElement("Frame", v40, v41);
            v37[#v37 + 1] = u3.createElement("Frame", v38, v39);
            v34[v35 + 1] = u3.createElement("Frame", v36, v37);
            local v45 = {
                LayoutOrder = 3,
                TextWrap = true,
                Text = "",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.9, 0.4),
                TextSize = v10,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextColor3 = ColorUtil.hexColor(16318462),
                Font = Enum.Font.Arial
            };
            local v46 = { u3.createElement("UIGridLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Left",
                    FillDirectionMaxCells = 3,
                    CellSize = UDim2.fromScale(1, 0.3),
                    CellPadding = UDim2.fromScale(0.5)
                }) };
            local v47 = #v46;

            for i, v in v29 do
                v46[v47 + i] = v;
            end;

            v34[v35 + 2] = u3.createElement("TextLabel", v45, v46);
            local v48 = {
                LayoutOrder = 3,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.07352941176470588)
            };
            local v49 = { u3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    Padding = UDim.new(0.02050473186119874)
                }) };
            local v50 = #v49;
            local v51 = {
                Size = UDim2.fromScale(0.1719242902208202, 1),
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                TextTransparency = 0.7,
                TextColor3 = ColorUtil.hexColor(16318462),
                Text = "CLOSE",
                TextScaled = true,

                [u3.Event.Activated] = function() -- Line: 326
                    -- upvalues: u7 (copy), SoundManager (ref), GameSound (ref)
                    u7.closeMenu();
                    SoundManager:playSound(GameSound.UI_CLOSE_2);
                end
            };
            local v52 = {};
            local v53 = #v52;
            local v54;

            if v12 > 5 then
                local createElement = u3.createElement;
                local v55 = {
                    AcceptZero = true,
                    BarColor = ColorUtil.hexColor(5329233),
                    BarBackgroundColor = ColorUtil.hexColor(2630435)
                };
                local v56 = 1 - math.max(v12 - 5, 0) / 10;
                v55.Progress = math.clamp(v56, 0, 1);
                v55.Size = UDim2.fromScale(1, 0.08823529411764706);
                v55.Position = UDim2.fromScale(0.5, 1.02);
                v55.AnchorPoint = Vector2.new(0.5, 0);
                v54 = createElement(ProgressBar, v55);
            else
                v54 = false;
            end;

            if v54 then
                v52[v53 + 1] = v54;
            end;

            v49[v50 + 1] = u3.createElement("TextButton", v51, v52);
            local v57 = DeviceUtil.isGamepadControls() and u3.createElement("ImageLabel", {
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.08990536277602523, 1),
                Image = GamepadUIUtil:getIconForKeycode(Enum.KeyCode.ButtonB)
            }, { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });

            if v57 then
                v49[v50 + 2] = v57;
            end;

            v34[v35 + 3] = u3.createElement("Frame", v48, v49);
            v32[#v32 + 1] = u3.createElement("ImageLabel", v33, v34);
            v30[#v30 + 1] = u3.createElement(SlideIn, v31, v32);

            return u3.createElement("ScreenGui", {}, v30);
        end;

        local v58 = u3.createElement("TextLabel", {
            LayoutOrder = 3,
            TextWrap = true,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            TextSize = v10,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            TextColor3 = ColorUtil.hexColor(16318462),
            Text = "- " .. tierDescription[v28 + 1],
            Font = Enum.Font.Arial
        });
        table.insert(v29, v58);
    end;
end);

return {
    TierUpgradeNotificationPopup = v5.connect(function(p60, p61) -- Line: 365
        local v62 = {};

        for i, v in p61 do
            v62[i] = v;
        end;

        return v62;
    end)(v59)
};