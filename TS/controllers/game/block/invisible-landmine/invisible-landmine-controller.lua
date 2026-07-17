-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = {
    tag = "invisible-landmine",
    enemyFadeTransparency = 1,
    friendlyFadeTransparency = 0.6,
    fadeDuration = 0.3,
    revealTransparency = 0,
    revealDuration = 0.25,
    beepVolume = 0.3,
    rollOffMaxDistance = 25,
    beepSound = GameSound.INVISIBLE_LANDMINE_BEEP_LOOP
};
local u5 = TweenInfo.new(u4.fadeDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
local u6 = TweenInfo.new(u4.revealDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "InvisibleLandmineController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 44
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9, ...) -- Line: 48
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p9, ...);
    p9.Name = "InvisibleLandmineController";
    p9.invisibleLandmineMap = {};
    p9.tweenMaid = u2.new();
end;

function u7.KnitStart(u10) -- Line: 54
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), u4 (copy), default (copy), Players (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), CollectionService (copy)
    KnitController.KnitStart(u10);
    WatchCollectionTag(u4.tag, function(p11) -- Line: 56
        -- upvalues: u10 (copy)
        if not u10:isClientPrediction(p11) then
            u10:tagLandmineWithTeam(p11);
            u10:hideLandmine(p11);
            u10:handleTouch(p11);
        end;
    end);
    default.Client:OnEvent("LandmineExplode", function(p12) -- Line: 63
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        local INVISIBLE_LANDMINE_EXPLOSION = GameSound.INVISIBLE_LANDMINE_EXPLOSION;
        local v13 = {
            rollOffMaxDistance = 250
        };
        local v14;

        if Players.LocalPlayer.Character and Players.LocalPlayer.Character == p12.targetEntityInstance then
            v14 = nil;
        else
            v14 = p12.position;
        end;

        v13.position = v14;
        SoundManager:playSound(INVISIBLE_LANDMINE_EXPLOSION, v13);
        local v15 = ReplicatedStorage.Assets.Effects.LandmineExplosion:Clone();
        v15.Parent = Workspace;
        v15.CFrame = CFrame.new(p12.position);
        EffectUtil:playEffects({ v15 }, nil, {
            destroyAfterSec = 3
        });
    end);
    CollectionService:GetInstanceRemovedSignal(u4.tag):Connect(function(p16) -- Line: 76
        -- upvalues: u10 (copy)
        if not u10:isClientPrediction(p16) then
            local v17 = u10.invisibleLandmineMap[p16];

            if v17 ~= nil then
                local beepLoopMaid = v17.beepLoopMaid;

                if beepLoopMaid ~= nil then
                    beepLoopMaid:DoCleaning();
                end;
            end;

            u10.invisibleLandmineMap[p16] = nil;
        end;
    end);
end;

function u7.hideLandmine(u18, u19) -- Line: 92
    -- upvalues: u4 (copy), TweenService (copy), u5 (copy)
    local Landmine = u19:WaitForChild("Landmine");
    local v20 = u19:GetAttribute("LandmineActive");
    local v21 = u19:GetAttribute("LandmineDetonating");
    local u22 = u18:isFriendlyLandmine(u19);

    if v20 then
        u18.invisibleLandmineMap[u19] = {
            isActive = v20,
            isDetonating = v21
        };
        local v23;

        if u22 then
            v23 = u4.friendlyFadeTransparency;
        else
            v23 = u4.enemyFadeTransparency;
        end;

        Landmine.Transparency = v23;

        if not (v21 or u22) then
            u18:setupSound(u19);
        end;
    else
        local v24 = {};
        local v25;

        if u22 then
            v25 = u4.friendlyFadeTransparency;
        else
            v25 = u4.enemyFadeTransparency;
        end;

        v24.Transparency = v25;
        local v26 = TweenService:Create(Landmine, u5, v24);
        local u27 = nil;
        u27 = v26.Completed:Connect(function() -- Line: 116
            -- upvalues: u18 (copy), u19 (copy), u22 (copy), u27 (ref)
            u18.invisibleLandmineMap[u19] = {
                isActive = true,
                isDetonating = false
            };
            u19:SetAttribute("LandmineActive", true);

            if not u22 then
                u18:setupSound(u19);
            end;

            u18.tweenMaid:GiveTask(u27);
            u18.tweenMaid:DoCleaning();
        end);
        v26:Play();
    end;
end;

function u7.revealLandmine(p28, p29) -- Line: 133
    -- upvalues: TweenService (copy), u6 (copy), u4 (copy)
    TweenService:Create(p29:WaitForChild("Landmine"), u6, {
        Transparency = u4.revealTransparency
    }):Play();
