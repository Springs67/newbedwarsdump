-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network");
local ProjectileImpactZap = v4.ProjectileImpactZap;
local ProjectileLaunchZap = v4.ProjectileLaunchZap;
local ProjectileUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ProjectileMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
local getProjectileSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-skin-meta").getProjectileSkinMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local u5 = {};
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "ProjectileEffectController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 37
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 41
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8, ...);
    p8.Name = "ProjectileEffectController";
end;

function u6.KnitStart(u9) -- Line: 45
    -- upvalues: ClientSyncEvents (copy), Players (copy), KnitClient2 (copy), ProjectileImpactZap (copy), getProjectileSkinMeta (copy), ProjectileMeta (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), ProjectileUtil (copy), getItemSkinMeta (copy), u6 (copy), ProjectileLaunchZap (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), getItemMeta (copy), u3 (copy)
    ClientSyncEvents.StartLaunchProjectile:connect(function(p10) -- Line: 46
        -- upvalues: Players (ref), KnitClient2 (ref)
        if p10:isCancelled() then
            return nil;
        end;

        if p10.projectileSource.launchScreenShake then
            local config = p10.projectileSource.launchScreenShake.config;
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:GetPrimaryPartCFrame();
            end;

            if Character then
                KnitClient2.Controllers.ScreenShakeController:shake(Character.Position, Character * Vector3.new(-0.25, 0, -1) - Character.Position, config);
            end;
        end;
    end);
    ProjectileImpactZap.On(function(p11, p12, p13, p14, p15, p16, p17, p18) -- Line: 141
        -- upvalues: u9 (copy), getProjectileSkinMeta (ref), ProjectileMeta (ref), SoundManager (ref), RandomUtil (ref), Players (ref), GameSound (ref), ProjectileUtil (ref), getItemSkinMeta (ref), u6 (ref)
        local Name = p13.Name;
        local v19;

        if p16 == nil then
            v19 = p16;
        else
            v19 = p16.Character;
        end;

        local v20 = nil;

        if v19 then
            local v21 = u9:getProjectileSkin(Name);

            if v21 then
                v20 = getProjectileSkinMeta(v21);
            end;
        end;

        local v22 = {};

        for i, v in ProjectileMeta[Name] do
            v22[i] = v;
        end;

        if v20 ~= nil then
            v20 = v20.projectileMetaOverrides;
        end;

        if type(v20) == "table" then
            for i, v in v20 do
                v22[i] = v;
            end;
        end;

        if v22.impactSound then
            SoundManager:playSound(RandomUtil.fromList(unpack(v22.impactSound)), {
                looped = false,
                position = p11
            });
        end;

        if p16 == Players.LocalPlayer then
            if p18 then
                SoundManager:playSound(GameSound.HEADSHOT);
            end;

            if p17 ~= nil then
                p17 = p17:GetAttribute("HostingMinigame");
            end;

            if p17 == true then
                SoundManager:playSound(GameSound.HALLOWEEN_BOSS_HIT);
            elseif p12 ~= 0 and (p12 == p12 and p12) then
                local hitSounds = v22.hitSounds;
                local v23 = p14 or p15;
                local v24;

                if v23 then
                    local v25 = ProjectileUtil.getProjectileSource(Name, v23);

                    if v25 then
                        local v26 = v23:GetAttribute("ItemSkin");

                        if v26 then
                            local v27 = getItemSkinMeta(v26);

                            if v27 then
                                v25 = {};

                                for i, v in v25 do
                                    v25[i] = v;
                                end;

                                local projectileSourceOverrides = v27.projectileSourceOverrides;

                                if type(projectileSourceOverrides) == "table" then
                                    for i, v in projectileSourceOverrides do
                                        v25[i] = v;
                                    end;
                                end;
                            end;
                        end;

                        v24 = {};

                        if type(hitSounds) == "table" then
                            for i, v in hitSounds do
                                v24[i] = v;
                            end;
                        end;

                        if v25 ~= nil then
                            v25 = v25.hitSounds;
                        end;

                        if type(v25) == "table" then
                            for i, v in v25 do
                                v24[i] = v;
                            end;
                        end;
                    else
                        v24 = hitSounds;
                    end;
                else
                    v24 = hitSounds;
                end;

                local v28 = v24 and v24[p12];

                if v28 then
                    SoundManager:playSound(RandomUtil.fromList(unpack(v28)));
                end;

                local v29;

                if v24 == nil then
                    v29 = v24;
                else
                    v29 = v24[1];
                end;

                if (not v29 or #v24[1] == 0) and p12 == 1 then
                    SoundManager:playSound(GameSound.ARROW_HIT);
                end;
            end;
        end;

        u6:destroyProjectile(p13);
    end);
    ProjectileLaunchZap.On(function(p30, p31, u32, p33, p34, p35, p36, p37, p38, p39, p40) -- Line: 257
        -- upvalues: ProjectileMeta (ref), EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), Players (ref), getItemMeta (ref), SoundManager (ref), RandomUtil (ref), ProjectileUtil (ref), u6 (ref), u3 (ref)
        local v41 = ProjectileMeta[u32.Name];
        local v42;

        if p36 then
            v42 = EntityUtil:getEntity(p36);
        else
            v42 = nil;
        end;

        if not RuntimeLib.instanceof(v42, PlayerEntity) then
            v42 = nil;
        end;

        local v43;

        if v42 == nil then
            v43 = v42;
        else
            v43 = v42:getPlayer().UserId;
        end;

        local v44 = v43 == Players.LocalPlayer.UserId;

        if v44 then
            local v45;

            if v41 == nil then
                v45 = v41;
            else
                v45 = v41.useServerModel;
            end;

            v44 = not v45;
        end;

        if not v44 then
            local v46;

            if v41 == nil then
                v46 = v41;
            else
                v46 = v41.firedFromServer;
            end;

            if v46 then
                local v47;

                if v41 == nil then
                    v47 = v41;
                else
                    v47 = v41.useServerModel;
                end;

                v46 = not v47;
            end;

            v44 = v46 or p39;
        end;

        if v44 then
            u32:Destroy();

            return nil;
        end;

        if p34 ~= nil then
            p34 = p34.Name;
        end;

        if p34 == nil then
            if p35 ~= nil then
                p35 = p35.Name;
            end;
        else
            p35 = p34;
        end;

        local v48 = getItemMeta(p35);
        local v49;

        if v48 == nil then
            v49 = v48;
        else
            v49 = v48.projectileSource;
        end;

        if v49 == nil then
            if v48 ~= nil then
                v48 = v48.block;

                if v48 ~= nil then
                    v48 = v48.projectileSource;
                end;
            end;
        elseif v48 ~= nil then
            v48 = v48.projectileSource;
        end;

        if v48 then
            local v50;

            if v42 == nil then
                v50 = v42;
            else
                v50 = v42:getPlayer();
            end;

            if v50 ~= Players.LocalPlayer then
                local v51;

                if v48 == nil then
                    v51 = v48;
                else
                    v51 = v48.launchSound;
                end;

                if v51 then
                    local launchSoundConfig = v48.launchSoundConfig;
                    local v52;

                    if launchSoundConfig == nil then
                        v52 = launchSoundConfig;
                    else
                        v52 = launchSoundConfig.pitch;
                    end;

                    local v53;

                    if v48 == nil then
                        v53 = v48;
                    else
                        v53 = v48.launchSound;
                    end;

                    local v54 = RandomUtil.fromList(unpack(v53));
                    local v55 = {
                        position = p31
                    };
                    local v56;

                    if v52 then
                        v56 = math.random() * (v52.Max - v52.Min) + v52.Min;
                    else
                        v56 = nil;
                    end;

                    v55.playbackSpeedMultiplier = v56;

                    if launchSoundConfig ~= nil then
                        launchSoundConfig = launchSoundConfig.volumeMultiplier;
                    end;

                    v55.volumeMultiplier = launchSoundConfig == nil and 1 or launchSoundConfig;
                    SoundManager:playSound(v54, v55);
                end;

                local launchOverlaySound = v48.launchOverlaySound;

                if launchOverlaySound ~= "" and launchOverlaySound then
                    local launchSoundConfig = v48.launchSoundConfig;

                    if launchSoundConfig ~= nil then
                        launchSoundConfig = launchSoundConfig.launchOverlayPitch;
                    end;

                    local launchOverlaySound2 = v48.launchOverlaySound;
                    local v57 = {};
                    local v58;

                    if launchSoundConfig then
                        v58 = math.random() * (launchSoundConfig.Max - launchSoundConfig.Min) + launchSoundConfig.Min;
                    else
                        v58 = nil;
                    end;

                    v57.playbackSpeedMultiplier = v58;
                    SoundManager:playSound(launchOverlaySound2, v57);
                end;
            end;
        end;

        if not u32.PrimaryPart then
            u32:GetPropertyChangedSignal("PrimaryPart"):Wait();

            if not u32.PrimaryPart then
                return nil;
            end;
        end;

        local v59;

        if v41 == nil then
            v59 = v41;
        else
            v59 = v41.useServerModel;
        end;

        local v60;

        if v59 then
            v60 = u32;
        else
            v60 = u32:Clone();
            v60.Parent = u32.Parent;
            u32:Destroy();
        end;

        local v61;

        if v41 == nil then
            v61 = v41;
        else
            v61 = v41.useServerModel;
        end;

        local v62 = not v61;

        if not v62 then
            local v63;

            if v42 == nil then
                v63 = v42;
            else
                v63 = v42:getPlayer().UserId;
            end;

            v62 = v63 == Players.LocalPlayer.UserId;
        end;

        if v62 then
            local PrimaryPart = v60.PrimaryPart;

            if PrimaryPart ~= nil then
                local v64 = PrimaryPart:FindFirstChildWhichIsA("BodyForce");

                if v64 ~= nil then
                    v64:Destroy();
                end;
            end;

            local v65;

            if p36 then
                v65 = EntityUtil:getEntity(p36);
            else
                v65 = nil;
            end;

            local v66;

            if v41 == nil then
                v66 = v41;
            else
                v66 = v41.gravitationalAcceleration;
            end;

            local function v69(p67, p68) -- Line: 438
                -- upvalues: u32 (copy)
                u32:Destroy();
            end;

            local v70 = {};

            if v48 ~= nil then
                v48 = v48.relativeOverride;
            end;

            v70.relative = v48;

            if p40 ~= nil then
                p40 = p40.detectHitTerrain;
            end;

            v70.detectHitTerrain = p40;

            if not p38 then
                if v41 ~= nil then
                    v41 = v41.useServerModel;
                end;

                p38 = v41 == true;

                if p38 then
                    if v42 ~= nil then
                        v42 = v42:getPlayer().UserId;
                    end;

                    p38 = v42 == Players.LocalPlayer.UserId;
                end;
            end;

            ProjectileUtil.fireProjectile(v65, v60, p33, p31, p30, v66 == nil and 196.2 or v66, v69, nil, p37, v70, p38);
        end;

        u6:createProjectile(u32, v60, p30, p31, p36, p37);
        local u71 = u3.new();
        u71:GiveTask(function() -- Line: 475
            -- upvalues: u6 (ref), u32 (copy)
            u6:destroyProjectile(u32);
        end);

        if v60 then
            u71:GiveTask(v60.AncestryChanged:Once(function() -- Line: 479
                -- upvalues: u71 (copy)
                u71:DoCleaning();
            end));
        end;

        local setupProjectileConstantOrientation = ProjectileUtil.setupProjectileConstantOrientation;
        local v72;

        if RuntimeLib.instanceof(p36, PlayerEntity) then
            v72 = p36:getPlayer();
        else
            v72 = nil;
        end;

        u71:GiveTask(setupProjectileConstantOrientation(v60, v72));
    end);
