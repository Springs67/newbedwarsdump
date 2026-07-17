-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local FlyingLuckyBlockUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "flying-lucky-block", "flying-lucky-block-util").FlyingLuckyBlockUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "FlyingLuckyBlockController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 35
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 39
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "FlyingLuckyBlockController";
    p6.partMap = {};
end;

function u4.KnitStart(u7) -- Line: 44
    -- upvalues: KnitController (copy), default (copy), Flamework (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), ItemUtil (copy), RuntimeLib (copy), KnitClient2 (copy), Players (copy), getItemMeta (copy)
    KnitController.KnitStart(u7);
    default.Client:Get("FlyingLuckyBlockDestroy"):Connect(function(p8) -- Line: 47
        -- upvalues: u7 (copy), Flamework (ref)
        local v9 = u7.partMap[p8.uuid];

        if v9 ~= nil then
            v9:Destroy();
        end;

        u7.partMap[p8.uuid] = nil;
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. p8.uuid);
    end);
    default.Client:Get("FlyingLuckyBlockCreate"):Connect(function(p10) -- Line: 60
        -- upvalues: u7 (copy)
        u7:initializeFlyingLuckyBlock(p10.uuid, p10.serverInstance, p10.spawnPosition, p10.endPosition, p10.perchPosition, p10.height, p10.spawning, p10.direction);
    end);
    default.Client:Get("FlyingLuckyBlockBreak"):Connect(function() -- Line: 64
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.LUCKY_BLOCK_BREAK);
    end);
    default.Client:Get("FlyingLuckyBlockReceiveItem"):Connect(function(u11) -- Line: 68
        -- upvalues: ReplicatedStorage (ref), ItemUtil (ref), RuntimeLib (ref), KnitClient2 (ref), SoundManager (ref), GameSound (ref), Players (ref), getItemMeta (ref)
        local Character = u11.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if not Character then
            return nil;
        end;

        for _, v in u11.drops do
            local amount = v.amount;
            local v12 = math.floor(amount == nil and 1 or amount);
            local v13 = math.min(v12, 4);
            local v14 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(v.item);
            local u15 = ItemUtil.cloneItemIntoModel(v14);
            local blockWorldPos = u11.blockWorldPos;
            local v16 = false;
            local v17 = 0;
            local u18 = 0;

            while true do
                if true then
                    if v16 then
                        v17 = v17 + 1;
                    else
                        v16 = true;
                    end;
                end;

                if v17 >= v13 then
                    break;
                end;

                task.spawn(function() -- Line: 101
                    -- upvalues: RuntimeLib (ref), KnitClient2 (ref), u15 (copy), blockWorldPos (copy), Character (copy), SoundManager (ref), GameSound (ref), u11 (copy), Players (ref), u18 (ref), getItemMeta (ref), v (copy)
                    RuntimeLib.Promise.delay(math.random() * 0.2):await();
                    KnitClient2.Controllers.ReceiveItemEffectController:playEffect(u15, blockWorldPos, function() -- Line: 103
                        -- upvalues: Character (ref)
                        return Character.CFrame;
                    end, 0.5 + math.random() * 0.2):andThen(function(p19) -- Line: 106
                        -- upvalues: SoundManager (ref), GameSound (ref), u11 (ref), Players (ref), Character (ref), u18 (ref), getItemMeta (ref), v (ref)
                        if p19 then
                            local PICKUP_ITEM_DROP = GameSound.PICKUP_ITEM_DROP;
                            local v20 = {
                                volumeMultiplier = 0.8
                            };
                            local v21;

                            if u11.player == Players.LocalPlayer then
                                v21 = nil;
                            else
                                v21 = Character.Position;
                            end;

                            v20.position = v21;
                            local v22 = SoundManager:playSound(PICKUP_ITEM_DROP, v20);

                            if v22 then
                                local v23 = u18;
                                u18 = u18 + 1;
                                v22:setProperty("PlaybackSpeed", v23 / 50 + 1);
                            end;

                            local pickUpOverlaySound = getItemMeta(v.item).pickUpOverlaySound;

                            if pickUpOverlaySound ~= "" and pickUpOverlaySound then
                                local v24 = {
                                    volumeMultiplier = 0.9
                                };
                                local v25;

                                if u11.player == Players.LocalPlayer then
                                    v25 = nil;
                                else
                                    v25 = Character.Position;
                                end;

                                v24.position = v25;
                                local v26 = SoundManager:playSound(pickUpOverlaySound, v24);

                                if v26 then
                                    local v27 = u18;
                                    u18 = u18 + 1;
                                    v26:setProperty("PlaybackSpeed", v27 / 50 + 1);
                                end;
                            end;
                        end;
                    end);
                end);
            end;
        end;
    end);
