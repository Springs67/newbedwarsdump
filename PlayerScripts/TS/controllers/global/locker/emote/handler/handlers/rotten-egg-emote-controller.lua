-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PartFollowUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "part-follow-util").PartFollowUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "RottenEggEmoteController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "RottenEggEmoteController";
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), Players (copy), EntityUtil (copy), ReplicatedStorage (copy), PartFollowUtil (copy), GameSound (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local ROTTEN_EGG = EmoteType.ROTTEN_EGG;
    local u6 = EmoteHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 40, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 46
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 50
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onEnable(u10, u11, u12, p13, p14) -- Line: 53
        -- upvalues: Players (ref), EntityUtil (ref), ReplicatedStorage (ref), PartFollowUtil (ref), GameSound (ref)
        local LeftHand = u12.LeftHand;

        if not LeftHand then
            return nil;
        end;

        local v15 = Players:GetPlayerByUserId(u11);

        if not v15 then
            return nil;
        end;

        local v16 = EntityUtil:getEntity(v15);

        if not v16 then
            return nil;
        end;

        local u17 = v16:hideHandItem();
        local u18 = ReplicatedStorage.Assets.Misc.RottenEgg:Clone();
        u18.Parent = LeftHand;
        u18:PivotTo(LeftHand.CFrame * CFrame.new(Vector3.new(0, 0, -0.75)));
        local u19 = PartFollowUtil.startFollowing(u18.PrimaryPart, LeftHand, Vector3.new(0, 0, -0.75), true, false, Vector3.new(90, 0, 0));
        task.delay(0.3, function() -- Line: 77
            -- upvalues: u10 (copy), GameSound (ref), u11 (copy), u12 (copy)
            u10:playSound(GameSound.ROTTEN_EGG_EMOTE_SOUND, u11, {
                rollOffMaxDistance = 55,
                playbackSpeedMultiplier = 0.7,
                position = u12:GetPivot().Position
            });
        end);
        task.delay(3, function() -- Line: 85
            -- upvalues: u18 (copy), u19 (copy), u17 (copy)
            if u18 and u18.Parent ~= nil then
                u18:Destroy();
            end;

            if u19 then
                u19:Destroy();
            end;

            u17:DoCleaning();
        end);
        p14:GiveTask(function() -- Line: 94
            -- upvalues: u18 (copy), u19 (copy), u17 (copy)
            if u18 and u18.Parent ~= nil then
                u18:Destroy();
            end;

            if u19 then
                u19:Destroy();
            end;

            u17:DoCleaning();
        end);
    end;

    function u7.onDisable(p20, p21, p22, p23) -- Line: 104
    end;

    EmoteHandlerController:registerHandler(ROTTEN_EGG, u7);
end;

KnitClient.CreateController(u2.new());

return nil;