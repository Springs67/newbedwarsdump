-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-gardener", "spirit-gardener-balance");
local SpiritGardenerKitBalance = v4.SpiritGardenerKitBalance;
local SpiritGardenerUtil = v4.SpiritGardenerUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "SpiritGardenerSeedHandController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 35
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 39
    -- upvalues: HandKnitController (copy), u2 (copy), Workspace (copy), default (copy)
    HandKnitController.constructor(p7);
    p7.Name = "SpiritGardenerSeedHandController";
    p7.maid = u2.new();
    p7.camera = Workspace.CurrentCamera;
    p7.targetPosition = nil;
    p7.requestPlaceSpiritGardenerFlowerRemote = default.Client:Get("RequestPlaceSpiritGardenerFlower");
end;

function u5.KnitStart(u8) -- Line: 47
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), ItemType (copy)
    HandKnitController.KnitStart(u8);
    ClientSyncEvents.PlaceBlock:connect(function(p9) -- Line: 49
        -- upvalues: ItemType (ref), u8 (copy)
        if p9.blockType == ItemType.SOULVINE_FLOWER or (p9.blockType == ItemType.TEARBLOOM_FLOWER or p9.blockType == ItemType.CRYSTALHEART_FLOWER) then
            p9:setCancelled(true);
            u8:requestFlowerPlacement();
        end;
    end);
end;

function u5.enableHandHighlight(u10) -- Line: 56
    -- upvalues: ReplicatedStorage (copy), ItemType (copy), Workspace (copy), RunService (copy), Players (copy), DeviceUtil (copy), SpiritGardenerKitBalance (copy), BlockEngine (copy)
    if not u10.currentItemType then
        return nil;
    end;

    local u11 = ReplicatedStorage.Assets.Misc.SoulvineFlowerIndicator:Clone();
    local currentItemType = u10.currentItemType;

    if currentItemType == ItemType.SOULVINE_SEED then
        u11 = ReplicatedStorage.Assets.Misc.SoulvineFlowerIndicator:Clone();
    elseif currentItemType == ItemType.TEARBLOOM_SEED then
        u11 = ReplicatedStorage.Assets.Misc.TearbloomFlowerIndicator:Clone();
    elseif currentItemType == ItemType.CRYSTALHEART_SEED then
        u11 = ReplicatedStorage.Assets.Misc.CrystalheartFlowerIndicator:Clone();
    end;

    u11.Parent = Workspace;
    u10.maid:GiveTask(u11);

    local function u13() -- Line: 79
        -- upvalues: u11 (ref)
        local function _(p12) -- Line: 81
            if p12:IsA("MeshPart") then
                p12.LocalTransparencyModifier = 1;
            end;

            if p12:IsA("Beam") then
                p12.Enabled = false;
            end;
        end;

        for i, descendant in u11:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("MeshPart") then
                descendant.LocalTransparencyModifier = 1;
            end;

            if descendant:IsA("Beam") then
                descendant.Enabled = false;
            end;
        end;
    end;

    local function u15() -- Line: 93
        -- upvalues: u11 (ref)
        local function _(p14) -- Line: 95
            if p14:IsA("MeshPart") then
                p14.LocalTransparencyModifier = 0;
            end;

            if p14:IsA("Beam") then
                p14.Enabled = true;
            end;
        end;

        for i, descendant in u11:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("MeshPart") then
                descendant.LocalTransparencyModifier = 0;
            end;

            if descendant:IsA("Beam") then
                descendant.Enabled = true;
            end;
        end;
    end;

    u10.maid:GiveTask(RunService.Heartbeat:Connect(function(p16) -- Line: 107
        -- upvalues: u10 (copy), u11 (ref), Players (ref), DeviceUtil (ref), SpiritGardenerKitBalance (ref), u13 (copy), BlockEngine (ref), u15 (copy)
        if not (u10:isEnabled() and u10.camera) then
            u11:Destroy();
            u10.maid:DoCleaning();

            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if not Character then
            return nil;
        end;

        local UnitRay = Players.LocalPlayer:GetMouse().UnitRay;
        local v17;

        if DeviceUtil.isMobileControls() then
            v17 = u10.camera.CFrame.LookVector.Unit;
        else
            v17 = UnitRay.Direction;
        end;

        local v18 = u10:getSnappedPosition(u10.camera.CFrame.Position, v17, SpiritGardenerKitBalance.DISTANCE_CAN_PLACE_FLOWERS * 1.5, Character);

        if not v18 then
            u10.targetPosition = nil;
            u13();

            return nil;
        end;

        if (v18 - Character).Magnitude > SpiritGardenerKitBalance.DISTANCE_CAN_PLACE_FLOWERS then
            u10.targetPosition = nil;
            u13();

            return nil;
        end;

        if u10:checkIsInvalidPlacement(BlockEngine:getBlockPosition(v18)) then
            u10.targetPosition = nil;
            u13();

            return nil;
        end;

        u10.targetPosition = v18;
        u10:recolorIndicator(u11);
        u15();
        u11:PivotTo(CFrame.new(u10.targetPosition));
    end));
