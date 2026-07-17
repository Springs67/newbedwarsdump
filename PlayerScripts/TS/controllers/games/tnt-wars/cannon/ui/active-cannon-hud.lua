-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local GamepadAction = v1.GamepadAction;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v4.ContextActionService;
local TweenService = v4.TweenService;
local TNT_WARS_IMAGE_ID = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").TNT_WARS_IMAGE_ID;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u5 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
local v6 = u3.Component:extend("ActiveCannonHud");

function v6.init(p7) -- Line: 18
    -- upvalues: u3 (copy), u2 (copy)
    p7.hpOuterRef = u3.createRef();
    p7.autoOuterRef = u3.createRef();
    p7.ammoCounterRef = u3.createRef();
    p7.autoFireMaid = u2.new();
end;

function v6.render(u8) -- Line: 24
    -- upvalues: ColorUtil (copy), Theme (copy), u3 (copy), TNT_WARS_IMAGE_ID (copy)
    local v9 = {
        ResetOnSpawn = true
    };
    local v10 = {};
    local _ = #v10;
    local v11 = {
        BackgroundTransparency = 0.1,
        BackgroundColor3 = ColorUtil.darken(Theme.Gray, 0.25),
        Size = UDim2.fromScale(0.2, 0.4),
        Position = UDim2.fromScale(0.8, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v12 = {
        u3.createElement("UICorner"),
        u3.createElement("UIStroke", {
            Thickness = 6,
            Color = Color3.fromRGB(255, 255, 255)
        }),
        HpContainer = u3.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.05, 0),
            Size = UDim2.fromScale(0.9, 0.15)
        }, {
            HpLabel = u3.createElement("TextLabel", {
                Text = "HP",
                TextScaled = true,
                BackgroundTransparency = 1,
                TextStrokeTransparency = 0,
                Font = Enum.Font.Arcade,
                Size = UDim2.fromScale(0.25, 1),
                Position = UDim2.fromScale(0, 0.15),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            }),
            HpBarInner = u3.createElement("Frame", {
                BackgroundTransparency = 0.25,
                Size = UDim2.fromScale(0.7, 0.4),
                Position = UDim2.fromScale(0.28, 0.5),
                BackgroundColor3 = Theme.Gray
            }, {
                u3.createElement("UIStroke", {
                    Thickness = 2,
                    Color = Color3.fromRGB(255, 255, 255)
                }),
                u3.createElement("UICorner"),
                HpBarOuter = u3.createElement("Frame", {
                    [u3.Ref] = u8.hpOuterRef,
                    Size = u8:getCurrentDurability(),
                    BackgroundColor3 = Theme.mcGreen
                }, { u3.createElement("UICorner") })
            })
        }),
        AmmoContainer = u3.createElement("Frame", {
            BackgroundTransparency = 0.25,
            Size = UDim2.fromScale(0.8, 0.25),
            Position = UDim2.fromScale(0.1, 0.2),
            BackgroundColor3 = Theme.Gray
        }, {
            u3.createElement("UICorner"),
            u3.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(255, 255, 255)
            }),
            TNTIcon = u3.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = TNT_WARS_IMAGE_ID.LOGO,
                Size = UDim2.fromScale(0.4, 0.4),
                Position = UDim2.fromScale(0.225, 0.5),
                SizeConstraint = Enum.SizeConstraint.RelativeXX
            }),
            Counter = u3.createElement("TextLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                [u3.Ref] = u8.ammoCounterRef,
                Text = tostring(u8.props.cannon:GetAttribute("CannonAmmo")) .. "/" .. tostring(u8.props.config.ammoCapacity),
                Font = Enum.Font.Arcade,
                Size = UDim2.fromScale(0.5, 0.6),
                Position = UDim2.fromScale(0.7, 0.5),
                TextStrokeTransparency = 0,
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextScaled = true,
                BackgroundTransparency = 1
            })
        })
    };
    local v13 = #v12;
    local v14 = u8.props.config.autoFire and u3.createFragment({
        AutoFireBarInner = u3.createElement("Frame", {
            BackgroundTransparency = 0.3,
            Position = UDim2.fromScale(0.05, 0.5),
            Size = UDim2.fromScale(0.9, 0.075),
            BackgroundColor3 = Theme.Gray
        }, {
            u3.createElement("UICorner"),
            u3.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(255, 255, 255)
            }),
            AutoFireBarOuter = u3.createElement("Frame", {
                [u3.Ref] = u8.autoOuterRef,
                Size = UDim2.fromScale(0, 1),
                BackgroundColor3 = Theme.mcBlue
            }, { u3.createElement("UICorner") })
        })
    });

    if v14 then
        v12[v13 + 1] = v14;
    end;

    local _ = #v12;
    local v15 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.9, 0.4)
    };
    local v16;

    if u8.props.config.autoFire then
        v16 = UDim2.fromScale(0.05, 0.6);
    else
        v16 = UDim2.fromScale(0.05, 0.525);
    end;

    v15.Position = v16;
    local v17 = {};
    local v18 = #v17;
    local v19 = not u8.props.config.autoFire and u3.createFragment({
        FireControl = u3.createElement("Frame", {
            Active = true,
            Size = UDim2.fromScale(0.5, 1),
            Position = UDim2.fromScale(0, 0),
            BackgroundTransparency = 1,

            [u3.Event.TouchTap] = function() -- Line: 154
                -- upvalues: u8 (copy)
                u8.props.requestFire(u8.props.cannon);
            end
        }, {
            FireOutline = u3.createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.8, 0.8),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            }, {
                u3.createElement("UIStroke", {
                    Thickness = 2,
                    Color = Color3.fromRGB(255, 255, 255)
                }),
                u3.createElement("UICorner"),
                FireButton = u3.createElement("TextLabel", {
                    Text = "X",
                    TextStrokeTransparency = 0,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Font = Enum.Font.RobotoMono,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                    Size = UDim2.fromScale(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.4),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }),
                FireText = u3.createElement("TextLabel", {
                    Text = "Fire",
                    TextStrokeTransparency = 0,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Font = Enum.Font.RobotoMono,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                    Size = UDim2.fromScale(0.9, 0.4),
                    Position = UDim2.fromScale(0.5, 0.75),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                })
            })
        })
    });

    if v19 then
        v17[v18 + 1] = v19;
    end;

    local _ = #v17;
    local createElement = u3.createElement;
    local v20 = {
        Active = true,
        Size = UDim2.fromScale(0.5, 1)
    };
    local v21;

    if u8.props.config.autoFire then
        v21 = UDim2.fromScale(0.25, 0);
    else
        v21 = UDim2.fromScale(0.5, 0);
    end;

    v20.Position = v21;
    v20.BackgroundTransparency = 1;

    v20[u3.Event.TouchTap] = function() -- Line: 205
        -- upvalues: u8 (copy)
        u8.props.unmount();
    end;

    v17.UnmountControl = createElement("Frame", v20, {
        UnmountOutline = u3.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.8, 0.8),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        }, {
            u3.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(255, 255, 255)
            }),
            u3.createElement("UICorner"),
            UnmountButton = u3.createElement("TextLabel", {
                Text = "F",
                TextStrokeTransparency = 0,
                TextScaled = true,
                BackgroundTransparency = 1,
                Font = Enum.Font.RobotoMono,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                Size = UDim2.fromScale(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.4),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }),
            UnmountText = u3.createElement("TextLabel", {
                Text = "Unmount",
                TextStrokeTransparency = 0,
                TextScaled = true,
                BackgroundTransparency = 1,
                Font = Enum.Font.RobotoMono,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                Size = UDim2.fromScale(0.9, 0.4),
                Position = UDim2.fromScale(0.5, 0.75),
                AnchorPoint = Vector2.new(0.5, 0.5)
            })
        })
    });
    v12.ControlContainer = u3.createElement("Frame", v15, v17);
    v10.ActiveHudContainer = u3.createElement("Frame", v11, v12);

    return u3.createFragment({
        ActiveCannonHud = u3.createElement("ScreenGui", v9, v10)
    });
