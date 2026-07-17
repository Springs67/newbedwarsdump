-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "InvisibilityPotionController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, ...) -- Line: 37
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7, ...);
    p7.Name = "InvisibilityPotionController";
    p7.playerJumpDustMap = {};
    p7.playerJumpMaidMap = {};
    p7.invisibilityMaids = {};
end;

function u5.KnitStart(u8) -- Line: 44
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), CollectionService (copy), ClientSyncEvents (copy), StatusEffectType (copy), Players (copy), KnitClient (copy), BedwarsKit (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), WeldUtil (copy), u2 (copy), default (copy)
    KnitController.KnitStart(u8);
    WatchCollectionTag("entity", function(u9) -- Line: 46
        -- upvalues: u8 (copy)
        local function _() -- Line: 48
            -- upvalues: u8 (ref), u9 (copy)
            u8:removeInvisibility(u9);
            local v10 = u9:GetAttribute("Transparency");

            if v10 ~= nil and v10 > 0 then
                u8.invisibilityMaids[u9] = u8:setTransparencyOfCharacter(u9, v10);
            end;
        end;

        u9:GetAttributeChangedSignal("Transparency"):Connect(function() -- Line: 57
            -- upvalues: u8 (ref), u9 (copy)
            u8:removeInvisibility(u9);
            local v11 = u9:GetAttribute("Transparency");

            if v11 ~= nil and v11 > 0 then
                u8.invisibilityMaids[u9] = u8:setTransparencyOfCharacter(u9, v11);
            end;
        end);
        u8:removeInvisibility(u9);
        local v12 = u9:GetAttribute("Transparency");

        if v12 ~= nil and v12 > 0 then
            u8.invisibilityMaids[u9] = u8:setTransparencyOfCharacter(u9, v12);
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("entity"):Connect(function(p13) -- Line: 62
        -- upvalues: u8 (copy)
        u8:removeInvisibility(p13);
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p14) -- Line: 67
        -- upvalues: StatusEffectType (ref), Players (ref), KnitClient (ref), BedwarsKit (ref), u8 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), WeldUtil (ref), u2 (ref), default (ref)
        if p14.statusEffect ~= StatusEffectType.INVISIBILITY then
            return nil;
        end;

        local u15 = Players:GetPlayerFromCharacter(p14.entityInstance);

        if not u15 then
            return nil;
        end;

        local Character = u15.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if not Character then
            return nil;
        end;

        if KnitClient.Controllers.KitController:isUsingKit(u15, BedwarsKit.SMOKE) then
            u8:playSmokePuff(p14.entityInstance);
        else
            local v16 = ReplicatedStorage.Assets.Effects.MimicBlockEffect:Clone();
            v16.Parent = Workspace;
            v16.Position = Character;
            EffectUtil:playEffects({ v16 }, nil, {
                destroyAfterSec = 1
            });
            SoundManager:playSound(GameSound.BLOCK_DISGUISE, {
                volumeMultiplier = 0.5,
                position = Character
            });
        end;

        SoundManager:playSound(GameSound.SMOKE_GRENADE_POP, {
            position = Character
        });
        local Character2 = u15.Character;

        if not Character2 then
            return nil;
        end;

        local v17 = ReplicatedStorage.Assets.Effects.JumpDust:Clone();
        v17.Parent = Workspace;
        v17.CFrame = Character2.RightFoot.CFrame;
        v17:FindFirstChild("MeshPart").Orientation = Vector3.new(0, 0, -90);
        WeldUtil:weldParts(v17, Character2.HumanoidRootPart);
        u8.playerJumpDustMap[u15] = v17;

        if u15 == Players.LocalPlayer then
            local v18 = u2.new();
            u8.playerJumpMaidMap[u15] = v18;
            v18:GiveTask(p14.entityInstance.Humanoid.StateChanged:Connect(function(p19, p20) -- Line: 115
                -- upvalues: default (ref), Players (ref)
                if p20 == Enum.HumanoidStateType.Jumping then
                    default.Client:Get("InvisiblePotionJumpStarted"):SendToServer({
                        player = Players.LocalPlayer
                    });
                end;
            end));
        end;

        local BlockKickerBlocks = Workspace:FindFirstChild("BlockKickerBlocks");

        if BlockKickerBlocks ~= nil then
            local v21 = BlockKickerBlocks:GetDescendants();

            local function v24(p22) -- Line: 127
                -- upvalues: u15 (copy)
                if p22:GetAttribute("BlockOwner") == u15.UserId and p22:IsA("BasePart") then
                    p22.Transparency = 1;

                    local function _(p23) -- Line: 131
                        if p23:IsA("Texture") then
                            p23.Transparency = 1;
                        end;
                    end;

                    for i, descendant in p22:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("Texture") then
                            descendant.Transparency = 1;
                        end;
                    end;
                end;
            end;

            for i, v in v21 do
                v24(v, i - 1, v21);
            end;
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p25) -- Line: 146
        -- upvalues: StatusEffectType (ref), Players (ref), KnitClient (ref), BedwarsKit (ref), u8 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
        if p25.statusEffect ~= StatusEffectType.INVISIBILITY then
            return nil;
        end;

        local u26 = Players:GetPlayerFromCharacter(p25.entityInstance);

        if not u26 then
            return nil;
        end;

        local Character = u26.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if not Character then
            return nil;
        end;

        if KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.SMOKE) then
            u8:playSmokePuff(p25.entityInstance);
        else
            local v27 = ReplicatedStorage.Assets.Effects.MimicBlockEffect:Clone();
            v27.Parent = Workspace;
            v27.Position = Character;
            EffectUtil:playEffects({ v27 }, nil, {
                destroyAfterSec = 1
            });
            SoundManager:playSound(GameSound.BLOCK_DISGUISE, {
                volumeMultiplier = 0.5,
                position = Character
            });
        end;

        local v28 = u8.playerJumpDustMap[u26];

        if v28 ~= nil then
            v28:Destroy();
        end;

        local v29 = u8.playerJumpMaidMap[u26];

        if v29 ~= nil then
            v29:DoCleaning();
        end;

        local BlockKickerBlocks = Workspace:FindFirstChild("BlockKickerBlocks");

        if BlockKickerBlocks ~= nil then
            local v30 = BlockKickerBlocks:GetDescendants();

            local function v33(p31) -- Line: 188
                -- upvalues: u26 (copy)
                if p31:GetAttribute("BlockOwner") == u26.UserId and p31:IsA("BasePart") then
                    p31.Transparency = 0;

                    local function _(p32) -- Line: 192
                        if p32:IsA("Texture") then
                            p32.Transparency = 0;
                        end;
                    end;

                    for i, descendant in p31:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("Texture") then
                            descendant.Transparency = 0;
                        end;
                    end;
                end;
            end;

            for i, v in v30 do
                v33(v, i - 1, v30);
            end;
        end;
    end);
    default.Client:OnEvent("InvisiblePotionJumpServerValidation", function(p34) -- Line: 207
        -- upvalues: u8 (copy)
        u8:playJumpParticle(p34.player);
    end);
