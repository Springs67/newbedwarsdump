-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jellyfish", "jellyfish-kit-util");
local EnemyJellyfishColors = v4.EnemyJellyfishColors;
local JellyfishBalance = v4.JellyfishBalance;
local JellyfishParts = v4.JellyfishParts;
local JellyfishPlacement = v4.JellyfishPlacement;
local SelfJellyfishColors = v4.SelfJellyfishColors;
local TeamJellyfishColors = v4.TeamJellyfishColors;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "JellyfishHandItemController";
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
    p7.Name = "JellyfishHandItemController";
    p7.maid = u2.new();
    p7.camera = Workspace.CurrentCamera;
    p7.targetPosition = nil;
    p7.requestPlaceJellyfishRemote = default.Client:Get("RequestPlaceJellyfish");
end;

function u5.KnitStart(u8) -- Line: 47
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), ItemType (copy)
    HandKnitController.KnitStart(u8);
    ClientSyncEvents.PlaceBlock:connect(function(p9) -- Line: 49
        -- upvalues: ItemType (ref), u8 (copy)
        if p9.blockType == ItemType.JELLYFISH_BLOCK_SNAPPING then
            p9:setCancelled(true);
            u8:requestPlaceJellyfish();
        end;
    end);
end;

function u5.enableHandHighlight(u10) -- Line: 56
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), RunService (copy), Players (copy), DeviceUtil (copy), JellyfishBalance (copy)
    local u11 = ReplicatedStorage.Assets.Misc.JellyfishIndicator2:Clone();
    u11.Parent = Workspace;
    u10.maid:GiveTask(u11);

    local function u13() -- Line: 60
        -- upvalues: u11 (copy)
        local function _(p12) -- Line: 62
            if p12:IsA("MeshPart") then
                p12.LocalTransparencyModifier = 1;
            end;
        end;

        for i, child in u11:GetChildren() do
            local _ = i - 1;

            if child:IsA("MeshPart") then
                child.LocalTransparencyModifier = 1;
            end;
        end;
    end;

    local function u15() -- Line: 71
        -- upvalues: u11 (copy)
        local function _(p14) -- Line: 73
            if p14:IsA("MeshPart") then
                p14.LocalTransparencyModifier = 0;
            end;
        end;

        for i, child in u11:GetChildren() do
            local _ = i - 1;

            if child:IsA("MeshPart") then
                child.LocalTransparencyModifier = 0;
            end;
        end;
    end;

    u10.maid:GiveTask(RunService.Heartbeat:Connect(function(p16) -- Line: 82
        -- upvalues: u10 (copy), u11 (copy), Players (ref), DeviceUtil (ref), JellyfishBalance (ref), u13 (copy), u15 (copy)
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

        local v18 = u10:getSnappedPositionAboveBlock(u10.camera.CFrame.Position, v17, JellyfishBalance.DistancePlayerCanPlaceJellyfish * 1.5, Character);

        if v18 ~= nil then
            v18 = v18 + JellyfishBalance.DistanceFromGround;
        end;

        if not v18 then
            u10.targetPosition = nil;
            u13();

            return nil;
        end;

        if (v18 - Character).Magnitude > JellyfishBalance.DistancePlayerCanPlaceJellyfish then
            u10.targetPosition = nil;
            u13();

            return nil;
        end;

        if u10:jellyfishExistsAtLocation(v18) then
            u10.targetPosition = nil;
            u13();

            return nil;
        end;

        u10.targetPosition = v18;
        local v19 = u10:checkIndicatorPosition(v18);
        u10:recolorJellyfishIndicator(u11, v19[1], v19[2]);
        u15();
        local v20 = Vector3.new(u10.camera.CFrame.Position.X, u10.targetPosition.Y, u10.camera.CFrame.Position.Z);
        u11:PivotTo(CFrame.lookAt(u10.targetPosition, v20) * CFrame.Angles(0, 3.141592653589793, 0));
    end));
end;

function u5.jellyfishExistsAtLocation(p21, u22) -- Line: 133
    -- upvalues: CollectionService (copy), Players (copy)
    local function _(p23) -- Line: 135
        -- upvalues: Players (ref)
        return Players.LocalPlayer.UserId == p23:GetAttribute("PlacedByUserId");
    end;

    local v24 = 0;
    local v25 = {};

    for i, v in CollectionService:GetTagged("jellyfish") do
        local _ = i - 1;

        if Players.LocalPlayer.UserId == v:GetAttribute("PlacedByUserId") == true then
            v24 = v24 + 1;
            v25[v24] = v;
        end;
    end;

    local function _(p26) -- Line: 149
        -- upvalues: u22 (copy)
        return p26:GetAttribute("CenteredPosition") == u22;
    end;

    for i, v in v25 do
        local _ = i - 1;

        if v:GetAttribute("CenteredPosition") == u22 == true then
            return v;
        end;
    end;

    return nil;
