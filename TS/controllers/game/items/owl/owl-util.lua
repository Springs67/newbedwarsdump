-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 9, Name: __tostring
        return "OwlUtil";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 14
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 18
end;

function u1.setOwlTarget(p4, p5, p6) -- Line: 20
    p4.userTargetMap[p5.UserId] = p6;
end;

function u1.getOwlTarget(p7, p8) -- Line: 26
    return p7.userTargetMap[p8.UserId];
end;

function u1.setOwlClientModel(p9, p10, p11) -- Line: 31
    p9.userOwlMap[p10.UserId] = p11;
end;

function u1.getOwlClientModelByUser(p12, p13) -- Line: 37
    return p12.userOwlMap[p13.UserId];
end;

function u1.deattachOwl(p14, p15) -- Line: 42
    p14.userOwlMap[p15.UserId] = nil;
    p14.userTargetMap[p15.UserId] = nil;
end;

function u1.linkOwls(p16, p17, p18) -- Line: 50
    p16.owlMap[p17] = p18;
end;

function u1.unlinkOwls(p19, p20) -- Line: 56
    p19.owlMap[p20] = nil;
end;

function u1.getClientOwlFromServerOwl(p21, p22) -- Line: 61
    return p21.owlMap[p22];
end;

function u1.getOwlHootSound(p23, p24) -- Line: 66
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    if not p24.Character then
        return p23.owlHootSound;
    end;

    local v25 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p24.Character)];
    local owl = v25.owl;

    if owl ~= nil then
        owl = owl.owlHootSound;
    end;

    if owl then
        return v25.owl.owlHootSound;
    end;

    return p23.owlHootSound;
end;

function u1.getOwlCuteSound(p26, p27) -- Line: 81
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    if not p27.Character then
        return p26.owlCuteSound;
    end;

    local v28 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p27.Character)];
    local owl = v28.owl;

    if owl ~= nil then
        owl = owl.owlHootSound;
    end;

    if owl then
        return v28.owl.owlHootSound;
    end;

    return p26.owlHootSound;
end;

function u1.getOwlShootSound(p29, p30) -- Line: 96
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    if not p30.Character then
        return p29.owlShootingSound;
    end;

    local v31 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p30.Character)];
    local owl = v31.owl;

    if owl ~= nil then
        owl = owl.owlShootSound;
    end;

    if owl then
        return v31.owl.owlShootSound;
    end;

    return p29.owlShootingSound;
end;

u1.userOwlMap = {};
u1.userTargetMap = {};
u1.owlMap = {};
u1.owlHootSound = {
    GameSound.OWL_HOOT_1,
    GameSound.OWL_HOOT_2,
    GameSound.OWL_HOOT_3,
    GameSound.OWL_HOOT_4
};
u1.owlShootingSound = { GameSound.OWL_SHOOT_1, GameSound.OWL_SHOOT_2, GameSound.OWL_SHOOT_3 };
u1.owlCuteSound = { GameSound.OWL_CUTE_1, GameSound.OWL_CUTE_2 };

return {
    OwlUtil = u1
};