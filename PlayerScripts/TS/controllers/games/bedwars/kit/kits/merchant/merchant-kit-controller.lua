-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Queue = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "datastructures", "out").Queue;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local RunService = v2.RunService;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local MerchantDiscount = RuntimeLib.import(script, script.Parent, "ui", "merchant-discount").MerchantDiscount;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "MerchantKitController";
    end,

    __index = BaseKitController
});
u3.__index = u3;

function u3.new(...) -- Line: 32
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 36
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), default (copy), Queue (copy), u1 (copy)
    BaseKitController.constructor(p5, BedwarsKit.MERCHANT);
    p5.Name = "MerchantKitController";
    p5.discountedItems = {};
    p5.discountedItemsEvent = default.Client:Get("MerchantItems");
    p5.discountAppliedEvent = default.Client:Get("MerchantDiscountApplied");
    p5.purchaseQueue = Queue.new();
    p5.queueAccumulator = 0;
    p5.frameRef = u1.createRef();
end;

function u3.onKitLocalActivated(p6, p7) -- Line: 46
end;

function u3.onKitLocalDeactivated(p8) -- Line: 48
end;

function u3.onKitReplicationActivated(u9, p10) -- Line: 50
    -- upvalues: RunService (copy), u1 (copy), MerchantDiscount (copy)
    u9:createUIContainer();
    p10:GiveTask(u9.discountedItemsEvent:Connect(function(p11) -- Line: 52
        -- upvalues: u9 (copy)
        u9.discountedItems = p11.items;
    end));
    p10:GiveTask(u9.discountAppliedEvent:Connect(function(p12) -- Line: 55
        -- upvalues: u9 (copy)
        u9.purchaseQueue:Push(p12);
    end));
    RunService.Heartbeat:Connect(function(p13) -- Line: 58
        -- upvalues: u9 (copy), u1 (ref), MerchantDiscount (ref)
        if not u9.purchaseQueue:IsEmpty() then
            local v14 = u9;
            v14.queueAccumulator = v14.queueAccumulator + p13;
        end;

        if u9.queueAccumulator >= 0.5 then
            local v15 = u9.purchaseQueue:Pop();
            local v16 = v15 and u9.frameRef:getValue();

            if v16 then
                u9:scheduleForDeletion((u1.mount(u1.createElement(MerchantDiscount, {
                    item = v15.item,
                    refund = v15.refund
                }), v16)));
            end;

            u9.queueAccumulator = 0;
        end;
    end);
end;

function u3.onKitReplicationDeactivated(p17) -- Line: 78
end;

function u3.onInnateAbilityEnabled(p18, p19, p20) -- Line: 80
end;

function u3.onAbilityUsed(p21, p22, p23) -- Line: 82
    -- upvalues: AbilityId (copy), SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy)
    if p23.ability ~= AbilityId.MERCHANT_REROLL then
        return nil;
    end;

    SoundManager:playSound(GameSound.BOUNTY_CLAIMED);

    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.BEDWARS_ITEM_SHOP) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.BEDWARS_ITEM_SHOP);
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.BEDWARS_ITEM_SHOP, {});
    end;
end;

function u3.createUIContainer(p24) -- Line: 92
    -- upvalues: u1 (copy), Players (copy)
    u1.mount(u1.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, {
        DiscountContainer = u1.createElement("Frame", {
            [u1.Ref] = p24.frameRef,
            Size = UDim2.fromScale(0.9, 0.9),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Active = false
        }, { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                Padding = UDim.new(0, 15)
            }) })
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function u3.scheduleForDeletion(p25, u26) -- Line: 113
    -- upvalues: u1 (copy)
    task.delay(2, function() -- Line: 114
        -- upvalues: u1 (ref), u26 (copy)
        u1.unmount(u26);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;