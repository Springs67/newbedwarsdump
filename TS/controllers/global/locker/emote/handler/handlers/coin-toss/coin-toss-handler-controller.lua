-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ConstantManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ConstantManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local EmoteUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-utils").EmoteUtils;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local CoinTossResult = RuntimeLib.import(script, script.Parent, "coin-toss-result").CoinTossResult;
ConstantManager.registerConstants(script, {
    PlayerAnimStartTime = 0.5
});
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "CoinTossHandlerController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 31
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "CoinTossHandlerController";
end;

function u5.KnitStart(p8) -- Line: 39
    -- upvalues: KnitController (copy), default (copy), KnitClient (copy), EmoteType (copy), KnitClient2 (copy), u3 (copy), CoinTossResult (copy), Players (copy), EmoteHandler (copy), ReplicatedStorage (copy), u2 (copy), EmoteUtils (copy)
    KnitController.KnitStart(p8);
    default.Client:OnEvent("CoinTossEmotePlayed", function(u9) -- Line: 41
        -- upvalues: KnitClient (ref), EmoteType (ref), KnitClient2 (ref), u3 (ref), CoinTossResult (ref), Players (ref)
        local sourcePlayer = u9.sourcePlayer;
        local Character = u9.sourcePlayer.Character;

        if not Character then
            return nil;
        end;

        task.delay(1.3, function() -- Line: 47
            -- upvalues: KnitClient (ref), sourcePlayer (copy), EmoteType (ref), KnitClient2 (ref), u3 (ref), CoinTossResult (ref), Character (copy), u9 (copy), Players (ref)
            if KnitClient.Controllers.EmoteController:getPlayingEmote(sourcePlayer) ~= EmoteType.COIN_TOSS then
                return nil;
            end;

            KnitClient2.Controllers.CoinTossHandlerController.guiTree = u3.mount(u3.createElement(CoinTossResult, {
                Character = Character,
                ResultImage = u9.result
            }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        end);
    end);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local COIN_TOSS = EmoteType.COIN_TOSS;
    local u10 = EmoteHandler;
    local u11 = setmetatable({}, {
        __tostring = function() -- Line: 64, Name: __tostring
            return "Anonymous";
        end,

        __index = u10
    });
    u11.__index = u11;

    function u11.new(...) -- Line: 70
        -- upvalues: u11 (ref)
        local v12 = setmetatable({}, u11);

        return v12:constructor(...) or v12;
    end;

    function u11.constructor(p13, ...) -- Line: 74
        -- upvalues: u10 (copy)
        u10.constructor(p13, ...);
    end;

    function u11.onEnable(p14, p15, u16, p17, u18) -- Line: 77
        -- upvalues: ReplicatedStorage (ref), u2 (ref), u3 (ref), EmoteUtils (ref), EmoteType (ref), KnitClient2 (ref), CoinTossResult (ref), Players (ref)
        if not u16.PrimaryPart then
            return nil;
        end;

        local v19 = ReplicatedStorage.Assets.Misc.Coin:Clone();
        v19.Parent = u16;
        v19:PivotTo(u16.RightHand.CFrame);
        p14:setupInstance(v19);
        v19.CanCollide = false;
        u18:GiveTask(v19);
        u18:GiveTask((u2("Motor6D", {
            Parent = v19,
            Part0 = u16.RightHand,
            Part1 = v19
        })));

        if p14:isPreview(p15) then
            u18:GiveTask(task.delay(1.3, function() -- Line: 94
                -- upvalues: u3 (ref), u16 (copy), EmoteUtils (ref), EmoteType (ref), KnitClient2 (ref), CoinTossResult (ref), Players (ref), u18 (copy)
                local v20 = {
                    Character = u16
                };
                local v21 = EmoteUtils.getIconResult(EmoteType.COIN_TOSS);
                v20.ResultImage = v21 == nil and "" or v21;
                KnitClient2.Controllers.CoinTossHandlerController.guiTree = u3.mount(u3.createElement(CoinTossResult, v20), Players.LocalPlayer:WaitForChild("PlayerGui"));
                u18:GiveTask(function() -- Line: 105
                    -- upvalues: KnitClient2 (ref), u3 (ref)
                    if KnitClient2.Controllers.CoinTossHandlerController.guiTree then
                        u3.unmount(KnitClient2.Controllers.CoinTossHandlerController.guiTree);
                    end;
                end);
            end));
        end;
    end;

    function u11.onDisable(p22, p23, p24, p25) -- Line: 113
    end;

    EmoteHandlerController:registerHandler(COIN_TOSS, u11);
end;

KnitClient.CreateController(u5.new());

return nil;