end;

function u5.recolorIndicator(p19, p20) -- Line: 146
end;

function u5.checkIsInvalidPlacement(p21, p22) -- Line: 148
    -- upvalues: KnitClient (copy), BlockEngine (copy), ItemType (copy)
    if not p22 then
        return true;
    end;

    if KnitClient.Controllers.MapController:isInDenyRegion(p22) then
        return true;
    end;

    if BlockEngine:getStore():getBlockAt(p22) then
        return true;
    end;

    local v23 = BlockEngine:getStore():getBlockAt(p22 - Vector3.new(0, 1, 0));

    if not v23 then
        return true;
    end;

    local v24 = BlockEngine:getHandlerRegistry():getHandler(v23.Name);

    if v24 ~= nil then
        v24 = v24:getBlockMeta();
    end;

    if v24 ~= nil then
        v24 = v24.denyPlaceOn;
    end;

    return v24 and true or v23.Name == ItemType.BED;
end;

function u5.getSnappedPosition(p25, p26, p27, p28, p29) -- Line: 189
    -- upvalues: CollectionService (copy), BlockEngine (copy), SpiritGardenerKitBalance (copy)
    local v30 = RaycastParams.new();
    v30.FilterType = Enum.RaycastFilterType.Include;
    v30.FilterDescendantsInstances = CollectionService:GetTagged("block");
    local v31 = BlockEngine:serverRaycast(p26, p27 * p28, v30);

    if not v31 then
        return nil;
    end;

    if (p29 - v31.Position).Magnitude > SpiritGardenerKitBalance.DISTANCE_CAN_PLACE_FLOWERS then
        return nil;
    end;

    return BlockEngine:getWorldPosition(BlockEngine:snapPosition(BlockEngine:getBlockPosition(v31.Position)));
end;

function u5.requestFlowerPlacement(p32) -- Line: 209
    -- upvalues: Players (copy), SpiritGardenerKitBalance (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SpiritGardenerUtil (copy), SoundManager (copy)
    if p32.targetPosition == nil then
        return nil;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPivot().Position;
    end;

    if not Character then
        return nil;
    end;

    if (p32.targetPosition - Character).Magnitude > SpiritGardenerKitBalance.DISTANCE_CAN_PLACE_FLOWERS then
        return false;
    end;

    if p32.requestPlaceSpiritGardenerFlowerRemote:CallServer(p32.targetPosition, p32.currentItemType) then
        local v33 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.PLACE_BLOCK), {
            looped = false
        });

        if v33 ~= nil then
            v33:Play();
        end;

        SoundManager:playSound(SpiritGardenerUtil.CROP_PLANT_SOUNDS[math.random(0, #SpiritGardenerUtil.CROP_PLANT_SOUNDS - 1) + 1], {
            position = p32.targetPosition
        });
    end;
end;

function u5.onEnable(p34, p35, p36) -- Line: 238
    p34.currentItemType = p35.itemType;
    p34:enableHandHighlight();
end;

function u5.onDisable(p37) -- Line: 242
    p37.maid:DoCleaning();
end;

function u5.isRelevantItem(p38, p39) -- Line: 245
    -- upvalues: ItemType (copy)
    return p39.itemType == ItemType.SOULVINE_SEED or (p39.itemType == ItemType.TEARBLOOM_SEED or p39.itemType == ItemType.CRYSTALHEART_SEED);
end;

KnitClient.CreateController(u5.new());

return nil;