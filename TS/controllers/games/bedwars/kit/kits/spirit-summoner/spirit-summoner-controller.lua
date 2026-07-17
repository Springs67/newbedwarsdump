-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out", "util", "map-util").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local scalePart = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local SpiritSummonerBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-constants").SpiritSummonerBalance;
local SummonedSpiritType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "summoned-spirit-type").SummonedSpiritType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local SpiritSummonerDisplay = RuntimeLib.import(script, script.Parent, "ui", "spirit-summoner-display").SpiritSummonerDisplay;
local SummonStoneItemTimerApp = RuntimeLib.import(script, script.Parent, "ui", "summon-stone-item-timer").SummonStoneItemTimerApp;
local u4 = Color3.fromRGB(224, 69, 255);
local u5 = Color3.fromRGB(69, 232, 255);
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "SpiritSummonerController";
    end,

    __index = BaseKitController
});
u6.__index = u6;

function u6.new(...) -- Line: 44
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 48
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), AnimationType (copy), default (copy)
    BaseKitController.constructor(p8, BedwarsKit.SPIRIT_SUMMONER, {
        sounds = {
            GameSound.SPIRIT_SUMMONING,
            GameSound.ATTACK_SPIRIT_THROW,
            GameSound.HEAL_SPIRIT_THROW,
            GameSound.ATTACK_SPIRIT_APPEAR,
            GameSound.HEAL_SPIRIT_APPEAR,
            GameSound.SPIRIT_DISPEL,
            GameSound.SPIRIT_SUMMONER_CHANGE_AFFINITY
        },
        animations = {
            AnimationType.WIZARD_BALL_CAST,
            AnimationType.USE_GRAVESTONE,
            AnimationType.SPIRIT_FLOATING_IDLE,
            AnimationType.SPIRIT_HEAL,
            AnimationType.SPIRIT_HEAL_ALT,
            AnimationType.ATTACK_SPIRIT_ATTACK,
            AnimationType.HEAL_SPIRIT_ATTACK,
            AnimationType.HEAL_SPIRIT_ATTACK_ALT
        }
    });
    p8.Name = "SpiritSummonerController";
    p8.spiritSummonedRemote = default.Client:Get("SpiritSummoned");
    p8.spiritDispelledRemote = default.Client:Get("SpiritDispelled");
    p8.spirits = {};
    p8.playerLastPos = {};
end;

function u6.onKitLocalActivated(p9, p10) -- Line: 59
    -- upvalues: u2 (copy), SpiritSummonerDisplay (copy), Players (copy), KnitClient (copy), SummonStoneItemTimerApp (copy)
    local u11 = u2.mount(u2.createElement(SpiritSummonerDisplay), Players.LocalPlayer:WaitForChild("PlayerGui"));
    p10:GiveTask(function() -- Line: 62
        -- upvalues: u2 (ref), u11 (copy)
        u2.unmount(u11);
    end);
    local u12 = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u2.createElement(SummonStoneItemTimerApp));
    p10:GiveTask(function() -- Line: 67
        -- upvalues: u2 (ref), u12 (copy)
        u2.unmount(u12);
    end);
end;

function u6.onKitLocalDeactivated(p13) -- Line: 71
end;

