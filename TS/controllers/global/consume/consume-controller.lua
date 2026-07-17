-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityDisabled = v1.AbilityDisabled;
local ClickHold = v1.ClickHold;
local MobileButton = v1.MobileButton;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local UserInputService = v4.UserInputService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local ConsumeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "consume-util").ConsumeUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "ConsumeController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 39
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 43
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p7);
    p7.Name = "ConsumeController";
    p7.maid = u2.new();
    p7.lastDisabledNotification = 0;
end;

function u5.KnitStart(u8) -- Line: 49
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), SyncEventPriority (copy)
    HandKnitController.KnitStart(u8);
    ClientSyncEvents.StartConsuming:setPriority(SyncEventPriority.HIGHEST + 1):connect(function(p9) -- Line: 51
        -- upvalues: u8 (copy)
        if p9:isCancelled() then
            return nil;
        end;

        if u8:isConsumeDisabled(p9.itemType, true) then
            p9:setCancelled(true);
        end;
    end);
end;

function u5.isConsumeDisabled(u10, p11, p12) -- Line: 60
    -- upvalues: EntityUtil (copy), getItemMeta (copy), StatusEffectUtil (copy), u2 (copy), Flamework (copy), u3 (copy), AbilityDisabled (copy)
    local v13 = EntityUtil:getLocalPlayerEntity();
    local v14 = getItemMeta(p11);

    if v14 ~= nil then
        v14 = v14.consumable;

        if v14 ~= nil then
            v14 = v14.blockingStatusEffects;
        end;
    end;

    if v13 and (v14 and StatusEffectUtil:hasAnyActive(v13:getInstance(), v14)) then
        if p12 and not u10.disabledActionBarMaid then
            local u15 = time();
            u10.lastDisabledNotification = u15;
            u10.disabledActionBarMaid = u2.new();
            u10.disabledActionBarMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u3.createElement(AbilityDisabled)));
            u10.disabledActionBarMaid:GiveTask(function() -- Line: 76
                -- upvalues: u10 (copy)
                u10.disabledActionBarMaid = nil;
            end);
            task.delay(1.5, function() -- Line: 79
                -- upvalues: u10 (copy), u15 (copy)
                if u10.lastDisabledNotification ~= u15 then
                    return nil;
                end;

                local disabledActionBarMaid = u10.disabledActionBarMaid;

                if disabledActionBarMaid ~= nil then
                    disabledActionBarMaid:DoCleaning();
                end;
            end);
        end;

        return true;
    end;
end;

function u5.isRelevantItem(p16, p17) -- Line: 92
    -- upvalues: ConsumeUtil (copy)
    return ConsumeUtil:isConsumable(p17.itemType);
end;

