-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "PillowController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 27
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 31
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p6);
    p6.Name = "PillowController";
    p6.pillowRemote = default.Client:Get("PillowSwing");
    p6.playEffectsRemoteEvent = default.Client:Get("PillowEffects");
end;

function u4.KnitStart(u7) -- Line: 37
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), u2 (copy), Players (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy)
    KnitController.KnitStart(u7);
    ClientSyncEvents.SwordSwing:connect(function(p8) -- Line: 39
        -- upvalues: ItemType (ref), u7 (copy)
        if p8:isCancelled() or p8.swordType ~= ItemType.PILLOW then
            return nil;
        end;

        local chargedAttack = p8.chargedAttack;

        if chargedAttack ~= nil then
            chargedAttack = chargedAttack.chargeRatio;
        end;

        u7.pillowRemote:CallServerAsync(chargedAttack == nil and 0 or chargedAttack);
    end);
    u7.playEffectsRemoteEvent:Connect(function(u9) -- Line: 54
        -- upvalues: u2 (ref), Players (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref)
        local u10 = u2.new();
        local u11 = false;
        local playerIds = u9.playerIds;

        local function v17(p12) -- Line: 58
            -- upvalues: Players (ref), u11 (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), u9 (copy), u10 (copy)
            local v13 = Players:GetPlayerByUserId(p12);

            if v13 ~= nil then
                v13 = v13.Character;
            end;

            if v13 ~= nil then
                v13 = v13.PrimaryPart;

                if v13 ~= nil then
                    v13 = v13.Position;
                end;
            end;

            if v13 then
                if not u11 then
                    SoundManager:playSound(RandomUtil.fromList(GameSound.PILLOW_HIT_1, GameSound.PILLOW_HIT_2, GameSound.PILLOW_HIT_3), {
                        rollOffMaxDistance = 220,
                        volumeMultiplier = 1.8,
                        position = v13
                    });
                    u11 = true;
                end;

                local u14 = ReplicatedStorage.Assets.Effects.WhiteFeatherEffect:Clone();
                u14.Position = v13;
                u14.Parent = Workspace;
                task.delay(0.3, function() -- Line: 84
                    -- upvalues: u14 (copy), u9 (ref)
                    local v15 = u14;

                    if v15 ~= nil then
                        local function _(p16) -- Line: 88
                            -- upvalues: u9 (ref)
                            if p16:IsA("ParticleEmitter") then
                                p16:Emit(u9.charged and 30 or 5);
                            end;
                        end;

                        for i, child in v15:GetChildren() do
                            local _ = i - 1;

                            if child:IsA("ParticleEmitter") then
                                child:Emit(u9.charged and 30 or 5);
                            end;
                        end;
                    end;
                end);
                u10:GiveTask(u14);
            end;
        end;

        for i, v in playerIds do
            v17(v, i - 1, playerIds);
        end;

        task.delay(3, function() -- Line: 104
            -- upvalues: u10 (copy)
            return u10:DoCleaning();
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;