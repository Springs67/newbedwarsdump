-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v7.Players;
local ReplicatedStorage = v7.ReplicatedStorage;
local RunService = v7.RunService;
local Workspace = v7.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local v8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "traveling-merchant", "traveling-merchant-meta");
local TRAVELING_MERCHANT_ITEM_ATTRIBUTE = v8.TRAVELING_MERCHANT_ITEM_ATTRIBUTE;
local TRAVELING_MERCHANT_ITEM_TAG = v8.TRAVELING_MERCHANT_ITEM_TAG;
local TRAVELING_MERCHANT_OPEN_ATTRIBUTE = v8.TRAVELING_MERCHANT_OPEN_ATTRIBUTE;
local TRAVELING_MERCHANT_WAGON_TAG = v8.TRAVELING_MERCHANT_WAGON_TAG;
local TravelingMerchantUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "traveling-merchant", "traveling-merchant-util").TravelingMerchantUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local TravelingMerchantUnlockCountdown = RuntimeLib.import(script, script.Parent, "ui", "countdown", "traveling-merchant-unlock-countdown").TravelingMerchantUnlockCountdown;
local TravelingMerchantItemPopup = RuntimeLib.import(script, script.Parent, "ui", "item", "traveling-merchant-item").TravelingMerchantItemPopup;
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 48, Name: __tostring
        return "TravelingMerchantController";
    end,

    __index = KnitController
});
u9.__index = u9;

function u9.new(...) -- Line: 54
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 58
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p11);
    p11.Name = "TravelingMerchantController";
    p11.merchantActive = false;
    p11.shopOpen = false;
    p11.cleanupMap = {};
    p11.billboardMap = {};
    p11.purchaseRequestRemote = default.Client:Get("TravelingMerchantPurchaseRequest");
end;

function u9.KnitStart(u12) -- Line: 67
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), TRAVELING_MERCHANT_WAGON_TAG (copy), TRAVELING_MERCHANT_ITEM_TAG (copy), TRAVELING_MERCHANT_ITEM_ATTRIBUTE (copy), TravelingMerchantUtil (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u12);
    WatchCollectionTag(TRAVELING_MERCHANT_WAGON_TAG, function(p13) -- Line: 70
        -- upvalues: u12 (copy)
        u12.merchantInstance = p13;
        u12:handleWagonSpawn(p13);
        u12:createPurchasePrompt();
    end);
    WatchCollectionTag(TRAVELING_MERCHANT_ITEM_TAG, function(p14) -- Line: 77
        -- upvalues: TRAVELING_MERCHANT_ITEM_ATTRIBUTE (ref), TravelingMerchantUtil (ref), u12 (copy)
        local u15 = TravelingMerchantUtil:getShopItemByItemType((p14:GetAttribute(TRAVELING_MERCHANT_ITEM_ATTRIBUTE)));

        if not u15 then
            return nil;
        end;

        if not u12.shopOpen then
            u12.shopOpen = true;
            u12:handleShopOpen();
        end;

        u12:handleWagonItemSpawn(u15, p14);
        p14.AncestryChanged:Connect(function(p16, p17) -- Line: 91
            -- upvalues: u12 (ref), u15 (copy)
            if p17 == nil then
                u12:handleWagonItemDespawn(u15);
            end;
        end);
    end);
    ClientSyncEvents.TravelingMerchantBillboardMounted:connect(function(p18) -- Line: 98
        -- upvalues: u12 (copy)
        u12.billboardMap[p18.merchantItem] = p18.billboard;
    end);
    u12:handleItemSelection();
end;

