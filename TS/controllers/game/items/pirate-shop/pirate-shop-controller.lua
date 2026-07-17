-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "PirateHatController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "PirateHatController";
end;

function u3.KnitStart(u6) -- Line: 33
    -- upvalues: KnitController (copy), default (copy), Players (copy), SoundManager (copy), GameSound (copy), WatchCharacter (copy)
    KnitController.KnitStart(u6);
    default.Client:OnEvent("UnlockPirateCategory", function(p7) -- Line: 35
        -- upvalues: u6 (copy), Players (ref), SoundManager (ref), GameSound (ref)
        local function _(p8) -- Line: 37
            -- upvalues: u6 (ref), Players (ref), SoundManager (ref), GameSound (ref)
            u6:equipPirateHat(p8);

            if Players.LocalPlayer == p8 then
                SoundManager:playSound(GameSound.HANNAH_UNSHEATH_SWORD, {});
            end;
        end;

        for i, v in p7.players do
            local _ = i - 1;
            u6:equipPirateHat(v);

            if Players.LocalPlayer == v then
                SoundManager:playSound(GameSound.HANNAH_UNSHEATH_SWORD, {});
            end;
        end;
    end);
    WatchCharacter(function(p9, p10) -- Line: 47
        -- upvalues: u6 (copy)
        if p9:GetAttribute("HasPirateUnlock") == true then
            u6:equipPirateHat(p9);
        end;
    end);
end;

function u3.equipPirateHat(p11, p12) -- Line: 53
    -- upvalues: EntityUtil (copy), ReplicatedStorage (copy), WeldUtil (copy)
    local Character = p12.Character;

    if not Character then
        return nil;
    end;

    local v13 = EntityUtil:getEntity(p12);

    if not v13 then
        return nil;
    end;

    local u14 = v13:getHumanoid();

    if not u14 then
        return nil;
    end;

    local u15 = {};

    for _, child in Character:GetChildren() do
        if child:IsA("Accessory") and (child.Name == "HatAttachment" and table.find(u15, child) == nil) then
            table.insert(u15, child);
            child:Destroy();
        end;
    end;

    local v16 = ReplicatedStorage.Assets.Misc.PirateHat:Clone();
    v16:SetAttribute("IsPirateHat", true);
    v16:SetAttribute("NoArmorHide", true);
    u14:AddAccessory(v16);
    local v17 = ReplicatedStorage.Assets.Misc.Parrot:Clone();
    v17:SetAttribute("IsParrot", true);
    v17:SetAttribute("NoArmorHide", true);
    u14:AddAccessory(v17);
    v16.Destroying:Connect(function() -- Line: 86
        -- upvalues: u15 (copy), u14 (copy), WeldUtil (ref), Character (copy)
        for _, v in u15 do
            u14:AddAccessory(v);
            WeldUtil:weldCharacterAccessories(Character);
        end;
    end);
    WeldUtil:weldCharacterAccessories(Character);
end;

KnitClient.CreateController(u3.new());

return nil;