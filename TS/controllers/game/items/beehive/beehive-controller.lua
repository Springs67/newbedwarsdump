-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "BeehiveController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 27
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "BeehiveController";
    p7.beehiveData = {};
end;

function u5.KnitStart(u8) -- Line: 36
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), u3 (copy), SoundManager (copy), GameSound (copy), CollectionService (copy)
    KnitController.KnitStart(u8);
    WatchCollectionTag("beehive", function(u9) -- Line: 38
        -- upvalues: u3 (ref), u8 (copy), SoundManager (ref), GameSound (ref)
        local v10 = u3.new();
        u8.beehiveData[u9] = {
            bees = {},
            maid = v10
        };
        v10:GiveTask(function() -- Line: 47
            -- upvalues: u8 (ref), u9 (copy)
            local v11 = u8.beehiveData[u9];

            if v11 ~= nil then
                v11 = v11.bees;
            end;

            if v11 then
                for _, v in v11 do
                    v:Destroy();
                end;
            end;
        end);
        local v12 = u8:getBeehiveSoundConfig(u9);

        if v12 ~= nil then
            v12 = v12.hiveLoop;
        end;

        if v12 == nil then
            v12 = GameSound.HIVE_LOOP;
        end;

        v10:GiveTask(SoundManager:playSound(v12, {
            looped = true,
            position = u9.Position,
            parent = u9
        }));
        v10:GiveTask(u9:GetAttributeChangedSignal("Level"):Connect(function() -- Line: 76
            -- upvalues: SoundManager (ref), u8 (ref), u9 (copy), GameSound (ref)
            local v13 = u8:getBeehiveSoundConfig(u9);

            if v13 ~= nil then
                v13 = v13.depositBee;
            end;

            SoundManager:playRandomSound(v13 == nil and { GameSound.DEPOSIT_BEE } or v13, {
                position = u9.Position,
                parent = u9
            });
            u9.LevelUpParticles:Emit(10);
            u8:reconcileBeesAroundHive(u9, u9:GetAttribute("Level"));
        end));
    end);
    CollectionService:GetInstanceRemovedSignal("beehive"):Connect(function(p14) -- Line: 94
        -- upvalues: u8 (copy)
        local v15 = u8.beehiveData[p14];

        if v15 ~= nil then
            v15.maid:DoCleaning();
        end;

        u8.beehiveData[p14] = nil;
    end);
end;

function u5.reconcileBeesAroundHive(p16, p17, p18) -- Line: 103
    -- upvalues: KnitClient2 (copy), GameSound (copy)
    local v19 = p16.beehiveData[p17];

    if v19 == nil then
        error("beehive is not key of this.beehiveData. somebody did something dumb if you see this");
    end;

    local v20 = math.floor(p18 / 2);
    local v21 = v20 - #v19.bees;

    if v20 > 7 then
        return nil;
    end;

    if v21 > 0 then
        local v22 = false;
        local v23 = 0;

        while true do
            if true then
                if v22 then
                    v23 = v23 + 1;
                else
                    v22 = true;
                end;
            end;

            if v23 >= v21 then
                break;
            end;

            local BeeController = KnitClient2.Controllers.BeeController;
            local v24 = {
                id = -1,
                maxDistanceFromOrigin = 2,
                includeProximityPrompt = false,
                scale = 0.55,
                origin = p17.Position,
                beeModel = p16:getHiveBeeModel(p17)
            };
            local v25 = p16:getBeehiveSoundConfig(p17);

            if v25 ~= nil then
                v25 = v25.beeLoop;
            end;

            if v25 == nil then
                v25 = GameSound.BEE_LOOP;
            end;

            v24.beeLoopSound = v25;
            local v26 = BeeController:createLocalBee(v24);
            table.insert(v19.bees, v26);
        end;
    elseif v21 <= 0 then
        local v27 = false;
        local v28 = 0;

        while true do
            if true then
                if v27 then
                    v28 = v28 + 1;
                else
                    v27 = true;
                end;
            end;

            if v28 >= math.abs(v21) then
                break;
            end;

            local bees = v19.bees;
            local v29 = #bees;
            local v30 = bees[v29];
            bees[v29] = nil;

            if v30 ~= nil then
                v30:Destroy();
            end;
        end;
    end;
end;

function u5.getHiveBeeModel(p31, p32) -- Line: 182
    -- upvalues: KnitClient2 (copy), ReplicatedStorage (copy)
    local v33 = p31:getBeehiveOwner(p32);
    local v34;

    if v33 then
        v34 = KnitClient2.Controllers.KitSkinController:getPlayerKitSkinMeta(v33);

        if v34 ~= nil then
            v34 = v34.beekeeper;

            if v34 ~= nil then
                v34 = v34.beeModel;

                if v34 ~= nil then
                    v34 = v34:Clone();
                end;
            end;
        end;
    else
        v34 = nil;
    end;

    if v34 == nil then
        v34 = ReplicatedStorage.Assets.Effects.Bee:Clone();
    end;

    return v34;
end;

function u5.getBeehiveSoundConfig(p35, p36) -- Line: 206
    -- upvalues: KnitClient2 (copy)
    local v37 = p35:getBeehiveOwner(p36);

    if not v37 then
        return nil;
    end;

    local v38 = KnitClient2.Controllers.KitSkinController:getPlayerKitSkinMeta(v37);

    if v38 ~= nil then
        v38 = v38.beekeeper;

        if v38 ~= nil then
            v38 = v38.sounds;
        end;
    end;

    return v38;
end;

function u5.getBeehiveOwner(p39, p40) -- Line: 223
    -- upvalues: Players (copy)
    return Players:GetPlayerByUserId(p40:GetAttribute("PlacedByUserId"));
end;

KnitClient.CreateController(u5.new());

return nil;