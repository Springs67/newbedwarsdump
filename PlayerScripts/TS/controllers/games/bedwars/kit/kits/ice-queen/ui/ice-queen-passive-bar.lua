-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local GetTarmacAsset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset;
local IceShard = RuntimeLib.import(script, script.Parent, "ice-shard").IceShard;
local u3 = GetTarmacAsset("Shard1");
local u4 = GetTarmacAsset("Shard2");
local u5 = GetTarmacAsset("Shard3");
local u6 = GetTarmacAsset("Shard4");
local u7 = GetTarmacAsset("ShardOutline");
local u8 = u1.Component:extend("IceQueenPassiveBar");

function u8.init(p9) -- Line: 18
end;

function u8.render(p10) -- Line: 20
    -- upvalues: u7 (copy), u1 (copy), u3 (copy), IceShard (copy), u4 (copy), u5 (copy), u6 (copy)
    local v11 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(0.6, 0, 0.6, 0)
    };
    local shardImages = p10.props.shardImages;

    if shardImages ~= nil then
        shardImages = shardImages.shardsOutline.Image;
    end;

    if shardImages == nil then
        shardImages = u7.Image;
    end;

    v11.Image = shardImages;
    local shardImages2 = p10.props.shardImages;

    if shardImages2 ~= nil then
        shardImages2 = shardImages2.shardsOutline.ImageRectSize;
    end;

    if shardImages2 == nil then
        shardImages2 = u7.ImageRectSize;
    end;

    v11.ImageRectSize = shardImages2;
    local shardImages3 = p10.props.shardImages;

    if shardImages3 ~= nil then
        shardImages3 = shardImages3.shardsOutline.ImageRectOffset;
    end;

    if shardImages3 == nil then
        shardImages3 = u7.ImageRectOffset;
    end;

    v11.ImageRectOffset = shardImages3;
    local v12 = { u1.createElement("UIGradient", {
            Rotation = -90,
            Color = p10.props.iceShardGradient or ColorSequence.new(Color3.fromRGB(5, 167, 226), Color3.fromRGB(84, 237, 255)),
            Offset = Vector2.new(0, 0.1)
        }) };
    local v13 = #v12;
    local v14 = {};
    local shardImages4 = p10.props.shardImages;

    if shardImages4 ~= nil then
        shardImages4 = shardImages4.shard1;
    end;

    if shardImages4 == nil then
        shardImages4 = u3;
    end;

    v14.shard = shardImages4;
    v14.barNumber = 0;
    v14.currentBar = p10.props.bar;
    v14.gradient = p10.props.iceShardGradient;
    v12[v13 + 1] = u1.createElement(IceShard, v14);
    local v15 = {};
    local shardImages5 = p10.props.shardImages;

    if shardImages5 ~= nil then
        shardImages5 = shardImages5.shard2;
    end;

    if shardImages5 == nil then
        shardImages5 = u4;
    end;

    v15.shard = shardImages5;
    v15.barNumber = 1;
    v15.currentBar = p10.props.bar;
    v15.gradient = p10.props.iceShardGradient;
    v12[v13 + 2] = u1.createElement(IceShard, v15);
    local v16 = {};
    local shardImages6 = p10.props.shardImages;

    if shardImages6 ~= nil then
        shardImages6 = shardImages6.shard3;
    end;

    if shardImages6 == nil then
        shardImages6 = u5;
    end;

    v16.shard = shardImages6;
    v16.barNumber = 2;
    v16.currentBar = p10.props.bar;
    v16.gradient = p10.props.iceShardGradient;
    v12[v13 + 3] = u1.createElement(IceShard, v16);
    local v17 = {};
    local shardImages7 = p10.props.shardImages;

    if shardImages7 ~= nil then
        shardImages7 = shardImages7.shard4;
    end;

    if shardImages7 == nil then
        shardImages7 = u6;
    end;

    v17.shard = shardImages7;
    v17.barNumber = 3;
    v17.currentBar = p10.props.bar;
    v17.gradient = p10.props.iceShardGradient;
    v12[v13 + 4] = u1.createElement(IceShard, v17);

    return u1.createFragment({
        IceQueenPassiveBar = u1.createElement("ImageLabel", v11, v12)
    });
end;

local u18 = u1.Component:extend("StackIndicator");

function u18.init(p19) -- Line: 126
end;

function u18.render(u20) -- Line: 128
    -- upvalues: u1 (copy)
    return u1.createElement("TextLabel", {
        Font = "LuckiestGuy",
        TextScaled = true,
        BackgroundTransparency = 1,
        Text = u20.props.bar:map(function(p21) -- Line: 130
            -- upvalues: u20 (copy)
            return tostring(u20.props.bar:getValue());
        end),
        TextColor3 = u20.props.stackIndicatorColor or Color3.new(0.42, 0.63, 0.95),
        Size = UDim2.fromScale(0.75, 0.25),
        Position = UDim2.fromScale(0.5, 0.3),
        AnchorPoint = Vector2.new(0.5, 1)
    });
end;

local function v28(p22, p23) -- Line: 143
    -- upvalues: Players (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), u1 (copy), u18 (ref), u8 (ref)
    local _ = p23.useState;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local lastAttackerUserId = p22.lastAttackerUserId;

    if lastAttackerUserId ~= 0 and (lastAttackerUserId == lastAttackerUserId and lastAttackerUserId) then
        local v27 = Players:GetPlayerByUserId(p22.lastAttackerUserId);

        if v27 ~= nil then
            v27 = v27.Character;
        end;

        if v27 then
            v26 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(v27)].freiya;

            if v26 == nil then
                v24 = v26;
            else
                v24 = v26.iceShardGradient;
            end;

            if v26 == nil then
                v25 = v26;
            else
                v25 = v26.stackIndicatorColor;
            end;

            if v26 ~= nil then
                v26 = v26.shardImages;
            end;
        end;
    end;

    return u1.createElement("BillboardGui", {
        AlwaysOnTop = false,
        ResetOnSpawn = false,
        ExtentsOffsetWorldSpace = Vector3.new(0, 4.3, 0),
        Adornee = p22.adornee,
        Size = UDim2.fromScale(3, 3)
    }, { u1.createElement(u18, {
            bar = p22.bar,
            stackIndicatorColor = v25
        }), u1.createElement(u8, {
            bar = p22.bar,
            iceShardGradient = v24,
            shardImages = v26
        }) });
end;

return {
    IceQueenPassiveBar = u8,
    StackIndicator = u18,
    IceQueenPassiveBarWrapper = v2.new(u1)(v28)
};