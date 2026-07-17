-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ExpireList = v1.ExpireList;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "BedShieldUpgradeController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 30
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 34
    -- upvalues: KnitController (copy), ExpireList (copy)
    KnitController.constructor(p6);
    p6.Name = "BedShieldUpgradeController";
    p6.bedShieldTimer = ExpireList.new();
end;

function u4.KnitStart(u7) -- Line: 39
    -- upvalues: KnitController (copy), KnitClient2 (copy), GameSound (copy), default (copy), ClientSyncEvents (copy), SyncEventPriority (copy)
    KnitController.KnitStart(u7);
    KnitClient2.Controllers.PreloadController:runPreload({
        sounds = {
            GameSound.BED_SHIELD_ACTIVATE,
            GameSound.BED_SHIELD_DEACTIVATE,
            GameSound.BED_SHIELD_IMPACT_1,
            GameSound.BED_SHIELD_IMPACT_2,
            GameSound.BED_SHIELD_IMPACT_3,
            GameSound.BED_SHIELD_IMPACT_4
        }
    });
    default.Client:OnEvent("BedShieldActivated", function(p8) -- Line: 44
        -- upvalues: u7 (copy)
        u7:handleBedShieldActivated(p8);
    end);
    default.Client:OnEvent("BedShieldImpacted", function(p9) -- Line: 47
        -- upvalues: u7 (copy)
        u7:handleBedShieldImpacted(p9);
    end);
    default.Client:OnEvent("BedShieldDeactivated", function(p10, p11) -- Line: 50
        -- upvalues: u7 (copy)
        u7:handleBedShieldDeactivated(p10, p11);
    end);
    ClientSyncEvents.ProjectileHit:setPriority(SyncEventPriority.HIGH):connect(function(p12) -- Line: 53
        if p12:isCancelled() then
            return nil;
        end;

        local hitData = p12.hitData;

        if hitData ~= nil then
            hitData = hitData.part;

            if hitData ~= nil then
                hitData = hitData:HasTag("ProjectileShield");
            end;
        end;

        if hitData then
            p12.projectileModel:Destroy();
        end;
    end);
end;

function u4.getLocalBedShieldTimer(p13) -- Line: 70
    -- upvalues: KnitClient2 (copy), Players (copy)
    local v14 = KnitClient2.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

    if v14 ~= nil then
        v14 = v14.id;
    end;

    local v15 = p13.bedShieldTimer:get(v14 == nil and "" or v14);

    if v15 ~= nil then
        v15 = v15.expiresAt;
    end;

    return v15;
end;

function u4.handleBedShieldActivated(p16, p17) -- Line: 86
    -- upvalues: Workspace (copy), Players (copy), SoundManager (copy), GameSound (copy)
    local v18 = p17.expireTime - Workspace:GetServerTimeNow();
    p16.bedShieldTimer:add(p17.teamId, v18);
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    if (Character:GetPivot().Position - p17.bedPosition).Magnitude < 100 then
        SoundManager:playSound(GameSound.BED_SHIELD_ACTIVATE, {
            rollOffMaxDistance = 100,
            position = p17.bedPosition
        });
    end;
end;

function u4.handleBedShieldImpacted(p19, p20) -- Line: 103
    -- upvalues: Players (copy), GameSound (copy), SoundManager (copy), RandomUtil (copy), ReplicatedStorage (copy), Workspace (copy), KnitClient2 (copy), RunService (copy)
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    if (Character:GetPivot().Position - p20.Position).Magnitude >= 100 then
        return nil;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack({
        GameSound.BED_SHIELD_IMPACT_1,
        GameSound.BED_SHIELD_IMPACT_2,
        GameSound.BED_SHIELD_IMPACT_3,
        GameSound.BED_SHIELD_IMPACT_4
    })), {
        rollOffMaxDistance = 70,
        volumeMultiplier = 0.8,
        position = p20.Position
    });
    local u21 = ReplicatedStorage.Assets.Effects.BedShieldImpact:Clone();
    u21.Parent = Workspace;
    u21:PivotTo(p20);

    local function _(p22) -- Line: 126
        if p22:IsA("ParticleEmitter") then
            p22:Emit();
        end;
    end;

    for i, descendant in u21:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit();
        end;
    end;

    local v23 = false;
    local v24 = 0;

    while true do
        if v23 then
            v24 = v24 + 1;
        else
            v23 = true;
        end;

        if v24 >= 3 then
            if not RunService:IsStudio() then
                task.delay(2, function() -- Line: 157
                    -- upvalues: u21 (copy)
                    u21:Destroy();
                end);
            end;

            return;
        end;

        local BlockDebrisController = KnitClient2.Controllers.BlockDebrisController;
        local Position = p20.Position;
        local v25 = Color3.fromRGB(237, 128, 56);
        local v26 = Vector3.new();
        local v27 = {
            burnDebris = true,
            transparency = 0.15,
            burnColors = { Color3.fromRGB(240, 94, 71), Color3.fromRGB(240, 120, 46) },
            material = Enum.Material.Neon
        };
        local v28 = math.random() * 0.6;
        local v29 = math.random() * 0.5;
        local v30 = math.random() * 0.9;
        v27.size = Vector3.new(v28, v29, v30);
        BlockDebrisController:createDebris(Position, v25, v26, v27);
    end;
end;

function u4.handleBedShieldDeactivated(p31, p32, p33) -- Line: 162
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy)
    p31.bedShieldTimer:remove(p32);
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    if (Character:GetPivot().Position - p33).Magnitude < 100 then
        SoundManager:playSound(GameSound.BED_SHIELD_DEACTIVATE, {
            rollOffMaxDistance = 100,
            position = p33
        });
    end;
end;

KnitClient.CreateController(u4.new());

return nil;