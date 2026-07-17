-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ConstantManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ConstantManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local EmoteUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-utils").EmoteUtils;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local RPSResult = RuntimeLib.import(script, script.Parent, "rps-result").RPSResult;
ConstantManager.registerConstants(script, {
    PlayerAnimStartTime = 0.5
});
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "RockPaperScissorsHandlerController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 28
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "RockPaperScissorsHandlerController";
end;

function u3.KnitStart(p6) -- Line: 36
    -- upvalues: KnitController (copy), default (copy), KnitClient (copy), EmoteType (copy), KnitClient2 (copy), u2 (copy), RPSResult (copy), Players (copy), EmoteHandler (copy), EmoteUtils (copy)
    KnitController.KnitStart(p6);
    default.Client:OnEvent("RPSEmotePlayed", function(u7) -- Line: 38
        -- upvalues: KnitClient (ref), EmoteType (ref), KnitClient2 (ref), u2 (ref), RPSResult (ref), Players (ref)
        local sourcePlayer = u7.sourcePlayer;
        local Character = u7.sourcePlayer.Character;

        if not Character then
            return nil;
        end;

        task.delay(2.35, function() -- Line: 44
            -- upvalues: KnitClient (ref), sourcePlayer (copy), EmoteType (ref), KnitClient2 (ref), u2 (ref), RPSResult (ref), Character (copy), u7 (copy), Players (ref)
            if KnitClient.Controllers.EmoteController:getPlayingEmote(sourcePlayer) ~= EmoteType.ROCK_PAPER_SCISSORS then
                return nil;
            end;

            KnitClient2.Controllers.RockPaperScissorsHandlerController.rpsTree = u2.mount(u2.createElement(RPSResult, {
                Character = Character,
                ResultImage = u7.result
            }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        end);
    end);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local ROCK_PAPER_SCISSORS = EmoteType.ROCK_PAPER_SCISSORS;
    local u8 = EmoteHandler;
    local u9 = setmetatable({}, {
        __tostring = function() -- Line: 61, Name: __tostring
            return "Anonymous";
        end,

        __index = u8
    });
    u9.__index = u9;

    function u9.new(...) -- Line: 67
        -- upvalues: u9 (ref)
        local v10 = setmetatable({}, u9);

        return v10:constructor(...) or v10;
    end;

    function u9.constructor(p11, ...) -- Line: 71
        -- upvalues: u8 (copy)
        u8.constructor(p11, ...);
    end;

    function u9.onEnable(p12, p13, u14, p15, p16) -- Line: 74
        -- upvalues: u2 (ref), EmoteUtils (ref), EmoteType (ref), KnitClient2 (ref), RPSResult (ref), Players (ref)
        if not u14.PrimaryPart then
            return nil;
        end;

        if p12:isPreview(p13) then
            p16:GiveTask(task.delay(2.35, function() -- Line: 79
                -- upvalues: u2 (ref), u14 (copy), EmoteUtils (ref), EmoteType (ref), KnitClient2 (ref), RPSResult (ref), Players (ref)
                local v17 = {
                    Character = u14
                };
                local v18 = EmoteUtils.getIconResult(EmoteType.ROCK_PAPER_SCISSORS);
                v17.ResultImage = v18 == nil and "" or v18;
                KnitClient2.Controllers.RockPaperScissorsHandlerController.rpsTree = u2.mount(u2.createElement(RPSResult, v17), Players.LocalPlayer:WaitForChild("PlayerGui"));
            end));
        end;
    end;

    function u9.onDisable(p19, p20, p21, p22) -- Line: 93
    end;

    EmoteHandlerController:registerHandler(ROCK_PAPER_SCISSORS, u9);
end;

KnitClient.CreateController(u3.new());

return nil;