end;

function u5.checkIndicatorPosition(p27, u28) -- Line: 163
    -- upvalues: CollectionService (copy), Players (copy), JellyfishBalance (copy), JellyfishPlacement (copy)
    local function _(p29) -- Line: 165
        -- upvalues: Players (ref)
        return Players.LocalPlayer.UserId == p29:GetAttribute("PlacedByUserId");
    end;

    local v30 = 0;
    local v31 = {};

    for i, v in CollectionService:GetTagged("jellyfish") do
        local _ = i - 1;

        if Players.LocalPlayer.UserId == v:GetAttribute("PlacedByUserId") == true then
            v30 = v30 + 1;
            v31[v30] = v;
        end;
    end;

    local function _(p32) -- Line: 179
        -- upvalues: u28 (copy), JellyfishBalance (ref)
        return (p32:GetAttribute("CenteredPosition") - u28).Magnitude < JellyfishBalance.JellyfishMinDistance;
    end;

    local v33 = nil;

    for i, v in v31 do
        local _ = i - 1;

        if (v:GetAttribute("CenteredPosition") - u28).Magnitude < JellyfishBalance.JellyfishMinDistance == true then
            v33 = v;
            break;
        end;
    end;

    local v34 = v33 == nil and not JellyfishPlacement.jellyfishHasBlockOverlap(u28);

    local function _(p35) -- Line: 198
        -- upvalues: u28 (copy), JellyfishBalance (ref)
        return (p35:GetAttribute("CenteredPosition") - u28).Magnitude < JellyfishBalance.MaxReplicationRadius;
    end;

    local v36 = nil;

    for i, v in v31 do
        local _ = i - 1;

        if (v:GetAttribute("CenteredPosition") - u28).Magnitude < JellyfishBalance.MaxReplicationRadius == true then
            v36 = v;
            break;
        end;
    end;

    return { v34, v36 ~= nil };
end;

function u5.recolorJellyfishIndicator(p37, p38, p39, p40) -- Line: 215
    -- upvalues: SelfJellyfishColors (copy), TeamJellyfishColors (copy), EnemyJellyfishColors (copy), u1 (copy), JellyfishParts (copy)
    local u41;

    if p39 and p40 then
        u41 = SelfJellyfishColors;
    elseif p40 or not p39 then
        u41 = EnemyJellyfishColors;
    else
        u41 = TeamJellyfishColors;
    end;

    local u42 = u1.keys(JellyfishParts);

    local function _(p43) -- Line: 219
        -- upvalues: u42 (copy), u41 (copy)
        local v44 = p43:IsA("MeshPart") and table.find(u42, p43.Name) ~= nil;

        if v44 then
            p43.Color = u41[p43.Name];
        end;
    end;

    for i, descendant in p38:GetDescendants() do
        local _ = i - 1;
        local v45 = descendant:IsA("MeshPart") and table.find(u42, descendant.Name) ~= nil;

        if v45 then
            descendant.Color = u41[descendant.Name];
        end;
    end;
end;

function u5.getSnappedPositionAboveBlock(p46, p47, p48, p49, p50) -- Line: 233
    -- upvalues: CollectionService (copy), BlockEngine (copy), JellyfishBalance (copy)
    local v51 = RaycastParams.new();
    v51.FilterType = Enum.RaycastFilterType.Include;
    v51.FilterDescendantsInstances = CollectionService:GetTagged("block");
    local v52 = BlockEngine:serverRaycast(p47, p48 * p49, v51);

    if not v52 then
        return nil;
    end;

    if (p50 - v52.Position).Magnitude > JellyfishBalance.DistancePlayerCanPlaceJellyfish then
        return nil;
    end;

    return BlockEngine:getWorldPosition(BlockEngine:snapPosition(BlockEngine:getBlockPosition(v52.Position)));
end;

function u5.requestPlaceJellyfish(p53) -- Line: 253
    -- upvalues: Players (copy), JellyfishBalance (copy)
    if p53.targetPosition == nil then
        return nil;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPivot().Position;
    end;

    if not Character then
        return nil;
    end;

    if (p53.targetPosition - Character).Magnitude > JellyfishBalance.DistancePlayerCanPlaceJellyfish then
        return false;
    end;

    p53.requestPlaceJellyfishRemote:CallServer(p53.targetPosition);
end;

function u5.onEnable(p54, p55, p56) -- Line: 270
    p54:enableHandHighlight();
end;

function u5.onDisable(p57) -- Line: 273
    p57.maid:DoCleaning();
end;

function u5.isRelevantItem(p58, p59) -- Line: 276
    -- upvalues: ItemType (copy)
    return p59.itemType == ItemType.JELLYFISH;
end;

KnitClient.CreateController(u5.new());

return nil;