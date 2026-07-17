-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PirateFlagStash = RuntimeLib.import(script, script.Parent, "ui", "pirate-flag-stash").PirateFlagStash;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "PirateFlagController";
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
    p6.Name = "PirateFlagController";
    p6.ownedFlags = {};
    p6.flagCollectedMap = {};
    p6.flagToTree = {};
end;

function u4.KnitStart(u7) -- Line: 45
    -- upvalues: KnitController (copy), RuntimeLib (copy), default (copy), Flamework (copy), BlockEngine (copy), Players (copy), BalanceFile (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u7);
    RuntimeLib.Promise.defer(function() -- Line: 47
        -- upvalues: RuntimeLib (ref), u7 (copy)
        while true do
            local v8 = task.wait(3);

            if v8 == 0 or (v8 ~= v8 or not v8) then
                break;
            end;

            RuntimeLib.Promise.defer(function() -- Line: 53
                -- upvalues: u7 (ref)
                u7:checkForPickUp();
            end);
        end;
    end);
    default.Client:Get("PirateFlagPlaced"):Connect(function(u9) -- Line: 58
        -- upvalues: Flamework (ref), BlockEngine (ref), Players (ref), u7 (copy), BalanceFile (ref), SoundManager (ref), GameSound (ref)
        if not u9.flagPosition then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                message = "There is another pirate flag nearby!"
            });

            return nil;
        end;

        local u10 = nil;
        local v11 = BlockEngine:getWorldPosition(u9.flagPosition);
        local v12 = BlockEngine:getStore():getBlockAt(u9.flagPosition);

        if u9.placer == Players.LocalPlayer then
            if v12 then
                u10 = u7:createBuffCircleIndicator(v12:GetPivot().Position, BalanceFile.PIRATE_FLAG_RANGE, {
                    fadeOutAfterSec = 1.25,
                    parent = v12
                });
            end;

            table.insert(u7.ownedFlags, v11);
        end;

        local u13 = nil;

        if v12 ~= nil then
            v12 = v12.Destroying:Connect(function() -- Line: 84
                -- upvalues: u10 (ref), u9 (copy), u7 (ref), u13 (ref)
                local v14 = u10;

                if v14 ~= nil then
                    v14:Destroy();
                end;

                if u9.flagPosition then
                    u7.flagCollectedMap[u9.flagPosition] = nil;
                    u7.flagToTree[u9.flagPosition] = nil;
                end;

                local v15 = u13;

                if v15 ~= nil then
                    v15:Disconnect();
                end;
            end);
        end;

        local FLAG_DROP = GameSound.FLAG_DROP;
        local v16 = {};
        local v17;

        if u9.placer == Players.LocalPlayer then
            v17 = nil;
        else
            v17 = u9.flagPosition;
        end;

        v16.position = v17;
        SoundManager:playSound(FLAG_DROP, v16);
    end);
end;

