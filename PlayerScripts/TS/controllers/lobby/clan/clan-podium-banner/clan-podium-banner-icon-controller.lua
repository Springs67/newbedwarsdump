-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types");
local CLAN_PODIUM_BANNER_ICON_IMAGE_ATTRIBUTE = v2.CLAN_PODIUM_BANNER_ICON_IMAGE_ATTRIBUTE;
local CLAN_PODIUM_BANNER_ICON_TAG = v2.CLAN_PODIUM_BANNER_ICON_TAG;
local CLAN_PODIUM_NAMEPLATE_TAG = v2.CLAN_PODIUM_NAMEPLATE_TAG;
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local ClanPodiumBannerIcon = RuntimeLib.import(script, script.Parent, "ui", "clan-podium-banner-icon").ClanPodiumBannerIcon;
local v3 = RuntimeLib.import(script, script.Parent, "ui", "clan-podium-nameplate-billboard");
local ClanPodiumNameplateBillboard = v3.ClanPodiumNameplateBillboard;
local getNameplateOffset = v3.getNameplateOffset;
local getPodiumBillboardAdornee = v3.getPodiumBillboardAdornee;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "ClanPodiumBannerIconController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 28
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6, ...);
    p6.Name = "ClanPodiumBannerIconController";
    p6.trees = {};
end;

function u4.KnitStart(u7) -- Line: 37
    -- upvalues: KnitController (copy), PlaceUtil (copy), CollectionTagAdded (copy), CLAN_PODIUM_BANNER_ICON_TAG (copy), CLAN_PODIUM_BANNER_ICON_IMAGE_ATTRIBUTE (copy), u1 (copy), ClanPodiumBannerIcon (copy), CollectionService (copy), CLAN_PODIUM_NAMEPLATE_TAG (copy), getPodiumBillboardAdornee (copy), getNameplateOffset (copy), ClanPodiumNameplateBillboard (copy)
    KnitController.KnitStart(u7);

    if not PlaceUtil.isLobbyServer() then
        return nil;
    end;

    CollectionTagAdded(CLAN_PODIUM_BANNER_ICON_TAG, function(p8) -- Line: 42
        -- upvalues: CLAN_PODIUM_BANNER_ICON_IMAGE_ATTRIBUTE (ref), u1 (ref), ClanPodiumBannerIcon (ref), u7 (copy)
        if not p8:IsA("BasePart") then
            return nil;
        end;

        local v9 = p8:GetAttribute(CLAN_PODIUM_BANNER_ICON_IMAGE_ATTRIBUTE);
        local v10 = u1.mount(u1.createElement(ClanPodiumBannerIcon, {
            Adornee = p8,
            Image = v9 == nil and "" or v9
        }), p8);
        u7.trees[p8] = v10;
    end);
    CollectionService:GetInstanceRemovedSignal(CLAN_PODIUM_BANNER_ICON_TAG):Connect(function(p11) -- Line: 59
        -- upvalues: u7 (copy), u1 (ref)
        local v12 = u7.trees[p11];

        if v12 ~= nil then
            u1.unmount(v12);
            u7.trees[p11] = nil;
        end;
    end);
    CollectionTagAdded(CLAN_PODIUM_NAMEPLATE_TAG, function(p13) -- Line: 70
        -- upvalues: getPodiumBillboardAdornee (ref), getNameplateOffset (ref), u1 (ref), ClanPodiumNameplateBillboard (ref), u7 (copy)
        local v14 = getPodiumBillboardAdornee(p13);

        if not v14 then
            return nil;
        end;

        local v15 = getNameplateOffset(p13, v14);
        local v16 = u1.mount(u1.createElement(ClanPodiumNameplateBillboard, {
            PodiumModel = p13,
            Adornee = v14,
            StudsOffsetWorldSpace = v15
        }), v14);
        u7.trees[p13] = v16;
    end);
    CollectionService:GetInstanceRemovedSignal(CLAN_PODIUM_NAMEPLATE_TAG):Connect(function(p17) -- Line: 85
        -- upvalues: u7 (copy), u1 (ref)
        local v18 = u7.trees[p17];

        if v18 ~= nil then
            u1.unmount(v18);
            u7.trees[p17] = nil;
        end;
    end);
end;

KnitClient.CreateController(u4.new());

return nil;