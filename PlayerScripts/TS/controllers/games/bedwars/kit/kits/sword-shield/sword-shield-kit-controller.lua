-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "SwordShieldKitController";
    end,

    __index = BaseKitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy)
    BaseKitController.constructor(p3, BedwarsKit.SWORD_SHIELD, {
        sounds = {
            GameSound.WOOD_SHIELD_BREAK,
            GameSound.WOOD_SHIELD_REACTIVE,
            GameSound.STONE_SHIELD_BREAK,
            GameSound.STONE_SHIELD_REACTIVE,
            GameSound.IRON_SHIELD_BREAK,
            GameSound.IRON_SHIELD_REACTIVE,
            GameSound.DIAMOND_SHIELD_BREAK,
            GameSound.DIAMOND_SHIELD_REACTIVE,
            GameSound.EMERALD_SHIELD_BREAK,
            GameSound.EMERALD_SHIELD_REACTIVE
        }
    });
    p3.Name = "SwordShieldKitController";
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p4);
end;

function u1.onKitLocalActivated(p5, p6) -- Line: 30
end;

function u1.onKitLocalDeactivated(p7) -- Line: 32
end;

function u1.onKitReplicationActivated(p8, p9) -- Line: 34
end;

function u1.onKitReplicationDeactivated(p10) -- Line: 36
end;

function u1.onInnateAbilityEnabled(p11, p12, p13) -- Line: 38
end;

function u1.onAbilityUsed(p14, p15, p16) -- Line: 40
end;

KnitClient.CreateController(u1.new());

return nil;