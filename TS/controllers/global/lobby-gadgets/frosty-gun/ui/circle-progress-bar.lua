-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local FrostyStaffUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "frosty-gun", "frosty-gun-util").FrostyStaffUtil;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
({
    progress = 0
}).color = Color3.fromRGB(0, 0, 0);
local v3 = u2.Component:extend("FrostedCircleProgressBar");

function v3.init(p4, p5) -- Line: 19
    -- upvalues: u1 (copy), u2 (copy)
    p4.connectionMaid = u1.new();
    p4.leftCircleUIGradRef = u2.createRef();
    p4.rightCircleUIGradRef = u2.createRef();
    p4.idImage = u2.createRef();
    p4:listenToUpdate();
end;

function v3.render(p6) -- Line: 26
    -- upvalues: u2 (copy)
    return u2.createFragment({ p6:createBar() });
end;

function v3.willUnmount(p7) -- Line: 31
    p7.connectionMaid:DoCleaning();
end;

function v3.listenToUpdate(u8) -- Line: 34
    -- upvalues: ClientSyncEvents (copy), StatusEffectType (copy), StatusEffectUtil (copy), FrostyStaffUtil (copy), default (copy), Linear (copy)
    ClientSyncEvents.StatusEffectChanged:connect(function(p9) -- Line: 35
        -- upvalues: u8 (copy), StatusEffectType (ref), StatusEffectUtil (ref), FrostyStaffUtil (ref), default (ref), Linear (ref)
        if p9.entityInstance ~= u8.props.entityInstance then
            return nil;
        end;

        if p9.statusEffect ~= StatusEffectType.COLD then
            return nil;
        end;

        local v10 = StatusEffectUtil:getActive(p9.entityInstance, StatusEffectType.COLD);

        if not v10 then
            return nil;
        end;

        local u11 = u8.leftCircleUIGradRef:getValue();
        local u12 = u8.rightCircleUIGradRef:getValue();

        if not (u11 and u12) then
            return nil;
        end;

        local v13 = v10.stacks * 100 / FrostyStaffUtil.MAX_COLD_STACK;
        local v14 = math.clamp(v13 * 3.6, 0, 360);
        local v15 = math.floor(v14);
        local Rotation = u12.Rotation;
        local Rotation2 = u11.Rotation;
        local v16 = u8.idImage:getValue();

        if v13 == 100 and v16 then
            v16.ImageColor3 = Color3.fromRGB(44, 111, 255);
        elseif v16 then
            v16.ImageColor3 = Color3.fromRGB(255, 255, 255);
        end;

        default(0.2, Linear, function(p17) -- Line: 61
            -- upvalues: u12 (copy)
            u12.Rotation = p17;
        end, Rotation, (math.clamp(v15, 0, 180)));
        default(0.2, Linear, function(p18) -- Line: 64
            -- upvalues: u11 (copy)
            u11.Rotation = p18;
        end, Rotation2, (math.clamp(v15, 180, 360)));
    end);
end;

function v3.createLeftCircle(p19) -- Line: 69
    -- upvalues: u2 (copy)
    local v20 = math.clamp(p19.props.progress * 3.6, 0, 360);
    local v21 = math.floor(v20);

    return u2.createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Position = UDim2.new(1, 0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AutomaticSize = Enum.AutomaticSize.None,
        AnchorPoint = Vector2.new(0.5, 0),
        SizeConstraint = Enum.SizeConstraint.RelativeYY
    }, { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), u2.createElement("UIGradient", {
            Color = ColorSequence.new(Color3.fromRGB(28, 176, 255)),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.51, 0.5),
                NumberSequenceKeypoint.new(1, 0.5)
            }),
            Rotation = math.clamp(v21, 180, 360),
            [u2.Ref] = p19.leftCircleUIGradRef
        }) });
end;

function v3.createRightCircle(p22) -- Line: 94
    -- upvalues: u2 (copy)
    local v23 = math.clamp(p22.props.progress * 3.6, 0, 360);
    local v24 = math.floor(v23);

    return u2.createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Position = UDim2.new(1, 0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AutomaticSize = Enum.AutomaticSize.None,
        AnchorPoint = Vector2.new(1, 0),
        SizeConstraint = Enum.SizeConstraint.RelativeYY
    }, { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), u2.createElement("UIGradient", {
            Color = ColorSequence.new(Color3.fromRGB(28, 176, 255)),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.51, 0.5),
                NumberSequenceKeypoint.new(1, 0.5)
            }),
            Rotation = math.clamp(v24, 0, 180),
            [u2.Ref] = p22.rightCircleUIGradRef
        }) });
end;

function v3.createImage(p25) -- Line: 119
    -- upvalues: u2 (copy)
    return u2.createElement("ImageLabel", {
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.8, 0.8),
        Image = "rbxassetid://11611911951",
        [u2.Ref] = p25.idImage
    });
end;

function v3.createBar(p26) -- Line: 130
    -- upvalues: u2 (copy)
    local v27 = UDim2.fromScale(1, 1);

    if p26.props.playerGUI then
        v27 = UDim2.fromOffset(15, 15);
    end;

    return u2.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v27,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.None,
        SizeConstraint = Enum.SizeConstraint.RelativeYY
    }, {
        u2.createElement("Frame", {
            BackgroundTransparency = 0.75,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(94, 92, 92),
            AutomaticSize = Enum.AutomaticSize.None,
            AnchorPoint = Vector2.new(0.5, 0)
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }) }),
        u2.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Position = UDim2.new(0, 0, 0, 0),
            Size = UDim2.new(0.5, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            AutomaticSize = Enum.AutomaticSize.None,
            AnchorPoint = Vector2.new(0, 0)
        }, { p26:createLeftCircle() }),
        u2.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Position = UDim2.new(1, 0, 0, 0),
            Size = UDim2.new(0.5, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            AutomaticSize = Enum.AutomaticSize.None,
            AnchorPoint = Vector2.new(1, 0)
        }, { p26:createRightCircle() }),
        u2.createElement("Frame", {
            BackgroundTransparency = 0.75,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            BackgroundColor3 = Color3.fromRGB(125, 122, 122),
            AutomaticSize = Enum.AutomaticSize.None,
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), p26:createImage() })
    });
end;

return {
    FrostedCircleProgressBar = v3
};