end;

function u7.handleTouch(u30, u31) -- Line: 139
    -- upvalues: default (copy)
    u31.Touched:Connect(function(p32) -- Line: 140
        -- upvalues: u30 (copy), u31 (copy), default (ref)
        local v33 = u30.invisibleLandmineMap[u31];
        local v34 = u30:isLandmineOwner(u31, p32);
        local v35 = u30:playerOnLandmineOwnersTeam(u31, p32);
        local v36 = u30:isHumanoid(p32) and not v34 and not v35;

        if v36 then
            if v33 == nil then
                v36 = v33;
            else
                v36 = v33.isActive;
            end;

            if v36 then
                local v37;

                if v33 == nil then
                    v37 = v33;
                else
                    v37 = v33.isDetonating;
                end;

                v36 = not v37;
            end;
        end;

        if v36 then
            local v38 = u30:isLocalPlayer(p32);

            if v33 ~= nil then
                local beepLoopMaid = v33.beepLoopMaid;

                if beepLoopMaid ~= nil then
                    beepLoopMaid:DoCleaning();
                end;
            end;

            u30:revealLandmine(u31);
            v33.isDetonating = true;

            if v38 then
                u31:SetAttribute("LandmineDetonating", true);
                default.Client:Get("TriggerInvisibleLandmine"):SendToServer({
                    invisibleLandmine = u31
                });
            end;
        end;
    end);
end;

function u7.setupSound(p39, p40) -- Line: 183
    -- upvalues: u2 (copy)
    local v41 = p39:startBeepLoop(p40);
    local v42 = u2.new();
    v42:GiveTask(v41);
    local v43 = p39.invisibleLandmineMap[p40];

    if v43 then
        v43.beepLoopMaid = v42;
    end;
end;

function u7.startBeepLoop(p44, p45) -- Line: 194
    -- upvalues: SoundManager (copy), u4 (copy)
    return SoundManager:playSound(u4.beepSound, {
        looped = true,
        position = p45.Position,
        volumeMultiplier = u4.beepVolume,
        rollOffMaxDistance = u4.rollOffMaxDistance
    });
end;

function u7.tagLandmineWithTeam(p46, p47) -- Line: 203
    -- upvalues: Players (copy)
    local v48 = Players:GetPlayerByUserId((p47:GetAttribute("PlacedByUserId")));

    if v48 then
        local Team = v48.Team;

        if Team ~= nil then
            Team = Team.Name;
        end;

        p47:SetAttribute("LandmineTeam", Team);
    end;
end;

function u7.isLandmineOwner(p49, p50, p51) -- Line: 215
    -- upvalues: Players (copy)
    local v52 = Players:GetPlayerFromCharacter(p51.Parent);
    local v53 = p50:GetAttribute("PlacedByUserId");

    if v52 ~= nil then
        v52 = v52.UserId;
    end;

    return v53 == v52;
end;

function u7.playerOnLandmineOwnersTeam(p54, p55, p56) -- Line: 224
    -- upvalues: Players (copy)
    local v57 = Players:GetPlayerByUserId((p55:GetAttribute("PlacedByUserId")));
    local v58 = Players:GetPlayerFromCharacter(p56.Parent);

    if v57 ~= nil then
        v57 = v57.Team;

        if v57 ~= nil then
            v57 = v57.Name;
        end;
    end;

    if v58 ~= nil then
        v58 = v58.Team;

        if v58 ~= nil then
            v58 = v58.Name;
        end;
    end;

    return v57 == v58;
end;

function u7.isFriendlyLandmine(p59, p60) -- Line: 244
    -- upvalues: Players (copy)
    local v61 = p60:GetAttribute("LandmineTeam");
    local Team = Players.LocalPlayer.Team;

    if Team ~= nil then
        Team = Team.Name;
    end;

    return v61 == Team;
end;

function u7.isLocalPlayer(p62, p63) -- Line: 252
    -- upvalues: Players (copy)
    return Players.LocalPlayer.Character and p63.Parent == Players.LocalPlayer.Character;
end;

function u7.isHumanoid(p64, p65) -- Line: 255
    local Parent = p65.Parent;

    if Parent ~= nil then
        Parent = Parent:FindFirstChild("Humanoid");
    end;

    return Parent ~= nil;
end;

function u7.isClientPrediction(p66, p67) -- Line: 262
    return p67:GetAttribute("ClientPlaced");
end;

KnitClient.CreateController(u7.new());

return nil;