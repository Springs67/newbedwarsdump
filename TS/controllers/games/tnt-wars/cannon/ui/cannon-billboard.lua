-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local TweenService = v3.TweenService;
local CANNON_COLLECTION_TAGS = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "cannon-constants").CANNON_COLLECTION_TAGS;
local TNT_WARS_IMAGE_ID = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").TNT_WARS_IMAGE_ID;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
local v5 = u2.Component:extend("CannonBillboard");

function v5.init(p6) -- Line: 16
    -- upvalues: u2 (copy), u1 (copy)
    p6.billboardRef = u2.createRef();
    p6.hpOuterRef = u2.createRef();
    p6.autoOuterRef = u2.createRef();
    p6.ammoCounterRef = u2.createRef();
    p6.autoFireMaid = u1.new();
end;

function v5.render(p7) -- Line: 23
    -- upvalues: u2 (copy), TNT_WARS_IMAGE_ID (copy), Theme (copy)
    local v8 = {
        [u2.Ref] = p7.billboardRef,
        Adornee = p7.props.cannon:WaitForChild("Camera"),
        ExtentsOffset = Vector3.new(0, 7.5, 0),
        Size = UDim2.fromScale(4, 5),
        MaxDistance = 25
    };
    local v9 = {};
    local _ = #v9;
    local v10 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Image = TNT_WARS_IMAGE_ID.BILLBOARD
    };
    local v11 = {};
    local _ = #v11;
    local v12 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.6),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 0.7)
    };
    local v13 = {
        HpContainer = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.25)
        }, {
            HpLabel = u2.createElement("TextLabel", {
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
            HpBarInner = u2.createElement("Frame", {
                BackgroundTransparency = 0.25,
                Size = UDim2.fromScale(0.7, 0.4),
                Position = UDim2.fromScale(0.28, 0.5),
                BackgroundColor3 = Theme.Gray
            }, {
                u2.createElement("UIStroke", {
                    Thickness = 2,
                    Color = Color3.fromRGB(255, 255, 255)
                }),
                u2.createElement("UICorner"),
                HpBarOuter = u2.createElement("Frame", {
                    [u2.Ref] = p7.hpOuterRef,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Theme.mcGreen
                }, { u2.createElement("UICorner") })
            })
        })
    };
    local createElement = u2.createElement;
    local v14 = {
        BackgroundTransparency = 0.25,
        Size = UDim2.fromScale(1, 0.45)
    };
    local v15;

    if p7.props.config.autoFire then
        v15 = UDim2.fromScale(0, 0.32);
    else
        v15 = UDim2.fromScale(0, 0.42);
    end;

    v14.Position = v15;
    v14.BackgroundColor3 = Theme.Gray;
    v13.AmmoContainer = createElement("Frame", v14, {
        u2.createElement("UICorner"),
        u2.createElement("UIStroke", {
            Thickness = 2,
            Color = Color3.fromRGB(255, 255, 255)
        }),
        TNTIcon = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = TNT_WARS_IMAGE_ID.LOGO,
            Size = UDim2.fromScale(0.4, 0.4),
            Position = UDim2.fromScale(0.225, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeXX
        }),
        Counter = u2.createElement("TextLabel", {
            [u2.Ref] = p7.ammoCounterRef,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Text = "0/" .. tostring(p7.props.config.ammoCapacity),
            Font = Enum.Font.Arcade,
            Size = UDim2.fromScale(0.5, 0.5),
            Position = UDim2.fromScale(0.7, 0.5),
            TextStrokeTransparency = 0,
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextScaled = true,
            BackgroundTransparency = 1
        })
    });
    local v16 = #v13;
    local v17 = p7.props.config.autoFire and u2.createFragment({
        AutoFireBarInner = u2.createElement("Frame", {
            BackgroundTransparency = 0.3,
            Position = UDim2.fromScale(0, 0.85),
            Size = UDim2.fromScale(1, 0.1),
            BackgroundColor3 = Theme.Gray
        }, {
            u2.createElement("UICorner"),
            u2.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(255, 255, 255)
            }),
            AutoFireBarOuter = u2.createElement("Frame", {
                [u2.Ref] = p7.autoOuterRef,
                Size = UDim2.fromScale(0, 1),
                BackgroundColor3 = Theme.mcBlue
            }, { u2.createElement("UICorner") })
        })
    });

    if v17 then
        v13[v16 + 1] = v17;
    end;

    v11.UsableArea = u2.createElement("Frame", v12, v13);
    v9.BillboardFrame = u2.createElement("ImageLabel", v10, v11);

    return u2.createFragment({
        CannonBillboard = u2.createElement("BillboardGui", v8, v9)
    });
end;

function v5.didMount(p18) -- Line: 150
    p18:addTag();
    p18:startAutoFireTween();
    p18:setupDamageListener();
    p18:setupAmmoListener();
end;

function v5.willUnmount(p19) -- Line: 156
    p19.autoFireMaid:DoCleaning();
end;

function v5.addTag(p20) -- Line: 159
    -- upvalues: CollectionService (copy), CANNON_COLLECTION_TAGS (copy)
    local v21 = p20.billboardRef:getValue();

    if not v21 then
        return nil;
    end;

    CollectionService:AddTag(v21, CANNON_COLLECTION_TAGS.billboard);
end;

function v5.startAutoFireTween(p22) -- Line: 166
    -- upvalues: TweenService (copy)
    if not p22.props.config.autoFire then
        return nil;
    end;

    local v23 = p22.autoOuterRef:getValue();

    if not v23 then
        return nil;
    end;

    local u24 = TweenService:Create(v23, TweenInfo.new(p22.props.config.autoFire.fireInterval, Enum.EasingStyle.Linear, Enum.EasingDirection.In, (1 / 0)), {
        Size = UDim2.fromScale(1, 1)
    });
    u24:Play();
    p22.autoFireMaid:GiveTask(function() -- Line: 179
        -- upvalues: u24 (copy)
        u24:Destroy();
    end);
end;

function v5.setupDamageListener(u25) -- Line: 183
    -- upvalues: TweenService (copy), u4 (copy)
    local u26 = u25.hpOuterRef:getValue();

    if not u26 then
        return nil;
    end;

    u25.props.cannon:GetAttributeChangedSignal("CannonDurability"):Connect(function() -- Line: 188
        -- upvalues: u25 (copy), u26 (copy), TweenService (ref), u4 (ref)
        local v27 = u25.props.cannon:GetAttribute("CannonDurability") / u25.props.cannon:GetAttribute("MaxHealth");
        TweenService:Create(u26, u4, {
            Size = UDim2.fromScale(v27, u26.Size.Y.Scale)
        }):Play();
    end);
end;

function v5.setupAmmoListener(u28) -- Line: 198
    local u29 = u28.ammoCounterRef:getValue();

    if not u29 then
        return nil;
    end;

    u28.props.cannon:GetAttributeChangedSignal("CannonAmmo"):Connect(function() -- Line: 203
        -- upvalues: u28 (copy), u29 (copy)
        local v30 = u28.props.cannon:GetAttribute("CannonAmmo");
        local ammoCapacity = u28.props.config.ammoCapacity;
        u29.Text = tostring(v30) .. "/" .. tostring(ammoCapacity);
    end);
end;

return {
    CannonBillboard = v5
};