end;

function v6.didMount(p22) -- Line: 252
    p22:startAutoFireTween();
    p22:setupDamageListener();
    p22:setupAmmoListener();
    p22:setupKeybinds();
end;

function v6.willUnmount(p23) -- Line: 258
    p23:cleanupKeybinds();
end;

function v6.setupKeybinds(u24) -- Line: 261
    -- upvalues: ContextActionService (copy), GamepadAction (copy)
    if not u24.props.config.autoFire then
        ContextActionService:BindAction("fire-cannon", function(p25, p26, p27) -- Line: 263
            -- upvalues: u24 (copy)
            if p26 == Enum.UserInputState.Begin then
                u24.props.requestFire(u24.props.cannon);
            end;
        end, false, Enum.KeyCode.X, GamepadAction.Interact);
    end;

    ContextActionService:BindAction("unmount-cannon", function(p28, p29, p30) -- Line: 269
        -- upvalues: u24 (copy)
        if p29 == Enum.UserInputState.Begin then
            u24.props.unmount();
        end;
    end, false, Enum.KeyCode.F);
end;

function v6.cleanupKeybinds(p31) -- Line: 275
    -- upvalues: ContextActionService (copy)
    ContextActionService:UnbindAction("fire-cannon");
    ContextActionService:UnbindAction("unmount-cannon");
