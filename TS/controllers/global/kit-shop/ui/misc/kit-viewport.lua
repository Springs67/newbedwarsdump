-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local PlayerViewport = RuntimeLib.import(script, script.Parent, "player-viewport").PlayerViewport;
local v2 = u1.Component:extend("KitViewport");

function v2.init(p3) -- Line: 12
end;

function v2.render(p4) -- Line: 14
    -- upvalues: u1 (copy), PlayerViewport (copy), getBedwarsKitMeta (copy), BedwarsKit (copy), BedwarsKitSkin (copy), BedwarsKitSkinMeta (copy)
    local v5 = {};

    for i, v in p4.props do
        v5[i] = v;
    end;

    v5[u1.Children] = nil;
    v5.Kit = nil;
    v5.Skin = nil;

    if not p4.props.Kit then
        local v6 = {};

        for i, v in v5 do
            v6[i] = v;
        end;

        local v7 = {};
        local v8 = #v7;
        local v9 = p4.props[u1.Children];

        if v9 then
            for i, v in v9 do
                if type(i) == "number" then
                    v7[v8 + i] = v;
                else
                    v7[i] = v;
                end;
            end;
        end;

        return u1.createElement(PlayerViewport, v6, v7);
    end;

    local renderImage = getBedwarsKitMeta(BedwarsKit.GRIM_REAPER).renderImage;
    local v10 = renderImage == nil and "" or renderImage;

    if p4.props.Kit then
        local v11 = getBedwarsKitMeta(p4.props.Kit);

        if v11 then
            v10 = v11.renderImage;
        else
            warn(p4.props.Kit .. " is not a valid kit");
        end;
    end;

    if p4.props.Skin and p4.props.Skin ~= BedwarsKitSkin.DEFAULT then
        local v12 = BedwarsKitSkinMeta[p4.props.Skin];

        if v12 then
            v10 = v12.renderImage;
        else
            warn(p4.props.Skin .. " is not a valid kit skin");
        end;
    end;

    local v13 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Image = v10,
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    };
    local ImageTransparency = p4.props.ImageTransparency;
    v13.ImageTransparency = ImageTransparency == nil and 0 or ImageTransparency;
    v13.ZIndex = p4.props.ZIndex;

    for i, v in v5 do
        v13[i] = v;
    end;

    local v14 = {};
    local v15 = #v14;
    local v16 = p4.props[u1.Children];

    if v16 then
        for i, v in v16 do
            if type(i) == "number" then
                v14[v15 + i] = v;
            else
                v14[i] = v;
            end;
        end;
    end;

    return u1.createElement("ImageLabel", v13, v14);
end;

return {
    KitViewport = v2
};