function u4.checkForPickUp(p18) -- Line: 109
    -- upvalues: BlockEngine (copy), CollectionService (copy), BalanceFile (copy), Workspace (copy), getItemMeta (copy), InventoryUtil (copy), Players (copy), default (copy), MapUtil (copy)
    local v19 = false;
    local v20 = 0;
    local u21, v22;

    while true do
        if v19 then
            v20 = v20 + 1;
        else
            v19 = true;
        end;

        if v20 >= #p18.ownedFlags then
            return;
        end;

        u21 = p18.ownedFlags[v20 + 1];
        v22 = BlockEngine:getBlockPosition(u21);

        if BlockEngine:getStore():getBlockAt(v22) then
            break;
        end;

        table.remove(p18.ownedFlags, v20 + 1);
    end;

    local function _(p23) -- Line: 135
        -- upvalues: u21 (copy), BalanceFile (ref)
        return (u21 - p23.Position).Magnitude <= BalanceFile.PIRATE_FLAG_RANGE;
    end;

    local v24 = 0;
    local v25 = {};

    for i, v in CollectionService:GetTagged("ItemDrop") do
        local _ = i - 1;

        if (u21 - v.Position).Magnitude <= BalanceFile.PIRATE_FLAG_RANGE == true then
            v24 = v24 + 1;
            v25[v24] = v;
        end;
    end;

    local function _(p26) -- Line: 153
        -- upvalues: Workspace (ref)
        return Workspace:GetServerTimeNow() > p26:GetAttribute("PickupReadyTime");
    end;

    local v27 = 0;
    local v28 = {};

    for i, v in v25 do
        local _ = i - 1;

        if Workspace:GetServerTimeNow() > v:GetAttribute("PickupReadyTime") == true then
            v27 = v27 + 1;
            v28[v27] = v;
        end;
    end;

    local function _(p29) -- Line: 168
        local v30 = p29:GetAttribute("ClientPickupAttemptTime");

        return v30 == nil and true or tick() - v30 > 5;
    end;

    local v31 = 0;
    local v32 = {};

    for i, v in v28 do
        local _ = i - 1;
        local v33 = v:GetAttribute("ClientPickupAttemptTime");

        if (v33 == nil and true or tick() - v33 > 5) == true then
            v31 = v31 + 1;
            v32[v31] = v;
        end;
    end;

    local function _(p34) -- Line: 187
        local v35 = p34:GetAttribute("ClientDropTime");

        return (v35 == 0 or (v35 ~= v35 or (v35 == "" or not v35))) and true or false;
    end;

    local v36 = 0;
    local v37 = {};

    for i, v in v32 do
        local _ = i - 1;
        local v38 = v:GetAttribute("ClientDropTime");

        if ((v38 == 0 or (v38 ~= v38 or (v38 == "" or not v38))) and true or false) == true then
            v36 = v36 + 1;
            v37[v36] = v;
        end;
    end;

    local function _(p39) -- Line: 207
        -- upvalues: getItemMeta (ref), InventoryUtil (ref), Players (ref)
        local v40 = getItemMeta(p39.Name);
        local v41;

        if v40 == nil then
            v41 = v40;
        else
            v41 = v40.maxStackSize;
        end;

        if v41 ~= nil then
            local v42 = InventoryUtil.getToolFromInventory(Players.LocalPlayer, p39.Name);
            local v43;

            if v42 == nil then
                v43 = v42;
            else
                v43 = v42.amount;
            end;

            if v43 ~= nil and v42.amount >= v40.maxStackSize.amount then
                return false;
            end;
        end;

        return true;
    end;

    local v44 = 0;
    local v45 = {};

    for i, v in v37 do
        local _ = i - 1;
        local v46 = getItemMeta(v.Name);
        local v47;

        if v46 == nil then
            v47 = v46;
        else
            v47 = v46.maxStackSize;
        end;

        local v48;

        if v47 == nil then
            v48 = true;
        else
            local v49 = InventoryUtil.getToolFromInventory(Players.LocalPlayer, v.Name);
            local v50;

            if v49 == nil then
                v50 = v49;
            else
                v50 = v49.amount;
            end;

            v48 = v50 == nil or v49.amount < v46.maxStackSize.amount;
        end;

        if v48 == true then
            v44 = v44 + 1;
            v45[v44] = v;
        end;
    end;

    local v51 = false;
    local v52 = 0;

    while true do
        if true then
            if v51 then
                v52 = v52 + 1;
            else
                v51 = true;
            end;
        end;

        if v52 >= math.min(5, #v45) then
            break;
        end;

        local v53 = v45[v52 + 1];
        v53:SetAttribute("ClientPickupAttemptTime", tick());
        default.Client:Get("PirateFlagPickUpItem"):CallServerAsync({
            itemDrop = v53,
            flagPosition = u21
        });
        local flagCollectedMap = p18.flagCollectedMap;
        local v54 = {
            [v53.Name] = v53:GetAttribute("Amount")
        };
        local v55 = MapUtil.getOrCreate(flagCollectedMap, u21, v54);
        local v56 = v55[v53.Name];
        v55[v53.Name] = (v56 == nil and 0 or v56) + v53:GetAttribute("Amount");
    end;

    p18:updateBillboard(u21);

    if v19 then
        v20 = v20 + 1;
    else
        v19 = true;
    end;

    if v20 >= #p18.ownedFlags then
        return;
    end;

    u21 = p18.ownedFlags[v20 + 1];
    v22 = BlockEngine:getBlockPosition(u21);

    if BlockEngine:getStore():getBlockAt(v22) then
        break;
    end;

    table.remove(p18.ownedFlags, v20 + 1);
end;

function u4.updateBillboard(p57, p58) -- Line: 278
    -- upvalues: BlockEngine (copy), u2 (copy), PirateFlagStash (copy)
    local v59 = p57.flagToTree[p58];
    local v60 = p57.flagCollectedMap[p58];

    if not v60 then
        return nil;
    end;

    local v61 = BlockEngine:getStore():getBlockAt(BlockEngine:getBlockPosition(p58));

    if not v61 then
        return nil;
    end;

    if v59 then
        u2.update(v59, u2.createElement(PirateFlagStash, {
            ItemsCollected = v60,
            Flag = v61
        }));

        return;
    end;

    local v62 = u2.mount(u2.createElement(PirateFlagStash, {
        ItemsCollected = v60,
        Flag = v61
    }), v61);
    p57.flagToTree[p58] = v62;
end;

function u4.createBuffCircleIndicator(p63, p64, u65, p66) -- Line: 307
    -- upvalues: Workspace (copy), BLOCK_SIZE (copy), u1 (copy), TweenService (copy)
    local v67 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
    local u68 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
    local v69 = {
        Name = "BuffCircle"
    };
    local v70;

    if p66 == nil then
        v70 = p66;
    else
        v70 = p66.parent;
    end;

    if v70 == nil then
        v70 = Workspace;
    end;

    v69.Parent = v70;
    v69.Size = Vector3.new(0.15, 0, 0);
    v69.CFrame = CFrame.new(p64) - Vector3.new(0, BLOCK_SIZE / 2, 0);
    v69.Orientation = Vector3.new(0, 0, 90);
    v69.Shape = Enum.PartType.Cylinder;
    local v71;

    if p66 == nil then
        v71 = p66;
    else
        v71 = p66.color;
    end;

    if v71 == nil then
        v71 = Color3.fromRGB(255, 255, 255);
    end;

    v69.Color = v71;
    local v72;

    if p66 == nil then
        v72 = p66;
    else
        v72 = p66.transparency;
    end;

    v69.Transparency = v72 == nil and 0 or v72;
    v69.CastShadow = false;
    v69.Material = Enum.Material.ForceField;
    v69.Reflectance = 0;
    v69.Anchored = true;
    v69.CanCollide = false;
    v69.CanTouch = false;
    v69.CanQuery = false;
    local u73 = u1("Part", v69);
    local v74 = TweenService:Create(u73, v67, {
        Size = Vector3.new(0, u65 * 2, u65 * 2)
    });
    v74:Play();
    local u75 = nil;
    u75 = v74.Completed:Connect(function() -- Line: 371
        -- upvalues: TweenService (ref), u73 (copy), u68 (copy), u65 (copy), u75 (ref)
        TweenService:Create(u73, u68, {
            Size = Vector3.new(0.25, u65 * 2, u65 * 2),
            Position = Vector3.new(u73.Position.X, u73.Position.Y + 0.125 + 0.1, u73.Position.Z)
        }):Play();
        u75:Disconnect();
    end);
    local v76;

    if p66 == nil then
        v76 = p66;
    else
        v76 = p66.fadeOutAfterSec;
    end;

    if v76 ~= nil then
        if p66 ~= nil then
            p66 = p66.fadeOutAfterSec;
        end;

        task.delay(p66, function() -- Line: 388
            -- upvalues: TweenService (ref), u73 (copy)
            local v77 = TweenService:Create(u73, TweenInfo.new(1), {
                Transparency = 1
            });
            v77:Play();
            local u78 = nil;
            u78 = v77.Completed:Connect(function() -- Line: 395
                -- upvalues: u73 (ref), u78 (ref)
                u73:Destroy();
                u78:Disconnect();
            end);
        end);
    end;

    return u73;
end;

KnitClient.CreateController(u4.new());

return nil;