function u9.handleWagonSpawn(p19, u20) -- Line: 107
    -- upvalues: TRAVELING_MERCHANT_OPEN_ATTRIBUTE (copy), Workspace (copy), u6 (copy), TravelingMerchantUnlockCountdown (copy), Players (copy), u5 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    p19.merchantActive = true;
    local v21 = u20:GetAttribute(TRAVELING_MERCHANT_OPEN_ATTRIBUTE);

    if v21 ~= nil then
        local v22 = v21 - Workspace:GetServerTimeNow();

        if v22 > 10 then
            local u23 = u6.mount(u6.createElement(TravelingMerchantUnlockCountdown, {
                shopOpensIn = v22,
                wagonInstance = u20
            }), Players.LocalPlayer:WaitForChild("PlayerGui"));
            task.delay(v22 + 0.5, function() -- Line: 120
                -- upvalues: u6 (ref), u23 (copy)
                return u6.unmount(u23);
            end);
        end;
    end;

    task.delay(5, function() -- Line: 127
        -- upvalues: u20 (copy), u5 (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local TravelingMerchantNPC = u20:WaitForChild("TravelingMerchantNPC");
        local Humanoid = u20:WaitForChild("TravelingMerchantNPC"):WaitForChild("Humanoid");

        if not u20:FindFirstChildWhichIsA("Animator") then
            u5("Animator", {
                Parent = Humanoid
            });
        end;

        AnimationUtil:playAnimation(TravelingMerchantNPC, GameAnimationUtil:getAssetId(AnimationType.MERCHANT_IDLE));
    end);
end;

function u9.handleShopOpen(p24) -- Line: 139
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if not p24.merchantInstance then
        return nil;
    end;

    local v25 = AnimationUtil:playAnimation(p24.merchantInstance, GameAnimationUtil:getAssetId(AnimationType.MERCHANT_WAGON_IDLE));

    if v25 then
        v25:AdjustSpeed(0.5);
    end;
end;

function u9.createPurchasePrompt(u26) -- Line: 149
    -- upvalues: KnitClient2 (copy), u5 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), TravelingMerchantUtil (copy), SoundManager (copy), Flamework (copy)
    u26.purchasePrompt = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        Name = "TravelingMerchantPurchasePrompt",
        Enabled = false,
        HoldDuration = 1.5,
        RequiresLineOfSight = false,
        ObjectText = "itemName",
        ActionText = "Buy",
        UIOffset = Vector2.new(0, -80)
    });
    u26.purchasePrompt.Triggered:Connect(function() -- Line: 160
        -- upvalues: u26 (copy), u5 (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), TravelingMerchantUtil (ref), SoundManager (ref), Flamework (ref)
        if u26.selectedItem then
            u26.purchaseRequestRemote:CallServerAsync({
                merchantItem = u26.selectedItem
            }):andThen(function(p27) -- Line: 165
                -- upvalues: u26 (ref), u5 (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), TravelingMerchantUtil (ref), SoundManager (ref), Flamework (ref)
                if p27 then
                    if u26.merchantInstance then
                        local TravelingMerchantNPC = u26.merchantInstance:WaitForChild("TravelingMerchantNPC");
                        local Humanoid = u26.merchantInstance:WaitForChild("TravelingMerchantNPC"):WaitForChild("Humanoid");

                        if not u26.merchantInstance:FindFirstChildWhichIsA("Animator") then
                            u5("Animator", {
                                Parent = Humanoid
                            });
                        end;

                        AnimationUtil:playAnimation(TravelingMerchantNPC, GameAnimationUtil:getAssetId(AnimationType.MERCHANT_PURCHASE));
                    end;

                    if u26.selectedItem then
                        SoundManager:playSound(TravelingMerchantUtil:getPurchaseSoundForRarity(u26.selectedItem.rarity), {
                            position = nil
                        });
                    end;
                else
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        message = "Failed to complete purchase."
                    });
                end;
            end);
        end;
    end);
end;

