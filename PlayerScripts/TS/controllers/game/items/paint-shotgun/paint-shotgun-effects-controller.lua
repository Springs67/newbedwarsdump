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
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PaintShotgunConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "paint-shotgun", "paint-shotgun-constants").PaintShotgunConstants;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "PaintShotgunEffectsController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 34
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 38
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "PaintShotgunEffectsController";
    p6.hitMarkerOverflow = 0;
    p6.effectCooldown = {};
end;

function u4.KnitStart(u7) -- Line: 44
    -- upvalues: KnitController (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), InventoryUtil (copy), MapUtil (copy), ExpireList (copy), PaintShotgunConstants (copy), EntityDamageEventZap (copy), RunService (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u7);
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.PAINT_SHOTGUN_SHOOT) }, function(p8, p9) -- Line: 47
        -- upvalues: Players (ref), InventoryUtil (ref), MapUtil (ref), u7 (copy), ExpireList (ref), PaintShotgunConstants (ref)
        local Character = p8.Character;

        if not Character then
            return nil;
        end;

        if p8 == Players.LocalPlayer then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(p8).hand;

        if hand ~= nil then
            hand = hand.tool;
        end;

        if hand then
            local v10 = MapUtil.getOrCreate(u7.effectCooldown, p8.UserId, ExpireList.new(PaintShotgunConstants.COOLDOWN * 0.9));

            if #v10:getValues() >= 2 then
                return nil;
            end;

            v10:add(math.random());
            u7:playShotgunEffect(Character);
        end;
    end);
    EntityDamageEventZap.On(function(p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24) -- Line: 70
        -- upvalues: Players (ref), u7 (copy)
        if p11.PrimaryPart and p15 then
            local v25 = Players:GetPlayerFromCharacter(p15) == Players.LocalPlayer;

            if v25 then
                if p18 ~= nil then
                    p18 = p18.paintBlast;
                end;
            else
                p18 = v25;
            end;

            if p18 then
                u7.hitMarkerOverflow = math.min(u7.hitMarkerOverflow + 1, 3);
            end;
        end;
    end);
    local u26 = 0;
    RunService.Heartbeat:Connect(function() -- Line: 87
        -- upvalues: u26 (ref), u7 (copy), SoundManager (ref), GameSound (ref)
        if tick() - u26 < 0.1 then
            return nil;
        end;

        if u7.hitMarkerOverflow > 0 then
            local v27 = u7;
            v27.hitMarkerOverflow = v27.hitMarkerOverflow - 1;
            SoundManager:playSound(GameSound.ARROW_HIT, {
                volumeMultiplier = 0.2
            });
            u26 = tick();
        end;
    end);
end;

function u4.playShotgunEffect(p28, p29) -- Line: 100
    -- upvalues: Workspace (copy), SoundManager (copy), GameSound (copy), Players (copy), KnitClient2 (copy), ItemType (copy), EffectUtil (copy)
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = CurrentCamera.CFrame.Position;
    end;

    if not CurrentCamera or (p29:GetPrimaryPartCFrame().Position - CurrentCamera).Magnitude > 300 then
        return nil;
    end;

    local PAINT_SHOTGUN_BLAST = GameSound.PAINT_SHOTGUN_BLAST;
    local v30 = {};
    local v31;

    if p29 == Players.LocalPlayer.Character then
        v31 = nil;
    else
        v31 = p29:GetPrimaryPartCFrame().Position;
    end;

    v30.position = v31;
    SoundManager:playSound(PAINT_SHOTGUN_BLAST, v30);

    if p29 == Players.LocalPlayer.Character and KnitClient2.Controllers.ViewmodelController:isVisible() then
        p29 = KnitClient2.Controllers.ViewmodelController:getViewModel() or p29;
    end;

    local v32 = p29:FindFirstChild(ItemType.PAINT_SHOTGUN);

    if not v32 then
        return nil;
    end;

    EffectUtil:playEffects(v32:GetDescendants(), nil);
end;

KnitClient.CreateController(u4.new());

return nil;