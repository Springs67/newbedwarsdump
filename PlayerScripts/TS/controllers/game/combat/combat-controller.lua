-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local MultiKillConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "multi-kill-constants").MultiKillConstants;
local getAssetIdFromEncoding = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "encoding", "sound-encoding").getAssetIdFromEncoding;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "CombatController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 35
    -- upvalues: KnitController (copy), GameSound (copy)
    KnitController.constructor(p6);
    p6.Name = "CombatController";
    p6.killSounds = {
        GameSound.PLAYER_KILL_1,
        GameSound.PLAYER_KILL_2,
        GameSound.PLAYER_KILL_3,
        GameSound.PLAYER_KILL_4,
        GameSound.PLAYER_KILL_5,
        GameSound.PLAYER_KILL_6
    };
    p6.multiKillLoops = {
        GameSound.PLAYER_MULTIKILL_LOOP_2,
        GameSound.PLAYER_MULTIKILL_LOOP_3,
        GameSound.PLAYER_MULTIKILL_LOOP_4,
        GameSound.PLAYER_MULTIKILL_LOOP_5,
        GameSound.PLAYER_MULTIKILL_LOOP_6
    };
    p6.attackIndicatorSounds = { GameSound.ATTACK_INDICATOR_1, GameSound.ATTACK_INDICATOR_2, GameSound.ATTACK_INDICATOR_3 };
    p6.damageSounds = { GameSound.DAMAGE_1, GameSound.DAMAGE_2, GameSound.DAMAGE_3 };
end;

function u4.KnitStart(u7) -- Line: 43
    -- upvalues: EntityDamageEventZap (copy), ClientStore (copy), QueueMeta (copy), EntityUtil (copy), Workspace (copy), u2 (copy), Players (copy), SoundManager (copy), RandomUtil (copy), getAssetIdFromEncoding (copy), GameSound (copy), default (copy), MultiKillConstants (copy)
    EntityDamageEventZap.On(function(p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21) -- Line: 44
        -- upvalues: ClientStore (ref), QueueMeta (ref), EntityUtil (ref), Workspace (ref), u2 (ref)
        local queueType = ClientStore:getState().Game.queueType;

        if queueType and QueueMeta[queueType].disableDamageHighlight then
            return nil;
        end;

        if p20 then
            return nil;
        end;

        debug.profilebegin("damage-highlight");
        local v22 = EntityUtil:getEntity(p8);

        if v22 then
            local v23 = v22:getInstance();

            if v23.PrimaryPart and (v23:GetPrimaryPartCFrame().Position - Workspace.CurrentCamera.CFrame.Position).Magnitude <= 200 then
                local u24 = v23:FindFirstChild("_DamageHighlight_") or u2("Highlight", {
                    Name = "_DamageHighlight_",
                    OutlineTransparency = 1,
                    FillTransparency = 0.4,
                    Parent = v23,
                    FillColor = Color3.fromRGB(255, 0, 0),
                    DepthMode = Enum.HighlightDepthMode.Occluded
                });
                u24.Enabled = true;
                task.delay(0.2, function() -- Line: 73
                    -- upvalues: u24 (ref)
                    local v25 = u24;

                    if v25 ~= nil then
                        v25 = v25.Parent;
                    end;

                    if v25 then
                        u24.Enabled = false;
                    end;
                end);
            end;
        end;

        debug.profileend();
    end);
    EntityDamageEventZap.On(function(p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38, p39) -- Line: 87
        -- upvalues: Players (ref), SoundManager (ref), RandomUtil (ref), u7 (copy), getAssetIdFromEncoding (ref), GameSound (ref)
        if p30 == Players.LocalPlayer.Character then
            SoundManager:playSound(RandomUtil.fromList(unpack(u7.attackIndicatorSounds)));
        end;

        local v40 = p26 == Players.LocalPlayer.Character;

        if not (p26.PrimaryPart or v40) then
            return nil;
        end;

        local v41 = nil;

        if p35 == 0 or (p35 ~= p35 or not p35) then
            v41 = RandomUtil.fromList(unpack(u7.damageSounds));
        else
            local v42 = getAssetIdFromEncoding(p35);

            if v42 ~= "" then
                v41 = v42 or v41;
            end;
        end;

        if p33 ~= nil then
            p33 = p33.swingTimeRatio;
        end;

        if p33 ~= nil and p33 >= 0.9 then
            v41 = GameSound.DAMAGE_HIT_HARD;
        end;

        if p36 ~= nil then
            local function _(p43) -- Line: 114
                -- upvalues: getAssetIdFromEncoding (ref)
                return getAssetIdFromEncoding(p43);
            end;

            local v44 = 0;
            p36 = {};

            for i, v in p36 do
                local _ = i - 1;
                local v45 = getAssetIdFromEncoding(v);

                if v45 ~= nil then
                    v44 = v44 + 1;
                    p36[v44] = v45;
                end;
            end;
        end;

        local v46 = p36 == nil and {} or p36;
        local v47 = { v41 };
        table.move(v46, 1, #v46, #v47 + 1, v47);

        for _, v in v47 do
            if v ~= "" and v then
                local v48 = {};
                local v49;

                if v40 then
                    v49 = nil;
                else
                    v49 = p26.PrimaryPart;

                    if v49 ~= nil then
                        v49 = v49.Position;
                    end;
                end;

                v48.position = v49;
                SoundManager:playSound(v, v48);
            end;
        end;
    end);
    default.Client:WaitFor("EntityDeathEvent"):andThen(function(p50) -- Line: 159
        -- upvalues: u7 (copy), Players (ref), SoundManager (ref), MultiKillConstants (ref)
        p50:Connect(function(p51) -- Line: 160
            -- upvalues: u7 (ref), Players (ref), SoundManager (ref), MultiKillConstants (ref)
            if not u7.killSounds or p51.noKillSound then
                return nil;
            end;

            if p51.fromEntity and p51.fromEntity == Players.LocalPlayer.Character then
                local multiKillCount = p51.multiKillCount;
                local v52 = multiKillCount == nil and 1 or multiKillCount;
                local v53 = math.min(v52 - 1, #u7.killSounds - 1);
                SoundManager:playSound(u7.killSounds[v53 + 1]);
                local v54 = math.min(v52 - 2, #u7.multiKillLoops - 1);

                if v54 >= 0 then
                    local u55 = SoundManager:playSound(u7.multiKillLoops[v54 + 1], {
                        looped = true
                    });

                    if u7.activeMultiKillLoop then
                        u7.activeMultiKillLoop:Stop();
                        u7.activeMultiKillLoop:Destroy();
                    end;

                    u7.activeMultiKillLoop = u55;
                    task.delay(MultiKillConstants.MULTI_KILL_EXPIRATION_TIME_SEC, function() -- Line: 182
                        -- upvalues: u55 (copy), u7 (ref), SoundManager (ref)
                        if not u55 then
                            return nil;
                        end;

                        if u7.activeMultiKillLoop == u55 then
                            SoundManager:tweenSoundVolume(u55, 0, 1);
                            task.delay(1.5, function() -- Line: 188
                                -- upvalues: u55 (ref)
                                u55:Stop();
                                u55:Destroy();
                            end);
                            u7.activeMultiKillLoop = nil;
                        end;
                    end);
                end;
            end;
        end);
    end);
end;

function u4.setKillSounds(p56, p57) -- Line: 201
    p56.killSounds = p57;
end;

return {
    CombatController = KnitClient.CreateController(u4.new())
};