function u9.handleWagonItemSpawn(p28, p29, u30) -- Line: 197
    -- upvalues: u4 (copy), u6 (copy), TravelingMerchantItemPopup (copy), Players (copy), RunService (copy), Workspace (copy), BLOCK_SIZE (copy), ReplicatedStorage (copy), TravelingMerchantUtil (copy), EffectUtil (copy)
    local v31 = u4.new();
    local u32 = u6.mount(u6.createElement(TravelingMerchantItemPopup, {
        merchantItem = p29,
        merchantItemInstance = u30
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    v31:GiveTask(function() -- Line: 204
        -- upvalues: u6 (ref), u32 (copy)
        return u6.unmount(u32);
    end);
    v31:GiveTask(RunService.Heartbeat:Connect(function(u33) -- Line: 208
        -- upvalues: u30 (copy), Workspace (ref), BLOCK_SIZE (ref)
        if u30.Parent == nil then
            return nil;
        end;

        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            return nil;
        end;

        if (CurrentCamera.Position - u30.Position).Magnitude > 40 * BLOCK_SIZE then
            return nil;
        end;

        debug.profilebegin("traveling-merchant-inventory");
        local Orientation = u30.Orientation;
        u30.Orientation = Vector3.new(Orientation.X, Orientation.Y + u33 * 25, Orientation.Z);

        local function _(p34) -- Line: 229
            -- upvalues: u33 (copy)
            if p34.Parent == nil then
                return nil;
            end;

            if p34:IsA("BasePart") then
                local Orientation2 = p34.Orientation;
                p34.Orientation = Vector3.new(Orientation2.X, Orientation2.Y + u33 * 25, Orientation2.Z);
            end;
        end;

        for i, descendant in u30:GetDescendants() do
            local _ = i - 1;

            if descendant.Parent ~= nil then
                if descendant:IsA("BasePart") then
                    local Orientation2 = descendant.Orientation;
                    descendant.Orientation = Vector3.new(Orientation2.X, Orientation2.Y + u33 * 25, Orientation2.Z);
                end;
            end;
        end;

        debug.profileend();
    end));
    local v35 = ReplicatedStorage.Assets.Effects.TravelingMerchantItemEffect:Clone();
    local v36 = TravelingMerchantUtil:getRarityColor(p29.rarity);
    v35.Root.Particle.RarityRing.Color = ColorSequence.new(v36);
    v35:PivotTo(u30.CFrame - Vector3.new(0, 0.5, 0));
    v35.Parent = Workspace;
    EffectUtil:playEffects({ v35 }, nil);
    v31:GiveTask(v35);
    p28.cleanupMap[p29] = v31;
end;

function u9.handleWagonItemDespawn(p37, p38) -- Line: 257
    local v39 = p37.cleanupMap[p38];

    if v39 then
        v39:DoCleaning();
        p37.cleanupMap[p38] = nil;
    end;

    p37.billboardMap[p38] = nil;
end;

function u9.handleItemSelection(u40) -- Line: 272
    -- upvalues: Players (copy), u3 (copy), getItemMeta (copy)
    local function _() -- Line: 274
        -- upvalues: u40 (copy)
        if u40.enabledBillboard then
            u40.enabledBillboard.Enabled = false;
            u40.enabledBillboard = nil;
        end;

        if u40.purchasePrompt then
            u40.purchasePrompt.Parent = nil;
            u40.purchasePrompt.Enabled = false;
        end;

        if u40.selectedItem then
            u40.selectedItem = nil;
        end;
    end;

    task.spawn(function() -- Line: 288
        -- upvalues: Players (ref), u40 (copy), u3 (ref), getItemMeta (ref)
        while true do
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:GetPivot().Position;
            end;

            if u40.merchantActive and (Character and u40.purchasePrompt) then
                local v41 = u3.keys(u40.billboardMap);
                local u42 = nil;
                local u43 = nil;
                local u44 = (1 / 0);
                local u45 = nil;

                local function _(p46) -- Line: 302
                    -- upvalues: u40 (ref), Character (copy), u44 (ref), u42 (ref), u43 (ref), u45 (ref)
                    local v47 = u40.billboardMap[p46];

                    if not v47 then
                        return nil;
                    end;

                    local Adornee = v47.Adornee;
                    local Magnitude = (Adornee.Position - Character).Magnitude;

                    if Magnitude <= 6 and Magnitude < u44 then
                        u42 = v47;
                        u43 = p46;
                        u44 = Magnitude;
                        u45 = Adornee;
                    end;
                end;

                for i, v in v41 do
                    local _ = i - 1;
                    local v48 = u40.billboardMap[v];

                    if v48 then
                        local Adornee = v48.Adornee;
                        local Magnitude = (Adornee.Position - Character).Magnitude;

                        if Magnitude <= 6 and Magnitude < u44 then
                            u42 = v48;
                            u43 = v;
                            u44 = Magnitude;
                            u45 = Adornee;
                        end;
                    end;
                end;

                if u43 and u42 then
                    if u40.enabledBillboard then
                        u40.enabledBillboard.Enabled = false;
                        u40.enabledBillboard = nil;
                    end;

                    u40.selectedItem = u43;
                    u42.Enabled = true;
                    u40.enabledBillboard = u42;

                    if u40.purchasePrompt.Parent ~= u45 then
                        u40.purchasePrompt.ObjectText = getItemMeta(u43.item).displayName;
                        u40.purchasePrompt.Parent = nil;
                        u40.purchasePrompt.Parent = u45;
                        u40.purchasePrompt.Enabled = false;
                        u40.purchasePrompt.Enabled = true;
                    end;
                else
                    if u40.enabledBillboard then
                        u40.enabledBillboard.Enabled = false;
                        u40.enabledBillboard = nil;
                    end;

                    if u40.purchasePrompt then
                        u40.purchasePrompt.Parent = nil;
                        u40.purchasePrompt.Enabled = false;
                    end;

                    if u40.selectedItem then
                        u40.selectedItem = nil;
                    end;
                end;
            end;

            task.wait(0.2);
        end;
    end);
end;

KnitClient.CreateController(u9.new());

return nil;