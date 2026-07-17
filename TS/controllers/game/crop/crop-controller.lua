-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v6.Lighting;
local Players = v6.Players;
local TweenService = v6.TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ItemViewport = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local getCropConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "crop", "crop-meta").getCropConfig;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "CropController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 45
    -- upvalues: u7 (copy)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 49
    -- upvalues: KnitController (copy)
    KnitController.constructor(p9);
    p9.Name = "CropController";
end;

function u7.KnitStart(u10) -- Line: 53
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), SyncEventPriority (copy), getCropConfig (copy), BlockEngine (copy), ItemType (copy), Players (copy), default (copy), SoundManager (copy), GameSound (copy), u4 (copy), Lighting (copy), GameQueryUtil (copy), u5 (copy), Empty (copy), ItemViewport (copy), TweenService (copy), RuntimeLib (copy), CollectionTagAdded (copy), isUsingKit (copy), KnitClient (copy), u3 (copy), getItemMeta (copy), KnitClient2 (copy), GameAnimationUtil (copy), AnimationType (copy), BedwarsKitSkinMeta (copy), RandomUtil (copy), BedwarsKitSkin (copy)
    KnitController.KnitStart(u10);
    ClientSyncEvents.PlaceBlock:setPriority(SyncEventPriority.HIGHEST):connect(function(p11) -- Line: 56
        -- upvalues: getCropConfig (ref), BlockEngine (ref), ItemType (ref)
        if not getCropConfig(p11.blockType) then
            return nil;
        end;

        local v12 = BlockEngine:getStore():getBlockAt(p11.blockPosition - Vector3.new(0, 1, 0));

        if not v12 then
            p11:setCancelled(true);

            return nil;
        end;

        if getCropConfig(v12.Name) then
            p11:setCancelled(true);
        end;

        if v12.Name == ItemType.BED then
            p11:setCancelled(true);
        end;
    end);
    ClientSyncEvents.DamageBlock:connect(function(p13) -- Line: 78
        -- upvalues: BlockEngine (ref), u10 (copy), Players (ref)
        local v14 = BlockEngine:getStore():getBlockAt(p13.blockPosition);

        if v14 and not u10:canBreakCrop(Players.LocalPlayer, v14) then
            p13:setCancelled(true);

            return nil;
        end;
    end);
    default.Client:WaitFor("HarvestCrop"):andThen(function(p15) -- Line: 88
        -- upvalues: Players (ref), BlockEngine (ref), SoundManager (ref), GameSound (ref), u4 (ref), Lighting (ref), GameQueryUtil (ref), u5 (ref), Empty (ref), ItemViewport (ref), TweenService (ref), RuntimeLib (ref)
        p15:Connect(function(p16) -- Line: 89
            -- upvalues: Players (ref), BlockEngine (ref), SoundManager (ref), GameSound (ref), u4 (ref), Lighting (ref), GameQueryUtil (ref), u5 (ref), Empty (ref), ItemViewport (ref), TweenService (ref), RuntimeLib (ref)
            if Players.LocalPlayer.Character and Players.LocalPlayer:DistanceFromCharacter(BlockEngine:getWorldPosition(p16.blockPosition)) <= 100 then
                local v17 = p16.floatEffectItem or p16.itemType;
                local v18 = BlockEngine:getWorldPosition(p16.blockPosition);

                if p16.player ~= Players.LocalPlayer then
                    SoundManager:playSound(GameSound.CROP_HARVEST, {
                        position = v18
                    });
                end;

                local v19 = u4("Part", {
                    Name = "HarvestCropFloatEffect",
                    Size = Vector3.new(1, 1, 1),
                    Transparency = 1,
                    Anchored = true,
                    CanCollide = false,
                    CFrame = CFrame.new(v18),
                    Parent = Lighting
                });
                GameQueryUtil:setQueryIgnored(v19, true);
                local u20 = u5.createRef();
                local u21 = u5.mount(u5.createElement("BillboardGui", {
                    [u5.Ref] = u20,
                    Adornee = v19,
                    Size = UDim2.fromScale(2.5, 2.5),
                    LightInfluence = 0
                }, { u5.createElement(Empty, {
                        Size = UDim2.fromScale(1, 1),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5)
                    }, { u5.createElement(ItemViewport, {
                            ItemType = v17
                        }) }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));
                TweenService:Create(u20:getValue(), TweenInfo.new(0.7), {
                    StudsOffsetWorldSpace = Vector3.new(0, 3.2, 0)
                }):Play();
                RuntimeLib.Promise.delay(0.5):andThen(function() -- Line: 129
                    -- upvalues: TweenService (ref), u20 (copy)
                    TweenService:Create(u20:getValue(), TweenInfo.new(0.2), {
                        Size = UDim2.fromScale(0, 0)
                    }):Play();
                end);
                RuntimeLib.Promise.delay(1.5):andThen(function() -- Line: 136
                    -- upvalues: u5 (ref), u21 (copy)
                    u5.unmount(u21);
                end);
            end;
        end);
    end);
    CollectionTagAdded("HarvestableCrop", function(u22) -- Line: 144
        -- upvalues: Players (ref), getCropConfig (ref), isUsingKit (ref), KnitClient (ref), u3 (ref), getItemMeta (ref), KnitClient2 (ref), GameAnimationUtil (ref), AnimationType (ref), ItemType (ref), GameSound (ref), BedwarsKitSkinMeta (ref), RandomUtil (ref), SoundManager (ref), BedwarsKitSkin (ref), default (ref), BlockEngine (ref)
        local v23 = Players:GetPlayerByUserId((u22:GetAttribute("PlacedByUserId")));
        local v24 = getCropConfig(u22.Name);
        local v25;

        if v24 == nil then
            v25 = v24;
        else
            v25 = v24.requireKit;
        end;

        if v25 and not isUsingKit(Players.LocalPlayer, v24.requireKit) then
            return nil;
        end;

        local v26 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);
        local v27;

        if v23 == nil then
            v27 = nil;
        else
            v27 = KnitClient.Controllers.TeamController:getPlayerTeam(v23);
        end;

        if v27 ~= v26 then
            return nil;
        end;

        if v24 ~= nil then
            v24 = v24.disableTeammatePickup;
        end;

        if v24 and v23 ~= Players.LocalPlayer then
            return nil;
        end;

        local v28 = u3.new();
        local v29 = getItemMeta(u22.Name);
        v28:GiveTask(KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Harvest",
            HoldDuration = 0,
            RequiresLineOfSight = false,
            MaxActivationDistance = 6,
            ObjectText = v29.displayName,
            Parent = u22
        }).Triggered:Connect(function(p30) -- Line: 185
            -- upvalues: GameAnimationUtil (ref), AnimationType (ref), u22 (copy), ItemType (ref), GameSound (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), RandomUtil (ref), SoundManager (ref), BedwarsKitSkin (ref), default (ref), BlockEngine (ref)
            GameAnimationUtil:playAnimation(p30, AnimationType.PUNCH);

            if u22.Name == ItemType.CHICKEN_EGG_BLOCK then
                local CHICKEN_ATTACK_1 = GameSound.CHICKEN_ATTACK_1;

                if p30 then
                    local taliyah = BedwarsKitSkinMeta[KnitClient.Controllers.KitController:getKitSkin(p30)].taliyah;
                    local v31;

                    if taliyah == nil then
                        v31 = taliyah;
                    else
                        v31 = taliyah.entity;

                        if v31 ~= nil then
                            v31 = v31.sounds;

                            if v31 ~= nil then
                                v31 = v31.attack;
                            end;
                        end;
                    end;

                    if v31 then
                        CHICKEN_ATTACK_1 = RandomUtil.fromList(unpack(taliyah.entity.sounds.attack));
                    end;
                end;

                SoundManager:playSound(CHICKEN_ATTACK_1);
            elseif u22:GetAttribute("CropKitSkin") == BedwarsKitSkin.FARMER_CLETUS_VALENTINE then
                SoundManager:playSound(GameSound.VALENTINE_CROP_HARVEST);
            else
                SoundManager:playSound(GameSound.CROP_HARVEST);
            end;

            default.Client:Get("CropHarvest"):CallServer({
                position = BlockEngine:getBlockPosition(u22.Position)
            });
        end));
    end);
end;

function u7.canBreakCrop(p32, p33, p34) -- Line: 220
    -- upvalues: getCropConfig (copy), Players (copy), KnitClient (copy)
    if getCropConfig(p34.Name) then
        local v35 = p34:GetAttribute("PlacedByUserId");
        local v36 = v35 ~= 0 and (v35 == v35 and (v35 and Players:GetPlayerByUserId(v35)));

        if v36 then
            return KnitClient.Controllers.TeamController:getPlayerTeam(v36) ~= KnitClient.Controllers.TeamController:getPlayerTeam(p33) and true or p33.UserId == v35;
        end;
    end;

    return true;
end;

return {
    CropController = KnitClient.CreateController(u7.new())
};