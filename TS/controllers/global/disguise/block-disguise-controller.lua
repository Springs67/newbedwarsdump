-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "BlockDisguiseController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 31
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "BlockDisguiseController";
    p7.disguisedPlayerMap = {};
end;

function u5.KnitStart(u8) -- Line: 40
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectType (copy), Players (copy)
    KnitController.KnitStart(u8);
    ClientSyncEvents.StatusEffectAdded:connect(function(p9) -- Line: 42
        -- upvalues: StatusEffectType (ref), Players (ref), u8 (copy)
        if p9.statusEffect ~= StatusEffectType.INVISIBILITY then
            return nil;
        end;

        local v10 = Players:GetPlayerFromCharacter(p9.entityInstance);

        if not v10 then
            return nil;
        end;

        local v11 = u8:getPlayerBlockModel(v10);

        if v11 then
            u8:setTransparencyOfModel(v11, 1);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p12) -- Line: 55
        -- upvalues: StatusEffectType (ref), Players (ref), u8 (copy)
        if p12.statusEffect ~= StatusEffectType.INVISIBILITY then
            return nil;
        end;

        local v13 = Players:GetPlayerFromCharacter(p12.entityInstance);

        if not v13 then
            return nil;
        end;

        local v14 = u8:getPlayerBlockModel(v13);

        if v14 then
            u8:setTransparencyOfModel(v14, 0);

            return;
        end;

        if v13.Character then
            u8:setTransparencyOfModel(v13.Character, 0);
        end;
    end);
end;

function u5.getPlayerBlockModel(p15, p16) -- Line: 71
    -- upvalues: Workspace (copy)
    return Workspace:FindFirstChild("DisguisedPlayerBlock_" .. tostring(p16.UserId));
end;

function u5.anchorBlockModel(p17, p18) -- Line: 74
    -- upvalues: Workspace (copy)
    local v19 = Workspace:FindFirstChild("DisguisedPlayerBlock_" .. tostring(p18.UserId));

    if not v19 then
        return false;
    end;

    local function _(p20) -- Line: 80
        if not p20:IsA("BasePart") then
            p20:IsA("WeldConstraint");

            return;
        end;

        p20.Anchored = true;
        p20.CanCollide = false;
    end;

    for i, descendant in v19:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.Anchored = true;
            descendant.CanCollide = false;
        else
            descendant:IsA("WeldConstraint");
        end;
    end;

    return true;
end;

function u5.disguisePlayerAsBlock(p21, p22, p23) -- Line: 92
    -- upvalues: ReplicatedStorage (copy), ItemUtil (copy), Workspace (copy), CollectionService (copy), scaleModel (copy), BLOCK_SIZE (copy), u2 (copy), u3 (copy), MapUtil (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy)
    local v24 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(p23);
    local v25 = ItemUtil.cloneItemIntoModel(v24);
    local v26 = v25:FindFirstChildWhichIsA("BasePart");
    local Character = p22.Character;
    local v27;

    if Character == nil then
        v27 = Character;
    else
        v27 = Character:FindFirstChildWhichIsA("Humanoid");
    end;

    local v28;

    if Character == nil then
        v28 = Character;
    else
        v28 = Character.PrimaryPart;
    end;

    if not (v26 and (Character and (v27 and v28))) then
        v25:Destroy();

        return nil;
    end;

    v25.Parent = Workspace;
    v25.Name = "DisguisedPlayerBlock_" .. tostring(p22.UserId);

    local function _(p29) -- Line: 114
        if p29:IsA("BasePart") then
            p29.CanCollide = false;
            p29.Anchored = false;
        end;
    end;

    for i, descendant in v25:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            descendant.Anchored = false;
        end;
    end;

    CollectionService:AddTag(v25, "DontBlockSwordRaycast");
    scaleModel(v25, BLOCK_SIZE / 2.8 * 2);
    local v30 = u2.new();
    v30:GiveTask(v25);
    v25:PivotTo(v28.CFrame - Vector3.new(0, v28.Size.Y / 2 + v27.HipHeight - BLOCK_SIZE / 2, 0));
    v30:GiveTask((u3("WeldConstraint", {
        Part0 = v26,
        Part1 = v28,
        Parent = v25
    })));
    local v31 = MapUtil.getOrCreate(p21.disguisedPlayerMap, p22, {
        hiddenPlayerMaid = nil,
        blockMaid = nil,
        heldItemMaid = nil
    });
    local blockMaid = v31.blockMaid;

    if blockMaid ~= nil then
        blockMaid:Destroy();
    end;

    v31.blockMaid = v30;
    v31.blockType = p23;
    local v32 = EntityUtil:getEntity(p22);

    if v32 ~= nil then
        v32 = v32:getInstance();
    end;

    if v32 and StatusEffectUtil:isActive(v32, StatusEffectType.INVISIBILITY) then
        p21:setTransparencyOfModel(v25, 1);
    end;
end;

