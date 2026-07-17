-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ExpireList = v1.ExpireList;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "BattleRotaleGhostController";
    end,

    __index = GameKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 33
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 37
    -- upvalues: GameKnitController (copy), GameType (copy), Workspace (copy), ExpireList (copy)
    GameKnitController.constructor(p5, { GameType.BATTLE_ROYALE });
    p5.Name = "BattleRotaleGhostController";
    p5.camera = Workspace.CurrentCamera;
    p5.isGhost = false;
    p5.ghostMap = {};
    p5.cooldownList = ExpireList.new(1);
end;

function u3.KnitStart(u6) -- Line: 45
    -- upvalues: GameKnitController (copy), default (copy), Players (copy), KnitClient (copy), ClientSyncEvents (copy), RuntimeLib (copy), PlayerEntity (copy), WatchCollectionTag (copy), GameQueryUtil (copy), EntityUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    GameKnitController.KnitStart(u6);
    default.Client:Get("BeconeGhost"):Connect(function(p7) -- Line: 47
        -- upvalues: u6 (copy)
        u6.isGhost = true;
        u6:becomesGhost(p7.ghostModel);
        u6:showOtherGhost();
    end);
    default.Client:Get("ReviveEffect"):Connect(function(p8) -- Line: 52
        -- upvalues: Players (ref), u6 (copy), KnitClient (ref)
        if p8.player == Players.LocalPlayer then
            u6.isGhost = false;
            u6:disableFirstPersonController();
            KnitClient.Controllers.RoyaleBedController:enableAllPrompts();
            u6:hideOtherGhost();
        end;

        u6:reviveEffect(p8.position);
    end);
    ClientSyncEvents.ProjectileHit:connect(function(p9) -- Line: 61
        -- upvalues: RuntimeLib (ref), PlayerEntity (ref)
        if p9:isCancelled() then
            return nil;
        end;

        if RuntimeLib.instanceof(p9.hitEntity, PlayerEntity) then
            local Character = p9.hitEntity:getPlayer().Character;

            if Character ~= nil then
                Character = Character:GetAttribute("GhostForm");
            end;

            if Character ~= 0 and (Character == Character and (Character ~= "" and Character)) then
                p9:setCancelled(true);

                return nil;
            end;
        end;
    end);
    WatchCollectionTag("ghost-player", function(u10) -- Line: 77
        -- upvalues: Players (ref), u6 (copy), GameQueryUtil (ref), EntityUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local u11 = Players:GetPlayerByUserId(u10:GetAttribute("PlayerID"));

        if u11 then
            u6.ghostMap[u11] = u10;
        end;

        local function _(p12) -- Line: 86
            -- upvalues: GameQueryUtil (ref), u10 (copy)
            if p12:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(u10, true);
            end;
        end;

        for i, descendant in u10:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(u10, true);
            end;
        end;

        local Head = u10:WaitForChild("Head", 2);

        if Head ~= nil then
            local Nametag = Head:WaitForChild("Nametag", 2);

            if Nametag ~= nil then
                local EntityStateInfo = Nametag:WaitForChild("EntityStateInfo");

                if EntityStateInfo ~= nil then
                    EntityStateInfo:Destroy();
                end;
            end;
        end;

        task.delay(1, function() -- Line: 104
            -- upvalues: u10 (copy), u11 (copy), Players (ref), u6 (ref), EntityUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
            local function _(p13) -- Line: 106
                if p13:IsA("MeshPart") then
                    p13:SetAttribute("OriginalTrans", p13.Transparency);
                end;
            end;

            for i, descendant in u10:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("MeshPart") then
                    descendant:SetAttribute("OriginalTrans", descendant.Transparency);
                end;
            end;

            if u11 and (u11.Team ~= Players.LocalPlayer.Team and not u6.isGhost) then
                local v14 = EntityUtil:getEntity(u11);

                if v14 then
                    v14:hideNametag();
                end;

                local function _(p15) -- Line: 120
                    if p15:IsA("MeshPart") or p15:IsA("Part") then
                        p15.Transparency = 1;
                    end;
                end;

                for i, descendant in u10:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("MeshPart") or descendant:IsA("Part") then
                        descendant.Transparency = 1;
                    end;
                end;
            end;

            if u11 == Players.LocalPlayer then
                u6:enableFirstPersonController(u10);
            end;

            GameAnimationUtil:playAnimation(u10, AnimationType.GHOST_IDLE);
        end);
    end);
end;

function u3.becomesGhost(p16, p17) -- Line: 136
    -- upvalues: Workspace (copy)
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera and p17.PrimaryPart then
        CurrentCamera.CameraSubject = p17.PrimaryPart;
    end;
end;

