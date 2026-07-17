-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v2 = u1.Component:extend("DrillBillboard");

function v2.init(p3) -- Line: 9
    -- upvalues: u1 (copy)
    p3.billboardRef = u1.createRef();
    p3.resourceCounterRef = u1.createRef();
    p3.head = p3.props.drill:WaitForChild("Head");
    p3.image = "rbxassetid://6850538075";
end;

function v2.render(p4) -- Line: 15
    -- upvalues: getItemMeta (copy), u1 (copy), Theme (copy)
    local image = getItemMeta(p4.props.itemtype).image;

    if image ~= "" and image then
        p4.image = image;
    end;

    return u1.createFragment({
        CannonBillboard = u1.createElement("BillboardGui", {
            [u1.Ref] = p4.billboardRef,
            Adornee = p4.head,
            ExtentsOffset = Vector3.new(0, 7.5, 0),
            Size = UDim2.fromScale(4, 5),
            MaxDistance = 25
        }, {
            UsableArea = u1.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.6),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.8, 0.7)
            }, {
                ResourceContainer = u1.createElement("Frame", {
                    BackgroundTransparency = 0.25,
                    Size = UDim2.fromScale(1, 0.45),
                    Position = UDim2.fromScale(0, 0.42),
                    BackgroundColor3 = Theme.Gray
                }, {
                    u1.createElement("UICorner"),
                    u1.createElement("UIStroke", {
                        Thickness = 2,
                        Color = Color3.fromRGB(255, 255, 255)
                    }),
                    ResourceIcon = u1.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Image = p4.image,
                        Size = UDim2.fromScale(0.4, 0.4),
                        Position = UDim2.fromScale(0.225, 0.5),
                        SizeConstraint = Enum.SizeConstraint.RelativeXX
                    }),
                    Counter = u1.createElement("TextLabel", {
                        [u1.Ref] = p4.resourceCounterRef,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Text = "0",
                        Font = Enum.Font.Arcade,
                        Size = UDim2.fromScale(0.5, 0.5),
                        Position = UDim2.fromScale(0.7, 0.5),
                        TextStrokeTransparency = 0,
                        TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextScaled = true,
                        BackgroundTransparency = 1
                    })
                })
            })
        })
    });
end;

function v2.didMount(p5) -- Line: 73
    p5:setupResourceListener();
end;

function v2.setupResourceListener(u6) -- Line: 76
    local u7 = u6.resourceCounterRef:getValue();

    if not u7 then
        return nil;
    end;

    u6.props.drill:GetAttributeChangedSignal(u6.props.itemtype):Connect(function() -- Line: 81
        -- upvalues: u6 (copy), u7 (copy)
        local v8 = u6.props.drill:GetAttribute(u6.props.itemtype);
        u7.Text = tostring(v8);
    end);
end;

return {
    DrillBillboard = v2
};