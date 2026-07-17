-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ExpireList = v1.ExpireList;
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CarrotCannonConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "carrot-cannon", "carrot-cannon-constants").CarrotCannonConstants;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "CarrotCannonEffectsController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 37
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 41
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "CarrotCannonEffectsController";
    p6.hitMarkerOverflow = 0;
    p6.effectCooldown = {};
end;

function u4.KnitStart(u7) -- Line: 47
    -- upvalues: KnitController (copy), default (copy), Players (copy), ClientSyncEvents (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy), InventoryUtil (copy), MapUtil (copy), ExpireList (copy), CarrotCannonConstants (copy), EntityDamageEventZap (copy), RunService (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u7);
    default.Client:WaitFor("CarrotRocketExplode"):andThen(function(p8) -- Line: 50
        -- upvalues: Players (ref), u7 (copy)
        p8:Connect(function(p9) -- Line: 51
            -- upvalues: Players (ref), u7 (ref)
            if p9.shooter ~= Players.LocalPlayer then
                u7:playExplosion(p9.position);
            end;
        end);
    end);
    ClientSyncEvents.LocalProjectileImpact:connect(function(p10) -- Line: 58
        -- upvalues: u7 (copy)
        if p10.projectile.Name == "carrot_rocket" then
            u7:playExplosion(p10.hitPosition);
        end;
    end);
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.CARROT_CANNON_SHOOT) }, function(p11, p12) -- Line: 64
        -- upvalues: InventoryUtil (ref), MapUtil (ref), u7 (copy), ExpireList (ref), CarrotCannonConstants (ref)
        local Character = p11.Character;

        if not Character then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(p11).hand;

        if hand ~= nil then
            hand = hand.tool;
        end;

        if hand then
            local v13 = MapUtil.getOrCreate(u7.effectCooldown, p11.UserId, ExpireList.new(CarrotCannonConstants.COOLDOWN * 0.9));

            if #v13:getValues() >= 4 then
                return nil;
            end;

            v13:add(math.random());
            u7:playFireEffect(Character);
        end;
    end);
    EntityDamageEventZap.On(function(p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27) -- Line: 83
        -- upvalues: Players (ref), u7 (copy)
        if p14.PrimaryPart and (p18 and p14 ~= Players.LocalPlayer.Character) then
            local v28 = Players:GetPlayerFromCharacter(p18) == Players.LocalPlayer;

            if v28 then
                if p21 ~= nil then
                    p21 = p21.paintBlast;
                end;
            else
                p21 = v28;
            end;

            if p21 then
                u7.hitMarkerOverflow = math.min(u7.hitMarkerOverflow + 1, 3);
            end;
        end;
    end);
    local u29 = 0;
    RunService.Heartbeat:Connect(function() -- Line: 100
        -- upvalues: u29 (ref), u7 (copy), SoundManager (ref), GameSound (ref)
        if tick() - u29 < 0.1 then
            return nil;
        end;

        if u7.hitMarkerOverflow > 0 then
            local v30 = u7;
            v30.hitMarkerOverflow = v30.hitMarkerOverflow - 1;
            SoundManager:playSound(GameSound.ARROW_HIT, {
                volumeMultiplier = 0.2
            });
            u29 = tick();
        end;
    end);
end;

function u4.playFireEffect(p31, p32) -- Line: 113
    -- upvalues: Workspace (copy), Players (copy), KnitClient2 (copy), ItemType (copy), EffectUtil (copy)
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = CurrentCamera.CFrame.Position;
    end;

    if not CurrentCamera or (p32:GetPrimaryPartCFrame().Position - CurrentCamera).Magnitude > 300 then
        return nil;
    end;

    if p32 == Players.LocalPlayer.Character and KnitClient2.Controllers.ViewmodelController:isVisible() then
        p32 = KnitClient2.Controllers.ViewmodelController:getViewModel() or p32;
    end;

    local v33 = p32:FindFirstChild(ItemType.CARROT_CANNON);

    if not v33 then
        return nil;
    end;

    EffectUtil:playEffects(v33:GetDescendants(), nil);
end;

function u4.playExplosion(p34, p35) -- Line: 137
    -- upvalues: ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), Workspace (copy), EffectUtil (copy)
    local u36 = ReplicatedStorage.Assets.Effects.Explosion:Clone();
    SoundManager:playSound(GameSound.TNT_EXPLODE_1, {
        rollOffMaxDistance = 200,
        position = p35
    });
    SoundManager:playSound(GameSound.CARROT_LAUNCHER_IMPACT, {
        rollOffMaxDistance = 200,
        position = p35
    });
    u36.Parent = Workspace;
    EffectUtil:playEffects({ u36 }, nil, {
        sizeMultiplier = 0.75
    });
    u36.CFrame = CFrame.new(p35);
    task.delay(2, function() -- Line: 152
        -- upvalues: u36 (copy)
        u36:Destroy();
    end);
end;

KnitClient.CreateController(u4.new());

return nil;