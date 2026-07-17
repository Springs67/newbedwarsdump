-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "ElektraTpEmoteController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 25
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "ElektraTpEmoteController";
end;

function u2.KnitStart(p5) -- Line: 33
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), AnimationType (copy), EntityUtil (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local ELEKTRA_TP = EmoteType.ELEKTRA_TP;
    local u6 = EmoteHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 41, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 47
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 51
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onEnable(u10, u11, u12, p13, u14) -- Line: 54
        -- upvalues: AnimationType (ref), EntityUtil (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
        u14:GiveTask(u10:watchEmoteAnimation(u11, u12, AnimationType.ELEKTRA_TP, function(p15) -- Line: 55
            -- upvalues: u14 (copy), u12 (copy), EntityUtil (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), u10 (copy), u11 (copy)
            if p15 ~= nil then
                p15 = p15:GetMarkerReachedSignal("tp"):Connect(function(p16) -- Line: 59
                    -- upvalues: u12 (ref), EntityUtil (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), u10 (ref), u11 (ref)
                    if not u12.PrimaryPart then
                        return nil;
                    end;

                    local u17 = EntityUtil:getEntity(u12);

                    if not u17 then
                        return nil;
                    end;

                    if p16 == "start" then
                        task.spawn(function() -- Line: 69
                            -- upvalues: ReplicatedStorage (ref), Workspace (ref), u17 (copy), EffectUtil (ref)
                            local v18 = ReplicatedStorage.Assets.Effects.ElectricDashStart:Clone();
                            v18.Parent = Workspace;
                            v18.CFrame = u17:getInstance():GetPivot();
                            local v19 = {};
                            local v20 = v18:GetDescendants();
                            table.move(v20, 1, #v20, #v19 + 1, v19);
                            EffectUtil:playEffects(v19, u17:getInstance(), {
                                destroyAfterSec = 2
                            });
                            task.wait(2);
                            v18:Destroy();
                        end);

                        return;
                    end;

                    task.spawn(function() -- Line: 86
                        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u17 (copy), EffectUtil (ref)
                        local v21 = ReplicatedStorage.Assets.Effects.ElectricDashBurst:Clone();
                        v21.Parent = Workspace;
                        v21.CFrame = u17:getInstance():GetPivot();
                        local v22 = {};
                        local v23 = v21:GetDescendants();
                        table.move(v23, 1, #v23, #v22 + 1, v22);
                        EffectUtil:playEffects(v22, u17:getInstance(), {
                            destroyAfterSec = 2
                        });
                        task.wait(2);
                        v21:Destroy();
                    end);
                    local ELECTRIC_DASH = GameSound.ELECTRIC_DASH;
                    local v24 = {
                        playbackSpeedMultiplier = 1.27
                    };
                    local v25;

                    if u10:isPreview(u11) then
                        v25 = nil;
                    else
                        v25 = u12.PrimaryPart.Position;
                    end;

                    v24.position = v25;
                    SoundManager:playSound(ELECTRIC_DASH, v24);
                end);
            end;

            u14:GiveTask(p15);
        end));
    end;

    function u7.onDisable(p26, p27, p28, p29) -- Line: 111
    end;

    EmoteHandlerController:registerHandler(ELEKTRA_TP, u7);
end;

KnitClient.CreateController(u2.new());

return nil;