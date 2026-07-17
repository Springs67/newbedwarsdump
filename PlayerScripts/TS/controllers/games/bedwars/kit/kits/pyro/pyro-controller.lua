-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local HttpService = v2.HttpService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local PyroUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "pyro-util").PyroUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "PyroController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 33
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 37
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "PyroController";
end;

function u3.KnitStart(p6) -- Line: 41
    -- upvalues: KnitClient (copy), AnimationType (copy), WatchCharacter (copy), Players (copy), ReplicatedStorage (copy), RuntimeLib (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), PyroUtil (copy), ClientSyncEvents (copy), EntityUtil (copy), SoundManager (copy), GameSound (copy), HttpService (copy), WeldUtil (copy), EntityDamageEventZap (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.FLAMETHROWER_USE, AnimationType.FLAMETHROWER_UPGRADE, AnimationType.FLAMETHROWER_IDLE }
    });
    WatchCharacter(function(u7, u8, u9) -- Line: 46
        -- upvalues: Players (ref), ReplicatedStorage (ref), RuntimeLib (ref)
        if u7 == Players.LocalPlayer then
            return nil;
        end;

        local u10 = nil;
        local u11 = nil;

        local function handleBrittle(p12) -- Line: 52
            -- upvalues: u11 (ref), u8 (copy), ReplicatedStorage (ref), u10 (ref), RuntimeLib (ref), u9 (copy)
            if p12 == 0 or (p12 ~= p12 or (not p12 or p12 < os.time())) then
                local v13 = u11;

                if v13 ~= nil then
                    v13 = v13.Parent;
                end;

                if v13 then
                    u11:Destroy();
                end;

                return nil;
            end;

            local Head = u8:FindFirstChild("Head");

            if not Head then
                return nil;
            end;

            local v14 = u11;

            if v14 ~= nil then
                v14 = v14.Parent;
            end;

            if not v14 then
                u11 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("BrittleParticle"):FindFirstChildWhichIsA("Attachment"):Clone();
                u11.Parent = Head;
            end;

            if u10 then
                u10:cancel();
            end;

            u10 = RuntimeLib.Promise.delay(p12 - os.time()):andThen(function() -- Line: 79
                -- upvalues: u11 (ref)
                local v15 = u11;

                if v15 ~= nil then
                    v15:Destroy();
                end;
            end);
            u9:GiveTask(function() -- Line: 86
                -- upvalues: u10 (ref), u11 (ref)
                local v16 = u10;

                if v16 ~= nil then
                    v16:cancel();
                end;

                local v17 = u11;

                if v17 ~= nil then
                    v17:Destroy();
                end;
            end);
        end;

        handleBrittle(u7:GetAttribute("BrittleUntil"));
        u9:GiveTask(u7:GetAttributeChangedSignal("BrittleUntil"):Connect(function() -- Line: 98
            -- upvalues: handleBrittle (copy), u7 (copy)
            handleBrittle(u7:GetAttribute("BrittleUntil"));
        end));
    end);
    local u18 = {};
    local u19 = {};
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.FLAMETHROWER_UPGRADE), GameAnimationUtil:getAssetId(AnimationType.FLAMETHROWER_USE) }, function(p20, u21) -- Line: 105
        -- upvalues: PyroUtil (ref), ClientSyncEvents (ref), GameAnimationUtil (ref), AnimationType (ref), u18 (copy), EntityUtil (ref), SoundManager (ref), GameSound (ref), Players (ref), HttpService (ref), u19 (copy), ReplicatedStorage (ref), WeldUtil (ref)
        local Character = p20.Character;

        if not Character then
            return nil;
        end;

        local Animation = u21.Animation;

        if Animation ~= nil then
            Animation = Animation.AnimationId;
        end;

        local cooldown = ClientSyncEvents.ItemCooldownModifierCheck:fire(PyroUtil.FLAMETHROWER_COOLDOWN_SEC).cooldown;

        if Animation == GameAnimationUtil:getAssetId(AnimationType.FLAMETHROWER_USE) then
            local v22 = tick();
            local v23 = u18[p20];

            if v22 - (v23 == nil and 0 or v23) < cooldown * 0.95 then
                return nil;
            end;

            u18[p20] = tick();
            local u24 = EntityUtil:getEntity(p20);

            if u24 ~= nil then
                u24 = u24:getHandItemInstanceFromCharacter();
            end;

            if u24 then
                local FLAMETHROWER_USE = GameSound.FLAMETHROWER_USE;
                local v25 = {};
                local v26;

                if p20 == Players.LocalPlayer then
                    v26 = nil;
                else
                    v26 = Character:GetPivot().Position;
                end;

                v25.position = v26;
                local u27 = SoundManager:playSound(FLAMETHROWER_USE, v25);
                local u28 = HttpService:GenerateGUID();
                PyroUtil.setEnabled(u24, true, u28);
                u21.Destroying:Connect(function() -- Line: 144
                    -- upvalues: PyroUtil (ref), u24 (copy), u28 (copy), u27 (copy)
                    PyroUtil.setEnabled(u24, false, u28);
                    local v29 = u27;

                    if v29 ~= nil then
                        v29:Stop();
                    end;

                    local v30 = u27;

                    if v30 ~= nil then
                        v30:Destroy();
                    end;
                end);
            end;
        end;

        if Animation == GameAnimationUtil:getAssetId(AnimationType.FLAMETHROWER_UPGRADE) then
            local v31 = tick();
            local v32 = u19[p20];

            if v31 - (v32 == nil and 0 or v32) < 1 then
                return nil;
            end;

            u19[p20] = tick();
            local FLAMETHROWER_UPGRADE = GameSound.FLAMETHROWER_UPGRADE;
            local v33 = {};
            local v34;

            if p20 == Players.LocalPlayer then
                v34 = nil;
            else
                v34 = Character:GetPivot().Position;
            end;

            v33.position = v34;
            local u35 = SoundManager:playSound(FLAMETHROWER_UPGRADE, v33);
            task.spawn(function() -- Line: 176
                -- upvalues: u21 (copy), ReplicatedStorage (ref), Character (copy), WeldUtil (ref), u35 (copy)
                u21:GetMarkerReachedSignal("spawn_blowtorch"):Wait();
                local v36 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("BlowTorch"):Clone();
                v36.Parent = Character;
                WeldUtil:weldCharacterAccessories(Character);
                u21:GetMarkerReachedSignal("activate_blowtorch"):Wait();

                local function _(p37) -- Line: 183
                    if p37:IsA("ParticleEmitter") then
                        p37.Enabled = true;
                    end;

                    if p37:IsA("Light") then
                        p37.Enabled = true;
                    end;
                end;

                for i, descendant in v36:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant.Enabled = true;
                    end;

                    if descendant:IsA("Light") then
                        descendant.Enabled = true;
                    end;
                end;

                u21:GetMarkerReachedSignal("despawn_blowtorch"):Wait();
                v36:Destroy();
                local v38 = u35;

                if v38 ~= nil then
                    v38:Stop();
                end;

                local v39 = u35;

                if v39 ~= nil then
                    v39:Destroy();
                end;
            end);
        end;
    end);
    EntityDamageEventZap.On(function(p40, p41, p42, p43, p44, p45, p46, p47, p48, p49, p50, p51, p52, p53) -- Line: 208
        -- upvalues: SoundManager (ref), GameSound (ref), Players (ref)
        if p47 ~= nil then
            p47 = p47.pyroBrittleAttack;
        end;

        if p47 then
            local BRITTLE_HIT = GameSound.BRITTLE_HIT;
            local v54 = {};
            local v55;

            if p40 == Players.LocalPlayer.Character then
                v55 = nil;
            else
                v55 = p40.PrimaryPart;

                if v55 ~= nil then
                    v55 = v55.Position;
                end;
            end;

            v54.position = v55;
            SoundManager:playSound(BRITTLE_HIT, v54);
        end;
    end);
end;

function u3.openUpgradeMenu(p56) -- Line: 233
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.FLAMETHROWER_UPGRADES, {});
end;

KnitClient.CreateController(u3.new());

return nil;