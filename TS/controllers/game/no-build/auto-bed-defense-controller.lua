-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local BedDefenseMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "no-build", "bed-defense-meta").BedDefenseMeta;
local NoBuildUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "no-build", "no-build-util").NoBuildUtil;
local GamePlayer = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "game-player").GamePlayer;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "AutoBedDefenseController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 39
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 43
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "AutoBedDefenseController";
end;

function u4.KnitStart(p7) -- Line: 47
    -- upvalues: KnitController (copy), getQueueMeta (copy), KnitClient (copy), ClientSyncEvents (copy), Players (copy), default2 (copy), BlockEngine (copy), Workspace (copy), default (copy), InQuad (copy), BLOCK_SIZE (copy), getItemMeta (copy), SoundManager (copy), GameSound (copy), GamePlayer (copy), WatchCollectionTag (copy), u2 (copy), NoBuildUtil (copy), GameAnimationUtil (copy), AnimationType (copy), BedDefenseMeta (copy), InventoryUtil (copy), Flamework (copy), RunService (copy)
    KnitController.KnitStart(p7);

    if not getQueueMeta(KnitClient.Controllers.MatchController:getQueueTypeAsync():expect()).autoBedDefense then
        return nil;
    end;

    ClientSyncEvents.DamageBlock:connect(function(p8) -- Line: 53
        -- upvalues: KnitClient (ref), Players (ref)
        local v9 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if not v9 then
            return nil;
        end;

        if p8.blockInstance:GetAttribute("BedDefenseForTeam") == v9.id then
            p8:setCancelled(true);
        end;
    end);
    default2.Client:Get("UpgradeBedDefense"):Connect(function(p10, p11) -- Line: 62
        -- upvalues: BlockEngine (ref), Workspace (ref), default (ref), InQuad (ref), BLOCK_SIZE (ref), getItemMeta (ref), SoundManager (ref), GameSound (ref), Players (ref)
        if not p10 then
            return nil;
        end;

        local v12 = false;
        local v13 = 0;

        while true do
            if v12 then
                v13 = v13 + 1;
            else
                v12 = true;
            end;

            if v13 >= math.pow(#p11, 0.8) then
                return;
            end;

            local v14 = math.random() * #p11;
            local v15 = math.floor(v14);
            local u16 = table.remove(p11, v15 + 1);

            if not u16 then
                return nil;
            end;

            local blockType = u16.blockType;
            local v17 = BlockEngine:getHandlerRegistry():getHandler(blockType);

            if v17 then
                local u18 = v17:place(Vector3.new(0, 0, 0), u16.blockData);
                u18.CanCollide = false;
                u18.CanQuery = false;
                u18.Anchored = true;
                u18.Name = "UpgradeEffectBlock";
                u18.Parent = Workspace;
                local Character = p10.Character;

                if Character ~= nil then
                    Character = Character:GetPivot();
                end;

                if not Character then
                    return nil;
                end;

                u18.CFrame = Character;
                u18.Size = Vector3.new(0.5, 0.5, 0.5);
                local u20 = default(0.3, InQuad, function(p19) -- Line: 106
                    -- upvalues: u18 (copy), BLOCK_SIZE (ref), Character (copy), u16 (copy)
                    u18.Size = (Vector3.new(0.5, 0.5, 0.5)):Lerp(Vector3.new(BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE), p19);
                    u18.CFrame = Character:Lerp(CFrame.new(u16.worldPosition), p19);
                end);
                task.spawn(function() -- Line: 110
                    -- upvalues: u20 (copy), u18 (copy), getItemMeta (ref), blockType (copy), SoundManager (ref), u16 (copy)
                    u20:Wait();
                    u18:Destroy();
                    local block = getItemMeta(blockType).block;

                    if block ~= nil then
                        block = block.placeSound;
                    end;

                    if block then
                        SoundManager:playSound(block()[1].SoundId, {
                            volumeMultiplier = 0.95 + 0.1 * math.random(),
                            position = u16.worldPosition
                        });
                    end;
                end);
                local PICKUP_ITEM_DROP = GameSound.PICKUP_ITEM_DROP;
                local v21 = {
                    volumeMultiplier = 0.95 + 0.1 * math.random()
                };
                local v22;

                if p10 == Players.LocalPlayer then
                    v22 = nil;
                else
                    v22 = Character.Position;
                end;

                v21.position = v22;
                SoundManager:playSound(PICKUP_ITEM_DROP, v21);
                task.wait(0.05);
            end;
        end;
    end);
    local u23 = GamePlayer.new(Players.LocalPlayer);
    WatchCollectionTag("UpgradeBedDefense", function(u24) -- Line: 135
        -- upvalues: u2 (ref), NoBuildUtil (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref), BedDefenseMeta (ref), InventoryUtil (ref), Flamework (ref), getItemMeta (ref), default2 (ref), RunService (ref), u23 (copy)
        local u25 = u2.new();
        u25:GiveTask(u24.Destroying:Connect(function() -- Line: 137
            -- upvalues: u25 (copy)
            u25:DoCleaning();
        end));

        local function u29(p26) -- Line: 141
            -- upvalues: u24 (copy), NoBuildUtil (ref)
            local v27 = u24:GetAttribute("MissingBlocks");
            local v28 = v27 == nil and 0 or v27;

            if v28 == 0 then
                u24.HoldDuration = 1;
            else
                u24.HoldDuration = v28 * NoBuildUtil.REPAIR_BLOCKS_PER_SECOND + 0.2;
            end;

            if p26 == nil and true or p26 then
                u24:InputHoldEnd();
            end;

            u24.Enabled = false;
            task.delay(0.016666666666666666, function() -- Line: 161
                -- upvalues: u24 (ref)
                u24.Enabled = true;
            end);
        end;

        local u30 = false;
        local u31 = u2.new();
        local u32 = u2.new();
        u25:GiveTask(u24.PromptButtonHoldBegan:Connect(function() -- Line: 168
            -- upvalues: u30 (ref), u31 (copy), GameAnimationUtil (ref), Players (ref), AnimationType (ref), u32 (copy), u24 (copy), BedDefenseMeta (ref), InventoryUtil (ref), Flamework (ref), getItemMeta (ref), NoBuildUtil (ref), default2 (ref), RunService (ref)
            u30 = true;
            u31:DoCleaning();
            local u33 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.OPEN_CRATE);
            u32:GiveTask(function() -- Line: 173
                -- upvalues: u33 (copy)
                local v34 = u33;

                if v34 ~= nil then
                    v34:Stop();
                end;

                local v35 = u33;

                if v35 ~= nil then
                    v35:Destroy();
                end;
            end);
            local v36 = u24:GetAttribute("MissingBlocks");
            local v37 = v36 == nil and 0 or v36;

            if v37 == 0 then
                local v38 = u24:GetAttribute("DefenseLevel");
                local v39 = v38 == nil and 0 or v38;

                if #BedDefenseMeta - 1 <= v39 then
                    return nil;
                end;

                local v40 = BedDefenseMeta[v39 + 1 + 1];

                if InventoryUtil.hasEnough(Players.LocalPlayer, v40.cost.itemType, v40.cost.amount) then
                    return nil;
                end;

                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "Upgrade requires " .. tostring(v40.cost.amount) .. "x " .. string.lower(getItemMeta(v40.cost.itemType).displayName)
                });
                u24:InputHoldEnd();

                return nil;
            end;

            if v37 > 0 then
                local function _() -- Line: 211
                    -- upvalues: InventoryUtil (ref), Players (ref), NoBuildUtil (ref)
                    return InventoryUtil.hasEnough(Players.LocalPlayer, NoBuildUtil.REPAIR_RESOURCE, NoBuildUtil.REPAIR_COST);
                end;

                local u41 = "Repair requires " .. tostring(NoBuildUtil.REPAIR_COST) .. "x " .. string.lower(getItemMeta(NoBuildUtil.REPAIR_RESOURCE).displayName);

                if not InventoryUtil.hasEnough(Players.LocalPlayer, NoBuildUtil.REPAIR_RESOURCE, NoBuildUtil.REPAIR_COST) then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        message = u41
                    });
                    u24:InputHoldEnd();

                    return nil;
                end;

                default2.Client:Get("SetRepairingBedDefense"):SendToServer(true);
                u31:GiveTask(function() -- Line: 225
                    -- upvalues: default2 (ref)
                    default2.Client:Get("SetRepairingBedDefense"):SendToServer(false);
                end);
                u31:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 229
                    -- upvalues: InventoryUtil (ref), Players (ref), NoBuildUtil (ref), Flamework (ref), u41 (copy), u24 (ref), u31 (ref)
                    if InventoryUtil.hasEnough(Players.LocalPlayer, NoBuildUtil.REPAIR_RESOURCE, NoBuildUtil.REPAIR_COST) then
                        return nil;
                    end;

                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        message = u41
                    });
                    u24:InputHoldEnd();
                    u31:DoCleaning();
                end));
            end;
        end));
        u25:GiveTask(u24.PromptButtonHoldEnded:Connect(function() -- Line: 241
            -- upvalues: u32 (copy), u31 (copy), u30 (ref), u29 (copy)
            u32:DoCleaning();
            u31:DoCleaning();
            u30 = false;
            u29(false);
        end));
        u25:GiveTask(u24:GetAttributeChangedSignal("MissingBlocks"):Connect(function() -- Line: 247
            -- upvalues: u24 (copy), u29 (copy), u30 (ref)
            local v42 = u24:GetAttribute("MissingBlocks");

            if (v42 == nil and 0 or v42) == 0 then
                u29();

                return;
            end;

            if not u30 then
                u29();
            end;
        end));
        u25:GiveTask(u23:watchTeamId(function(p43) -- Line: 259
            -- upvalues: u24 (copy)
            u24.Enabled = u24:GetAttribute("Team") == p43;
        end));
    end);
end;

KnitClient.CreateController(u4.new());

return nil;