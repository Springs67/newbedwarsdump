-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local ColorUtil = v1.ColorUtil;
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InOutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = ConstantManager.registerConstants(script, {
    P1XRange = NumberRange.new(-30, 30),
    P1YRange = NumberRange.new(-15, 15),
    P1ZRange = NumberRange.new(-15, 15)
});
local u5 = { GameSound.PENGUIN_ATTACK_1, GameSound.PENGUIN_ATTACK_2, GameSound.PENGUIN_ATTACK_3 };
local u6 = {
    GameSound.PENGUIN_DAMAGED_5,
    GameSound.PENGUIN_DAMAGED_6,
    GameSound.PENGUIN_DAMAGED_7,
    GameSound.PENGUIN_DAMAGED_8
};
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 44, Name: __tostring
        return "PenguinCatchingEventController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 50
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 54
    -- upvalues: KnitController (copy)
    KnitController.constructor(p9);
    p9.Name = "PenguinCatchingEventController";
    p9.nextCheck = -1;
    p9.cooldown = 0.3;
    p9.random = Random.new();
end;

function u7.KnitStart(u10) -- Line: 61
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), Flamework (copy), CooldownId (copy), getItemMeta (copy), ItemType (copy), default2 (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), Workspace (copy), EventMeta (copy), EventType (copy), Players (copy), ItemUtil (copy), CollectionTagAdded (copy), EntityUtil (copy), u2 (copy), RandomUtil (copy), u5 (copy), u6 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), ColorUtil (copy)
    KnitController.KnitStart(u10);
    ClientSyncEvents.ProjectileLaunched:connect(function(p11) -- Line: 63
        -- upvalues: Flamework (ref), CooldownId (ref), getItemMeta (ref), ItemType (ref)
        if p11:isLocalShooter() and p11.projectileType == "penguin_web" then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.WEB_LAUNCHER, getItemMeta(ItemType.WEB_LAUNCHER).projectileSource.fireDelaySec);
        end;
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p12) -- Line: 68
        -- upvalues: Flamework (ref), CooldownId (ref), getItemMeta (ref), ItemType (ref)
        if p12:isLocalShooter() and p12.projectileType == "big_web" then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.BIG_WEB_LAUNCHER, getItemMeta(ItemType.BIG_WEB_LAUNCHER).projectileSource.fireDelaySec);
        end;
    end);
    default2.Client:Get("WebHitPlayer"):Connect(function(p13) -- Line: 73
        -- upvalues: ReplicatedStorage (ref), SoundManager (ref), GameSound (ref), Workspace (ref)
        local u14 = ReplicatedStorage.Assets.Effects.PenguinWebEffect:Clone();
        u14.Size = u14.Size * 2;
        local Character = p13.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if not Character then
            return nil;
        end;

        SoundManager:playSound(GameSound.WEB_CAUGHT, {
            position = Character
        });
        u14.Position = Character - Vector3.new(0, 1, 0);
        u14.Parent = Workspace;
        task.delay(0.75, function() -- Line: 93
            -- upvalues: u14 (copy)
            u14:Destroy();
        end);
    end);

    if not EventMeta[EventType.PENGUIN_CATCHING_LOBBY_EVENT].active then
        return false;
    end;

    default2.Client:OnEvent("PlunderProc", function(p15, p16, p17, p18) -- Line: 101
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), u10 (copy), ReplicatedStorage (ref), ItemUtil (ref), getItemMeta (ref)
        local PrimaryPart = p15.PrimaryPart;

        if not PrimaryPart then
            return nil;
        end;

        local u19 = p15 == Players.LocalPlayer.Character;

        if u19 and not p18 then
            SoundManager:playSound(GameSound.CONFETTI);
        end;

        local u20 = 0;
        local Position = PrimaryPart.Position;

        if u10.eventNpcPosition then
            Position = u10.eventNpcPosition;
        end;

        Players:GetPlayerFromCharacter(p15);

        for _, v in p16 do
            local v21 = math.min(v.amount, 5);
            local v22 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(v.itemType);
            local u23 = ItemUtil.cloneItemIntoModel(v22);
            local v24 = false;
            local v25 = 0;

            while true do
                if true then
                    if v24 then
                        v25 = v25 + 1;
                    else
                        v24 = true;
                    end;
                end;

                if v25 >= math.ceil(v21) then
                    break;
                end;

                task.spawn(function() -- Line: 132
                    -- upvalues: u10 (ref), u23 (copy), Position (ref), PrimaryPart (copy), SoundManager (ref), GameSound (ref), u19 (copy), u20 (ref), getItemMeta (ref), v (copy)
                    task.wait(math.random() * 0.2);
                    u10:playEffect(u23, Position, function() -- Line: 134
                        -- upvalues: PrimaryPart (ref)
                        return PrimaryPart.CFrame;
                    end, 0.5 + math.random() * 0.2):andThen(function(p26) -- Line: 137
                        -- upvalues: SoundManager (ref), GameSound (ref), u19 (ref), PrimaryPart (ref), u20 (ref), getItemMeta (ref), v (ref)
                        if p26 then
                            local PICKUP_ITEM_DROP = GameSound.PICKUP_ITEM_DROP;
                            local v27 = {
                                volumeMultiplier = 0.8
                            };
                            local v28;

                            if u19 then
                                v28 = nil;
                            else
                                v28 = PrimaryPart.Position;
                            end;

                            v27.position = v28;
                            local v29 = u20;
                            u20 = u20 + 1;
                            v27.playbackSpeedMultiplier = v29 / 50 + 1;
                            SoundManager:playSound(PICKUP_ITEM_DROP, v27);
                            local pickUpOverlaySound = getItemMeta(v.itemType).pickUpOverlaySound;

                            if pickUpOverlaySound ~= "" and pickUpOverlaySound then
                                local v30 = {
                                    volumeMultiplier = 0.9
                                };
                                local v31;

                                if u19 then
                                    v31 = nil;
                                else
                                    v31 = PrimaryPart.Position;
                                end;

                                v30.position = v31;
                                local v32 = u20;
                                u20 = u20 + 1;
                                v30.playbackSpeedMultiplier = v32 / 50 + 1;
                                SoundManager:playSound(pickUpOverlaySound, v30);
                            end;
                        end;
                    end);
                end);
            end;
        end;
    end);
    CollectionTagAdded("LobbyBabyPenguin", function(u33) -- Line: 188
        -- upvalues: EntityUtil (ref), SoundManager (ref), GameSound (ref), u2 (ref), Workspace (ref), RandomUtil (ref), u5 (ref)
        local u34 = EntityUtil:getEntity(u33);
        local PrimaryPart = u33.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if PrimaryPart then
            SoundManager:playSound(GameSound.PENGUIN_SQUAWK_1, {
                position = PrimaryPart
            });
        end;

        u2("Highlight", {
            Name = "PenguinHighlight",
            FillTransparency = 0.7,
            OutlineTransparency = 0.2,
            FillColor = Color3.fromRGB(255, 61, 0),
            OutlineColor = Color3.fromRGB(255, 0, 0),
            Parent = u33,
            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        });
        task.spawn(function() -- Line: 209
            -- upvalues: u34 (copy), u33 (copy), Workspace (ref), SoundManager (ref), RandomUtil (ref), u5 (ref), PrimaryPart (copy)
            while true do
                local v35 = task.wait(math.random(5, 10));

                if v35 == 0 or (v35 ~= v35 or not v35) then
                    break;
                end;

                local v36 = u34;

                if v36 ~= nil then
                    v36 = v36:isDead();
                end;

                if v36 or (u33.Parent ~= Workspace and true or not u34) then
                    break;
                end;

                SoundManager:playSound(RandomUtil.fromList(unpack(u5)), {
                    position = PrimaryPart
                });
            end;
        end);
    end);
    default2.Client:Get("PenguinCaptured"):Connect(function(p37) -- Line: 232
        -- upvalues: ReplicatedStorage (ref), SoundManager (ref), RandomUtil (ref), u6 (ref), GameSound (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), u2 (ref), ColorUtil (ref)
        local v38 = ReplicatedStorage.Assets.Effects.PenguinWebEffect:Clone();
        local PrimaryPart = p37.penguinModel.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if not PrimaryPart then
            return nil;
        end;

        SoundManager:playSound(RandomUtil.fromList(unpack(u6)), {
            position = PrimaryPart
        });
        SoundManager:playSound(GameSound.WEB_CAUGHT, {
            position = PrimaryPart
        });
        v38.Position = PrimaryPart;
        v38.Parent = p37.penguinModel;
        AnimationUtil:playAnimation(p37.penguinModel, GameAnimationUtil:getAssetId(AnimationType.PENGUIN_IDLE_2), {
            looped = true
        });
        u2("BillboardGui", {
            StudsOffset = Vector3.new(0, 3, 0),
            Brightness = 1.5,
            ResetOnSpawn = false,
            Size = UDim2.new(4, 20, 4, 20),
            Parent = p37.penguinModel.PrimaryPart,
            Children = { u2("TextLabel", {
                    Name = "Name",
                    TextSize = 14,
                    RichText = true,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 10,
                    Text = "Caught by " .. p37.player.Name,
                    Size = UDim2.fromScale(1, 0.25),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    Font = Enum.Font.Arial
                }) }
        });
    end);