function u6.onKitReplicationActivated(u14, u15) -- Line: 73
    -- upvalues: ClientSyncEvents (copy), ItemType (copy), Players (copy), default (copy), EntityUtil (copy), MapUtil (copy), SpiritSummonerBalance (copy), KnitClient (copy), BedwarsKit (copy), RunService (copy), GameAnimationUtil (copy), AnimationType (copy), SummonedSpiritType (copy)
    local u17 = u14.spiritSummonedRemote:Connect(function(p16) -- Line: 75
        -- upvalues: u14 (copy)
        u14:spawnSpirit(p16.player, p16.id, p16.type, p16.tier);
    end);
    local u19 = u14.spiritDispelledRemote:Connect(function(p18) -- Line: 78
        -- upvalues: u14 (copy)
        u14:despawnSpirit(p18.player, p18.id);
    end);
    u15:GiveTask(function() -- Line: 81
        -- upvalues: u17 (copy), u19 (copy)
        u17:Disconnect();
        u19:Disconnect();
    end);
    u15:GiveTask(ClientSyncEvents.BeginProjectileTargeting:connect(function(p20) -- Line: 86
        -- upvalues: ItemType (ref), Players (ref)
        if p20:isCancelled() then
            return nil;
        end;

        if p20.handItem.itemType ~= ItemType.SPIRIT_STAFF then
            return nil;
        end;

        local LocalPlayer = Players.LocalPlayer;
        local v21 = LocalPlayer:GetAttribute("ReadySummonedAttackSpirits");
        local v22 = LocalPlayer:GetAttribute("ReadySummonedHealSpirits");

        if (v21 == nil and 0 or v21) + (v22 == nil and 0 or v22) <= 0 then
            p20:setCancelled(true);
        end;
    end));
    local u28 = default.Client:Get("SpiritBeginTravel"):Connect(function(u23) -- Line: 109
        -- upvalues: u14 (copy)
        local function _(p24) -- Line: 111
            -- upvalues: u23 (copy)
            local v25;

            if p24.owner == u23.owner then
                v25 = p24.id == u23.id;
            else
                v25 = false;
            end;

            return v25;
        end;

        local v26 = nil;

        for i, v in u14.spirits do
            local _ = i - 1;
            local v27;

            if v.owner == u23.owner then
                v27 = v.id == u23.id;
            else
                v27 = false;
            end;

            if v27 == true then
                v26 = v;
                break;
            end;
        end;

        if not v26 then
            return nil;
        end;

        v26.instance:PivotTo(CFrame.new(u23.startPos));
        u14:showSpirit(v26);

        if u23.targetEntityInstance then
            u14:moveSpiritToEntity(v26, u23.targetEntityInstance, u23.travelTime);

            return;
        end;

        if u23.targetItemDrop then
            u14:moveSpiritToItem(v26, u23.targetItemDrop, u23.travelTime);
        end;
    end);
    u15:GiveTask(function() -- Line: 135
        -- upvalues: u28 (copy)
        u28:Disconnect();
    end);
    local u35 = default.Client:Get("SpiritBeginReturn"):Connect(function(u29) -- Line: 139
        -- upvalues: u14 (copy), EntityUtil (ref)
        local function _(p30) -- Line: 141
            -- upvalues: u29 (copy)
            local v31;

            if p30.owner == u29.owner then
                v31 = p30.id == u29.id;
            else
                v31 = false;
            end;

            return v31;
        end;

        local v32 = nil;

        for i, v in u14.spirits do
            local _ = i - 1;
            local v33;

            if v.owner == u29.owner then
                v33 = v.id == u29.id;
            else
                v33 = false;
            end;

            if v33 == true then
                v32 = v;
                break;
            end;
        end;

        if not v32 then
            return nil;
        end;

        v32.instance:PivotTo(CFrame.new(u29.startPos));
        u14:showSpirit(v32);
        local v34 = EntityUtil:getEntity(u29.owner);

        if v34 ~= nil then
            v34 = v34:getInstance();
        end;

        if v34 then
            u14:moveSpiritToEntity(v32, v34, u29.travelTime);
        end;
    end);
    u15:GiveTask(function() -- Line: 168
        -- upvalues: u35 (copy)
        u35:Disconnect();
    end);
    local u38 = default.Client:Get("SpiritLaunched"):Connect(function(p36) -- Line: 172
        -- upvalues: u14 (copy)
        local v37 = u14:getSpiritById(p36.id);

        if not v37 then
            return nil;
        end;

        u14:hideSpirit(v37);
    end);
    u15:GiveTask(function() -- Line: 179
        -- upvalues: u38 (copy)
        u38:Disconnect();
    end);
    local u45 = default.Client:OnEvent("WormholeUse", function(p39, p40, p41) -- Line: 183
        -- upvalues: u14 (copy), MapUtil (ref), SpiritSummonerBalance (ref)
        local Character = p39.Character;

        if not Character then
            return nil;
        end;

        local v42 = u14:getCharacterCenter(Character);
        local v43 = MapUtil.getOrCreate(u14.playerLastPos, p39, {});

        if v42 then
            local v44 = v42 + Character:GetPivot().LookVector.Unit * Vector3.new(-2.5, -2.5, -2.5);
            table.insert(v43, 1, v44);

            if #v43 > SpiritSummonerBalance.SPIRIT_TRAIL_DISTANCE * (SpiritSummonerBalance.SPIRIT_MAX_TRAIL_COUNT + 1) then
                v43[#v43] = nil;
            end;
        end;
    end);
    u15:GiveTask(function() -- Line: 202
        -- upvalues: u45 (copy)
        u45:cancel();
    end);
    local v46 = Players:GetPlayers();

    local function v50(u47) -- Line: 207
        -- upvalues: KnitClient (ref), BedwarsKit (ref), u14 (copy), u15 (copy)
        if KnitClient.Controllers.KitController:isUsingKit(u47, BedwarsKit.SPIRIT_SUMMONER) then
            local u49 = u47:GetAttributeChangedSignal("SpiritSummonerTier"):Connect(function() -- Line: 209
                -- upvalues: u14 (ref), u47 (copy)
                local function _(p48) -- Line: 211
                    -- upvalues: u47 (ref), u14 (ref)
                    if p48.owner.UserId == u47.UserId then
                        p48.tier = u47:GetAttribute("SpiritSummonerTier");
                        p48.instance:ScaleTo(u14:getSpiritScale(p48.tier));
                    end;
                end;

                for i, v in u14.spirits do
                    local _ = i - 1;

                    if v.owner.UserId == u47.UserId then
                        v.tier = u47:GetAttribute("SpiritSummonerTier");
                        v.instance:ScaleTo(u14:getSpiritScale(v.tier));
                    end;
                end;
            end);
            u15:GiveTask(function() -- Line: 221
                -- upvalues: u49 (copy)
                u49:Disconnect();
            end);
        end;
    end;

    for i, v in v46 do
        v50(v, i - 1, v46);
    end;

    local u65 = RunService.Heartbeat:Connect(function(p51) -- Line: 230
        -- upvalues: Players (ref), u14 (copy), MapUtil (ref), SpiritSummonerBalance (ref), GameAnimationUtil (ref), AnimationType (ref), EntityUtil (ref), SummonedSpiritType (ref)
        for _, v in Players:GetPlayers() do
            if v.Character then
                local v52 = u14:getCharacterCenter(v.Character);
                local v53 = MapUtil.getOrCreate(u14.playerLastPos, v, {});

                if v52 then
                    local v54 = v52 + v.Character:GetPivot().LookVector.Unit * Vector3.new(-2.5, -2.5, -2.5);

                    if #v53 == 0 or v53[1] ~= v54 then
                        table.insert(v53, 1, v54);

                        if #v53 > SpiritSummonerBalance.SPIRIT_TRAIL_DISTANCE * (SpiritSummonerBalance.SPIRIT_MAX_TRAIL_COUNT + 1) then
                            v53[#v53] = nil;
                        end;
                    end;
                end;
            end;
        end;

        for _, v in u14.spirits do
            if v.travel.active then
                local travel = v.travel;
                travel.elapsedTime = travel.elapsedTime + p51;

                if v.targetEntityInstance and not v.travel.item then
                    v.travel.destPos = u14:getEntityDestPos(v).Position;
                end;

                local v55 = v.travel.startPos:Lerp(v.travel.destPos, v.travel.elapsedTime / v.travel.duration);
                v.instance:PivotTo(CFrame.lookAt(v55, v.travel.destPos));

                if v.travel.elapsedTime >= v.travel.duration then
                    v.travel.active = false;
                end;

                if v.animation.animator then
                    if v.animation.attackAnimationTrack then
                        local attackAnimationTrack = v.animation.attackAnimationTrack;

                        if attackAnimationTrack ~= nil then
                            attackAnimationTrack:Stop();
                        end;

                        local attackAnimationTrack2 = v.animation.attackAnimationTrack;

                        if attackAnimationTrack2 ~= nil then
                            attackAnimationTrack2:Destroy();
                        end;

                        v.animation.attackAnimationTrack = nil;
                    end;

                    if v.animation.healAnimationTrack then
                        local healAnimationTrack = v.animation.healAnimationTrack;

                        if healAnimationTrack ~= nil then
                            healAnimationTrack:Stop();
                        end;

                        local healAnimationTrack2 = v.animation.healAnimationTrack;

                        if healAnimationTrack2 ~= nil then
                            healAnimationTrack2:Destroy();
                        end;

                        v.animation.healAnimationTrack = nil;
                    end;
                end;

                if v.animation.animator and not v.animation.floatAnimationTrack then
                    v.animation.floatAnimationTrack = GameAnimationUtil:playAnimation(v.animation.animator, AnimationType.SPIRIT_FLOATING_IDLE, {
                        looped = true
                    });
                end;
            else
                local v56 = EntityUtil:getPlayerFromEntityInstance(v.targetEntityInstance);

                if v56 and v56 == v.owner then
                    u14:setSpiritFollowPosition(v);
                    local v57 = u14:getCharacterCenter(v.targetEntityInstance) or v.targetEntityInstance:GetPivot().Position;
                    local Y = v.instance:GetPivot().Position.Y;
                    local v58 = Vector3.new(0, Y, 0);
                    v.instance:PivotTo(CFrame.lookAt(v.instance:GetPivot().Position, v57 * Vector3.new(1, 0, 1) + v58));
                    v.floatDelta = v.floatDelta + p51;
                    local instance = v.instance;
                    local v59 = v.instance:GetPivot();
                    local v60 = math.sin(v.floatDelta * 2 + 6.283185307179586) * 0.8;
                    instance:PivotTo(v59 + Vector3.new(0, v60, 0));

                    if v.animation.animator then
                        if v.animation.attackAnimationTrack then
                            local attackAnimationTrack = v.animation.attackAnimationTrack;

                            if attackAnimationTrack ~= nil then
                                attackAnimationTrack:Stop();
                            end;

                            local attackAnimationTrack2 = v.animation.attackAnimationTrack;

                            if attackAnimationTrack2 ~= nil then
                                attackAnimationTrack2:Destroy();
                            end;

                            v.animation.attackAnimationTrack = nil;
                        end;

                        if v.animation.healAnimationTrack then
                            local healAnimationTrack = v.animation.healAnimationTrack;

                            if healAnimationTrack ~= nil then
                                healAnimationTrack:Stop();
                            end;

                            local healAnimationTrack2 = v.animation.healAnimationTrack;

                            if healAnimationTrack2 ~= nil then
                                healAnimationTrack2:Destroy();
                            end;

                            v.animation.healAnimationTrack = nil;
                        end;
                    end;

                    if v.animation.animator and not v.animation.floatAnimationTrack then
                        v.animation.floatAnimationTrack = GameAnimationUtil:playAnimation(v.animation.animator, AnimationType.SPIRIT_FLOATING_IDLE, {
                            looped = true
                        });
                    end;
                else
                    v.elapsedTime = v.elapsedTime + p51;
                    v.instance:PivotTo(u14:getEntityDestPos(v));

                    if v.animation.animator and v.animation.floatAnimationTrack then
                        local floatAnimationTrack = v.animation.floatAnimationTrack;

                        if floatAnimationTrack ~= nil then
                            floatAnimationTrack:Stop();
                        end;

                        local floatAnimationTrack2 = v.animation.floatAnimationTrack;

                        if floatAnimationTrack2 ~= nil then
                            floatAnimationTrack2:Destroy();
                        end;

                        v.animation.floatAnimationTrack = nil;
                    end;

                    local v61 = EntityUtil:getEntity(v.owner);
                    local v62 = EntityUtil:getEntity(v.targetEntityInstance);

                    if v62 and v.animation.animator then
                        local v63;

                        if v61 == nil then
                            v63 = v61;
                        else
                            v63 = v61:canAttack(v62);
                        end;

                        if v63 then
                            v63 = not v.animation.attackAnimationTrack;
                        end;

                        if v63 then
                            local v64;

                            if v.type == SummonedSpiritType.ATTACK then
                                v64 = AnimationType.ATTACK_SPIRIT_ATTACK;
                            else
                                v64 = AnimationType.HEAL_SPIRIT_ATTACK;
                            end;

                            v.animation.attackAnimationTrack = GameAnimationUtil:playAnimation(v.animation.animator, v64, {
                                looped = true
                            });

                            if v.animation.healAnimationTrack then
                                local healAnimationTrack = v.animation.healAnimationTrack;

                                if healAnimationTrack ~= nil then
                                    healAnimationTrack:Stop();
                                end;

                                local healAnimationTrack2 = v.animation.healAnimationTrack;

                                if healAnimationTrack2 ~= nil then
                                    healAnimationTrack2:Destroy();
                                end;

                                v.animation.healAnimationTrack = nil;
                            end;
                        else
                            if v61 ~= nil then
                                v61 = v61:canAttack(v62);
                            end;

                            if not v61 and not v.animation.healAnimationTrack then
                                v.animation.healAnimationTrack = GameAnimationUtil:playAnimation(v.animation.animator, AnimationType.SPIRIT_HEAL, {
                                    looped = true
                                });

                                if v.animation.attackAnimationTrack then
                                    local attackAnimationTrack = v.animation.attackAnimationTrack;

                                    if attackAnimationTrack ~= nil then
                                        attackAnimationTrack:Stop();
                                    end;

                                    local attackAnimationTrack2 = v.animation.attackAnimationTrack;

                                    if attackAnimationTrack2 ~= nil then
                                        attackAnimationTrack2:Destroy();
                                    end;

                                    v.animation.attackAnimationTrack = nil;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end);
    u15:GiveTask(function() -- Line: 420
        -- upvalues: u65 (copy)
        u65:Disconnect();
    end);
end;

function u6.onKitReplicationDeactivated(p66) -- Line: 424
end;

function u6.onInnateAbilityEnabled(p67, p68, p69) -- Line: 426
end;

function u6.onAbilityUsed(p70, p71, p72) -- Line: 428
    -- upvalues: Players (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), AbilityId (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if p72:isCancelled() then
        return nil;
    end;

    local v73 = p71 == Players.LocalPlayer.Character;
    local uma = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p71)].uma;
    local ability = p72.ability;
    local v74 = false;

    if ability == AbilityId.CHANGE_SPIRIT_AFFINITY then
        if v73 then
            SoundManager:playSound(GameSound.SPIRIT_SUMMONER_CHANGE_AFFINITY, {
                position = nil
            });
        end;
    elseif ability == AbilityId.SUMMON_ATTACK_SPIRIT and true or v74 or ability == AbilityId.SUMMON_HEAL_SPIRIT then
        local v75;

        if uma then
            v75 = uma.spiritSummonedSound;
        else
            v75 = GameSound.SPIRIT_SUMMONING;
        end;

        local v76 = {};
        local v77;

        if p72.userCharacter == Players.LocalPlayer.Character then
            v77 = nil;
        else
            v77 = p72.userCharacter:GetPivot().Position;
        end;

        v76.position = v77;
        SoundManager:playSound(v75, v76);

        if v73 then
            AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.USE_GRAVESTONE), {
                looped = false
            });
        end;
    end;
