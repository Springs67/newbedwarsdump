-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "SpringPunchGadgetController";
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
    -- upvalues: KnitController (copy), GameSound (copy)
    KnitController.constructor(p4);
    p4.Name = "SpringPunchGadgetController";
    p4.shotSounds = { GameSound.SPRING_PUNCH_SHOT_1, GameSound.SPRING_PUNCH_SHOT_2, GameSound.SPRING_PUNCH_SHOT_3 };
    p4.hitSounds = { GameSound.SPRING_PUNCH_HIT_1, GameSound.SPRING_PUNCH_HIT_2, GameSound.SPRING_PUNCH_HIT_3 };
end;

function u2.KnitStart(u5) -- Line: 34
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), default (copy), Players (copy), SoundManager (copy)
    KnitController.KnitStart(u5);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.LOBBY_SPRING_PUNCH, {
        sounds = {
            GameSound.SPRING_PUNCH_SHOT_1,
            GameSound.SPRING_PUNCH_SHOT_2,
            GameSound.SPRING_PUNCH_SHOT_3,
            GameSound.SPRING_PUNCH_HIT_1,
            GameSound.SPRING_PUNCH_HIT_2,
            GameSound.SPRING_PUNCH_HIT_3,
            GameSound.SPRING_PUNCH_RETRACT
        }
    });
    default.Client:Get("LobbySpringPunchFromServer"):Connect(function(u6) -- Line: 43
        -- upvalues: Players (ref), SoundManager (ref), u5 (copy)
        if u6.userPlayer == Players.LocalPlayer then
            local targetPlayer = u6.targetPlayer;

            if targetPlayer ~= nil then
                targetPlayer = targetPlayer.Character;

                if targetPlayer ~= nil then
                    targetPlayer = targetPlayer.PrimaryPart;
                end;
            end;

            if targetPlayer then
                local v7 = u5.hitSounds[math.random(0, #u5.hitSounds - 1) + 1];
                local v8 = {};
                local Character = u6.targetPlayer.Character;

                if Character ~= nil then
                    Character = Character.PrimaryPart;

                    if Character ~= nil then
                        Character = Character.Position;
                    end;
                end;

                v8.position = Character;
                local Character2 = u6.targetPlayer.Character;

                if Character2 ~= nil then
                    Character2 = Character2.PrimaryPart;
                end;

                v8.parent = Character2;
                SoundManager:playSound(v7, v8);
            end;

            return nil;
        end;

        task.spawn(function() -- Line: 76
            -- upvalues: u5 (ref), u6 (copy)
            u5:animatePunch(u6.userPlayer, u6.targetPlayer);
        end);
    end);
end;

function u2.animatePunch(u9, p10, u11) -- Line: 82
    -- upvalues: Players (copy), KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy)
    local v12;

    if p10 == Players.LocalPlayer then
        if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
            v12 = KnitClient.Controllers.ViewmodelController:getViewModel();

            if v12 ~= nil then
                v12 = v12:FindFirstChild("lobby_spring_punch");

                if v12 ~= nil then
                    v12 = v12:FindFirstChild("Handle");

                    if v12 ~= nil then
                        v12 = v12:FindFirstChild("AnimationController");

                        if v12 ~= nil then
                            v12 = v12:FindFirstChild("Animator");
                        end;
                    end;
                end;
            end;
        else
            v12 = Players.LocalPlayer;

            if v12 ~= nil then
                v12 = v12.Character;

                if v12 ~= nil then
                    v12 = v12:FindFirstChild("lobby_spring_punch");

                    if v12 ~= nil then
                        v12 = v12:FindFirstChild("Handle");

                        if v12 ~= nil then
                            v12 = v12:FindFirstChild("AnimationController");

                            if v12 ~= nil then
                                v12 = v12:FindFirstChild("Animator");
                            end;
                        end;
                    end;
                end;
            end;
        end;
    elseif p10 == nil then
        v12 = p10;
    else
        v12 = p10.Character;

        if v12 ~= nil then
            v12 = v12:FindFirstChild("lobby_spring_punch");

            if v12 ~= nil then
                v12 = v12:FindFirstChild("Handle");

                if v12 ~= nil then
                    v12 = v12:FindFirstChild("AnimationController");

                    if v12 ~= nil then
                        v12 = v12:FindFirstChild("Animator");
                    end;
                end;
            end;
        end;
    end;

    if v12 then
        AnimationUtil:playAnimation(v12, GameAnimationUtil:getAssetId(AnimationType.SPRING_PUNCH_ATTACK), {
            looped = false,
            speed = 4
        });
    end;

    local Character = p10.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if Character then
        local v13 = u9.shotSounds[math.random(0, #u9.shotSounds - 1) + 1];
        local v14 = {};
        local Character2 = p10.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;

            if Character2 ~= nil then
                Character2 = Character2.Position;
            end;
        end;

        v14.position = Character2;
        local Character3 = p10.Character;

        if Character3 ~= nil then
            Character3 = Character3.PrimaryPart;
        end;

        v14.parent = Character3;
        SoundManager:playSound(v13, v14);
    end;

    local v15;

    if u11 == nil then
        v15 = u11;
    else
        v15 = u11.Character;

        if v15 ~= nil then
            v15 = v15.PrimaryPart;
        end;
    end;

    if v15 then
        task.delay(0.2, function() -- Line: 184
            -- upvalues: SoundManager (ref), u9 (copy), u11 (copy)
            local v16 = u9.hitSounds[math.random(0, #u9.hitSounds - 1) + 1];
            local v17 = {};
            local Character2 = u11.Character;

            if Character2 ~= nil then
                Character2 = Character2.PrimaryPart;

                if Character2 ~= nil then
                    Character2 = Character2.Position;
                end;
            end;

            v17.position = Character2;
            local Character3 = u11.Character;

            if Character3 ~= nil then
                Character3 = Character3.PrimaryPart;
            end;

            v17.parent = Character3;
            SoundManager:playSound(v16, v17);
        end);
    end;
end;

KnitClient.CreateController(u2.new());

return nil;