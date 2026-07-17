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
local ItemCatalogCollection = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item-catalog", "item-catalog-collection").ItemCatalogCollection;
local ItemCatalogMetaCollectionMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item-catalog", "item-catalog-collection-meta").ItemCatalogMetaCollectionMeta;
local ItemCatalogUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item-catalog", "item-catalog-util").ItemCatalogUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v51 = v4.new(u3)(function(u7, p8) -- Line: 26
    -- upvalues: u3 (copy), u2 (copy), RunService (copy), ContextActionService (copy), getItemMeta (copy), ItemCatalogCollection (copy), ItemCatalogMetaCollectionMeta (copy), ItemCatalogUtil (copy), ColorUtil (copy), Empty (copy), SoundManager (copy), GameSound (copy), ProgressBar (copy), DeviceUtil (copy), GamepadUIUtil (copy), SlideIn (copy)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local u9 = u3.createRef();
    local v10, u11 = useState(32);
    local v12, u13 = useState(0);
    useEffect(function() -- Line: 32
        -- upvalues: u2 (ref), u9 (copy), u11 (copy), RunService (ref), u13 (copy), u7 (copy), ContextActionService (ref)
        local u14 = u2.new();
        local u15 = u9:getValue();

        if u15 then
            u14:GiveTask(u15:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 37
                -- upvalues: u15 (copy), u11 (ref)
                u11((math.round(u15.AbsoluteSize.Y / 544 * 32)));
            end));
        end;

        u14:GiveTask(RunService.Heartbeat:Connect(function(u16) -- Line: 43
            -- upvalues: u13 (ref)
            u13(function(p17) -- Line: 44
                -- upvalues: u16 (copy)
                return p17 + u16;
            end);
        end));
        local u18 = true;
        u14:GiveTask(function() -- Line: 49
            -- upvalues: u18 (ref)
            u18 = false;
        end);
        task.delay(15, function() -- Line: 52
            -- upvalues: u18 (ref), u7 (ref)
            if not u18 then
                return nil;
            end;

            u7.closeMenu();
        end);
        ContextActionService:BindAction("close-item-catalog-popup", function(p19, p20, p21) -- Line: 60
            -- upvalues: u7 (ref)
            if p20 ~= Enum.UserInputState.Begin then
                return nil;
            end;

            u7.closeMenu();
        end, false, Enum.KeyCode.ButtonB);
        u14:GiveTask(function() -- Line: 66
            -- upvalues: ContextActionService (ref)
            ContextActionService:UnbindAction("close-item-catalog-popup");
        end);

        return function() -- Line: 69
            -- upvalues: u14 (copy)
            u14:DoCleaning();
        end;
    end, {});
    local v22 = getItemMeta(u7.itemType);
    local itemCatalog = v22.itemCatalog;
    local v23;

    if itemCatalog == nil then
        v23 = itemCatalog;
    else
        v23 = itemCatalog.summary;
    end;

    if v23 == nil then
        local description = v22.description;
        v23 = description == nil and "" or description;
    end;

    if itemCatalog ~= nil then
        itemCatalog = itemCatalog.collection;
    end;

    if itemCatalog == nil then
        itemCatalog = ItemCatalogCollection.DEFAULT;
    end;

    local v24 = ItemCatalogMetaCollectionMeta[itemCatalog];
    local v25 = 0;

    for _ in ItemCatalogUtil:getAllCollectionElements(itemCatalog) do
        v25 = v25 + 1;
    end;

    local v26 = {};
    local v27 = {
        StartPosition = UDim2.fromScale(0.1, 0)
    };
    local v28 = {};
    local v29 = {
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
    local v30 = {
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
                Text = "Item Catalog",
                Size = UDim2.fromScale(0.5446985446985447, 0.5789473684210527),
                TextColor3 = ColorUtil.hexColor(16771765),
                Font = Enum.Font.ArialBold,
                Position = UDim2.fromScale(0.5, 0.05263157894736842),
                AnchorPoint = Vector2.new(0.5, 0)
            }) })
    };
    local v31 = #v30;
    local v32 = {
        LayoutOrder = 2,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0.3602941176470588)
    };
    local v33 = {};
    local v34 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.7760252365930599, 0.8520408163265306),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v35 = { u3.createElement("UIListLayout", {
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
                    Color = ColorUtil.hexColor(16758784)
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
    local v36 = {
        LayoutOrder = 2,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.7032520325203252, 0.718562874251497)
    };
    local v37 = { u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            Text = v22.displayName,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.fromScale(1, 0.2833333333333333),
            TextColor3 = ColorUtil.hexColor(16318462),
            Font = Enum.Font.ArialBold
        }) };
    local v38 = #v37;
    local displayLabel = v24.displayLabel;

    if displayLabel then
        local createElement = u3.createElement;
        local v39 = {
            BackgroundTransparency = 1,
            TextScaled = true
        };
        local name = v24.displayLabel.name;
        local v40 = math.round(100 * (u7.collectionProgress / v25));
        v39.Text = name .. " (" .. tostring(v40) .. "%)";
        v39.TextXAlignment = Enum.TextXAlignment.Left;
        v39.Size = UDim2.fromScale(1, 0.2);
        v39.TextColor3 = v24.displayLabel.color;
        v39.Font = Enum.Font.ArialBold;
        v39.Position = UDim2.fromScale(0, 1);
        v39.AnchorPoint = Vector2.new(0, 1);
        displayLabel = createElement("TextLabel", v39);
    end;

    if displayLabel then
        v37[v38 + 1] = displayLabel;
    end;

    v35[#v35 + 1] = u3.createElement("Frame", v36, v37);
    v33[#v33 + 1] = u3.createElement("Frame", v34, v35);
    v30[v31 + 1] = u3.createElement("Frame", v32, v33);
    v30[v31 + 2] = u3.createElement("TextLabel", {
        LayoutOrder = 3,
        TextWrap = true,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.9353312302839116, 0.3088235294117647),
        TextSize = v10,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextColor3 = ColorUtil.hexColor(16318462),
        Text = v23,
        Font = Enum.Font.Arial
    });
    local v41 = {
        LayoutOrder = 3,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0.07352941176470588)
    };
    local v42 = { u3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.02050473186119874)
        }) };
    local v43 = #v42;
    local v44 = {
        Size = UDim2.fromScale(0.1719242902208202, 1),
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        TextTransparency = 0.7,
        TextColor3 = ColorUtil.hexColor(16318462),
        Text = "CLOSE",
        TextScaled = true,

        [u3.Event.Activated] = function() -- Line: 287
            -- upvalues: u7 (copy), SoundManager (ref), GameSound (ref)
            u7.closeMenu();
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end
    };
    local v45 = {};
    local v46 = #v45;
    local v47;

    if v12 > 5 then
        local createElement = u3.createElement;
        local v48 = {
            AcceptZero = true,
            BarColor = ColorUtil.hexColor(5329233),
            BarBackgroundColor = ColorUtil.hexColor(2630435)
        };
        local v49 = 1 - math.max(v12 - 5, 0) / 10;
        v48.Progress = math.clamp(v49, 0, 1);
        v48.Size = UDim2.fromScale(1, 0.08823529411764706);
        v48.Position = UDim2.fromScale(0.5, 1.02);
        v48.AnchorPoint = Vector2.new(0.5, 0);
        v47 = createElement(ProgressBar, v48);
    else
        v47 = false;
    end;

    if v47 then
        v45[v46 + 1] = v47;
    end;

    v42[v43 + 1] = u3.createElement("TextButton", v44, v45);
    local v50 = DeviceUtil.isGamepadControls() and u3.createElement("ImageLabel", {
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.08990536277602523, 1),
        Image = GamepadUIUtil:getIconForKeycode(Enum.KeyCode.ButtonB)
    }, { u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });

    if v50 then
        v42[v43 + 2] = v50;
    end;

    v30[v31 + 3] = u3.createElement("Frame", v41, v42);
    v28[#v28 + 1] = u3.createElement("ImageLabel", v29, v30);
    v26[#v26 + 1] = u3.createElement(SlideIn, v27, v28);

    return u3.createElement("ScreenGui", {}, v26);
end);

return {
    ItemCatalogPopup = v5.connect(function(p52, p53) -- Line: 326
        local v54 = {};

        for i, v in p53 do
            v54[i] = v;
        end;

        return v54;
    end)(v51)
};