function u3.enableFirstPersonController(u18, u19) -- Line: 142
    -- upvalues: RunService (copy), Workspace (copy)
    local function _(p20) -- Line: 144
        return p20:IsA("MeshPart");
    end;

    local v21 = 0;
    local u22 = {};

    for i, descendant in u19:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("MeshPart") == true then
            v21 = v21 + 1;
            u22[v21] = descendant;
        end;
    end;

    local function _(p23) -- Line: 159
        if p23:IsA("MeshPart") then
            p23:SetAttribute("OriginalTransparency", p23.Transparency);
        end;
    end;

    for i, descendant in u19:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("MeshPart") then
            descendant:SetAttribute("OriginalTransparency", descendant.Transparency);
        end;
    end;

    u18.FirstPersonController = RunService.Heartbeat:Connect(function() -- Line: 167
        -- upvalues: u18 (copy), u19 (copy), u22 (copy), Workspace (ref)
        local camera = u18.camera;

        if camera ~= nil then
            camera = (camera.Focus.Position - u18.camera.CFrame.Position).Magnitude;
        end;

        if camera == 0 or (camera ~= camera or (not camera or (not u19 or (not u22 or u19.Parent ~= Workspace)))) then
            u18:disableFirstPersonController();

            return nil;
        end;

        if camera >= 0.6 then
            u19:SetAttribute("FirstPerson", false);

            local function _(p24) -- Line: 195
                if p24:IsA("MeshPart") or p24:IsA("Decal") then
                    p24.Transparency = p24:GetAttribute("OriginalTransparency");
                end;
            end;

            for i, v in u22 do
                local _ = i - 1;

                if v:IsA("MeshPart") or v:IsA("Decal") then
                    v.Transparency = v:GetAttribute("OriginalTransparency");
                end;
            end;

            return;
        end;

        print(62);

        local function _(p25) -- Line: 181
            if p25:IsA("MeshPart") then
                p25.Transparency = 1;
            end;
        end;

        for i, v in u22 do
            local _ = i - 1;

            if v:IsA("MeshPart") then
                v.Transparency = 1;
            end;
        end;

        u19:SetAttribute("FirstPerson", true);
        local v26 = CFrame.new(u19.PrimaryPart.Position);
        u19.PrimaryPart.CFrame = v26 * u18.camera.CFrame.Rotation;
    end);
end;

function u3.disableFirstPersonController(p27) -- Line: 206
    local FirstPersonController = p27.FirstPersonController;

    if FirstPersonController ~= nil then
        FirstPersonController:Disconnect();
    end;
end;

function u3.hideOtherGhost(p28) -- Line: 212
    -- upvalues: Players (copy), EntityUtil (copy)
    local ghostMap = p28.ghostMap;

    local function v33(p29, p30) -- Line: 214
        -- upvalues: Players (ref), EntityUtil (ref)
        if p30.Team == Players.LocalPlayer.Team then
            return nil;
        end;

        local v31 = EntityUtil:getEntity(p30);

        if v31 then
            v31:hideNametag();
        end;

        local function _(p32) -- Line: 223
            if p32:IsA("MeshPart") or p32:IsA("Part") then
                p32.Transparency = 1;
            end;
        end;

        for i, descendant in p29:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("MeshPart") or descendant:IsA("Part") then
                descendant.Transparency = 1;
            end;
        end;
    end;

    for i, v in ghostMap do
        v33(v, i, ghostMap);
    end;
end;

function u3.showOtherGhost(p34) -- Line: 236
    -- upvalues: Players (copy)
    local ghostMap = p34.ghostMap;

    local function v38(p35, u36) -- Line: 238
        -- upvalues: Players (ref)
        local function _(p37) -- Line: 240
            -- upvalues: u36 (copy), Players (ref)
            if u36.Team == Players.LocalPlayer.Team then
                return nil;
            end;

            if p37:IsA("MeshPart") then
                p37.Transparency = p37:GetAttribute("OriginalTrans");
            end;
        end;

        for i, descendant in p35:GetDescendants() do
            local _ = i - 1;

            if u36.Team ~= Players.LocalPlayer.Team then
                if descendant:IsA("MeshPart") then
                    descendant.Transparency = descendant:GetAttribute("OriginalTrans");
                end;
            end;
        end;
    end;

    for i, v in ghostMap do
        v38(v, i, ghostMap);
    end;
end;

function u3.reviveEffect(p39, p40) -- Line: 257
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy)
    if p39.cooldownList:has(p40) then
        return nil;
    end;

    p39.cooldownList:add(p40);
    local u41 = ReplicatedStorage.Assets.Effects.BedReviveEffect:Clone();
    u41:PivotTo(CFrame.new(p40));
    u41.Parent = Workspace;

    local function _(p42) -- Line: 267
        if p42:IsA("ParticleEmitter") then
            p42:Emit(1);
        end;
    end;

    for i, descendant in u41:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(1);
        end;
    end;

    SoundManager:playSound(GameSound.LANI_ASCEND, {
        rollOffMaxDistance = 60,
        position = p40
    });
    task.delay(1, function() -- Line: 279
        -- upvalues: u41 (copy)
        u41:Destroy();
    end);
end;

function u3.isLocalGhost(p43) -- Line: 283
    return p43.isGhost;
end;

KnitClient.CreateController(u3.new());

return nil;