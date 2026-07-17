-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local HVFaction = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "hero-villain-types").HVFaction;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local AccessoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "HeroVillainAssignmentController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "HeroVillainAssignmentController";
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), default (copy), Players (copy)
    KnitController.KnitStart(u5);
    default.Client:OnEvent("NotifyHeroVillainAssignment", function(p6) -- Line: 32
        -- upvalues: Players (ref), u5 (copy)
        if p6.player == Players.LocalPlayer then
            u5.localAssignment = p6.faction;
        end;

        u5:addAssignmentCapeToPlayer(p6.player, p6.faction);
    end);
end;

function u2.getLocalHeroVillainAssignment(p7) -- Line: 39
    return p7.localAssignment;
end;

function u2.addAssignmentCapeToPlayer(p8, p9, p10) -- Line: 42
    -- upvalues: HVFaction (copy), ReplicatedStorage (copy), AccessoryUtil (copy), WeldUtil (copy)
    local Character = p9.Character;

    if not Character then
        return nil;
    end;

    local v11 = Character:GetAttribute("CapeSetUP");

    if v11 ~= 0 and (v11 == v11 and (v11 ~= "" and v11)) then
        return nil;
    end;

    Character:SetAttribute("CapeSetUP", true);

    if p10 == HVFaction.VILLAIN then
        local v12 = ReplicatedStorage.Assets.Misc.LuckyBlockVillainCape:Clone();
        v12:SetAttribute("NoArmorHide", true);
        AccessoryUtil:addAccessory(Character, v12);
        WeldUtil:weldCharacterAccessories(Character);

        return;
    end;

    local v13 = ReplicatedStorage.Assets.Misc.LuckyBlockHeroCape:Clone();
    v13:SetAttribute("NoArmorHide", true);
    AccessoryUtil:addAccessory(Character, v13);
    WeldUtil:weldCharacterAccessories(Character);
end;

KnitClient.CreateController(u2.new());

return nil;