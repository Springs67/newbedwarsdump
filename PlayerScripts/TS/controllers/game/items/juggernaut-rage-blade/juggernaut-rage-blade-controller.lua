-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutCubic = v2.InOutCubic;
local Linear = v2.Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v5.Lighting;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local JuggernautUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "juggernaut-balance-file").JuggernautUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local u6 = {
    {
        tpAnimation = AnimationType.JUGGERNAUT_ATTACK_1,
        fpAnimation = AnimationType.JUGGERNAUT_ATTACK_1_FP,
        swingSound = GameSound.JUGGERNAUT_ATTACK_SWING_1,
        impactSound = GameSound.JUGGERNAUT_ATTACK_IMPACT_1
    },
    {
        tpAnimation = AnimationType.JUGGERNAUT_ATTACK_2,
        fpAnimation = AnimationType.JUGGERNAUT_ATTACK_2_FP,
        swingSound = GameSound.JUGGERNAUT_ATTACK_SWING_2,
        impactSound = GameSound.JUGGERNAUT_ATTACK_IMPACT_2
    },
    {
        tpAnimation = AnimationType.JUGGERNAUT_ATTACK_3,
        fpAnimation = AnimationType.JUGGERNAUT_ATTACK_3_FP,
        swingSound = GameSound.JUGGERNAUT_ATTACK_SWING_2,
        impactSound = GameSound.JUGGERNAUT_ATTACK_IMPACT_3
    }
};
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 52, Name: __tostring
        return "JuggernautRageBladeController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 58
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 62
    -- upvalues: KnitController (copy)
    KnitController.constructor(p9);
    p9.Name = "JuggernautRageBladeController";
    p9.originalEffectRotations = {};
end;

