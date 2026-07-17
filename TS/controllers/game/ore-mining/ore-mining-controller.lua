-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local LoggerProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local IRON_ORE_MESH_BLOCK = ItemType.IRON_ORE_MESH_BLOCK;
local u4 = { GameSound.ORE_HIT_1, GameSound.ORE_HIT_2, GameSound.ORE_HIT_3 };
local u5 = {
    Vector2.new(0, 2),
    Vector2.new(1, 2),
    Vector2.new(2, 2),
    Vector2.new(2, 1),
    Vector2.new(2, 0)
};
local u6 = Color3.fromRGB(1, 255, 158);
local u7 = Color3.fromRGB(105, 237, 250);
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "OreMiningController";
    end,

    __index = KnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 44
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 48
    -- upvalues: KnitController (copy), LoggerProvider (copy)
    KnitController.constructor(p10);
    p10.Name = "OreMiningController";
    p10.screenShakeCounter = 0;
    p10.logger = LoggerProvider.getLogger("OreMiningController");
end;

function u8.KnitStart(u11) -- Line: 54
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), IRON_ORE_MESH_BLOCK (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u11);
    WatchCollectionTag(IRON_ORE_MESH_BLOCK, function(u12) -- Line: 57
        -- upvalues: u11 (copy)
        local u13 = nil;
        u13 = u12.Destroying:Connect(function() -- Line: 59
            -- upvalues: u11 (ref), u12 (copy), u13 (ref)
            u11:playOreDestructionEffects(u12);
            u13:Disconnect();
        end);
        task.defer(function() -- Line: 65
            -- upvalues: u11 (ref), u12 (copy)
            u11:showBonusLoot(u12);
        end);
    end);
    ClientSyncEvents.DamageBlock:connect(function(p14) -- Line: 70
        -- upvalues: IRON_ORE_MESH_BLOCK (ref), u11 (copy)
        if p14.blockType == IRON_ORE_MESH_BLOCK then
            u11:playOreHitSound();
            u11:playOreHitEffects();
        end;
    end);
end;

