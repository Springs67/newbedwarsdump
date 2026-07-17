-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local CooldownBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").CooldownBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local UIGlitchEffect = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "glitch-effect", "ui-glitch-effect").UIGlitchEffect;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local v2 = u1.Component:extend("ItemViewport");

function v2.init(p3) -- Line: 12
    -- upvalues: u1 (copy)
    p3.imageRef = u1.createRef();
end;

function v2.didMount(p4) -- Line: 15
    if not p4.props.IgnoreInitialPop then
        p4:popImage();
    end;
end;

function v2.willUpdate(p5, p6) -- Line: 20
    local Amount = p6.Amount;
    local Amount2 = p5.props.Amount;

    if (Amount2 == nil and 0 or Amount2) < (Amount == nil and 0 or Amount) or p6.ItemType ~= p5.props.ItemType then
        p5:popImage();
    end;
end;

function v2.popImage(u7) -- Line: 37
    -- upvalues: TweenService (copy), RuntimeLib (copy)
    local u8 = u7.imageRef:getValue();

    if u8 then
        local v9 = TweenService:Create(u7.imageRef:getValue(), TweenInfo.new(0.04), {
            Size = UDim2.fromScale(u7.props.ImageSize.X.Scale - 0.1, u7.props.ImageSize.Y.Scale + 0.3)
        });
        v9:Play();
        RuntimeLib.Promise.fromEvent(v9.Completed):andThen(function() -- Line: 45
            -- upvalues: u8 (copy), TweenService (ref), u7 (copy)
            local v10 = u8;

            if v10 ~= nil then
                v10 = v10.Parent;
            end;

            if v10 then
                TweenService:Create(u7.imageRef:getValue(), TweenInfo.new(0.07), {
                    Size = u7.props.ImageSize
                }):Play();
            end;
        end);
    end;
end;

function v2.render(p11) -- Line: 59
    -- upvalues: u1 (copy), getItemMeta (copy), ItemUtil (copy), UIGlitchEffect (copy), CooldownBar (copy)
    local v12 = {};

    for i, v in p11.props do
        v12[i] = v;
    end;

    v12[u1.Children] = nil;
    v12.ItemType = nil;
    v12.Amount = nil;
    v12.IgnoreInitialPop = nil;
    v12.DisplayOneAmount = nil;
    v12.ShowCooldownBar = nil;
    v12.ImageSize = nil;
    v12.ImageTransparency = nil;
    local v13 = getItemMeta(p11.props.ItemType);
    local image = v13.image;
    local v14 = ItemUtil.getDisplayName(p11.props.ItemType);
    local cooldownId = v13.cooldownId;
    local v15 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1)
    };

    for i, v in v12 do
        v15[i] = v;
    end;

    local v16 = {};
    local v17 = #v16;
    local v18 = p11.props[u1.Children];

    if v18 then
        for i, v in v18 do
            if type(i) == "number" then
                v16[v17 + i] = v;
            else
                v16[i] = v;
            end;
        end;
    end;

    local v19 = #v16;
    local createElement = u1.createElement;
    local v20 = {
        Disabled = not v13.glitched
    };
    local v21 = {};
    local v22;

    if image == nil then
        v22 = u1.createElement("TextLabel", {
            Font = "RobotoMono",
            RichText = true,
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = v14,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(0.8, 0.6),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    else
        local createElement2 = u1.createElement;
        local v23 = {};
        local v24;

        if v13.glitched then
            v24 = nil;
        else
            v24 = p11.imageRef;
        end;

        v23[u1.Ref] = v24;
        v23.Size = p11.props.ImageSize;
        v23.Position = UDim2.fromScale(0.5, 0.5);
        v23.AnchorPoint = Vector2.new(0.5, 0.5);
        v23.BorderSizePixel = 0;
        v23.BackgroundTransparency = 1;
        v23.Image = image;
        v23.ImageTransparency = p11.props.ImageTransparency;
        v22 = createElement2("ImageLabel", v23);
    end;

    v21[1] = v22;
    v16[v19 + 1] = createElement(UIGlitchEffect, v20, v21);
    local v25;

    if p11.props.ShowCooldownBar == true and cooldownId ~= nil then
        v25 = u1.createElement(CooldownBar, {
            cooldownId = cooldownId,
            Position = UDim2.fromScale(0.5, 0.96),
            AnchorPoint = Vector2.new(0.5, 0.96),
            Size = UDim2.fromScale(1, 0.08)
        });
    else
        v25 = false;
    end;

    if v25 then
        v16[v19 + 2] = v25;
    end;

    local v26 = #v16;
    local v27;

    if p11.props.Amount == nil then
        v27 = false;
    else
        v27 = (p11.props.Amount > 1 or p11.props.DisplayOneAmount) and u1.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 10,
            TextXAlignment = "Right",
            Text = tostring(p11.props.Amount),
            FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(0.5, 0.3),
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.fromScale(0.98, 1)
        });
    end;

    if v27 then
        v16[v26 + 1] = v27;
    end;

    return u1.createElement("Frame", v15, v16);
end;

v2.defaultProps = {
    ImageTransparency = 0,
    ImageSize = UDim2.fromScale(1, 1)
};

return {
    ItemViewport = v2
};