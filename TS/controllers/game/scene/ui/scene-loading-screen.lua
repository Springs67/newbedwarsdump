-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CircularSpinner = v1.CircularSpinner;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;

return {
    SceneLoadingScreen = v4.new(u3)(function(u5, p6) -- Line: 14
        -- upvalues: u3 (copy), u2 (copy), UIUtil (copy), ColorUtil (copy), TweenService (copy), ClientSyncEvents (copy), DeviceUtil (copy), Empty (copy), CircularSpinner (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = u3.createRef();
        local u8 = u3.createRef();
        local u9 = u3.createRef();
        useEffect(function() -- Line: 20
            -- upvalues: u9 (copy), u8 (copy), u7 (copy), u2 (ref), u5 (copy), UIUtil (ref), ColorUtil (ref), TweenService (ref), ClientSyncEvents (ref)
            local u10 = u9:getValue();
            local u11 = u8:getValue();
            local v12 = u7:getValue();
            local u13 = u2.new();
            local u14 = false;

            if u10 and u11 then
                if u5.DisableEnterFade then
                    u11.Transparency = 1;
                else
                    local u15 = UIUtil:setContainerTransparency(u10, 1, {
                        onCleanUpTweenInfo = TweenInfo.new(0.5)
                    });
                    u11.BackgroundColor3 = ColorUtil.BLACK;
                    u11.Transparency = 1;
                    local v16 = TweenService:Create(u11, TweenInfo.new(1), {
                        BackgroundTransparency = 0
                    });
                    v16:Play();
                    u13:GiveTask(v16.Completed:Connect(function() -- Line: 41
                        -- upvalues: TweenService (ref), u11 (copy), u15 (copy)
                        TweenService:Create(u11, TweenInfo.new(1), {
                            BackgroundTransparency = 1
                        }):Play();
                        u15:DoCleaning();
                    end));
                end;
            end;

            if v12 then
                TweenService:Create(v12, TweenInfo.new(30), {
                    Offset = Vector2.new(0.15, 0)
                }):Play();
            end;

            if u10 then
                ClientSyncEvents.SceneLoadingScreenEnd:connect(function(p17) -- Line: 60
                    -- upvalues: u14 (ref), u11 (copy), u10 (copy), ColorUtil (ref), TweenService (ref), UIUtil (ref)
                    if u14 then
                        return nil;
                    end;

                    u14 = true;
                    p17:setEndAnimationLength(3);

                    if u11 and u10 then
                        u11.BackgroundColor3 = ColorUtil.BLACK;
                        TweenService:Create(u11, TweenInfo.new(1), {
                            BackgroundTransparency = 0
                        }):Play();
                        task.delay(1, function() -- Line: 72
                            -- upvalues: UIUtil (ref), u10 (ref), TweenService (ref), u11 (ref)
                            UIUtil:setContainerTransparency(u10, 1, {});
                            TweenService:Create(u11, TweenInfo.new(1), {
                                BackgroundTransparency = 1
                            }):Play();
                        end);
                    end;
                end);
            end;

            return function() -- Line: 83
                -- upvalues: u13 (copy)
                u13:DoCleaning();
            end;
        end);
        local v18 = {
            DisplayOrder = 1000,
            IgnoreGuiInset = true,
            ResetOnSpawn = false
        };
        local v19 = {};
        local v20 = {
            BlackOverlay = u3.createFragment({
                BlackOverlay = u3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = ColorUtil.BLACK,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    ZIndex = 20,
                    [u3.Ref] = u8
                })
            })
        };
        local _ = #v20;
        local v21 = {
            Size = UDim2.fromScale(1, 1),
            Image = u5.BackgroundImage,
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            ScaleType = "Crop",
            ZIndex = 1,
            [u3.Ref] = u9
        };
        local v22 = {
            BlackOverlay = u3.createElement("Frame", {
                BackgroundTransparency = 0.7,
                BorderSizePixel = 0,
                ZIndex = 2,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.BLACK
            })
        };
        local _ = #v22;
        local v23 = {
            BorderSizePixel = 0,
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v24 = {};
        local v25 = {
            Rotation = -30,
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.BLACK), ColorSequenceKeypoint.new(1, ColorUtil.BLACK) }),
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(0.3, 0.3), NumberSequenceKeypoint.new(1, 1) })
        };
        local BackgroundGradient = u5.BackgroundGradient;

        if BackgroundGradient then
            for i, v in BackgroundGradient do
                v25[i] = v;
            end;
        end;

        v25.Offset = Vector2.new(-0.1, 0);
        v25[u3.Ref] = u7;
        v24[#v24 + 1] = u3.createElement("UIGradient", v25);
        v22.OverlayGradient = u3.createElement("Frame", v23, v24);
        local v26 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v27 = {};
        local createElement = u3.createElement;
        local v28 = {};
        local v29;

        if DeviceUtil.isSmallScreen() then
            v29 = UDim.new(0.05, 0);
        else
            v29 = UDim.new(0.05, 0);
        end;

        v28.PaddingTop = v29;
        local v30;

        if DeviceUtil.isSmallScreen() then
            v30 = UDim.new(0.05, 0);
        else
            v30 = UDim.new(0.05, 0);
        end;

        v28.PaddingBottom = v30;
        local v31;

        if DeviceUtil.isSmallScreen() then
            v31 = UDim.new(0.03, 0);
        else
            v31 = UDim.new(0.03, 0);
        end;

        v28.PaddingLeft = v31;
        local v32;

        if DeviceUtil.isSmallScreen() then
            v32 = UDim.new(0.03, 0);
        else
            v32 = UDim.new(0.03, 0);
        end;

        v28.PaddingRight = v32;
        v27[1] = createElement("UIPadding", v28);
        local v33 = {
            ZIndex = 3,
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(0.4, 0.4)
        };
        local v34 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }), u3.createElement("TextLabel", {
                AutomaticSize = "Y",
                SizeConstraint = "RelativeXX",
                Text = "<b>TRAVELING TO</b>",
                TextXAlignment = "Left",
                RichText = true,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                ZIndex = 3,
                Size = UDim2.fromScale(1, 0),
                Font = Enum.Font.Roboto,
                TextColor3 = ColorUtil.WHITE
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = DeviceUtil.isSmallScreen() and 18 or 24
                }) }), u3.createElement("TextLabel", {
                AutomaticSize = "Y",
                SizeConstraint = "RelativeXX",
                TextXAlignment = "Left",
                RichText = true,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                ZIndex = 3,
                Size = UDim2.fromScale(1, 0),
                Text = "<b>" .. string.upper(u5.Title) .. "</b>",
                Font = Enum.Font.Roboto,
                TextColor3 = u5.TitleColor or ColorUtil.WHITE
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = DeviceUtil.isSmallScreen() and 40 or 60
                }) }) };
        local v35 = #v34;
        local v36;

        if u5.Description == nil then
            v36 = false;
        else
            v36 = u3.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextYAlignment = "Top",
                TextTransparency = 0.3,
                RichText = true,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                ZIndex = 3,
                Size = UDim2.fromScale(1, 0.2),
                Text = u5.Description,
                Font = Enum.Font.Roboto,
                TextColor3 = ColorUtil.WHITE
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = DeviceUtil.isSmallScreen() and 18 or 24
                }) });
        end;

        if v36 then
            v34[v35 + 1] = v36;
        end;

        v27.TextContainer = u3.createElement(Empty, v33, v34);
        v27[#v27 + 1] = u3.createElement(CircularSpinner, {
            ZIndex = 3,
            Size = UDim2.fromOffset(DeviceUtil.isSmallScreen() and 36 or 54, DeviceUtil.isSmallScreen() and 36 or 54),
            Position = UDim2.new(1, 0, 1, 0),
            AnchorPoint = Vector2.new(1, 1)
        });
        v22.Container = u3.createElement(Empty, v26, v27);
        v20.LoadingSceneScreenUI = u3.createFragment({
            LoadingSceneScreenUI = u3.createElement("ImageLabel", v21, v22)
        });
        v19[#v19 + 1] = u3.createFragment(v20);

        return u3.createFragment({
            LoadingSceneScreenGui = u3.createElement("ScreenGui", v18, v19)
        });
    end)
};