function u8.showBonusLoot(p15, p16) -- Line: 77
    -- upvalues: RandomUtil (copy), u7 (copy), u6 (copy)
    local v17 = p16:GetAttribute("IronCount");
    local v18 = v17 == nil and 0 or v17;
    local v19 = p16:GetAttribute("DiamondCount");
    local v20 = v19 == nil and 0 or v19;
    local v21 = p16:GetAttribute("EmeraldCount");
    local v22 = v21 == nil and 0 or v21;
    local v23 = v18 + v20 + v22;
    local _ = v18 / v23;
    local u24 = v20 / v23;
    local u25 = v22 / v23;

    if u24 > 0 or u25 > 0 then
        local function _(p26) -- Line: 100
            -- upvalues: u24 (copy), u25 (copy)
            local v27 = p26:IsA("Folder");

            if v27 then
                if u24 == 1 or u25 == 1 then
                    return true;
                end;

                v27 = p26.Name ~= "Bottom";
            end;

            return v27;
        end;

        local v28 = 0;
        local v29 = {};

        for i, descendant in p16:GetDescendants() do
            local _ = i - 1;
            local v30 = descendant:IsA("Folder") and ((u24 == 1 or u25 == 1) and true or descendant.Name ~= "Bottom");

            if v30 == true then
                v28 = v28 + 1;
                v29[v28] = descendant;
            end;
        end;

        local function v36(u31, p32, p33, p34) -- Line: 114
            local function _(p35) -- Line: 116
                -- upvalues: u31 (copy)
                table.insert(u31, p35);
            end;

            for i, child in p32:GetChildren() do
                local _ = i - 1;
                table.insert(u31, child);
            end;

            return u31;
        end;

        local u37 = {};

        for i = 1, #v29 do
            u37 = v36(u37, v29[i], i - 1, v29);
        end;

        local function _(p38) -- Line: 135
            -- upvalues: u37 (copy)
            local v39 = math.floor(p38 * #u37);

            return math.max(1, v39);
        end;

        local v40;

        if v20 == 0 or (v20 ~= v20 or not v20) then
            v40 = u37;
        else
            v40 = u37;
            local v41 = false;
            local v42 = 0;

            while true do
                if true then
                    if v41 then
                        v42 = v42 + 1;
                    else
                        v41 = true;
                    end;
                end;

                local v43 = math.floor(u24 * #u37);

                if v42 >= math.max(1, v43) then
                    break;
                end;

                local u44 = RandomUtil.fromList(unpack(v40));

                local function _(p45) -- Line: 153
                    -- upvalues: u44 (copy)
                    return p45 ~= u44;
                end;

                local v46 = 0;
                v40 = {};

                for i, v in v40 do
                    local _ = i - 1;

                    if v ~= u44 == true then
                        v46 = v46 + 1;
                        v40[v46] = v;
                    end;
                end;

                if u44 ~= nil then
                    u44.TextureID = "";
                    u44.Color = u7;
                end;
            end;
        end;

        if v22 ~= 0 and (v22 == v22 and v22) then
            local v47 = false;
            local v48 = 0;

            while true do
                if true then
                    if v47 then
                        v48 = v48 + 1;
                    else
                        v47 = true;
                    end;
                end;

                local v49 = math.floor(u25 * #u37);

                if v48 >= math.max(1, v49) then
                    break;
                end;

                local u50 = RandomUtil.fromList(unpack(v40));

                local function _(p51) -- Line: 191
                    -- upvalues: u50 (copy)
                    return p51 ~= u50;
                end;

                local v52 = 0;
                v40 = {};

                for i, v in v40 do
                    local _ = i - 1;

                    if v ~= u50 == true then
                        v52 = v52 + 1;
                        v40[v52] = v;
                    end;
                end;

                if u50 ~= nil then
                    u50.TextureID = "";
                    u50.Color = u6;
                end;
            end;
        end;
    end;
end;

function u8.playOreHitSound(p53) -- Line: 216
    -- upvalues: RandomUtil (copy), u4 (copy), SoundManager (copy)
    SoundManager:playSound((RandomUtil.fromList(unpack(u4))));
end;

function u8.playOreHitEffects(p54) -- Line: 220
    -- upvalues: u5 (copy), ScreenShakeUtil (copy), Players (copy), Workspace (copy), GameQueryUtil (copy), IRON_ORE_MESH_BLOCK (copy), ReplicatedStorage (copy), EffectUtil (copy)
    ScreenShakeUtil.shakeScreenDirection(u5[p54.screenShakeCounter % #u5 + 1], {
        magnitude = 0.01,
        duration = 0.1
    });
    p54.screenShakeCounter = p54.screenShakeCounter + 1;
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local CurrentCamera = Workspace.CurrentCamera;

    if not CurrentCamera then
        return nil;
    end;

    local v55 = RaycastParams.new();
    v55.FilterType = Enum.RaycastFilterType.Blacklist;
    v55.FilterDescendantsInstances = { Character };
    local UnitRay = Players.LocalPlayer:GetMouse().UnitRay;
    local v56 = GameQueryUtil:raycast(UnitRay.Origin, UnitRay.Direction * 50, v55);
    local v57;

    if v56 == nil then
        v57 = v56;
    else
        v57 = v56.Instance;
    end;

    if v57 then
        v57 = v56.Instance.Name == IRON_ORE_MESH_BLOCK;
    end;

    if v57 then
        local v58 = ReplicatedStorage.Assets.Effects.MiningDebris:Clone();
        v58.CFrame = CFrame.lookAt(v56.Position, CurrentCamera.CFrame.Position);
        v58.Parent = Workspace;
        EffectUtil:playEffects({ v58 }, nil, {
            sizeMultiplier = 1,
            destroyAfterSec = 1
        });
    end;
end;

function u8.playOreDestructionEffects(u59, u60) -- Line: 264
    -- upvalues: u2 (copy), RuntimeLib (copy), BlockEngine (copy), ItemType (copy), Workspace (copy), KnitClient (copy), IRON_ORE_MESH_BLOCK (copy), Players (copy), GameQueryUtil (copy)
    local u61 = u2.new();
    local v80, v81 = RuntimeLib.try(function() -- Line: 266
        -- upvalues: BlockEngine (ref), ItemType (ref), u61 (copy), RuntimeLib (ref), u60 (copy), Workspace (ref), KnitClient (ref), IRON_ORE_MESH_BLOCK (ref), Players (ref), GameQueryUtil (ref)
        local v62 = BlockEngine:getHandlerRegistry():getHandler(ItemType.IRON_ORE_MESH_BLOCK);

        if not v62 then
            u61:DoCleaning();

            return RuntimeLib.TRY_RETURN, {};
        end;

        local u63 = BlockEngine:getBlockPosition(u60.Position);
        local u64 = v62:place(u63, 0);
        u61:GiveTask(function() -- Line: 275
            -- upvalues: u64 (copy)
            u64:Destroy();
        end);
        task.delay(0.25, function() -- Line: 278
            -- upvalues: u61 (ref)
            u61:DoCleaning();
        end);
        u64.CanCollide = false;
        u64.CanQuery = false;
        u64.CastShadow = false;
        u64.Parent = Workspace;
        local u65 = nil;
        task.delay(0.25, function() -- Line: 288
            -- upvalues: KnitClient (ref), u64 (copy), IRON_ORE_MESH_BLOCK (ref), u63 (copy), u65 (ref)
            local v66 = false;
            local v67 = 0;

            while true do
                if v66 then
                    v67 = v67 + 1;
                else
                    v66 = true;
                end;

                if v67 >= 12 then
                    return;
                end;

                KnitClient.Controllers.BlockDebrisController:convertBlockToDebris(u64, IRON_ORE_MESH_BLOCK, u63, u65, v67);
            end;
        end);
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:GetPivot().LookVector;
        end;

        u65 = Character == nil and Vector3.new(5, 5, 5) or Character;
        local v68 = u64:GetDescendants();

        local function v78(u69, p70) -- Line: 317
            -- upvalues: GameQueryUtil (ref), u65 (ref)
            if u69:IsA("BasePart") then
                u69.Anchored = false;
                u69.CanCollide = true;
                u69.CollisionGroup = "Players";
                GameQueryUtil:setQueryIgnored(u69, true);
                local v71 = math.random() * 3.141592653589793 * 2;
                local v72 = math.random() * 10 + 5;
                local Unit = u65.Unit;
                local v73 = 5 + math.random() * 5;
                local v74 = v72 * math.cos(v71);
                local v75 = 5 + 5 * math.random();
                local v76 = v72 * math.sin(v71);
                local v77 = Vector3.new(v74, v75, v76);
                u69:ApplyImpulse(Unit * v73 + v77 * u69.Mass);
                task.delay(0.01 * p70, function() -- Line: 331
                    -- upvalues: u69 (copy)
                    return u69:Destroy();
                end);
            end;
        end;

        for i, v in v68 do
            v78(v, i - 1, v68);
        end;
    end, function(p79) -- Line: 339
        -- upvalues: u61 (copy), u59 (copy)
        u61:DoCleaning();
        u59.logger:Error("Error in ore mining controller {}", p79);
    end);

    if v80 then
        return unpack(v81);
    end;
end;

KnitClient.CreateController(u8.new());

return nil;