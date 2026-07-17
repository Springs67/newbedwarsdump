-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    SceneDeathScreen = v4.new(u3)(function(u6, p7) -- Line: 18
        -- upvalues: u3 (copy), u2 (copy), Workspace (copy), TweenService (copy), SoundManager (copy), GameSound (copy), UIUtil (copy), KnitClient (copy), ColorUtil (copy), Empty (copy), DeviceUtil (copy)
        local _ = p7.useState;
        local useEffect = p7.useEffect;
        local u8 = u3.createRef();
        local u9 = u3.createRef();
        local u10 = u3.createRef();
        useEffect(function() -- Line: 24
            -- upvalues: u8 (copy), u9 (copy), u10 (copy), u2 (ref), Workspace (ref), TweenService (ref), SoundManager (ref), GameSound (ref), u6 (copy), UIUtil (ref), KnitClient (ref)
            local u11 = true;
            local u12 = u8:getValue();
            local u13 = u9:getValue();
            local u14 = u10:getValue();

            if not (u12 and (u13 and u14)) then
                return nil;
            end;

            local u15 = u2.new();
            local CurrentCamera = Workspace.CurrentCamera;
            local u16;

            if CurrentCamera == nil then
                u16 = CurrentCamera;
            else
                u16 = CurrentCamera.FieldOfView;
            end;

            if CurrentCamera then
                TweenService:Create(CurrentCamera, TweenInfo.new(1), {
                    FieldOfView = 35
                }):Play();
            end;

            local v17 = TweenService:Create(u12, TweenInfo.new(1), {
                BackgroundTransparency = 0
            });
            v17:Play();
            u15:GiveTask(v17.Completed:Connect(function() -- Line: 50
                -- upvalues: SoundManager (ref), GameSound (ref), TweenService (ref), u13 (copy)
                SoundManager:playSound(GameSound.HALLOWEEN_LTM_LOST);
                TweenService:Create(u13, TweenInfo.new(0.5), {
                    TextTransparency = 0
                }):Play();
            end));
            task.delay(#u6.hints * 4 + 1, function() -- Line: 57
                -- upvalues: u11 (ref), CurrentCamera (copy), u16 (copy), TweenService (ref), UIUtil (ref), u12 (copy), u15 (copy), KnitClient (ref)
                if not u11 then
                    return nil;
                end;

                local v18 = CurrentCamera and u16;

                if v18 ~= 0 and (v18 == v18 and v18) then
                    TweenService:Create(CurrentCamera, TweenInfo.new(0.5), {
                        FieldOfView = u16
                    }):Play();
                end;

                UIUtil:setContainerTransparency(u12, 1, {
                    onSetTweenInfo = TweenInfo.new(0.5)
                }, {
                    exclude = { "Container" }
                });
                local v19 = TweenService:Create(u12, TweenInfo.new(1), {
                    BackgroundTransparency = 1
                });
                v19:Play();
                u15:GiveTask(v19.Completed:Connect(function() -- Line: 77
                    -- upvalues: KnitClient (ref)
                    KnitClient.Controllers.SceneDeathScreenController:unmountActiveDeathScreen();
                end));
            end);
            task.spawn(function() -- Line: 82
                -- upvalues: u11 (ref), u14 (copy), TweenService (ref), u6 (ref)
                task.wait(2);

                local function u21(p20) -- Line: 85
                    -- upvalues: u11 (ref), u14 (ref), TweenService (ref)
                    if not u11 then
                        return nil;
                    end;

                    if not u14 then
                        return nil;
                    end;

                    u14.Text = p20;
                    TweenService:Create(u14, TweenInfo.new(0.3), {
                        TextTransparency = 0,
                        Position = UDim2.fromScale(0, 0)
                    }):Play();
                    task.delay(3.7, function() -- Line: 99
                        -- upvalues: TweenService (ref), u14 (ref)
                        TweenService:Create(u14, TweenInfo.new(0.3), {
                            TextTransparency = 1,
                            Position = UDim2.fromScale(0, -0.1)
                        }):Play();
                    end);
                end;

                local function _(p22) -- Line: 107
                    -- upvalues: u21 (copy)
                    u21(p22);
                    task.wait(4);
                end;

                for i, v in u6.hints do
                    local _ = i - 1;
                    u21(v);
                    task.wait(4);
                end;
            end);

            return function() -- Line: 115
                -- upvalues: u15 (copy), u11 (ref)
                u15:DoCleaning();
                u11 = false;
            end;
        end);
        local createFragment = u3.createFragment;
        local v23 = {};
        local createElement = u3.createElement;
        local v24 = {
            DisplayOrder = 1000,
            IgnoreGuiInset = true,
            ResetOnSpawn = false
        };
        local v25 = {};
        local createElement2 = u3.createElement;
        local v26 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScaleType = "Crop",
            ZIndex = 1,
            [u3.Ref] = u8
        };
        local v27 = {};
        local createElement3 = u3.createElement;
        local v28 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v29 = {};
        local createElement4 = u3.createElement;
        local v30 = {};
        local v31;

        if DeviceUtil.isSmallScreen() then
            v31 = UDim.new(0.05, 0);
        else
            v31 = UDim.new(0.05, 0);
        end;

        v30.PaddingTop = v31;
        local v32;

        if DeviceUtil.isSmallScreen() then
            v32 = UDim.new(0.05, 0);
        else
            v32 = UDim.new(0.05, 0);
        end;

        v30.PaddingBottom = v32;
        local v33;

        if DeviceUtil.isSmallScreen() then
            v33 = UDim.new(0.03, 0);
        else
            v33 = UDim.new(0.03, 0);
        end;

        v30.PaddingLeft = v33;
        local v34;

        if DeviceUtil.isSmallScreen() then
            v34 = UDim.new(0.03, 0);
        else
            v34 = UDim.new(0.03, 0);
        end;

        v30.PaddingRight = v34;
        v29[1] = createElement4("UIPadding", v30);
        v29.TextContainer = u3.createElement(Empty, {
            ZIndex = 3,
            Position = UDim2.fromScale(0.5, 0.35),
            AnchorPoint = Vector2.new(0.5, 0),
            Size = UDim2.fromScale(0.4, 0.4)
        }, { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }), u3.createElement("TextLabel", {
                Size = UDim2.fromScale(1, 0),
                AutomaticSize = "Y",
                SizeConstraint = "RelativeXX",
                Text = "<b>YOU DIED!</b>",
                TextXAlignment = "Center",
                Font = Enum.Font.Roboto,
                TextColor3 = Color3.fromHex("89ffd4"),
                RichText = true,
                TextScaled = true,
                BackgroundTransparency = 1,
                TextTransparency = 1,
                LayoutOrder = 2,
                ZIndex = 3,
                [u3.Ref] = u9
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = DeviceUtil.isSmallScreen() and 46 or 66
                }) }), u3.createElement("TextLabel", {
                Size = UDim2.fromScale(1, 0.2),
                Text = "",
                TextXAlignment = "Center",
                TextYAlignment = "Top",
                Font = Enum.Font.Roboto,
                TextColor3 = ColorUtil.WHITE,
                RichText = true,
                TextScaled = true,
                BackgroundTransparency = 1,
                TextTransparency = 1,
                LayoutOrder = 3,
                ZIndex = 3,
                [u3.Ref] = u10
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = DeviceUtil.isSmallScreen() and 24 or 30
                }) }) });
        v27.Content = createElement3(Empty, v28, v29);
        v25.Container = createElement2("ImageLabel", v26, v27);
        v23.DeathScreenGui = createElement("ScreenGui", v24, v25);

        return createFragment(v23);
    end)
};