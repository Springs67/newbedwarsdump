-- Decompiled with Potassium's decompiler.

local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = u1.Component:extend("WorldGuardRegionNametag");

function v2.init(p3) -- Line: 7
end;

function v2.render(p4) -- Line: 9
    -- upvalues: u1 (copy)
    return u1.createFragment({
        ["WorldGuardRegionBillboard_" .. p4.props.regionId] = u1.createElement("BillboardGui", {
            ExtentsOffset = Vector3.new(0, 0, 0),
            MaxDistance = 110,
            AlwaysOnTop = true,
            Adornee = p4.props.adornee,
            Size = UDim2.fromScale(7.5, 2.5)
        }, {
            BillboardFrame = u1.createElement("ImageLabel", {
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Color3.fromRGB(43, 20, 38),
                Visible = p4.props.visible
            }, {
                u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0.15, 0)
                }),
                TextArea = u1.createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.85, 0.85)
                }, {
                    Id = u1.createElement("TextLabel", {
                        TextStrokeTransparency = 0,
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(0, 0),
                        Text = p4.props.regionId,
                        Font = Enum.Font.Arial,
                        Size = UDim2.fromScale(1, 1),
                        Position = UDim2.fromScale(0, 0),
                        TextStrokeColor3 = Color3.fromRGB(43, 20, 38),
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    })
                })
            })
        })
    });
end;

function v2.didMount(p5) -- Line: 53
end;

return {
    WorldGuardRegionNametag = v2
};