function u5.undisguisePlayer(p33, p34) -- Line: 158
    -- upvalues: EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy)
    local v35 = p33.disguisedPlayerMap[p34];

    if v35 ~= nil then
        local blockMaid = v35.blockMaid;

        if blockMaid ~= nil then
            blockMaid:Destroy();
        end;
    end;

    p33:unhidePlayer(p34);

    if v35 ~= nil then
        local heldItemMaid = v35.heldItemMaid;

        if heldItemMaid ~= nil then
            heldItemMaid:Destroy();
        end;
    end;

    p33.disguisedPlayerMap[p34] = nil;
    local v36 = EntityUtil:getEntity(p34);

    if v36 ~= nil then
        v36 = v36:getInstance();
    end;

    if v36 and StatusEffectUtil:isActive(v36, StatusEffectType.INVISIBILITY) then
        p33:setTransparencyOfModel(p34.Character, 1);
    end;
end;

function u5.unhidePlayer(p37, p38) -- Line: 189
    local v39 = p37.disguisedPlayerMap[p38];

    if v39 ~= nil then
        local hiddenPlayerMaid = v39.hiddenPlayerMaid;

        if hiddenPlayerMaid ~= nil then
            hiddenPlayerMaid:Destroy();
        end;
    end;
end;

function u5.hidePlayer(p40, p41, p42) -- Line: 201
    -- upvalues: MapUtil (copy), EntityUtil (copy), Players (copy), KnitClient (copy), u2 (copy)
    local v43 = MapUtil.getOrCreate(p40.disguisedPlayerMap, p41, {
        hiddenPlayerMaid = nil,
        blockMaid = nil,
        heldItemMaid = nil
    });
    local hiddenPlayerMaid = v43.hiddenPlayerMaid;

    if hiddenPlayerMaid ~= nil then
        hiddenPlayerMaid:Destroy();
    end;

    local heldItemMaid = v43.heldItemMaid;

    if heldItemMaid ~= nil then
        heldItemMaid:Destroy();
    end;

    local Character = p41.Character;

    if not Character then
        return nil;
    end;

    local u44 = EntityUtil:getEntity(p41);

    if not u44 then
        return nil;
    end;

    if p41.Team ~= Players.LocalPlayer.Team or (p41 == Players.LocalPlayer or p42) then
        u44:hideNametag();
    end;

    local u45 = {
        transparency = 1
    };
    KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(Character):addModifier(u45);

    local function _(p46, p47) -- Line: 230
        if p46:IsA("BasePart") then
            p46.LocalTransparencyModifier = p47;

            return;
        end;

        if p46:IsA("Decal") then
            p46.LocalTransparencyModifier = p47;
        end;
    end;

    local function _(p48) -- Line: 238
        if p48:IsA("BasePart") then
            p48.LocalTransparencyModifier = 1;

            return;
        end;

        if p48:IsA("Decal") then
            p48.LocalTransparencyModifier = 1;
        end;
    end;

    for i, descendant in Character:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.LocalTransparencyModifier = 1;
        elseif descendant:IsA("Decal") then
            descendant.LocalTransparencyModifier = 1;
        end;
    end;

    local u50 = Character.ChildAdded:Connect(function(p49) -- Line: 244
        if p49:IsA("BasePart") then
            p49.LocalTransparencyModifier = 1;

            return;
        end;

        if p49:IsA("Decal") then
            p49.LocalTransparencyModifier = 1;
        end;
    end);
    local v51 = u2.new();
    v51:GiveTask(function() -- Line: 248
        -- upvalues: u50 (copy), Character (copy), KnitClient (ref), u45 (copy), u44 (copy)
        u50:Disconnect();

        local function _(p52) -- Line: 251
            if p52:IsA("BasePart") then
                p52.LocalTransparencyModifier = 0;

                return;
            end;

            if p52:IsA("Decal") then
                p52.LocalTransparencyModifier = 0;
            end;
        end;

        for i, descendant in Character:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.LocalTransparencyModifier = 0;
            elseif descendant:IsA("Decal") then
                descendant.LocalTransparencyModifier = 0;
            end;
        end;

        KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(Character):removeModifier(u45);
        u44:showNametag();
    end);
    local v53;

    if Players.LocalPlayer == p41 then
        KnitClient.Controllers.ViewmodelController:setHeldItem(nil);
        v53 = u2.new();
        v53:GiveTask(function() -- Line: 264
            -- upvalues: EntityUtil (ref), Players (ref), KnitClient (ref)
            local v54 = EntityUtil:getEntity(Players.LocalPlayer);

            if v54 ~= nil then
                v54 = v54:getHandItemInstanceFromCharacter();
            end;

            local ViewmodelController = KnitClient.Controllers.ViewmodelController;

            if v54 ~= nil then
                v54 = v54:Clone();
            end;

            ViewmodelController:setHeldItem(v54);
        end);
    else
        v53 = nil;
    end;

    v43.hiddenPlayerMaid = v51;
    v43.heldItemMaid = v53;
end;

function u5.getDisguisedPlayer(p55, p56) -- Line: 281
    return p55.disguisedPlayerMap[p56];
end;

function u5.getDisguisedPlayers(p57) -- Line: 286
    -- upvalues: u1 (copy)
    return u1.keys(p57.disguisedPlayerMap);
end;

function u5.setTransparencyOfModel(p58, p59, p60) -- Line: 289
    for _, descendant in p59:GetDescendants() do
        if (descendant:IsA("BasePart") or (descendant:IsA("Decal") or descendant:IsA("Texture"))) and descendant.Name ~= "HumanoidRootPart" then
            descendant.Transparency = p60;
        end;
    end;
end;

KnitClient.CreateController(u5.new());

return nil;