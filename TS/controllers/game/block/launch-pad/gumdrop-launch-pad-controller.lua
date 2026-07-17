-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GumdropLaunchPadConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "blocks", "gumdrop-launch-pad-constants").GumdropLaunchPadConstants;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "GumdropLaunchPadController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 27
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "GumdropLaunchPadController";
end;

function u2.KnitStart(p5) -- Line: 35
    -- upvalues: KnitController (copy), BlockEngine (copy), ItemType (copy), Players (copy), KnitClient (copy), MapUtil (copy), GumdropLaunchPadConstants (copy), ClientSyncEvents (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    KnitController.KnitStart(p5);
    BlockEngine:getBlockDamageHook():connect(function(p6) -- Line: 37
        -- upvalues: BlockEngine (ref), ItemType (ref), Players (ref), KnitClient (ref), MapUtil (ref), GumdropLaunchPadConstants (ref)
        local v7 = BlockEngine:getStore():getBlockAt(p6.blockRef.blockPosition);
        local v8;

        if v7 == nil then
            v8 = v7;
        else
            v8 = v7.Name;
        end;

        if v8 ~= ItemType.GUMDROP_BOUNCE_PAD then
            return nil;
        end;

        local v9 = v7:GetAttribute("PlacedByUserId");

        if v9 == nil then
            return nil;
        end;

        local v10 = Players:GetPlayerByUserId(v9);

        if not v10 then
            return nil;
        end;

        local v11 = KnitClient.Controllers.TeamController:getPlayerTeam(v10);

        if not v11 then
            return nil;
        end;

        local function _(p12) -- Line: 59
            -- upvalues: Players (ref)
            return p12.userId == Players.LocalPlayer.UserId;
        end;

        local v13 = false;

        for i, v in MapUtil.values(v11.members) do
            local _ = i - 1;

            if v.userId == Players.LocalPlayer.UserId then
                v13 = true;
                break;
            end;
        end;

        if not v13 then
            p6.damage = p6.damage * GumdropLaunchPadConstants.NON_FRIENDLY_BREAK_SPEED;
        end;
    end);
    ClientSyncEvents.LaunchPadUsed:connect(function(p14) -- Line: 75
        -- upvalues: ItemType (ref), SoundManager (ref), GameSound (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        if p14.launchpad.Name == ItemType.GUMDROP_BOUNCE_PAD then
            local launchpad = p14.launchpad;
            SoundManager:playSound(GameSound.SLIME_SQUISH_2, {
                position = p14.launchpad.Position
            });
            AnimationUtil:playAnimation(launchpad.Jelly.Rig.AnimationController.Animator, GameAnimationUtil:getAssetId(AnimationType.JELLY_SQUISH), {
                looped = false
            });
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;