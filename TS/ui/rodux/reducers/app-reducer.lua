-- Decompiled with Potassium's decompiler.

local PlaceUtil = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local v1 = {};
local v2 = setmetatable({}, {
    __index = v1
});
v2.NONE = 0;
v1[0] = "NONE";
v2.PARTY = 1;
v1[1] = "PARTY";
v2.INVITES = 2;
v1[2] = "INVITES";
v2.INVENTORY = 3;
v1[3] = "INVENTORY";
v2.BEDWARS_UPGRADE_SHOP = 4;
v1[4] = "BEDWARS_UPGRADE_SHOP";
v2.BEDWARS_ITEM_SHOP = 5;
v1[5] = "BEDWARS_ITEM_SHOP";
v2.LOCKER = 6;
v1[6] = "LOCKER";
v2.MISSIONS = 7;
v1[7] = "MISSIONS";
v2.BATTLEPASS = 8;
v1[8] = "BATTLEPASS";
v2.TAB_LIST = 9;
v1[9] = "TAB_LIST";
v2.CUSTOM_MATCHES = 10;
v1[10] = "CUSTOM_MATCHES";
v2.FLAMETHROWER_UPGRADES = 11;
v1[11] = "FLAMETHROWER_UPGRADES";
v2.GIFTING = 12;
v1[12] = "GIFTING";
v2.GIFTED = 13;
v1[13] = "GIFTED";
v2.SOCIAL_CONNECTIONS = 14;
v1[14] = "SOCIAL_CONNECTIONS";
v2.GAME_UPDATES = 15;
v1[15] = "GAME_UPDATES";
v2.RANKED_PAID_RESTRICTION = 16;
v1[16] = "RANKED_PAID_RESTRICTION";
v2.CUSTOM_MATCH_HOST_PANEL = 17;
v1[17] = "CUSTOM_MATCH_HOST_PANEL";
local u3 = {
    scaleComponentValue = 0,
    shownApp = v2.NONE,
    showHotbarPartyControls = not PlaceUtil.isGameServer()
};

return {
    AppReducer = function(p4, p5) -- Line: 52, Name: AppReducer
        -- upvalues: u3 (copy)
        if p4 == nil then
            p4 = u3;
        end;

        if p5.type == "SetShownApp" then
            local v6 = {};

            for i, v in p4 do
                v6[i] = v;
            end;

            v6.shownApp = p5.app;

            return v6;
        end;

        if p5.type == "SetShowHotbarPartyControls" then
            local v7 = {};

            for i, v in p4 do
                v7[i] = v;
            end;

            v7.showHotbarPartyControls = p5.value;

            return v7;
        end;

        if p5.type ~= "SetScaleComponentValue" then
            return p4;
        end;

        local v8 = {};

        for i, v in p4 do
            v8[i] = v;
        end;

        v8.scaleComponentValue = p5.scale;

        return v8;
    end,

    App = v2
};