end;

function u5.playJumpParticle(p35, p36) -- Line: 211
    local v37 = p35.playerJumpDustMap[p36];

    if v37 == nil then
        return nil;
    end;

    for _, descendant in v37:GetDescendants() do
        if descendant:IsA("ParticleEmitter") then
            descendant.Enabled = true;
            task.delay(0.03, function() -- Line: 221
                -- upvalues: descendant (copy)
                descendant.Enabled = false;
            end);
        end;
    end;
end;

function u5.removeInvisibility(p38, p39) -- Line: 227
    local v40 = p38.invisibilityMaids[p39];

    if v40 ~= nil then
        v40:DoCleaning();
    end;

    p38.invisibilityMaids[p39] = nil;
end;

function u5.setTransparencyOfCharacter(p41, u42, u43) -- Line: 238
    -- upvalues: u2 (copy), KnitClient (copy)
    local v44 = u2.new();
    local u45 = {};
    local u46 = {};

    local function setTransparencyOfInstance(p47) -- Line: 242
        -- upvalues: u42 (copy), u45 (copy), u43 (copy), u46 (copy)
        if not p47:IsA("BasePart") and (not p47:IsA("Decal") or p47:IsA("Texture")) or p47 == u42.PrimaryPart then
            if p47:IsA("Beam") or (p47:IsA("ParticleEmitter") or p47:IsA("Trail")) then
                u46[p47] = {
                    effectTransparency = p47.Transparency,
                    enabled = p47.Enabled
                };
                p47.Enabled = false;
                p47.Transparency = NumberSequence.new(1);
            end;

            return;
        end;

        u45[p47] = p47.Transparency;
        p47.Transparency = u43;
    end;

    for _, descendant in u42:GetDescendants() do
        setTransparencyOfInstance(descendant);
    end;

    v44:GiveTask(u42.DescendantAdded:Connect(function(p48) -- Line: 262
        -- upvalues: setTransparencyOfInstance (copy)
        setTransparencyOfInstance(p48);
    end));
    v44:GiveTask(function() -- Line: 265
        -- upvalues: u45 (copy), u46 (copy), KnitClient (ref)
        for i, v in u45 do
            i.Transparency = v;
        end;

        for i, v in u46 do
            if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() ~= 0 or not i:HasTag("FirstPersonHidden") then
                i.Enabled = v.enabled;
                i.Transparency = v.effectTransparency;
            end;
        end;
    end);

    return v44;
end;

function u5.playSmokePuff(p49, p50) -- Line: 280
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), u3 (copy), GameQueryUtil (copy), EffectUtil (copy)
    local v51 = ReplicatedStorage.Assets.Effects.SmokePuff:Clone();
    local v52 = {};
    local PrimaryPart = p50.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame;
    end;

    v52.CFrame = PrimaryPart;
    v52.Anchored = true;
    v52.CanQuery = false;
    v52.CanCollide = false;
    v52.Transparency = 1;
    v52.Parent = Workspace;
    local u53 = u3("Part", v52);
    GameQueryUtil:setQueryIgnored(u53, true);
    v51.Parent = u53;
    EffectUtil:playEffects({ v51 }, p50);
    task.delay(5, function() -- Line: 298
        -- upvalues: u53 (copy)
        u53:Destroy();
    end);
end;

KnitClient.CreateController(u5.new());

return nil;