end;

u4.initializeFlyingLuckyBlock = RuntimeLib.async(function(p28, p29, p30, p31, p32, p33, p34, p35, p36) -- Line: 140
    -- upvalues: FlyingLuckyBlockUtil (copy)
    local v37 = Vector3.new(p33.X, p34, p33.Z);

    if p35 then
        local v38 = p28:createFlyingLuckyBlockModel(p31, p31, p32, p30, p29);
        p28.partMap[p29] = v38;
        FlyingLuckyBlockUtil.moveFlyingLuckyBlock(v38, v37, false);
        FlyingLuckyBlockUtil.moveFlyingLuckyBlock(v38, p33, true);
        v38:Destroy();

        return;
    end;

    local v39 = p28:createFlyingLuckyBlockModel(p33, p31, p32, p30, p29);
    p28.partMap[p29] = v39;
    FlyingLuckyBlockUtil.moveFlyingLuckyBlock(v39, v37, true);
    FlyingLuckyBlockUtil.moveFlyingLuckyBlock(v39, p32, false);
    v39:Destroy();
end);

function u4.createFlyingLuckyBlockModel(p40, p41, p42, p43, p44, p45) -- Line: 166
    -- upvalues: ReplicatedStorage (copy), ItemType (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy)
    local u46 = ReplicatedStorage.Assets.Blocks:FindFirstChild(ItemType.FLYING_LUCKY_BLOCK);

    if u46 ~= nil then
        u46 = u46:Clone();
    end;

    u46.Parent = Workspace;
    u46:SetAttribute("NoNametag", true);
    u46:PivotTo(CFrame.new(p42, p43));
    local Rotation = u46:GetPivot().Rotation;
    u46:PivotTo(CFrame.new(p41) * Rotation);
    local Root = u46:FindFirstChild("Root");

    if Root ~= nil then
        Root = Root:FindFirstChild("Wings");

        if Root ~= nil then
            Root = Root:WaitForChild("AnimationController", 3);

            if Root ~= nil then
                Root = Root:WaitForChild("Animator", 3);
            end;
        end;
    end;

    if Root then
        local v47 = GameAnimationUtil:playAnimation(Root, AnimationType.FLYING_LUCKY_BLOCK_FLAP);

        if v47 ~= nil then
            v47:AdjustSpeed(0.5);
        end;

        if v47 ~= nil then
            v47.DidLoop:Connect(function() -- Line: 199
                -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), u46 (copy)
                SoundManager:playSound(RandomUtil.fromList(GameSound.FLYING_LUCKY_BLOCK_WING_FLAP_1, GameSound.FLYING_LUCKY_BLOCK_WING_FLAP_2), {
                    volumeMultiplier = 0.5,
                    position = u46:GetPivot().Position
                });
            end);
        end;
    end;

    p40:createEntityHealthbar(p45, u46, p44, nil, 60);

    return u46;
end;

function u4.createEntityHealthbar(p48, p49, p50, p51, p52, p53) -- Line: 211
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        app = StatefulEntityHpBarBillboard,
        appId = "StatefulEntityHpBarBillboard_" .. p49
    }, {
        hpBarOffset = Vector3.new(0, 3.5, 0),
        gameEntity = p50,
        serverInstance = p51,
        barColor = p52,
        maxDistance = p53
    }, nil, p50);
end;

KnitClient.CreateController(u4.new());

return nil;