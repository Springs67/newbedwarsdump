-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local getWeaponMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weapon-util").getWeaponMeta;
local v2 = u1.Component:extend("WeaponViewport");

function v2.init(p3) -- Line: 9
    -- upvalues: u1 (copy)
    p3.imageRef = u1.createRef();
end;

function v2.didMount(p4) -- Line: 12
    if not p4.props.IgnoreInitialPop then
        p4:popImage();
    end;
end;

function v2.willUpdate(p5, p6) -- Line: 17
    local Amount = p6.Amount;
    local Amount2 = p5.props.Amount;

    if (Amount2 == nil and 0 or Amount2) < (Amount == nil and 0 or Amount) or p6.WeaponType ~= p5.props.WeaponType then
        p5:popImage();
    end;
end;

function v2.popImage(u7) -- Line: 34
    -- upvalues: TweenService (copy), RuntimeLib (copy)
    local u8 = u7.imageRef:getValue();

    if u8 then
        local v9 = TweenService:Create(u7.imageRef:getValue(), TweenInfo.new(0.04), {
            Size = UDim2.fromScale(u7.props.ImageSize.X.Scale - 0.1, u7.props.ImageSize.Y.Scale + 0.3)
        });
        v9:Play();
        RuntimeLib.Promise.fromEvent(v9.Completed):andThen(function() -- Line: 42
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

function v2.render(p11) -- Line: 56
    -- upvalues: u1 (copy), getWeaponMeta (copy)
    local v12 = {};

    for i, v in p11.props do
        v12[i] = v;
    end;

    v12[u1.Children] = nil;
    v12.WeaponType = nil;
    v12.Amount = nil;
    v12.IgnoreInitialPop = nil;
    v12.DisplayOneAmount = nil;
    v12.ShowCooldownBar = nil;
    v12.ImageSize = nil;
    v12.ImageTransparency = nil;
    v12.image = nil;
    local v13 = getWeaponMeta(p11.props.WeaponType);
    local image = p11.props.image;
    local v14;

    if image == "" or not image then
        v14 = v13.image;
    else
        v14 = p11.props.image;
    end;

    local _ = v13.name;
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

    v16[#v16 + 1] = u1.createElement("ImageLabel", {
        [u1.Ref] = p11.imageRef,
        Size = p11.props.ImageSize,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Image = v14,
        ImageTransparency = p11.props.ImageTransparency
    });

    return u1.createElement("Frame", v15, v16);
end;

v2.defaultProps = {
    ImageTransparency = 0,
    ImageSize = UDim2.fromScale(1, 1)
};

return {
    WeaponViewport = v2
};