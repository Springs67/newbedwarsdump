-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "ChickenController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "ChickenController";
end;

function u4.KnitStart(p7) -- Line: 39
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy), Players (copy), BedwarsKitSkinMeta (copy), GameSound (copy), SoundManager (copy), default (copy), MonsterType (copy), Workspace (copy), WatchCollectionTag (copy), KnitClient2 (copy), ItemType (copy)
    KnitController.KnitStart(p7);
    ClientSyncEvents.ProjectileLaunched:connect(function(p8) -- Line: 41
        -- upvalues: GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), Players (ref), BedwarsKitSkinMeta (ref), GameSound (ref), SoundManager (ref)
        if p8.projectileType ~= "deploy_chicken" then
            return nil;
        end;

        local AnimationController = p8.projectile:WaitForChild("AnimationController", 3);

        if AnimationController ~= nil then
            AnimationController = AnimationController:WaitForChild("Animator", 3);
        end;

        if not AnimationController then
            return nil;
        end;

        AnimationController:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.CHICKEN_FLAP)):Play();
        local taliyah = BedwarsKitSkinMeta[KnitClient.Controllers.KitController:getKitSkin(Players.LocalPlayer)].taliyah;
        local CHICKEN_DEPLOY = GameSound.CHICKEN_DEPLOY;
        local v9;

        if taliyah == nil then
            v9 = taliyah;
        else
            v9 = taliyah.entity;

            if v9 ~= nil then
                v9 = v9.sounds;

                if v9 ~= nil then
                    v9 = v9.deploy;
                end;
            end;
        end;

        if v9 ~= "" and v9 then
            CHICKEN_DEPLOY = taliyah.entity.sounds.deploy;
        end;

        local v10 = SoundManager:createSound(CHICKEN_DEPLOY);

        if not v10 then
            return nil;
        end;

        v10.Looped = true;
        v10.Parent = p8.projectile.PrimaryPart;
        v10:Play();
    end);
    default.Client:WaitFor("EntityDeathEvent"):andThen(function(p11) -- Line: 84
        -- upvalues: MonsterType (ref), GameSound (ref), Players (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), SoundManager (ref)
        p11:Connect(function(p12) -- Line: 85
            -- upvalues: MonsterType (ref), GameSound (ref), Players (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), SoundManager (ref)
            if p12.entityInstance:GetAttribute("MonsterType") ~= MonsterType.CHICKEN then
                return nil;
            end;

            local CHICKEN_DEATH = GameSound.CHICKEN_DEATH;
            local v13 = p12.entityInstance:GetAttribute("PlacedByUserId");

            if v13 ~= 0 and (v13 == v13 and v13) then
                local v14 = Players:GetPlayerByUserId(v13);

                if v14 then
                    local taliyah = BedwarsKitSkinMeta[KnitClient.Controllers.KitController:getKitSkin(v14)].taliyah;
                    local v15;

                    if taliyah == nil then
                        v15 = taliyah;
                    else
                        v15 = taliyah.entity;

                        if v15 ~= nil then
                            v15 = v15.sounds;

                            if v15 ~= nil then
                                v15 = v15.death;
                            end;
                        end;
                    end;

                    if v15 ~= "" and v15 then
                        CHICKEN_DEATH = taliyah.entity.sounds.death;
                    end;
                end;
            end;

            SoundManager:playSound(CHICKEN_DEATH, {
                position = p12.cframe.Position
            });
        end);
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p16) -- Line: 117
        -- upvalues: Players (ref), GameSound (ref), Workspace (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), SoundManager (ref)
        if p16.entityInstance.Name ~= "EggEntity" then
            return nil;
        end;

        local Position = p16.cframe.Position;

        if p16.fromEntity and Players:GetPlayerFromCharacter(p16.fromEntity) == Players.LocalPlayer then
            Position = nil;
        end;

        local CHICKEN_EGG_CRACK = GameSound.CHICKEN_EGG_CRACK;
        local v17 = p16.entityInstance:GetAttribute("ReadyTime");

        if v17 ~= 0 and (v17 == v17 and v17) then
            v17 = v17 < Workspace:GetServerTimeNow();
        end;

        if v17 ~= 0 and (v17 == v17 and v17) then
            CHICKEN_EGG_CRACK = GameSound.CHICKEN_DEATH;
        end;

        local v18 = p16.entityInstance:GetAttribute("PlacedByUserId");

        if v18 ~= 0 and (v18 == v18 and v18) then
            local v19 = Players:GetPlayerByUserId(v18);

            if v19 then
                local taliyah = BedwarsKitSkinMeta[KnitClient.Controllers.KitController:getKitSkin(v19)].taliyah;
                local v20;

                if taliyah == nil then
                    v20 = taliyah;
                else
                    v20 = taliyah.entity;

                    if v20 ~= nil then
                        v20 = v20.sounds;

                        if v20 ~= nil then
                            v20 = v20.eggCrack;
                        end;
                    end;
                end;

                if v20 ~= "" and v20 then
                    CHICKEN_EGG_CRACK = taliyah.entity.sounds.eggCrack;
                end;

                local v21 = p16.entityInstance:GetAttribute("ReadyTime");

                if v21 ~= 0 and (v21 == v21 and v21) then
                    v21 = v21 < Workspace:GetServerTimeNow();
                end;

                if v21 ~= 0 and (v21 == v21 and v21) then
                    local v22;

                    if taliyah == nil then
                        v22 = taliyah;
                    else
                        v22 = taliyah.entity;

                        if v22 ~= nil then
                            v22 = v22.sounds;

                            if v22 ~= nil then
                                v22 = v22.death;
                            end;
                        end;
                    end;

                    if v22 ~= "" and v22 then
                        CHICKEN_EGG_CRACK = taliyah.entity.sounds.death;
                    end;
                end;
            end;
        end;

        SoundManager:playSound(CHICKEN_EGG_CRACK, {
            position = Position
        });
        p16.noKillSound = true;
    end);
    WatchCollectionTag("Monster", function(u23) -- Line: 183
        -- upvalues: MonsterType (ref), GameSound (ref), Players (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), KnitClient2 (ref)
        if u23:GetAttribute("MonsterType") == MonsterType.CHICKEN then
            local u24 = {
                GameSound.CHICKEN_WALK_1,
                GameSound.CHICKEN_WALK_2,
                GameSound.CHICKEN_WALK_3,
                GameSound.CHICKEN_WALK_4
            };
            local v25 = u23:GetAttribute("PlacedByUserId");

            if v25 ~= 0 and (v25 == v25 and v25) then
                local v26 = Players:GetPlayerByUserId(v25);

                if v26 then
                    local taliyah = BedwarsKitSkinMeta[KnitClient.Controllers.KitController:getKitSkin(v26)].taliyah;
                    local v27;

                    if taliyah == nil then
                        v27 = taliyah;
                    else
                        v27 = taliyah.entity;

                        if v27 ~= nil then
                            v27 = v27.sounds;

                            if v27 ~= nil then
                                v27 = v27.walk;
                            end;
                        end;
                    end;

                    if v27 then
                        u24 = taliyah.entity.sounds.walk;
                    end;
                end;
            end;

            task.spawn(function() -- Line: 207
                -- upvalues: KnitClient2 (ref), u23 (copy), u24 (ref)
                KnitClient2.Controllers.FootstepsController:hookCharacter(nil, u23, {
                    walk = u24,
                    run = u24
                });
            end);
        end;
    end);
    WatchCollectionTag("HarvestableCrop", function(p28) -- Line: 215
        -- upvalues: ItemType (ref), SoundManager (ref), GameSound (ref)
        if p28.Name ~= ItemType.CHICKEN_EGG_BLOCK then
            return nil;
        end;

        local Position = p28.Position;

        if not Position then
            return nil;
        end;

        SoundManager:playSound(GameSound.CHICKEN_EGG_CRACK, {
            position = Position
        });
    end);
end;

KnitClient.CreateController(u4.new());

return nil;