end;

function v6.getCurrentDurability(p32) -- Line: 279
    local v33 = p32.props.cannon:GetAttribute("CannonDurability") / p32.props.cannon:GetAttribute("MaxHealth");

    return UDim2.fromScale(v33, 1);
end;

function v6.startAutoFireTween(p34) -- Line: 285
    -- upvalues: TweenService (copy)
    if not p34.props.config.autoFire then
        return nil;
    end;

    local v35 = p34.autoOuterRef:getValue();

    if not v35 then
        return nil;
    end;

    local u36 = TweenService:Create(v35, TweenInfo.new(p34.props.config.autoFire.fireInterval, Enum.EasingStyle.Linear, Enum.EasingDirection.In, (1 / 0)), {
        Size = UDim2.fromScale(1, 1)
    });
    u36:Play();
    p34.autoFireMaid:GiveTask(function() -- Line: 298
        -- upvalues: u36 (copy)
        u36:Destroy();
    end);
end;

function v6.setupDamageListener(u37) -- Line: 302
    -- upvalues: TweenService (copy), u5 (copy)
    local u38 = u37.hpOuterRef:getValue();

    if not u38 then
        return nil;
    end;

    u37.props.cannon:GetAttributeChangedSignal("CannonDurability"):Connect(function() -- Line: 307
        -- upvalues: u37 (copy), u38 (copy), TweenService (ref), u5 (ref)
        local v39 = u37.props.cannon:GetAttribute("CannonDurability") / u37.props.cannon:GetAttribute("MaxHealth");
        TweenService:Create(u38, u5, {
            Size = UDim2.fromScale(v39, u38.Size.Y.Scale)
        }):Play();
    end);
end;

function v6.setupAmmoListener(u40) -- Line: 317
    local u41 = u40.ammoCounterRef:getValue();

    if not u41 then
        return nil;
    end;

    u40.props.cannon:GetAttributeChangedSignal("CannonAmmo"):Connect(function() -- Line: 322
        -- upvalues: u40 (copy), u41 (copy)
        local v42 = u40.props.cannon:GetAttribute("CannonAmmo");
        local ammoCapacity = u40.props.config.ammoCapacity;
        u41.Text = tostring(v42) .. "/" .. tostring(ammoCapacity);
    end);
end;

return {
    ActiveCannonHud = v6
};