end;

function u6.KnitStart(p78) -- Line: 468
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p78);
end;

function u6.spawnSpirit(p79, u80, p81, p82, p83) -- Line: 471
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy), SummonedSpiritType (copy), ReplicatedStorage (copy), u4 (copy), u5 (copy), Players (copy), CollectionService (copy), Workspace (copy), EntityUtil (copy), scalePart (copy), EffectUtil (copy), GameSound (copy), SoundManager (copy)
    local uma = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(u80)].uma;
    local v84;

    if uma then
        if p82 == SummonedSpiritType.ATTACK then
            v84 = uma.attackSpirit:Clone();
        else
            v84 = uma.healSpirit:Clone();
        end;
    elseif p82 == SummonedSpiritType.ATTACK then
        v84 = ReplicatedStorage.Assets.Misc.AttackSpirit:Clone();
    else
        v84 = ReplicatedStorage.Assets.Misc.HealSpirit:Clone();
    end;

    local u85;

    if p82 == SummonedSpiritType.ATTACK then
        u85 = u4;
    else
        u85 = u5;
    end;

    v84:ScaleTo(p79:getSpiritScale(p83));
    local v86 = v84:GetDescendants();

    local function v88(p87) -- Line: 483
        -- upvalues: u80 (copy), Players (ref), CollectionService (ref)
        if u80 == Players.LocalPlayer then
            p87:SetAttribute("FirstPersonVisible", false);
            CollectionService:AddTag(p87, "FirstPersonHidden");
        end;

        if p87:IsA("BasePart") or (p87:IsA("MeshPart") or p87:IsA("Part")) then
            p87:SetAttribute("InitialTransparency", p87.Transparency);
        end;
    end;

    for i, v in v86 do
        v88(v, i - 1, v86);
    end;

    local v89 = math.random(-1, 1);
    local v90 = math.random(-1, 1);
    local v91 = Vector3.new(v89, v90, math.random(0, 2));

    if not u80.Character then
        return nil;
    end;

    v84.Parent = Workspace;
    local AnimationController = v84:FindFirstChild("AnimationController");

    if AnimationController ~= nil then
        AnimationController = AnimationController:FindFirstChild("Animator");
    end;

    local v92 = EntityUtil:getEntity(u80);

    if v92 ~= nil then
        v92 = v92:getInstance();
    end;

    if not v92 then
        return nil;
    end;

    local v93 = {
        elapsedTime = 0,
        circlingRadius = 5,
        speedMultiplier = 1,
        floatDelta = 0,
        id = p81,
        type = p82,
        tier = p83,
        instance = v84,
        owner = u80,
        targetEntityInstance = v92,
        offset = v91,
        animation = {
            floatAnimationTrack = nil,
            attackAnimationTrack = nil,
            healAnimationTrack = nil,
            animator = AnimationController
        },
        travel = {
            active = false,
            elapsedTime = 0,
            startPos = Vector3.new(0, 0, 0),
            destPos = Vector3.new(0, 0, 0),
            duration = 0,
            item = false
        }
    };
    table.insert(p79.spirits, v93);
    local v94 = p79:setSpiritFollowPosition(v93);
    local u95 = ReplicatedStorage.Assets.Effects.SpiritSummonEffect:Clone();
    scalePart(u95, 0.5);

    local function _(p96) -- Line: 547
        -- upvalues: u85 (copy)
        if p96:IsA("ParticleEmitter") then
            p96.Color = ColorSequence.new(u85);
        end;
    end;

    for i, descendant in u95:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant.Color = ColorSequence.new(u85);
        end;
    end;

    u95.Parent = Workspace;
    u95:PivotTo(v94);
    EffectUtil:playEffects({ u95 }, nil, {
        disableEffectsAfterSec = 0.1
    });
    task.delay(0.5, function() -- Line: 560
        -- upvalues: u95 (copy)
        u95:Destroy();
    end);
    local v97;

    if uma then
        if p82 == SummonedSpiritType.ATTACK then
            v97 = uma.attackSpiritAppearSound;
        else
            v97 = uma.healSpiritAppearSound;
        end;
    elseif p82 == SummonedSpiritType.ATTACK then
        v97 = GameSound.ATTACK_SPIRIT_APPEAR;
    else
        v97 = GameSound.HEAL_SPIRIT_APPEAR;
    end;

    if u80 == Players.LocalPlayer then
        SoundManager:playSound(v97, {
            position = nil
        });

        return v93;
    end;

    if u80.Character then
        local v98 = {};
        local Character = u80.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        v98.position = Character;
        SoundManager:playSound(v97, v98);
    end;

    return v93;
