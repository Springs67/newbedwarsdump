-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").CollectionTagAdded;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v4.Lighting;
local MarketplaceService = v4.MarketplaceService;
local Players = v4.Players;
local ProximityPromptService = v4.ProximityPromptService;
local TweenService = v4.TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local GiftType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType;
local Gamepass = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass;
local VIPUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vip", "vip-util").VIPUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "RankPurchaseController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 32
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "RankPurchaseController";
end;

function u5.KnitStart(p8) -- Line: 40
    -- upvalues: CollectionTagAdded (copy), u2 (copy), KnitClient2 (copy), ProximityPromptService (copy), Players (copy), VIPUtil (copy), Flamework (copy), BedwarsAppIds (copy), GiftType (copy), MarketplaceService (copy), Gamepass (copy), u3 (copy), Lighting (copy), TweenService (copy)
    CollectionTagAdded("VIPRankPurchase", function(u9) -- Line: 41
        -- upvalues: u2 (ref), KnitClient2 (ref), ProximityPromptService (ref), Players (ref), VIPUtil (ref), Flamework (ref), BedwarsAppIds (ref), GiftType (ref), MarketplaceService (ref), Gamepass (ref), u3 (ref), Lighting (ref), TweenService (ref)
        local u10 = u2.new();
        local u11 = true;
        u10:GiveTask(function() -- Line: 44
            -- upvalues: u11 (ref)
            u11 = false;
        end);
        local u12 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "VIP Rank",
            ObjectText = "Click to Purchase",
            RequiresLineOfSight = false,
            MaxActivationDistance = 20,
            HoldDuration = 0,
            Parent = u9
        });
        u10:GiveTask(ProximityPromptService.PromptTriggered:Connect(function(p13, p14) -- Line: 55
            -- upvalues: u12 (copy), Players (ref), VIPUtil (ref), Flamework (ref), BedwarsAppIds (ref), GiftType (ref), MarketplaceService (ref), Gamepass (ref)
            if p13 == u12 and p14 == Players.LocalPlayer then
                if VIPUtil.isPlayerVIP(Players.LocalPlayer) then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.GIFTING, {
                        GiftType = GiftType.VIP_RANK
                    });

                    return;
                end;

                MarketplaceService:PromptGamePassPurchase(p14, Gamepass.VIP);
            end;
        end));
        u9.AncestryChanged:Connect(function(p15, p16) -- Line: 66
            -- upvalues: u10 (copy)
            if p16 == nil then
                u10:DoCleaning();
            end;
        end);

        if not u9.PrimaryPart then
            u9:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;

        local u17 = u3("CFrameValue", {
            Parent = Lighting,
            Value = u9:GetPrimaryPartCFrame()
        });
        u10:GiveTask(function() -- Line: 78
            -- upvalues: u17 (copy)
            u17:Destroy();
        end);
        u17.Changed:Connect(function(p18) -- Line: 81
            -- upvalues: u9 (copy)
            u9:PivotTo(p18);
        end);

        while u11 do
            local v19 = TweenService:Create(u17, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
                Value = u17.Value * CFrame.Angles(0, 2.792526803190927, 0)
            });
            v19:Play();
            v19.Completed:Wait();
        end;
    end);
end;

return {
    RankPurchaseController = KnitClient.CreateController(u5.new())
};