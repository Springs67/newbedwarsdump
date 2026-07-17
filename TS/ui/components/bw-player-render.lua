-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local PlayerRender = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").PlayerRender;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local getPrimaryActiveKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getPrimaryActiveKit;
local v3 = {};
local u4 = setmetatable({}, {
    __index = v3
});
u4.DEFAULT = 0;
v3[0] = "DEFAULT";
u4.NONE = 1;
v3[1] = "NONE";
u4.KIT = 2;
v3[2] = "KIT";

local function v16(p5, p6) -- Line: 26
    -- upvalues: Players (copy), GamePlayerUtil (copy), KnitClient (copy), u4 (ref), getPrimaryActiveKit (copy), Theme (copy), u1 (copy), BedwarsKitMeta (copy), BedwarsImageId (copy), PlayerRender (copy)
    local _ = p6.useState;
    local v7 = Players:GetPlayerByUserId(p5.PlayerUserId);
    local v8 = {};

    for i, v in p5 do
        v8[i] = v;
    end;

    v8.FallbackMode = nil;
    v8.PlayerThumbnail = nil;

    if not (v7 and (GamePlayerUtil.getGamePlayer(v7):isInStreamerMode() or KnitClient.Controllers.StreamerModeController:inStreamerMode())) then
        local v9 = {};

        for i, v in v8 do
            v9[i] = v;
        end;

        v9.Thumbnail = p5.PlayerThumbnail;

        return u1.createElement(PlayerRender, v9);
    end;

    if p5.FallbackMode ~= u4.KIT and p5.FallbackMode ~= u4.NONE then
        local v10 = {};

        for i, v in v8 do
            v10[i] = v;
        end;

        v10.PlayerUserId = nil;

        return u1.createElement(PlayerRender, v10);
    end;

    local v11;

    if p5.FallbackMode == u4.KIT then
        v11 = getPrimaryActiveKit(v7);
    else
        v11 = nil;
    end;

    local v12 = {
        Size = p5.Size or UDim2.new(1, 0, 1, 0),
        Position = p5.Position,
        AnchorPoint = p5.AnchorPoint
    };
    local BorderSizePixel = p5.BorderSizePixel;
    v12.BorderSizePixel = BorderSizePixel == nil and 0 or BorderSizePixel;
    local BackgroundTransparency = p5.BackgroundTransparency;
    v12.BackgroundTransparency = BackgroundTransparency == nil and 1 or BackgroundTransparency;
    v12.BackgroundColor3 = p5.BackgroundColor3 or Theme.backgroundPrimary;
    v12.SizeConstraint = p5.SizeConstraint;
    local ClipsDescendants = p5.ClipsDescendants;
    v12.ClipsDescendants = ClipsDescendants == nil and true or ClipsDescendants;
    local LayoutOrder = p5.LayoutOrder;
    v12.LayoutOrder = LayoutOrder == nil and 1 or LayoutOrder;
    v12.ZIndex = p5.ZIndex;
    local createFragment = u1.createFragment;
    local v13 = {};
    local createElement = u1.createElement;
    local v14 = {};
    local v15;

    if v11 then
        v15 = u1.createFragment({
            PlayerKitImage = u1.createElement("ImageLabel", {
                BorderSizePixel = 0,
                ScaleType = "Crop",
                BackgroundTransparency = 1,
                Image = BedwarsKitMeta[v11].renderImage,
                Size = UDim2.fromScale(1.25, 1.25),
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0),
                ZIndex = p5.ZIndex
            })
        });
    else
        v15 = u1.createFragment({
            NoKitImage = u1.createElement("ImageLabel", {
                ImageTransparency = 0.3,
                BorderSizePixel = 0,
                ScaleType = "Crop",
                BackgroundTransparency = 1,
                Image = BedwarsImageId.X,
                Size = UDim2.fromScale(0.8, 0.8),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                ZIndex = p5.ZIndex
            })
        });
    end;

    v14[1] = v15;
    v13.PlayerKitFrame = createElement("Frame", v12, v14);

    return createFragment(v13);
end;

return {
    PlayerRenderFallbackMode = u4,
    BWPlayerRender = v2.new(u1)(v16)
};