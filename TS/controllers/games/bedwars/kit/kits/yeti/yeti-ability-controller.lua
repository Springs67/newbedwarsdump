-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "YetiAbilityController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "YetiAbilityController";
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: KnitController (copy), default (copy), EntityUtil (copy), SoundManager (copy), GameSound (copy), KnitClient (copy)
    KnitController.KnitStart(p4);
    default.Client:OnEvent("YetiAbility", function(p5) -- Line: 29
        -- upvalues: EntityUtil (ref), SoundManager (ref), GameSound (ref), KnitClient (ref)
        if p5.senderEntityInstance then
            local v6 = EntityUtil:getEntity(p5.senderEntityInstance);
            local YETI_ROAR = GameSound.YETI_ROAR;
            local v7 = {};

            if v6 ~= nil then
                v6 = v6:isLocalPlayer();
            end;

            local v8;

            if v6 then
                v8 = nil;
            else
                v8 = p5.position;
            end;

            v7.position = v8;
            SoundManager:playSound(YETI_ROAR, v7);
        end;

        KnitClient.Controllers.FreezeBlocksController:freezeBlocks(p5.position, p5.frozenBlocks);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;