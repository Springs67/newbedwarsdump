-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MobileLayoutUtil = RuntimeLib.import(script, script.Parent, "mobile-layout-util").MobileLayoutUtil;
local u6 = {
    KitPrimary = "Kit1",
    KitSecondary = "Kit2",
    KitTertiary = "Kit3",
    ItemPrimary = "Item1",
    ItemSecondary = "Item2",
    MiscPrimary = "Misc1",
    MiscSecondary = "Misc2"
};
local ButtonMaxSize = MobileLayoutUtil.ButtonMaxSize;
local ButtonMinSize = MobileLayoutUtil.ButtonMinSize;
local u7 = v5.new();
local u8 = v5.new();

return {
    ButtonUpdateStartSignal = u7,
    ButtonUpdateEndSignal = u8,
    MobileLayoutCustomizationPlane = v4.new(u3)(function(u9, p10) -- Line: 25
        -- upvalues: u3 (copy), u1 (copy), u2 (copy), u7 (copy), u8 (copy), UserInputService (copy), ButtonMaxSize (copy), ButtonMinSize (copy), MapUtil (copy), MobileLayoutUtil (copy), Theme (copy), u6 (copy)
        local useEffect = p10.useEffect;
        local _ = p10.useValue;
        local v11, _ = p10.useState(u3.createRef());
        local u12 = u1.new();
        useEffect(function() -- Line: 31
            -- upvalues: u1 (ref), u2 (ref), u7 (ref), u8 (ref), u9 (copy)
            local u13 = u1.new();

            local function u16(u14) -- Line: 33
                -- upvalues: u2 (ref), u7 (ref), u8 (ref)
                local v15 = u2("UIDragDetector", {
                    Enabled = true,
                    Parent = u14,
                    BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.Automatic
                });

                return { v15, v15.DragStart:Connect(function() -- Line: 39
                        -- upvalues: u7 (ref), u14 (copy)
                        u7:Fire(u14);
                    end), (v15.DragEnd:Connect(function() -- Line: 42
                        -- upvalues: u8 (ref), u14 (copy)
                        u8:Fire(u14);
                    end)) };
            end;

            task.delay(1, function() -- Line: 47
                -- upvalues: u9 (ref), u16 (copy), u13 (copy)
                local function _(p17, p18) -- Line: 49
                    -- upvalues: u16 (ref), u13 (ref)
                    local v19 = u16(p18:getValue());
                    local _ = v19[1];
                    local v20 = v19[3];
                    u13:GiveTask(v19[2]);
                    u13:GiveTask(v20);
                end;

                for i, _ in u9.imageButtons do
                    local v21 = u16(i:getValue());
                    local _ = v21[1];
                    local v22 = v21[3];
                    u13:GiveTask(v21[2]);
                    u13:GiveTask(v22);
                end;

                local function _(p23, p24) -- Line: 61
                    -- upvalues: u16 (ref), u13 (ref)
                    local v25 = u16(p24:getValue());
                    local _ = v25[1];
                    local v26 = v25[3];
                    u13:GiveTask(v25[2]);
                    u13:GiveTask(v26);
                end;

                for i, _ in u9.textButtons do
                    local v27 = u16(i:getValue());
                    local _ = v27[1];
                    local v28 = v27[3];
                    u13:GiveTask(v27[2]);
                    u13:GiveTask(v28);
                end;
            end);

            return function() -- Line: 73
                -- upvalues: u13 (copy)
                return u13:DoCleaning();
            end;
        end, {});
        useEffect(function() -- Line: 77
            -- upvalues: u12 (copy), UserInputService (ref), u9 (copy), ButtonMaxSize (ref), ButtonMinSize (ref), u8 (ref), u7 (ref)
            u12:DoCleaning();
            u12:GiveTask(UserInputService.TouchPinch:Connect(function(p29, p30, p31, p32) -- Line: 79
                -- upvalues: u9 (ref), ButtonMaxSize (ref), ButtonMinSize (ref), u8 (ref), u7 (ref)
                local currentlySelected = u9.currentlySelected;
                local v33;

                if currentlySelected == nil then
                    v33 = currentlySelected;
                else
                    v33 = currentlySelected.AbsoluteSize;
                end;

                if not v33 then
                    return nil;
                end;

                local v34;

                if p30 > 1 then
                    local v35 = ButtonMaxSize - v33.Y;
                    local v36 = math.min(ButtonMaxSize - v33.X, 2);
                    v34 = math.min(v35, v36);
                else
                    local v37 = v33.Y - ButtonMinSize;
                    local v38 = math.min(v33.X - ButtonMinSize, 2);
                    v34 = math.min(v37, v38) * -1;
                end;

                currentlySelected.Size = currentlySelected.Size + UDim2.fromOffset(v34, v34);

                if p32 == Enum.UserInputState.End then
                    u8:Fire(u9.currentlySelected);

                    return;
                end;

                if p32 == Enum.UserInputState.Begin then
                    u7:Fire(u9.currentlySelected);
                end;
            end));

            return function() -- Line: 100
                -- upvalues: u12 (ref)
                u12:DoCleaning();
            end;
        end, { u9.currentlySelected });
        local v39 = MapUtil.entries(u9.imageButtons);

        local function v43(p40) -- Line: 105
            -- upvalues: u3 (ref), MobileLayoutUtil (ref), u9 (copy)
            local u41 = p40[1];
            local v42 = p40[2];

            return u3.createFragment({
                ["Layout-" .. v42.buttonType] = u3.createElement("ImageButton", {
                    [u3.Ref] = u41,
                    Image = MobileLayoutUtil.getImage(v42.buttonType),
                    ImageRectSize = MobileLayoutUtil.getImageRectSize(v42.buttonType),
                    ImageRectOffset = MobileLayoutUtil.getImageRectOffset(v42.buttonType),
                    ImageTransparency = 0.2,
                    BackgroundTransparency = 1,
                    Size = v42.size,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = v42.position,

                    [u3.Event.TouchTap] = function() -- Line: 119
                        -- upvalues: u9 (ref), u41 (copy)
                        u9.setCurrentlySelected(u41:getValue());
                    end
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), u3.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }), u3.createElement("UIStroke", {
                        Thickness = u9.currentlySelected and u9.currentlySelected == u41:getValue() and 2 or 0,
                        Color = Color3.fromRGB(255, 80, 80),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }) })
            });
        end;

        local v44 = table.create(#v39);

        for i, v in v39 do
            v44[i] = v43(v, i - 1, v39);
        end;

        local v45 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 0.07,
            BackgroundColor3 = Theme.Gray,
            ScaleType = Enum.ScaleType.Crop,
            Selectable = false,
            AutoButtonColor = false,
            Active = true,
            Modal = true,
            [u3.Ref] = v11
        };
        local v46 = {};
        local v47 = #v46;

        for i, v in v44 do
            v46[v47 + i] = v;
        end;

        local v48 = #v46;
        local v49 = MapUtil.entries(u9.textButtons);

        local function v55(p50) -- Line: 161
            -- upvalues: u3 (ref), u6 (ref), u9 (copy)
            local u51 = p50[1];
            local v52 = p50[2];
            local v53 = {
                [u3.Ref] = u51
            };
            local v54 = u6[v52.buttonType];

            if v54 == nil then
                v54 = v52.buttonType;
            end;

            v53.Text = "<b>" .. v54 .. "</b>";
            v53.FontFace = Font.fromName("Roboto");
            v53.RichText = true;
            v53.LineHeight = 2;
            v53.TextScaled = true;
            v53.TextColor3 = Color3.fromRGB(255, 255, 255);
            v53.BackgroundColor3 = Color3.fromRGB(255, 191, 66);
            v53.BackgroundTransparency = 0.2;
            v53.AnchorPoint = Vector2.new(0.5, 0.5);
            v53.Size = v52.size;
            v53.Position = v52.position;

            v53[u3.Event.TouchTap] = function() -- Line: 183
                -- upvalues: u9 (ref), u51 (copy)
                u9.setCurrentlySelected(u51:getValue());
            end;

            return u3.createFragment({
                ["Layout-" .. v52.buttonType] = u3.createElement("TextButton", v53, {
                    u3.createElement("UITextSizeConstraint", {
                        MaxTextSize = 16
                    }),
                    u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }),
                    u3.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }),
                    u3.createElement("UIStroke", {
                        Thickness = u9.currentlySelected and u9.currentlySelected == u51:getValue() and 2 or 0,
                        Color = Color3.fromRGB(255, 80, 80),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    })
                })
            });
        end;

        local v56 = table.create(#v49);

        for i, v in v49 do
            v56[i] = v55(v, i - 1, v49);
        end;

        for i, v in v56 do
            v46[v48 + i] = v;
        end;

        return u3.createFragment({
            MobileLayoutPositioningContainer = u3.createElement("ImageButton", v45, v46)
        });
    end)
};