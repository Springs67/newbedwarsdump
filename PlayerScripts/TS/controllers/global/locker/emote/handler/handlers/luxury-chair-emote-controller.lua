-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "LuxuryChairEmoteController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "LuxuryChairEmoteController";
end;

function u3.KnitStart(p6) -- Line: 34
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), Workspace (copy), KnitClient2 (copy), WeldUtil (copy), Players (copy), InventoryUtil (copy), ItemUtil (copy)
    KnitController.KnitStart(p6);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local LUXURY_CHAIR = EmoteType.LUXURY_CHAIR;
    local u7 = EmoteHandler;
    local u8 = setmetatable({}, {
        __tostring = function() -- Line: 42, Name: __tostring
            return "Anonymous";
        end,

        __index = u7
    });
    u8.__index = u8;

    function u8.new(...) -- Line: 48
        -- upvalues: u8 (ref)
        local v9 = setmetatable({}, u8);

        return v9:constructor(...) or v9;
    end;

    function u8.constructor(p10, ...) -- Line: 52
        -- upvalues: u7 (copy)
        u7.constructor(p10, ...);
    end;

    function u8.onEnable(p11, u12, p13, p14, p15) -- Line: 55
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), KnitClient2 (ref), WeldUtil (ref), Players (ref), InventoryUtil (ref), ItemUtil (ref)
        local u16 = ReplicatedStorage.Assets.Misc.LuxuryChair:Clone();
        u16:PivotTo(p13.LowerTorso.CFrame);
        u16.Parent = Workspace;

        local function _(p17) -- Line: 61
            if p17:IsA("BasePart") then
                p17.Anchored = true;
            end;
        end;

        for i, descendant in u16:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.Anchored = true;
            end;
        end;

        KnitClient2.Controllers.ViewmodelController:setHeldItem(nil);
        local u18 = ReplicatedStorage.Assets.Misc.TeaMug:Clone();
        u18.Parent = p13;
        local u19 = ReplicatedStorage.Assets.Misc.MageSpellbook:Clone();
        u19.Parent = p13;
        WeldUtil:weldCharacterAccessories(p13);
        p15:GiveTask(function() -- Line: 76
            -- upvalues: u16 (copy), u18 (copy), u19 (copy), Players (ref), u12 (copy), InventoryUtil (ref), ItemUtil (ref), KnitClient2 (ref)
            u16:Destroy();
            u18:Destroy();
            u19:Destroy();
            local v20 = Players:GetPlayerByUserId(u12);

            if v20 == Players.LocalPlayer then
                local hand = InventoryUtil.getInventory(v20).hand;

                if hand ~= nil then
                    hand = hand.itemType;
                end;

                if not hand then
                    return nil;
                end;

                local v21 = ItemUtil.createItemInstance(hand);
                KnitClient2.Controllers.ViewmodelController:setHeldItem(v21);
            end;
        end);
    end;

    function u8.onDisable(p22, p23, p24, p25) -- Line: 96
    end;

    EmoteHandlerController:registerHandler(LUXURY_CHAIR, u8);
end;

KnitClient.CreateController(u3.new());

return nil;