end;

function u6.createProjectile(p73, p74, p75, p76, p77, p78, p79) -- Line: 589
    -- upvalues: ClientSyncEvents (copy), u5 (copy)
    ClientSyncEvents.ProjectileLaunched:fire(p75.Name, p75, p76, p77, p78 or nil, p79);
    u5[p74] = p75;
end;

function u6.destroyProjectile(p80, p81) -- Line: 596
    -- upvalues: u5 (copy), ClientSyncEvents (copy)
    local v82 = u5[p81];

    if not v82 then
        return nil;
    end;

    if not ClientSyncEvents.ProjectileDestroy:fire(v82.Name, v82):isCancelled() then
        v82:Destroy();
    end;

    u5[p81] = nil;
end;

function u6.getClientProjectile(p83, p84) -- Line: 610
    -- upvalues: u5 (copy)
    return u5[p84];
end;

function u6.getProjectileSkin(p85, u86) -- Line: 614
    -- upvalues: Players (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), getProjectileSkinMeta (copy)
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local projectileSkins = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character)].projectileSkins;

    if projectileSkins ~= nil then
        local function _(p87) -- Line: 623
            -- upvalues: getProjectileSkinMeta (ref), u86 (copy)
            return getProjectileSkinMeta(p87).projectileType == u86;
        end;

        projectileSkins = nil;

        for i, v in projectileSkins do
            local _ = i - 1;

            if getProjectileSkinMeta(v).projectileType == u86 == true then
                projectileSkins = v;
                break;
            end;
        end;
    end;

    return projectileSkins;
end;

return {
    ClientProjectileMap = u5,
    ProjectileEffectController = KnitClient.CreateController(u6.new())
};