-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local InventoryEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsArmorSet = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet;
local ArmorSlot = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local TrainingRoomHudSide = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "training-room", "ui", "training-room-hud-side").TrainingRoomHudSide;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "TrainingRoomEntityController";
    end,

    __index = GameKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 35
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 39
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p6, { GameType.TRAINING_ROOM, GameType.CUSTOM_KIT_CREATOR });
    p6.Name = "TrainingRoomEntityController";
end;

function u4.KnitStart(p7) -- Line: 43
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p7);
end;

function u4.onGameInit(u8) -- Line: 46
    -- upvalues: default (copy), Players (copy), KnitClient (copy), WatchCollectionTag (copy), BedwarsArmorSet (copy), u2 (copy), ArmorSlot (copy), InventoryEntity (copy), getItemMeta (copy), ReplicatedStorage (copy), WeldUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy)
    default.Client:Get("TrainingRoomLoad"):Connect(function(p9) -- Line: 47
        -- upvalues: Players (ref), u8 (copy), KnitClient (ref)
        if p9.player ~= Players.LocalPlayer then
            return nil;
        end;

        u8:mountTrainingRoomCommands();
        KnitClient.Controllers.KitController:getActiveKits(p9.player);
    end);
    WatchCollectionTag("trainingRoomDummy", function(u10) -- Line: 58
        -- upvalues: BedwarsArmorSet (ref), u2 (ref), ArmorSlot (ref), InventoryEntity (ref), getItemMeta (ref), ReplicatedStorage (ref), WeldUtil (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), u8 (copy), RunService (ref)
        local v11 = u10:GetAttribute("TrainingRoomDummy");

        if v11 ~= 0 and (v11 == v11 and (v11 ~= "" and v11)) then
            task.spawn(function() -- Line: 61
                -- upvalues: u10 (copy), BedwarsArmorSet (ref), u2 (ref), ArmorSlot (ref), InventoryEntity (ref), getItemMeta (ref), ReplicatedStorage (ref), WeldUtil (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), u8 (ref), RunService (ref)
                local v12 = u10:GetAttribute("ArmorType");
                local u13;

                if v12 == "LEATHER" then
                    u13 = BedwarsArmorSet.LEATHER;
                elseif v12 == "IRON" then
                    u13 = BedwarsArmorSet.IRON;
                elseif v12 == "DIAMOND" then
                    u13 = BedwarsArmorSet.DIAMOND;
                elseif v12 == "EMERALD" then
                    u13 = BedwarsArmorSet.EMERALD;
                elseif v12 == "VOID" then
                    u13 = BedwarsArmorSet.VOID;
                else
                    local _ = v12 == nil;
                    u13 = {};
                end;

                local u14 = 0;
                local v15 = false;

                while true do
                    if v15 then
                        u14 = u14 + 1;
                    else
                        v15 = true;
                    end;

                    if u14 >= #u2.values(ArmorSlot) then
                        local u16 = u10;
                        local Humanoid = u10:WaitForChild("Humanoid");
                        AnimationUtil:playAnimation(Humanoid:WaitForChild("Animator"), GameAnimationUtil:getAssetId(AnimationType.WARLOCK_IDLE));
                        local u17 = nil;
                        local u18 = u8:setUpAnimationTrack(Humanoid);
                        local u19 = -1;
                        local u20 = nil;
                        u20 = RunService.Heartbeat:Connect(function() -- Line: 148
                            -- upvalues: u16 (copy), u20 (ref), u17 (ref), u18 (copy), u19 (ref)
                            local v21 = u16;
                            v21.Destroying:Connect(function() -- Line: 150
                                -- upvalues: u20 (ref)
                                u20:Disconnect();
                            end);

                            if v21.HumanoidRootPart.AssemblyLinearVelocity.Magnitude < 1 and u17 ~= u18.idle then
                                local v22 = u17;

                                if v22 ~= nil then
                                    v22:Stop();
                                end;

                                u18.idle:Play();
                                u17 = u18.idle;
                                u19 = time() + math.random(6, 12);

                                return;
                            end;

                            if v21.HumanoidRootPart.AssemblyLinearVelocity.Magnitude <= 1 or u17 == u18.walk then
                                if u17 == u18.idle and (u19 > 0 and u19 < time()) then
                                    u19 = time() + math.random(10, 20);
                                end;

                                return;
                            end;

                            local v23 = u17;

                            if v23 ~= nil then
                                v23:Stop();
                            end;

                            local walk = u18.walk;

                            if walk ~= nil then
                                walk:Play();
                            end;

                            u17 = u18.walk;
                            u19 = -1;
                        end);

                        return;
                    end;

                    if not InventoryEntity.new(u10) then
                        return nil;
                    end;

                    u10:WaitForChild("Humanoid");
                    (function() -- Line: 112
                        -- upvalues: u13 (ref), u14 (ref), getItemMeta (ref), ReplicatedStorage (ref), u10 (ref), WeldUtil (ref)
                        local v24 = u13[u14 + 1];

                        if not getItemMeta(v24) then
                            return nil;
                        end;

                        local v25 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(v24):GetChildren();

                        if not v25 then
                            return nil;
                        end;

                        local function _(p26) -- Line: 122
                            -- upvalues: u10 (ref)
                            local v27 = p26:Clone();

                            if v27 then
                                v27.Parent = u10;
                            end;
                        end;

                        for i, v in v25 do
                            local _ = i - 1;
                            local v28 = v:Clone();

                            if v28 then
                                v28.Parent = u10;
                            end;
                        end;

                        WeldUtil:weldCharacterAccessories(u10);
                    end)();
                    u14 = u14;
                end;
            end);
        end;
    end);
end;

function u4.setUpAnimationTrack(p29, p30) -- Line: 180
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    local Animator = p30:WaitForChild("Animator");
    local v31 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.WARLOCK_WALK));
    v31.Priority = Enum.AnimationPriority.Action;
    local v32 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.WARLOCK_IDLE));
    v32.Priority = Enum.AnimationPriority.Action;

    return {
        walk = v31,
        idle = v32
    };
end;

function u4.mountTrainingRoomCommands(p33) -- Line: 191
    -- upvalues: KnitClient (copy), QueueType (copy), Flamework (copy), TrainingRoomHudSide (copy)
    if KnitClient.Controllers.MatchController:getQueueType() == QueueType.CUSTOM_KIT_CREATION then
        return nil;
    end;

    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("TrainingRoomHudSide") then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "TrainingRoomHudSide",
        app = TrainingRoomHudSide
    }, {});
end;

function u4.showWarningPopup(p34) -- Line: 203
end;

KnitClient.CreateController(u4.new());

return nil;