function u7.KnitStart(u10) -- Line: 67
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), u6 (copy), ClientSyncEvents (copy), SyncEventPriority (copy), Players (copy), EntityUtil (copy), JuggernautUtil (copy), InventoryUtil (copy), AnimationType (copy), GameAnimationUtil (copy), WatchCharacterAnimation (copy)
    KnitController.KnitStart(u10);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.JUGGERNAUT_RAGE_BLADE, {
        animations = {
            u6[1].tpAnimation,
            u6[2].tpAnimation,
            u6[3].tpAnimation,
            u6[1].fpAnimation,
            u6[2].fpAnimation,
            u6[3].fpAnimation
        },
        sounds = {
            u6[1].swingSound,
            u6[2].swingSound,
            u6[3].swingSound,
            u6[1].impactSound,
            u6[2].impactSound,
            u6[3].impactSound
        }
    });
    ClientSyncEvents.SwordSwing:setPriority(SyncEventPriority.HIGHEST):connect(function(p11) -- Line: 74
        -- upvalues: Players (ref), ItemType (ref), EntityUtil (ref), JuggernautUtil (ref)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:GetAttribute("JuggSpinning");
        end;

        if Character ~= 0 and (Character == Character and (Character ~= "" and Character)) then
            p11:setCancelled(true);

            return nil;
        end;

        if p11.swordType == ItemType.JUGGERNAUT_RAGE_BLADE then
            local v12 = EntityUtil:getLocalPlayerEntity();

            if not v12 then
                return nil;
            end;

            local v13 = v12:getInstance():GetAttribute("RageBladeCount");
            p11.attackSpeed = JuggernautUtil.JUGGERNAUT_SWORD_COOLDOWN;

            if (v13 == nil and 0 or v13) == 0 and JuggernautUtil:isSwinging(v12) then
                p11.attackSpeed = 0.9;
            end;
        end;
    end);
    ClientSyncEvents.SwordSwing:connect(function(p14) -- Line: 100
        -- upvalues: InventoryUtil (ref), Players (ref), ItemType (ref), EntityUtil (ref), JuggernautUtil (ref), u10 (copy)
        if p14:isCancelled() then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if hand ~= nil then
            hand = hand.itemType;
        end;

        local v15 = hand == ItemType.JUGGERNAUT_RAGE_BLADE and EntityUtil:getEntity(Players.LocalPlayer);

        if v15 then
            local v16 = JuggernautUtil:updateSwingCount(v15);
            u10:playAnimation(Players.LocalPlayer, v16);
            v15:getInstance():SetAttribute("RageBladeCount", (v16 + 1) % 3);
        end;
    end);
    local v17 = { AnimationType.JUGGERNAUT_ATTACK_1, AnimationType.JUGGERNAUT_ATTACK_2, AnimationType.JUGGERNAUT_ATTACK_3 };

    local function _(p18) -- Line: 120
        -- upvalues: GameAnimationUtil (ref)
        return GameAnimationUtil:getAssetId(p18);
    end;

    local u19 = table.create(#v17);

    for i, v in v17 do
        local _ = i - 1;
        u19[i] = GameAnimationUtil:getAssetId(v);
    end;

    WatchCharacterAnimation(u19, function(p20, p21) -- Line: 130
        -- upvalues: Players (ref), InventoryUtil (ref), ItemType (ref), u10 (copy), u19 (copy)
        if p20 == Players.LocalPlayer then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(p20).hand;

        if hand ~= nil then
            hand = hand.itemType;
        end;

        if hand ~= ItemType.JUGGERNAUT_RAGE_BLADE then
            return nil;
        end;

        u10:registerAnimationEffects(p20, (table.find(u19, p21.Animation.AnimationId) or 0) - 1, p21);
    end);
end;

function u7.playAnimation(p22, p23, p24) -- Line: 147
    -- upvalues: u6 (copy), AnimationUtil (copy), GameAnimationUtil (copy), Players (copy), KnitClient (copy)
    local v25 = u6[p24 + 1];
    local v26 = AnimationUtil:playAnimation(p23, GameAnimationUtil:getAssetId(v25.tpAnimation));

    if p23 == Players.LocalPlayer then
        KnitClient.Controllers.ViewmodelController:playAnimation(v25.fpAnimation);
    end;

    p22:registerAnimationEffects(p23, p24, v26);
end;

function u7.registerAnimationEffects(u27, u28, u29, u30) -- Line: 155
    -- upvalues: u6 (copy), u3 (copy)
    local Character = u28.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame;
        end;
    end;

    if not Character then
        return nil;
    end;

    local swingSound = u6[u29 + 1].swingSound;

    if swingSound ~= "" and swingSound then
        u27:playSound(u28, Character.Position, swingSound);
    end;

    local u31 = u3.new();
    u31:GiveTask(u30:GetMarkerReachedSignal("impact"):Connect(function() -- Line: 173
        -- upvalues: u27 (copy), u28 (copy), u29 (copy), u30 (copy)
        u27:playEffect(u28, u29);
        local Speed = u30.Speed;
        u30:AdjustSpeed(0.02);
        task.delay(0.08, function() -- Line: 177
            -- upvalues: u30 (ref), Speed (copy)
            u30:AdjustSpeed(Speed);
        end);
    end));
    task.delay(4, function() -- Line: 181
        -- upvalues: u31 (copy)
        u31:DoCleaning();
    end);
end;

function u7.playSound(p32, p33, p34, p35) -- Line: 185
    -- upvalues: Players (copy), SoundManager (copy)
    if p33 == Players.LocalPlayer then
        p34 = nil;
    end;

    SoundManager:playSound(p35, {
        rollOffMaxDistance = 250,
        rollOffMinDistance = 40,
        position = p34
    });
end;

function u7.playEffect(u36, p37, p38) -- Line: 196
    -- upvalues: Players (copy), u6 (copy), ScreenShakeUtil (copy), u4 (copy), Lighting (copy), default (copy), Linear (copy), Workspace (copy), ReplicatedStorage (copy), InOutCubic (copy), ModelUtil (copy)
    local v39 = p37 == Players.LocalPlayer;
    local v40 = u6[p38 + 1];
    local Character = p37.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame();
    end;

    if not Character then
        return nil;
    end;

    local impactSound = v40.impactSound;

    if impactSound ~= "" and impactSound then
        u36:playSound(p37, Character.Position, impactSound);
    end;

    if v39 then
        local v41 = ({ Vector2.new(1, 0.2), Vector2.new(-1, 0.2), Vector2.new(-0.2, 1) })[p38 + 1];
        ScreenShakeUtil.shakeScreenDirection(v41, {
            duration = 0.22,
            cycles = 2,
            magnitude = p38 == 2 and 0.75 or 0.5
        });
        local u42 = u4("DepthOfFieldEffect", {
            Name = "RagebladeDepthOfField",
            InFocusRadius = 20,
            FocusDistance = 0,
            FarIntensity = 0,
            Parent = Lighting
        });
        local u44 = default(0.14, Linear, function(p43) -- Line: 225
            -- upvalues: u42 (copy)
            u42.FarIntensity = (math.sqrt(p43) - p43) / 1.2 * 0.8;
        end);
        task.spawn(function() -- Line: 229
            -- upvalues: u44 (copy), u42 (copy)
            u44:Wait();
            u42:Destroy();
        end);
    end;

    local v45 = Character + Character.LookVector.Unit * 5;
    local u46 = u4("Part", {
        CanCollide = false,
        CanQuery = false,
        Anchored = true,
        Transparency = 1,
        CFrame = v45,
        Parent = Workspace
    });
    local u47 = u4("PointLight", {
        Range = 16.1,
        Brightness = 0,
        Color = Color3.fromRGB(255, 145, 30),
        Parent = u46
    });
    local u49 = default(0.24, Linear, function(p48) -- Line: 251
        -- upvalues: u47 (copy)
        u47.Brightness = (math.sqrt(p48) - p48) / 1.2 * 4 * 8;
    end);
    task.spawn(function() -- Line: 255
        -- upvalues: u49 (copy), u46 (copy)
        u49:Wait();
        u46:Destroy();
    end);
    local u50;

    if p38 < 2 then
        local u51 = ReplicatedStorage.Assets.Effects.JuggernautSwingEffectHorizontal:Clone();
        u50 = u51;
        local u52 = p38 == 0 and 1 or -1;
        u50:PivotTo(v45 * CFrame.Angles(0, u52 * -3.141592653589793 / 4, 0));
        local u53 = { u51.Main.SlashInner, u51.Main.SlashOuter };
        local u54 = 1;
        default(0.22, InOutCubic, function(u55) -- Line: 269
            -- upvalues: u51 (copy), u53 (copy), ModelUtil (ref), u54 (ref), u36 (copy), u52 (copy)
            if not u51.Parent then
                return nil;
            end;

            local function _(p56) -- Line: 274
                -- upvalues: u55 (copy)
                local v57 = math.abs(u55 - 0.5) * 4 - 1;
                p56.Transparency = math.clamp(v57, 0, 1);
            end;

            for i, v in u53 do
                local _ = i - 1;
                local v58 = math.abs(u55 - 0.5) * 4 - 1;
                v.Transparency = math.clamp(v58, 0, 1);
            end;

            local v59 = 1 + u55 * 0.8;
            ModelUtil.scaleModel(u51, v59 / u54);
            u54 = v59;
            local v60 = 0;
            local v61 = { Vector3.new(0, 1.3351768, 0), Vector3.new(0, 1.8849556, 0) };

            for _, v in u53 do
                u36:rotateAround(v, u51.Main.Center.WorldCFrame, u55, v61[v60 + 1] * u52);
                v60 = v60 + 1;
            end;
        end);
    else
        u50 = ReplicatedStorage.Assets.Effects.JuggernautSwingEffectVerticle:Clone();
        u50:PivotTo(v45);
    end;

    u50.Parent = Workspace;
    task.delay(0.22, function() -- Line: 303
        -- upvalues: u50 (ref)
        local v62 = u50;

        if v62 ~= nil then
            v62:Destroy();
        end;
    end);
end;

function u7.rotateAround(p63, p64, p65, p66, p67) -- Line: 310
    -- upvalues: MapUtil (copy)
    local originalEffectRotations = p63.originalEffectRotations;
    local v68 = p65:Inverse();
    local v69 = MapUtil.getOrCreate(originalEffectRotations, p64, v68 * p64.CFrame);
    local v70 = p65 * CFrame.Angles(p67.X * p66, p67.Y * p66, p67.Z * p66) * v69;
    p64.Position = v70.Position;
    local v71 = { v70:ToOrientation() };
    local v72 = math.deg(v71[1]);
    local v73 = math.deg(v71[2]);
    local v74 = math.deg(v71[3]);
    p64.Orientation = Vector3.new(v72, v73, v74);
end;

KnitClient.CreateController(u7.new());

return nil;