end;

function u6.despawnSpirit(p99, u100, u101) -- Line: 588
    -- upvalues: SummonedSpiritType (copy), u4 (copy), u5 (copy), ReplicatedStorage (copy), scalePart (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    local function _(p102) -- Line: 590
        -- upvalues: u100 (copy), u101 (copy)
        local v103;

        if p102.owner == u100 then
            v103 = p102.id == u101;
        else
            v103 = false;
        end;

        return v103;
    end;

    local v104 = -1;

    for i, v in p99.spirits do
        local _ = i - 1;
        local v105;

        if v.owner == u100 then
            v105 = v.id == u101;
        else
            v105 = false;
        end;

        if v105 == true then
            v104 = i - 1;
            break;
        end;
    end;

    local v106 = p99.spirits[v104 + 1];

    if v106 ~= nil then
        v106.instance:Destroy();
    end;

    table.remove(p99.spirits, v104 + 1);
    local u107;

    if v106.type == SummonedSpiritType.ATTACK then
        u107 = u4;
    else
        u107 = u5;
    end;

    local u108 = ReplicatedStorage.Assets.Effects.SpiritDispelEffect:Clone();
    scalePart(u108, 0.5);

    local function _(p109) -- Line: 614
        -- upvalues: u107 (copy)
        if p109:IsA("ParticleEmitter") then
            p109.Color = ColorSequence.new(u107);
        end;
    end;

    for i, descendant in u108:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant.Color = ColorSequence.new(u107);
        end;
    end;

    u108.Parent = Workspace;
    u108:PivotTo(v106.instance:GetPivot());
    EffectUtil:playEffects({ u108 }, nil);
    task.delay(1, function() -- Line: 625
        -- upvalues: u108 (copy)
        u108:Destroy();
    end);
    SoundManager:playSound(GameSound.SPIRIT_DISPEL, {
        position = v106.instance:GetPivot().Position
    });
end;

function u6.moveSpiritToEntity(p110, p111, p112, p113) -- Line: 633
    p111.travel.active = true;
    p111.travel.duration = p113;
    p111.travel.elapsedTime = 0;
    p111.travel.startPos = p111.instance:GetPivot().Position;
    p111.travel.destPos = p112:GetPivot().Position;
    p111.targetEntityInstance = p112;
    p111.travel.item = false;
end;

function u6.moveSpiritToItem(p114, p115, p116, p117) -- Line: 642
    p115.travel.active = true;
    p115.travel.duration = p117;
    p115.travel.elapsedTime = 0;
    p115.travel.startPos = p115.instance:GetPivot().Position;
    p115.travel.destPos = p116:GetPivot().Position;
    p115.travel.item = true;
end;

function u6.getCharacterCenter(p118, p119) -- Line: 650
    if not p119.PrimaryPart then
        return nil;
    end;

    local v120 = p119:FindFirstChildWhichIsA("Humanoid");

    return p119.PrimaryPart.Position + Vector3.new(0, -1 * ((not v120 and 0 or v120.HipHeight) + p119.PrimaryPart.Size.Y / 2), 0) + Vector3.new(0, 2.5, 0);
end;

function u6.setSpiritFollowPosition(p121, p122) -- Line: 666
    -- upvalues: MapUtil (copy), SpiritSummonerBalance (copy)
    local v123 = MapUtil.getOrCreate(p121.playerLastPos, p122.owner, {})[(p122.id % SpiritSummonerBalance.SPIRIT_MAX_TRAIL_COUNT + 1) * SpiritSummonerBalance.SPIRIT_TRAIL_DISTANCE + 1];
    p122.instance:PivotTo(CFrame.new(v123) * CFrame.new(p122.offset));

    return p122.instance:GetPivot();
end;

function u6.getSpiritById(p124, u125) -- Line: 679
    local function _(p126) -- Line: 681
        -- upvalues: u125 (copy)
        return p126.id == u125;
    end;

    for i, v in p124.spirits do
        local _ = i - 1;

        if v.id == u125 == true then
            return v;
        end;
    end;

    return nil;
end;

function u6.hideSpirit(p127, p128) -- Line: 695
    local function _(p129) -- Line: 697
        if p129:IsA("BasePart") or (p129:IsA("MeshPart") or p129:IsA("Part")) then
            p129.Transparency = 1;

            return;
        end;

        if p129:IsA("Trail") then
            p129.Enabled = false;
        end;
    end;

    for i, descendant in p128.instance:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") or (descendant:IsA("MeshPart") or descendant:IsA("Part")) then
            descendant.Transparency = 1;
        elseif descendant:IsA("Trail") then
            descendant.Enabled = false;
        end;
    end;
end;

function u6.showSpirit(p130, p131) -- Line: 708
    local v132 = p131.instance:GetDescendants();

    local function v135(p133) -- Line: 710
        if not (p133:IsA("BasePart") or (p133:IsA("MeshPart") or p133:IsA("Part"))) then
            if p133:IsA("Trail") then
                p133.Enabled = true;
            end;

            return;
        end;

        local v134 = p133:GetAttribute("InitialTransparency");
        p133.Transparency = v134 == nil and 0 or v134;
    end;

    for i, v in v132 do
        v135(v, i - 1, v132);
    end;
end;

function u6.getEntityDestPos(p136, p137) -- Line: 725
    local v138 = p136:getCharacterCenter(p137.targetEntityInstance) or Vector3.new(0, 0, 0);
    local circlingRadius = p137.circlingRadius;
    local v139 = circlingRadius == nil and 300 or circlingRadius;
    local v140 = math.sin((p137.elapsedTime + p137.id * 8) / 1) * v139;
    local v141 = math.cos((p137.elapsedTime + p137.id * 8) / 1) * v139;
    local v142 = v138 + Vector3.new(v140, 0, v141);

    return CFrame.lookAt(v142, v138);
end;

function u6.getSpiritScale(p143, p144) -- Line: 737
    return 0.5 + 0.1 * p144;
end;

KnitClient.CreateController(u6.new());

return nil;