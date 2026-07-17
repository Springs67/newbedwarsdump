-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "DroppedThisKingEmoteController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 23
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "DroppedThisKingEmoteController";
end;

function u1.KnitStart(p4) -- Line: 31
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), AnimationType (copy), ReplicatedStorage (copy), WeldUtil (copy), GameSound (copy), default (copy), Linear (copy)
    KnitController.KnitStart(p4);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local DROPPED_THIS_CROWN = EmoteType.DROPPED_THIS_CROWN;
    local u5 = EmoteHandler;
    local u6 = setmetatable({}, {
        __tostring = function() -- Line: 39, Name: __tostring
            return "Anonymous";
        end,

        __index = u5
    });
    u6.__index = u6;

    function u6.new(...) -- Line: 45
        -- upvalues: u6 (ref)
        local v7 = setmetatable({}, u6);

        return v7:constructor(...) or v7;
    end;

    function u6.constructor(p8, ...) -- Line: 49
        -- upvalues: u5 (copy)
        u5.constructor(p8, ...);
    end;

    function u6.onEnable(u9, u10, u11, p12, u13) -- Line: 52
        -- upvalues: AnimationType (ref), ReplicatedStorage (ref), WeldUtil (ref), GameSound (ref), default (ref), Linear (ref)
        local u14 = nil;
        u13:GiveTask((u9:watchEmoteAnimation(u10, u11, AnimationType.DROPPED_THIS_KING_LONG, function(p15) -- Line: 55
            -- upvalues: u13 (copy), u14 (ref), ReplicatedStorage (ref), u11 (copy), u9 (copy), WeldUtil (ref), GameSound (ref), u10 (copy), default (ref), Linear (ref)
            local v16;

            if p15 == nil then
                v16 = p15;
            else
                v16 = p15:GetMarkerReachedSignal("FoundItem"):Connect(function() -- Line: 60
                    -- upvalues: u14 (ref), ReplicatedStorage (ref), u11 (ref), u9 (ref), u13 (ref), WeldUtil (ref), GameSound (ref), u10 (ref)
                    u14 = ReplicatedStorage.Assets.Misc.GoldCrown:Clone();
                    u14.Parent = u11;
                    u9:setupInstance(u14);
                    u13:GiveTask(function() -- Line: 64
                        -- upvalues: u14 (ref)
                        local v17 = u14;

                        if v17 ~= nil then
                            v17:Destroy();
                        end;
                    end);
                    WeldUtil:weldCharacterAccessories(u11);
                    local u18 = u9:playSound(GameSound.RARE_FIND, u10, {
                        rollOffMaxDistance = 55,
                        volumeMultiplier = 1.1,
                        position = u11:GetPivot().Position
                    });
                    u13:GiveTask(function() -- Line: 77
                        -- upvalues: u18 (copy)
                        u18:Destroy();
                    end);
                end);
            end;

            u13:GiveTask(v16);
            local v19;

            if p15 == nil then
                v19 = p15;
            else
                v19 = p15:GetMarkerReachedSignal("Reveal"):Connect(function() -- Line: 87
                end);
            end;

            u13:GiveTask(v19);

            if p15 ~= nil then
                p15 = p15:GetMarkerReachedSignal("PullBack"):Connect(function() -- Line: 94
                    -- upvalues: u14 (ref), default (ref), Linear (ref)
                    if not u14 then
                        return nil;
                    end;

                    default(0.2, Linear, function(u20) -- Line: 98
                        -- upvalues: u14 (ref)
                        local v21 = u14;

                        if v21 ~= nil then
                            local function _(p22) -- Line: 102
                                -- upvalues: u20 (copy)
                                if p22:IsA("BasePart") then
                                    p22.Transparency = u20 * 1;
                                end;
                            end;

                            for i, descendant in v21:GetDescendants() do
                                local _ = i - 1;

                                if descendant:IsA("BasePart") then
                                    descendant.Transparency = u20 * 1;
                                end;
                            end;
                        end;
                    end);
                end);
            end;

            u13:GiveTask(p15);
        end)));
    end;

    function u6.onDisable(p23, p24, p25, p26) -- Line: 118
    end;

    EmoteHandlerController:registerHandler(DROPPED_THIS_CROWN, u6);
end;

KnitClient.CreateController(u1.new());

return nil;