-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockBreaker = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "break", "block-breaker").BlockBreaker;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameCoreClientSyncEvents = v1.GameCoreClientSyncEvents;
local preloadImages = v1.preloadImages;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local t = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientBlockEngine = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-break-util");
local DEFAULT_BREAK_COOLDOWN = v3.DEFAULT_BREAK_COOLDOWN;
local DEFAULT_BREAK_RANGE = v3.DEFAULT_BREAK_RANGE;
local EnchantBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "BlockBreakController";
    end,

    __index = HandKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 38
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 42
    -- upvalues: HandKnitController (copy), Flamework (copy), u2 (copy), BlockBreaker (copy), ClientBlockEngine (copy), DEFAULT_BREAK_COOLDOWN (copy), DEFAULT_BREAK_RANGE (copy)
    HandKnitController.constructor(p6);
    p6.Name = "BlockBreakController";
    p6.mobileLayoutController = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController");
    p6.maid = u2.new();
    p6.blockBreaker = BlockBreaker.new(ClientBlockEngine);
    p6.cooldown = DEFAULT_BREAK_COOLDOWN;
    p6.range = DEFAULT_BREAK_RANGE;
end;

function u4.KnitStart(u7) -- Line: 51
    -- upvalues: HandKnitController (copy), preloadImages (copy), BedwarsImageId (copy), ClientSyncEvents (copy), Setting (copy), t (copy), GameCoreClientSyncEvents (copy)
    HandKnitController.KnitStart(u7);
    preloadImages({
        BedwarsImageId.BLOCK_DAMAGED_1,
        BedwarsImageId.BLOCK_DAMAGED_2,
        BedwarsImageId.BLOCK_DAMAGED_3,
        BedwarsImageId.BLOCK_DAMAGED_4
    });
    ClientSyncEvents.SettingChanged:connect(function(p8) -- Line: 54
        -- upvalues: Setting (ref), t (ref), u7 (copy)
        if p8.setting ~= Setting.MOBILE_BLOCK_BREAK_BUTTON then
            return nil;
        end;

        if not t.boolean(p8.value) then
            return nil;
        end;

        u7.blockBreaker.shouldDisplayMobileBtn = p8.value;

        if u7:isEnabled() then
            if p8.value then
                u7.blockBreaker:displayMobileBreakButton();

                return;
            end;

            u7.blockBreaker:hideMobileBreakButton();
        end;
    end);
    GameCoreClientSyncEvents.MobileLayoutRegistered:connect(function() -- Line: 72
        -- upvalues: u7 (copy)
        local v9 = u7.mobileLayoutController:getLayoutDimensions("BlockBreak");

        if v9.position then
            u7.blockBreaker:setBlockBreakLayout(v9.position, v9.size);

            if u7.blockBreaker.shouldDisplayMobileBtn and u7:isEnabled() then
                u7.blockBreaker:hideMobileBreakButton();
                u7.blockBreaker:displayMobileBreakButton();
            end;
        end;
    end);
end;

function u4.isRelevantItem(p10, p11) -- Line: 85
    -- upvalues: getItemMeta (copy)
    return getItemMeta(p11.itemType).breakBlock and true or false;
end;

function u4.onEnable(u12) -- Line: 92
    -- upvalues: getItemMeta (copy), DEFAULT_BREAK_COOLDOWN (copy), DEFAULT_BREAK_RANGE (copy), EntityUtil (copy), Players (copy), StatusEffectUtil (copy), StatusEffectType (copy), EnchantBalance (copy), AnimationType (copy), KnitClient (copy), DeviceUtil (copy)
    u12.blockBreaker:disable();
    u12.blockBreaker:enable();
    local v13 = u12:getHandItem();

    if v13 ~= nil then
        v13 = v13.itemType;
    end;

    local v14;

    if v13 then
        v14 = getItemMeta(v13);
    else
        v14 = nil;
    end;

    local v15;

    if v14 == nil then
        v15 = v14;
    else
        v15 = v14.breakBlockCooldown;
    end;

    if v15 == 0 or (v15 ~= v15 or not v15) then
        v15 = DEFAULT_BREAK_COOLDOWN;
    end;

    u12.cooldown = v15;

    if v14 ~= nil then
        v14 = v14.breakBlockRange;
    end;

    if v14 == 0 or (v14 ~= v14 or not v14) then
        v14 = DEFAULT_BREAK_RANGE;
    end;

    u12.range = v14;
    u12.blockBreaker:setCooldown(u12.cooldown);
    local v16 = EntityUtil:getEntity(Players.LocalPlayer);

    if v16 ~= nil then
        v16 = v16:getInstance();
    end;

    if v16 and StatusEffectUtil:isActive(v16, StatusEffectType.TOOL_ENCHANT_EFFICIENCY) then
        u12.blockBreaker:setCooldown(u12.cooldown * (1 - EnchantBalance.EFFICIENCY_TOOL_PERCENT / 100));
    end;

    u12.blockBreaker:setRange(u12.range);
    u12.blockBreaker.onBreak:Connect(function() -- Line: 134
        -- upvalues: AnimationType (ref), u12 (copy), getItemMeta (ref), KnitClient (ref)
        local FP_USE_ITEM = AnimationType.FP_USE_ITEM;
        local v17 = u12:getHandItem();

        if v17 ~= nil then
            v17 = v17.itemType;
        end;

        if v17 then
            local v18 = getItemMeta(v17);
            local breakBlockSwingAnimationOverride = v18.breakBlockSwingAnimationOverride;

            if breakBlockSwingAnimationOverride ~= 0 and (breakBlockSwingAnimationOverride == breakBlockSwingAnimationOverride and breakBlockSwingAnimationOverride) then
                FP_USE_ITEM = v18.breakBlockSwingAnimationOverride;
            end;
        end;

        KnitClient.Controllers.ViewmodelController:playAnimation(FP_USE_ITEM);
    end);

    if DeviceUtil.isMobileControls() and (u12.blockBreaker.shouldDisplayMobileBtn and u12:isEnabled()) then
        u12.blockBreaker:displayMobileBreakButton();
    end;
end;

function u4.onDisable(p19) -- Line: 154
    p19.blockBreaker:disable();
    p19.maid:DoCleaning();
    p19.blockBreaker:hideMobileBreakButton();
end;

function u4.getBlockBreaker(p20) -- Line: 159
    return p20.blockBreaker;
end;

function u4.setDefaultCooldown(p21) -- Line: 162
    -- upvalues: getItemMeta (copy), DEFAULT_BREAK_COOLDOWN (copy)
    local v22 = p21:getHandItem();

    if v22 ~= nil then
        v22 = v22.itemType;
    end;

    local v23;

    if v22 then
        v23 = getItemMeta(v22);
    else
        v23 = nil;
    end;

    if v23 ~= nil then
        v23 = v23.breakBlockCooldown;
    end;

    if v23 == 0 or (v23 ~= v23 or not v23) then
        v23 = DEFAULT_BREAK_COOLDOWN;
    end;

    p21.cooldown = v23;
    p21.blockBreaker:setCooldown(p21.cooldown);

    return p21.cooldown;
end;

function u4.isBlockBreakEnabled(p24) -- Line: 184
    return p24:isEnabled();
end;

return {
    BlockBreakController = KnitClient.CreateController(u4.new())
};