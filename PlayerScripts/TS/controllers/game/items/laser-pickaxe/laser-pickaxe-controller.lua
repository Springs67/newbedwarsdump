-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out");
local BlockEngine = v1.BlockEngine;
local BreakBlockDamageType = v1.BreakBlockDamageType;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v2.DeviceUtil;
local GameQueryUtil = v2.GameQueryUtil;
local RandomUtil = v2.RandomUtil;
local SoundManager = v2.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 34, Name: __tostring
        return "LaserPickaxeController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 40
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 44
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p8);
    p8.Name = "LaserPickaxe";
    p8.laserMaidMap = {};
    p8.laserOnMap = {};
    p8.laserOriginMap = {};
    p8.laserEndMap = {};
    p8.lastBlockDamageTimeMap = {};
    p8.damageBlockPositionMap = {};
    p8.shouldEmitPulseMap = {};
end;

function u6.KnitStart(u9) -- Line: 55
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), SharedSyncEvents (copy), InventoryUtil (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), ClientSyncEvents (copy), getItemMeta (copy), BlockEngine (copy), Workspace (copy), GameQueryUtil (copy), default (copy), MapUtil (copy), u3 (copy), BreakBlockDamageType (copy), SoundManager (copy), RandomUtil (copy)
    HandKnitController.KnitStart(u9);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.LASER_PICKAXE, {
        sounds = {
            GameSound.LASER_PICKAXE_LOOP,
            GameSound.LASER_PICKAXE_CONTACT_LOOP,
            GameSound.LASER_PICKAXE_STONE_BREAK_1,
            GameSound.LASER_PICKAXE_STONE_BREAK_2,
            GameSound.LASER_PICKAXE_STONE_BREAK_3,
            GameSound.LASER_PICKAXE_STONE_BREAK_4,
            GameSound.LASER_PICKAXE_WOOD_BREAK_1,
            GameSound.LASER_PICKAXE_WOOD_BREAK_2,
            GameSound.LASER_PICKAXE_WOOD_BREAK_3,
            GameSound.LASER_PICKAXE_WOOD_BREAK_4,
            GameSound.LASER_PICKAXE_WOOL_BREAK_1,
            GameSound.LASER_PICKAXE_WOOL_BREAK_2,
            GameSound.LASER_PICKAXE_WOOL_BREAK_3,
            GameSound.LASER_PICKAXE_WOOL_BREAK_4
        }
    });
    SharedSyncEvents.BeforeAnimationPlayEvent:connect(function(p10) -- Line: 60
        -- upvalues: InventoryUtil (ref), Players (ref), ItemType (ref), GameAnimationUtil (ref), AnimationType (ref)
        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if hand ~= nil then
            hand = hand.itemType;
        end;

        if hand ~= ItemType.LASER_PICKAXE then
            return nil;
        end;

        local v11 = {
            GameAnimationUtil:getAssetId(AnimationType.BREAK_BLOCK),
            GameAnimationUtil:getAssetId(AnimationType.PUNCH),
            GameAnimationUtil:getAssetId(AnimationType.FP_USE_ITEM),
            GameAnimationUtil:getAssetId(AnimationType.FP_WALK)
        };

        if table.find(v11, p10.animationAssetId) ~= nil then
            p10:setCancelled(true);

            return nil;
        end;
    end);
    ClientSyncEvents.DamageBlock:connect(function(p12) -- Line: 77
        -- upvalues: InventoryUtil (ref), Players (ref), u9 (copy), getItemMeta (ref), BlockEngine (ref), Workspace (ref), GameQueryUtil (ref), default (ref)
        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if not (hand and u9:isRelevantItem(hand)) then
            return nil;
        end;

        local v13 = getItemMeta(hand.itemType);
        local v14 = not v13;

        if not v14 then
            local breakBlockRange = v13.breakBlockRange;

            if breakBlockRange == 0 then
                breakBlockRange = false;
            elseif breakBlockRange ~= breakBlockRange then
                breakBlockRange = false;
            end;

            v14 = not breakBlockRange;
        end;

        if v14 then
            return nil;
        end;

        local v15 = BlockEngine:getWorldPosition(p12.blockPosition);
        local Character = Players.LocalPlayer.Character;

        if not Character then
            return nil;
        end;

        if not Workspace.CurrentCamera then
            return nil;
        end;

        local v16 = RaycastParams.new();
        v16.FilterType = Enum.RaycastFilterType.Blacklist;
        v16.FilterDescendantsInstances = { Character };
        local breakBlockRange = v13.breakBlockRange;
        local UnitRay = Players.LocalPlayer:GetMouse().UnitRay;
        local v17 = GameQueryUtil:raycast(UnitRay.Origin, UnitRay.Direction * breakBlockRange, v16);
        local v18 = default.Client:Get("LaserPickaxeStartSpinningFromClient");
        local v19 = {
            laserIsOn = true
        };

        if v17 ~= nil then
            v17 = v17.Position;
        end;

        if v17 ~= nil then
            v15 = v17;
        end;

        v19.targetBlockPos = v15;
        v18:SendToServer(v19);
    end);
    default.Client:Get("LaserPickaxeStartSpinningFromServer"):Connect(function(u20) -- Line: 122
        -- upvalues: u9 (copy), MapUtil (ref), u3 (ref)
        if u20.laserIsOn and u20.laserEndPoint then
            u9.damageBlockPositionMap[u20.player] = u20.laserEndPoint;
            local v21 = u9.laserEndMap[u20.player];

            if v21 ~= nil then
                v21:PivotTo(CFrame.new(u20.laserEndPoint));
            end;

            u9.lastBlockDamageTimeMap[u20.player] = time();
            u9.shouldEmitPulseMap[u20.player] = true;
        end;

        if u9.laserOnMap[u20.player] ~= u20.laserIsOn then
            if u20.laserIsOn then
                u9.laserOnMap[u20.player] = true;
                local v22 = MapUtil.getOrCreate(u9.laserMaidMap, u20.player, u3.new());
                u9.laserMaidMap[u20.player] = v22;
                v22:GiveTask(function() -- Line: 156
                    -- upvalues: u9 (ref), u20 (copy)
                    u9.laserOnMap[u20.player] = false;
                end);
                u9.lastBlockDamageTimeMap[u20.player] = time();
                u9:startLaser(u20.player);

                return;
            end;

            local v23 = u9.laserMaidMap[u20.player];

            if v23 ~= nil then
                v23:DoCleaning();
            end;
        end;
    end);
    ClientSyncEvents.DamageBlockEffect:connect(function(p24) -- Line: 176
        -- upvalues: InventoryUtil (ref), u9 (copy), getItemMeta (ref), BreakBlockDamageType (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
        if not p24.fromPlayer then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(p24.fromPlayer).hand;

        if not (hand and u9:isRelevantItem(hand)) then
            return nil;
        end;

        local v25 = getItemMeta(p24.blockType);

        if v25 ~= nil then
            v25 = v25.block;

            if v25 ~= nil then
                v25 = v25.breakType;
            end;
        end;

        if not v25 then
            return nil;
        end;

        if v25 == BreakBlockDamageType.STONE then
            p24.sound = SoundManager:createSound(RandomUtil.fromList(unpack({
                GameSound.LASER_PICKAXE_STONE_BREAK_1,
                GameSound.LASER_PICKAXE_STONE_BREAK_2,
                GameSound.LASER_PICKAXE_STONE_BREAK_3,
                GameSound.LASER_PICKAXE_STONE_BREAK_4
            })));

            return;
        end;

        if v25 == BreakBlockDamageType.WOOD then
            p24.sound = SoundManager:createSound(RandomUtil.fromList(unpack({
                GameSound.LASER_PICKAXE_WOOD_BREAK_1,
                GameSound.LASER_PICKAXE_WOOD_BREAK_2,
                GameSound.LASER_PICKAXE_WOOD_BREAK_3,
                GameSound.LASER_PICKAXE_WOOD_BREAK_4
            })));

            return;
        end;

        if v25 ~= BreakBlockDamageType.WOOL then
            return;
        end;

        p24.sound = SoundManager:createSound(RandomUtil.fromList(unpack({
            GameSound.LASER_PICKAXE_WOOL_BREAK_1,
            GameSound.LASER_PICKAXE_WOOL_BREAK_2,
            GameSound.LASER_PICKAXE_WOOL_BREAK_3,
            GameSound.LASER_PICKAXE_WOOL_BREAK_4
        })));
    end);
end;

function u6.isRelevantItem(p26, p27) -- Line: 211
    -- upvalues: ItemType (copy)
    return p27.itemType == ItemType.LASER_PICKAXE;
end;

function u6.onEnable(p28, p29, p30) -- Line: 214
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    p28:setupYield(function() -- Line: 216
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref)
        local u31 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FLAMETHROWER_IDLE, {
            looped = true
        });

        return function() -- Line: 220
            -- upvalues: u31 (copy)
            local v32 = u31;

            if v32 ~= nil then
                v32:Stop();
            end;
        end;
    end);
