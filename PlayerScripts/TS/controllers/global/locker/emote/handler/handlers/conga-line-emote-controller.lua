-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "CongaLineEmoteController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 21
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "CongaLineEmoteController";
end;

function u3.KnitStart(p6) -- Line: 29
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), u1 (copy), Players (copy)
    KnitController.KnitStart(p6);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local CONGA_LINE = EmoteType.CONGA_LINE;
    local u7 = EmoteHandler;
    local u8 = setmetatable({}, {
        __tostring = function() -- Line: 37, Name: __tostring
            return "Anonymous";
        end,

        __index = u7
    });
    u8.__index = u8;

    function u8.new(...) -- Line: 43
        -- upvalues: u8 (ref)
        local v9 = setmetatable({}, u8);

        return v9:constructor(...) or v9;
    end;

    function u8.constructor(p10, ...) -- Line: 47
        -- upvalues: u7 (copy)
        u7.constructor(p10, ...);
    end;

    function u8.onEnable(p11, p12, p13, p14, p15) -- Line: 50
        -- upvalues: ReplicatedStorage (ref), u1 (ref), Players (ref), KnitClient (ref)
        if p13.PrimaryPart then
            local v16 = ReplicatedStorage.Assets.Effects.CongaConfetti:Clone();
            v16.Parent = p13.PrimaryPart;
            v16.Position = p13.PrimaryPart.Position;
            u1("WeldConstraint", {
                Part0 = v16,
                Part1 = p13.PrimaryPart,
                Parent = p13
            });
            p15:GiveTask(v16);
        end;

        if p12 ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        p15:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            constantSpeedMultiplier = 0.3,
            blockSprint = true
        }));
    end;

    function u8.onDisable(p17, p18, p19, p20) -- Line: 70
    end;

    EmoteHandlerController:registerHandler(CONGA_LINE, u8);
end;

KnitClient.CreateController(u3.new());

return nil;