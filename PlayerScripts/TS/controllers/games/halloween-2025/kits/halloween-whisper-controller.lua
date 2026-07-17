-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local ScytheUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "weapons", "scythe-util").ScytheUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "HalloweenWhisperController";
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
    -- upvalues: GameKnitController (copy), GameType (copy), ReplicatedStorage (copy)
    GameKnitController.constructor(p5, { GameType.HALLOWEEN_2025_EVENT_PVE });
    p5.Name = "HalloweenWhisperController";
    p5.readyTime = -1;
    p5.projecileModelTemplate = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Projectiles"):FindFirstChild("owl_projectile");
    p5.inited = false;
end;

function u3.KnitStart(p6) -- Line: 44
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p6);
end;

function u3.onGameInit(u7) -- Line: 47
    -- upvalues: ClientSyncEvents (copy), Workspace (copy), InventoryUtil (copy), Players (copy), ItemType (copy), EntityUtil (copy), default2 (copy)
    ClientSyncEvents.SwordSwing:connect(function(p8) -- Line: 48
        -- upvalues: u7 (copy), Workspace (ref), InventoryUtil (ref), Players (ref), ItemType (ref), EntityUtil (ref)
        if u7.readyTime > Workspace:GetServerTimeNow() then
            return nil;
        end;

        if p8:isCancelled() then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if hand ~= nil then
            hand = hand.itemType;
        end;

        if hand ~= ItemType.WHISPER_FEATHER then
            return nil;
        end;

        if not EntityUtil:getLocalPlayerEntity() then
            return nil;
        end;

        local v9 = Players.LocalPlayer:GetAttribute("IsCasting");

        if v9 ~= 0 and (v9 == v9 and (v9 ~= "" and v9)) then
            return nil;
        end;

        u7.readyTime = Workspace:GetServerTimeNow() + 0.4;
        u7:playLocalAnimation();
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        local targetEntity = p8.targetEntity;

        if targetEntity ~= nil then
            targetEntity = targetEntity:getInstance().PrimaryPart;

            if targetEntity ~= nil then
                targetEntity = targetEntity.Position;
            end;
        end;
    end);
    default2.Client:Get("SpecialWeaponHit"):Connect(function(p10) -- Line: 88
        -- upvalues: ItemType (ref), u7 (copy)
        if p10.item ~= ItemType.WHISPER_FEATHER then
            return nil;
        end;

        u7:featherEffect(p10.attacker, p10.target);
    end);
end;

function u3.playLocalAnimation(p11) -- Line: 95
    -- upvalues: Players (copy), ScytheUtil (copy), RandomUtil (copy), AnimationType (copy), AnimationUtil (copy), GameAnimationUtil (copy)
    local v12 = Players.LocalPlayer:GetAttribute("AttackCount");
    local _ = (v12 == nil and 0 or v12) % #ScytheUtil:getScytheAttackSequence();
    local v13 = RandomUtil.fromList(AnimationType.DART_THROW_1, AnimationType.DART_THROW_2);
    local v14 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(v13));
    local v15;

    if v14 == nil then
        v15 = v14;
    else
        v15 = v14.Length;
    end;

    if v15 ~= 0 and (v15 == v15 and (v15 and v14 ~= nil)) then
        v14:AdjustSpeed(v15 / 0.35);
    end;
end;

function u3.featherEffect(p16, p17, p18) -- Line: 116
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), default (copy), InQuad (copy)
    if not p16.projecileModelTemplate then
        p16.projecileModelTemplate = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Projectiles"):FindFirstChild("owl_projectile");
    end;

    local projecileModelTemplate = p16.projecileModelTemplate;

    if projecileModelTemplate ~= nil then
        projecileModelTemplate = projecileModelTemplate:Clone();
    end;

    if not projecileModelTemplate then
        return nil;
    end;

    local Character = p17.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local Character2 = p17.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.CFrame.LookVector.Unit;
        end;
    end;

    if not Character2 then
        return nil;
    end;

    if p18 ~= nil then
        p18 = p18.PrimaryPart;

        if p18 ~= nil then
            p18 = p18.Position;
        end;
    end;

    if p18 == nil then
        p18 = Character + Character2 * 15;
    end;

    projecileModelTemplate:PivotTo(CFrame.new(Character + Character2 * 2, p18));
    projecileModelTemplate.Parent = Workspace;
    local v19 = CFrame.new(p18, p18 + Character2 * 20);
    default(0.1, InQuad, function(p20) -- Line: 169
        -- upvalues: projecileModelTemplate (copy)
        projecileModelTemplate:PivotTo(p20);
    end, projecileModelTemplate.PrimaryPart.CFrame, v19);
    task.delay(0.1, function() -- Line: 172
        -- upvalues: projecileModelTemplate (copy)
        projecileModelTemplate:Destroy();
    end);
end;

KnitClient.CreateController(u3.new());

return nil;