function u5.onEnable(u18, u19) -- Line: 95
    -- upvalues: getItemMeta (copy), u2 (copy), ClientSyncEvents (copy), ClickHold (copy), default (copy), EntityUtil (copy), KnitClient (copy), RuntimeLib (copy), GameSound (copy), SoundManager (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), EntityDamageEventZap (copy), Flamework (copy), UserInputService (copy), u3 (copy), MobileButton (copy), BedwarsImageId (copy)
    u18.maid:DoCleaning();
    local u20 = getItemMeta(u19.itemType);

    if not u20.consumable then
        return nil;
    end;

    local u21 = u2.new();
    local u22 = false;
    local u23 = nil;
    local u24 = nil;
    local consumeTime = ClientSyncEvents.ConsumableConsumeTimeModifierCheck:fire(u20.consumable.consumeTime).consumeTime;
    local u25 = ClickHold.new(consumeTime, u20.consumable.closeOnComplete);
    local u26 = nil;
    local u27 = nil;
    u25:setOnComplete(function() -- Line: 109
        -- upvalues: u21 (copy), u18 (copy), u19 (copy), u26 (ref), ClientSyncEvents (ref), u22 (ref), u23 (ref), u24 (ref), u27 (ref), default (ref)
        u21:DoCleaning();

        if u18:isConsumeDisabled(u19.itemType, true) then
            u26();
            ClientSyncEvents.StopConsuming:fire(u19.itemType, false);

            return nil;
        end;

        ClientSyncEvents.StopConsuming:fire(u19.itemType, true);
        u22 = false;
        local v28 = u23;

        if v28 ~= nil then
            v28:Stop();
        end;

        local v29 = u24;

        if v29 ~= nil then
            v29:Stop();
        end;

        u27 = -1;
        default.Client:Get("ConsumeItem"):CallServerAsync({
            item = u19.tool
        }):andThen(function() -- Line: 131
        end):catch(function(p30) -- Line: 132
            warn(p30);
        end);
    end);
    u18.maid:GiveTask(function() -- Line: 136
        -- upvalues: u25 (copy)
        u25:disable();
    end);
    u27 = -1;

    local function startConsuming() -- Line: 140
        -- upvalues: u20 (copy), EntityUtil (ref), u21 (copy), KnitClient (ref), u22 (ref), u27 (ref), ClientSyncEvents (ref), u19 (copy), u26 (ref), RuntimeLib (ref), GameSound (ref), u24 (ref), SoundManager (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref), u23 (ref), u25 (copy)
        local consumable = u20.consumable;

        if consumable ~= nil then
            consumable = consumable.requiresMissingHealth;
        end;

        if consumable then
            local v31 = EntityUtil:getLocalPlayerEntity();

            if v31 and v31:getHealth() >= v31:getMaxHealth() then
                return nil;
            end;
        end;

        local consumable2 = u20.consumable;

        if consumable2 ~= nil then
            consumable2 = consumable2.disableJump;
        end;

        if consumable2 then
            local v32 = EntityUtil:getLocalPlayerEntity();

            if not v32 then
                return nil;
            end;

            local u33 = v32:getHumanoid();

            if u33 then
                local JumpHeight = u33.JumpHeight;
                u21:GiveTask(function() -- Line: 163
                    -- upvalues: u33 (copy), JumpHeight (copy)
                    u33.JumpHeight = JumpHeight;
                end);
                u33.JumpHeight = 0;
            end;
        end;

        local v34 = KnitClient.Controllers.SprintController:getMovementStatusModifier();
        local v35 = {
            blockSprint = true
        };
        local consumable3 = u20.consumable;

        if consumable3 ~= nil then
            consumable3 = consumable3.walkSpeedMultiplier;
        end;

        v35.moveSpeedMultiplier = consumable3 == nil and 0.5 or consumable3;
        u21:GiveTask(v34:addModifier(v35));
        u22 = true;
        local u36 = tick();
        u27 = u36;

        if ClientSyncEvents.StartConsuming:fire(u19.itemType):isCancelled() then
            u26();

            return nil;
        end;

        RuntimeLib.Promise.defer(function() -- Line: 193
            -- upvalues: u20 (ref), GameSound (ref), u24 (ref), SoundManager (ref), u27 (ref), u36 (copy)
            local consumable4 = u20.consumable;

            if consumable4 ~= nil then
                consumable4 = consumable4.soundOverride;
            end;

            if consumable4 ~= "None" then
                local v37;

                repeat
                    local consumable5 = u20.consumable;

                    if consumable5 ~= nil then
                        consumable5 = consumable5.soundOverride;
                    end;

                    if consumable5 == nil then
                        consumable5 = GameSound.EAT_FOOD_1;
                    end;

                    u24 = SoundManager:playSound(consumable5);
                    v37 = task.wait(0.23);

                    if v37 ~= 0 and (v37 == v37 and v37) then
                        v37 = u27 == u36;

                        if v37 then
                            local consumable6 = u20.consumable;

                            if consumable6 ~= nil then
                                consumable6 = consumable6.disableSoundRepeat;
                            end;

                            v37 = consumable6 ~= true;
                        end;
                    end;
                until v37 == 0 or (v37 ~= v37 or not v37);
            end;
        end);
        RuntimeLib.Promise.defer(function() -- Line: 226
            -- upvalues: u20 (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref), u23 (ref), u22 (ref)
            local consumable4 = u20.consumable;

            if consumable4 ~= nil then
                consumable4 = consumable4.disableAnimation;
            end;

            if consumable4 ~= true then
                local consumable5 = u20.consumable;

                if consumable5 ~= nil then
                    consumable5 = consumable5.animationOverride;
                end;

                if consumable5 == nil then
                    consumable5 = AnimationType.EAT;
                end;

                u23 = GameAnimationUtil:playAnimation(Players.LocalPlayer, consumable5, {
                    looped = true
                });

                if not u22 then
                    local v38 = u23;

                    if v38 ~= nil then
                        v38:Stop();
                    end;
                end;
            end;
        end);
        u25:startClick();
    end;

    u26 = function() -- Line: 255, Name: stopConsuming
        -- upvalues: u21 (copy), u22 (ref), u27 (ref), u25 (copy), u23 (ref), u24 (ref)
        u21:DoCleaning();
        u22 = false;
        u27 = -1;
        u25:endClick();
        local v39 = u23;

        if v39 ~= nil then
            v39:Stop();
        end;

        local v40 = u24;

        if v40 ~= nil then
            v40:Stop();
        end;
    end;

    u18.maid:GiveTask(function() -- Line: 269
        -- upvalues: u26 (ref)
        u26();
    end);

    if u20.consumable.cancelOnDamage then
        task.spawn(function() -- Line: 273
            -- upvalues: EntityDamageEventZap (ref), Players (ref), ClientSyncEvents (ref), u19 (copy), u25 (copy), u26 (ref), u18 (copy)
            local u55 = EntityDamageEventZap.On(function(p41, p42, p43, p44, p45, p46, p47, p48, p49, p50, p51, p52, p53, p54) -- Line: 274
                -- upvalues: Players (ref), ClientSyncEvents (ref), u19 (ref), u25 (ref), u26 (ref)
                if p41 == Players.LocalPlayer.Character then
                    ClientSyncEvents.StopConsuming:fire(u19.itemType, false);
                    u25:cancelClick();
                    u26();
                end;
            end);
            u18.maid:GiveTask(function() -- Line: 281
                -- upvalues: u55 (copy)
                u55();
            end);
        end);
    end;

    local v59 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "consume-item",

        boundFunction = function(p56, p57, p58) -- Line: 291, Name: boundFunction
            -- upvalues: startConsuming (copy), u26 (ref), ClientSyncEvents (ref), u19 (copy)
            if p57 == Enum.UserInputState.Begin then
                startConsuming();

                return;
            end;

            if p57 == Enum.UserInputState.End then
                u26();
                ClientSyncEvents.StopConsuming:fire(u19.itemType, false);
            end;
        end
    });
    u18.maid:GiveTask(v59);

    if UserInputService.TouchEnabled then
        u18:setupYield(function() -- Line: 303
            -- upvalues: KnitClient (ref), u3 (ref), MobileButton (ref), BedwarsImageId (ref), Flamework (ref), startConsuming (copy), u26 (ref), ClientSyncEvents (ref), u19 (copy), Players (ref)
            KnitClient.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():await();
            local u60 = u3.mount(u3.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u3.createElement(MobileButton, {
                    Image = BedwarsImageId.CONSUME_MOBILE,
                    Position = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("Consume"),
                    Size = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("Consume"),

                    OnPressDown = function() -- Line: 312, Name: OnPressDown
                        -- upvalues: startConsuming (ref)
                        startConsuming();
                    end,

                    OnPressUp = function() -- Line: 315, Name: OnPressUp
                        -- upvalues: u26 (ref), ClientSyncEvents (ref), u19 (ref)
                        u26();
                        ClientSyncEvents.StopConsuming:fire(u19.itemType, false);
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 321
                -- upvalues: u3 (ref), u60 (copy)
                u3.unmount(u60);
            end;
        end);
    end;
end;

function u5.onDisable(p61) -- Line: 327
    p61.maid:DoCleaning();
end;

return {
    ConsumeController = KnitClient.CreateController(u5.new())
};