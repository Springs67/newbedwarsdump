-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "RabbitHatTrickEmoteController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 21
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "RabbitHatTrickEmoteController";
end;

function u1.KnitStart(p4) -- Line: 29
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), WeldUtil (copy), GameSound (copy), AnimationType (copy)
    KnitController.KnitStart(p4);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local RABBIT_HAT_TRICK = EmoteType.RABBIT_HAT_TRICK;
    local u5 = EmoteHandler;
    local u6 = setmetatable({}, {
        __tostring = function() -- Line: 37, Name: __tostring
            return "Anonymous";
        end,

        __index = u5
    });
    u6.__index = u6;

    function u6.new(...) -- Line: 43
        -- upvalues: u6 (ref)
        local v7 = setmetatable({}, u6);

        return v7:constructor(...) or v7;
    end;

    function u6.constructor(p8, ...) -- Line: 47
        -- upvalues: u5 (copy)
        u5.constructor(p8, ...);
    end;

    function u6.onEnable(u9, u10, u11, p12, u13) -- Line: 50
        -- upvalues: ReplicatedStorage (ref), WeldUtil (ref), GameSound (ref), AnimationType (ref)
        local u14 = ReplicatedStorage.Assets.Misc.TopHatHead:Clone();
        u14.Parent = u11;
        u9:setupInstance(u14);
        WeldUtil:weldCharacterAccessories(u11);
        local u15 = nil;
        local u16 = u9:playSound(GameSound.RABBIT_HAT_EMOTE_DRUMROLL, u10, {
            rollOffMaxDistance = 55,
            looped = true,
            position = u11:GetPivot().Position
        });
        u13:GiveTask(function() -- Line: 62
            -- upvalues: u16 (copy)
            if u16 then
                u16:Stop();
                u16:Destroy();
            end;
        end);
        local u17 = nil;
        u13:GiveTask(u9:watchEmoteAnimation(u10, u11, AnimationType.RABBIT_HAT_TRICK, function(p18) -- Line: 70
            -- upvalues: u13 (copy), u14 (copy), u17 (ref), ReplicatedStorage (ref), u11 (copy), u9 (copy), WeldUtil (ref), u15 (ref), u16 (copy), GameSound (ref), u10 (copy)
            local v19;

            if p18 == nil then
                v19 = p18;
            else
                v19 = p18:GetMarkerReachedSignal("grab_hat"):Connect(function() -- Line: 74
                    -- upvalues: u14 (ref), u17 (ref), ReplicatedStorage (ref), u11 (ref), u9 (ref), WeldUtil (ref)
                    if u14 then
                        u14:Destroy();
                    end;

                    u17 = ReplicatedStorage.Assets.Misc.TopHatHand:Clone();
                    u17.Parent = u11;
                    u9:setupInstance(u17);
                    WeldUtil:weldCharacterAccessories(u11);
                end);
            end;

            u13:GiveTask(v19);
            local v20;

            if p18 == nil then
                v20 = p18;
            else
                v20 = p18:GetMarkerReachedSignal("grab_rabbit"):Connect(function() -- Line: 89
                    -- upvalues: u15 (ref), ReplicatedStorage (ref), u11 (ref), u9 (ref), WeldUtil (ref), u13 (ref), u16 (ref), GameSound (ref), u10 (ref)
                    u15 = ReplicatedStorage.Assets.Misc.RabbitHandAccessory:Clone();
                    u15.Parent = u11;
                    u9:setupInstance(u15);
                    WeldUtil:weldCharacterAccessories(u11);
                    u13:GiveTask(function() -- Line: 95
                        -- upvalues: u15 (ref)
                        if u15 then
                            u15:Destroy();
                        end;
                    end);

                    if u16 then
                        u16:Stop();
                        u16:Destroy();
                    end;

                    local u21 = u9:playSound(GameSound.RABBIT_HAT_EMOTE_TADA, u10, {
                        rollOffMaxDistance = 55,
                        position = u11:GetPivot().Position
                    });
                    u13:GiveTask(function() -- Line: 110
                        -- upvalues: u21 (copy)
                        if u21 then
                            u21:Stop();
                            u21:Destroy();
                        end;
                    end);
                end);
            end;

            u13:GiveTask(v20);
            local v22;

            if p18 == nil then
                v22 = p18;
            else
                v22 = p18:GetMarkerReachedSignal("hide_rabbit"):Connect(function() -- Line: 122
                    -- upvalues: u15 (ref)
                    if u15 then
                        u15:Destroy();
                    end;
                end);
            end;

            u13:GiveTask(v22);

            if p18 ~= nil then
                p18 = p18:GetMarkerReachedSignal("place_hat"):Connect(function() -- Line: 132
                    -- upvalues: u17 (ref), u14 (ref)
                    if u17 then
                        u17:Destroy();
                    end;

                    if u14 then
                        u14:Destroy();
                    end;
                end);
            end;

            u13:GiveTask(p18);
        end));
        u13:GiveTask(function() -- Line: 143
            -- upvalues: u14 (copy), u17 (ref)
            if u14 then
                u14:Destroy();
            end;

            if u17 then
                u17:Destroy();
            end;
        end);
    end;

    function u6.onDisable(p23, p24, p25, p26) -- Line: 152
    end;

    EmoteHandlerController:registerHandler(RABBIT_HAT_TRICK, u6);
end;

KnitClient.CreateController(u1.new());

return nil;