end;

u7.playEffect = RuntimeLib.async(function(p39, p40, u41, u42, p43, p44) -- Line: 277
    -- upvalues: Workspace (copy), u4 (copy), GameQueryUtil (copy), default (copy), InOutQuad (copy)
    local v45 = Workspace:GetServerTimeNow();

    if p44 == 0 or (p44 ~= p44 or not p44) then
        p44 = v45;
    end;

    local v46 = v45 - p44;
    local v47 = u42();

    if not v47 then
        return false;
    end;

    local Position = (v47 * CFrame.new(p39.random:NextNumber(u4.P1XRange.Min, u4.P1XRange.Max), p39.random:NextNumber(u4.P1YRange.Min, u4.P1YRange.Max), p39.random:NextNumber(u4.P1ZRange.Min, u4.P1ZRange.Max))):Lerp(v47, 0.5).Position;
    local u48 = p40:Clone();

    local function _(p49) -- Line: 291
        -- upvalues: GameQueryUtil (ref)
        return GameQueryUtil:setQueryIgnored(p49, true);
    end;

    for i, descendant in u48:GetDescendants() do
        local _ = i - 1;
        GameQueryUtil:setQueryIgnored(descendant, true);
    end;

    u48.Parent = Workspace;
    default(p43 - v46, InOutQuad, function(p50) -- Line: 298
        -- upvalues: u42 (copy), u41 (copy), Position (copy), u48 (ref)
        local v51 = u42();

        if v51 ~= nil then
            v51 = v51.Position;
        end;

        if not v51 then
            return nil;
        end;

        local v52 = u41:Lerp(Position, p50):Lerp(Position:Lerp(v51, p50), p50);
        u48:PivotTo(CFrame.new(v52) * CFrame.Angles(0, 6.283185307179586 * p50, 0));
    end, v46, 1):Wait();
    u48:Destroy();

    return true;
end);
KnitClient.CreateController(u7.new());

return nil;