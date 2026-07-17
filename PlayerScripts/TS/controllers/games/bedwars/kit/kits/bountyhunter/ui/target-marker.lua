-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AvatarUpper = RuntimeLib.import(script, script.Parent, "avatar-upper").AvatarUpper;
local u2 = u1.Component:extend("TargetMarker");

function u2.init(p3) -- Line: 10
end;

function u2.render(p4) -- Line: 12
    -- upvalues: u1 (copy), Theme (copy), BedwarsImageId (copy), AvatarUpper (copy)
    return u1.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        ScaleType = "Fit",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        ImageColor3 = Theme.backgroundPrimary,
        Size = UDim2.new(1, 0, 1, 0),
        Image = BedwarsImageId.BOUNTY_HUNTER_MARKER
    }, { u1.createElement(AvatarUpper, {
            store = p4.props.store,
            player = p4.props.player,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.2),
            Size = UDim2.fromScale(0.3, 0.3),
            BackgroundColor3 = Theme.backgroundSecondary
        }, { u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1,
                DominantAxis = "Width"
            }), u1.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }) }) });
end;

function u2.shouldUpdate(p5, p6) -- Line: 40
    return p5.props.store.Kit.bountyHunterTarget ~= p6.store.Kit.bountyHunterTarget;
end;

return {
    TargetMarkerWrapper = function(p7) -- Line: 44, Name: TargetMarkerWrapper
        -- upvalues: u1 (copy), u2 (ref)
        return u1.createElement("BillboardGui", {
            ExtentsOffsetWorldSpace = Vector3.new(0, 3, 0),
            ResetOnSpawn = false,
            Size = UDim2.fromOffset(100, 100),
            SizeOffset = Vector2.new(0, 1),
            Adornee = p7.adornee
        }, { u1.createElement(u2, {
                store = p7.store,
                player = p7.player
            }) });
    end,

    TargetMarker = u2
};