end;

function u6.onDisable(p33) -- Line: 228
end;

function u6.startLaser(u34, u35) -- Line: 230
    -- upvalues: MapUtil (copy), u3 (copy), Workspace (copy), u4 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), DeviceUtil (copy), GameSound (copy), RunService (copy)
    local Character = u35.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local u36 = MapUtil.getOrCreate(u34.laserMaidMap, u35, u3.new());
    u34.laserOriginMap[u35] = u4("Part", {
        Transparency = 1,
        CanCollide = false,
        Anchored = false,
        Parent = Workspace
    });
    local u37 = ReplicatedStorage.Assets.Effects.LaserPickaxeHit:Clone();
    u37.Parent = Workspace;
    u34.laserEndMap[u35] = u37;
    u36:GiveTask(u37);
    local u38 = u34.laserOriginMap[u35];

    if not u38 then
        return nil;
    end;

    local u39 = u34.laserEndMap[u35];

    if not u39 then
        return nil;
    end;

    local function _(p40) -- Line: 268
        return p40.Name == "LaserPickaxeBeamStartPart";
    end;

    local v41 = nil;

    for i, descendant in u35.Character:GetDescendants() do
        local _ = i - 1;

        if descendant.Name == "LaserPickaxeBeamStartPart" == true then
            v41 = descendant;
            break;
        end;
    end;

    if v41 == nil then
        v41 = u35.Character.PrimaryPart;
    end;

    u38:PivotTo(v41:GetPivot());
    local v42 = u34.damageBlockPositionMap[u35];

    if v42 then
        u39:PivotTo(CFrame.new(v42));
    end;

    local v43 = u4("WeldConstraint", {
        Part0 = u38,
        Part1 = v41,
        Parent = u35.Character
    });
    u34.laserMaidMap[u35] = u36;
    u36:GiveTask(v43);
    GameQueryUtil:setQueryIgnored(u38, true);
    GameQueryUtil:setQueryIgnored(u39, true);
    u39.Transparency = 1;
    local v44 = u4("Attachment", {
        Parent = u38
    });
    local v45 = u4("Attachment", {
        Parent = u39
    });
    local v46 = DeviceUtil.isMobileControls() and 3 or 1;
    local u47 = u4("Beam", {
        FaceCamera = true,
        Segments = 10,
        Brightness = 5,
        LightEmission = 1,
        Texture = "rbxassetid://10525762007",
        TextureSpeed = 5,
        TextureLength = 0.8,
        Attachment0 = v44,
        Attachment1 = v45,
        Color = ColorSequence.new(Color3.fromRGB(255, 107, 38)),
        Transparency = NumberSequence.new(0),
        Width0 = v46 * 0.5,
        Width1 = v46 * 0.5,
        Parent = Workspace
    });
    u36:GiveTask(u47);
    local v48 = u4("Sound", {
        Name = "LaserSound",
        Looped = true,
        Volume = 0.3,
        RollOffMaxDistance = 25,
        SoundId = GameSound.LASER_PICKAXE_LOOP,
        Parent = u35.Character.PrimaryPart
    });
    v48:Play();
    u36:GiveTask(v48);
    local v49 = u4("Sound", {
        Name = "LaserContactSound",
        Looped = true,
        Volume = 0.2,
        RollOffMaxDistance = 25,
        SoundId = GameSound.LASER_PICKAXE_LOOP,
        Parent = u37
    });
    v49:Play();
    u36:GiveTask(v49);
    u36:GiveTask((RunService.Heartbeat:Connect(function() -- Line: 348
        -- upvalues: u34 (copy), u35 (copy), u38 (copy), u39 (copy), u47 (copy), u37 (copy), u36 (copy)
        local v50 = u34.damageBlockPositionMap[u35];
        local v51 = u38;

        if v51 ~= nil then
            v51 = v51.Position;
        end;

        if not (v51 and (u39 and v50)) then
            u47:Destroy();
            u37:Destroy();

            return nil;
        end;

        local v52 = u39;

        if v52 ~= nil then
            v52:PivotTo(CFrame.new(v50));
        end;

        if u34.shouldEmitPulseMap[u35] then
            u37.Attachment.Specs:Emit(10);
            u34.shouldEmitPulseMap[u35] = false;
        end;

        local v53 = u34.lastBlockDamageTimeMap[u35];

        if time() - ((v53 == 0 or (v53 ~= v53 or not v53)) and 0 or v53) > 0.25 then
            u36:DoCleaning();
        end;
    end)));
end;

KnitClient.CreateController(u6.new());

return nil;