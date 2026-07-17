-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchPlayer = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "VoidKnightArmorLobbyController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 21
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "VoidKnightArmorLobbyController";
    p5.playerMaid = {};
end;

function u3.KnitStart(u6) -- Line: 30
    -- upvalues: KnitController (copy), WatchPlayer (copy), LobbyGadgetType (copy)
    KnitController.KnitStart(u6);
    WatchPlayer(function(u7, p8) -- Line: 32
        -- upvalues: LobbyGadgetType (ref), u6 (copy)
        if u7:GetAttribute("LobbyGadgetType") == LobbyGadgetType.VOID_KNIGHT_ARMOR then
            u6:equip(u7);
        else
            u6:unequip(u7);
        end;

        p8:GiveTask(u7:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function() -- Line: 42
            -- upvalues: u7 (copy), LobbyGadgetType (ref), u6 (ref)
            if u7:GetAttribute("LobbyGadgetType") == LobbyGadgetType.VOID_KNIGHT_ARMOR then
                u6:equip(u7);

                return;
            end;

            u6:unequip(u7);
        end));
    end);
end;

function u3.equip(u9, u10) -- Line: 52
    -- upvalues: u1 (copy)
    task.spawn(function() -- Line: 53
        -- upvalues: u10 (copy), u1 (ref), u9 (copy)
        if not u10.Character then
            return nil;
        end;

        u10.Character:SetAttribute("Transparency", 1);
        local u11 = u1.new();
        local v12 = u10.Character:GetDescendants();

        local function v14(u13) -- Line: 60
            -- upvalues: u11 (copy)
            if u13:IsA("Part") or (u13:IsA("BasePart") or u13:IsA("MeshPart")) then
                local Transparency = u13.Transparency;
                u11:GiveTask(function() -- Line: 63
                    -- upvalues: u13 (copy), Transparency (copy)
                    u13.Transparency = Transparency;
                end);
                u13.Transparency = 1;
            end;
        end;

        for i, v in v12 do
            v14(v, i - 1, v12);
        end;

        u9:equipCharacter(u10.Character, u11);
        u9.playerMaid[u10.UserId] = u11;
    end);
end;

function u3.equipCharacter(p15, u16, u17) -- Line: 78
    -- upvalues: ReplicatedStorage (copy), u2 (copy), WeldUtil (copy)
    local v18 = ReplicatedStorage.Assets.Effects.VoidKnightArmor:Clone();
    local v19 = u2("Attachment", {
        Name = "LeftLowerArmAttachment",
        Parent = u16.LeftLowerArm
    });
    local v20 = u2("Attachment", {
        Name = "RightLowerArmAttachment",
        Parent = u16.RightLowerArm
    });
    u17:GiveTask(v19);
    u17:GiveTask(v20);

    local function _(p21) -- Line: 94
        -- upvalues: u17 (copy), u16 (copy)
        if p21:IsA("Accessory") then
            u17:GiveTask(p21);
            p21.Parent = u16;
        end;
    end;

    for i, child in v18:GetChildren() do
        local _ = i - 1;

        if child:IsA("Accessory") then
            u17:GiveTask(child);
            child.Parent = u16;
        end;
    end;

    WeldUtil:weldCharacterAccessories(u16);

    return u17;
end;

function u3.unequip(p22, p23) -- Line: 106
    local Character = p23.Character;

    if Character ~= nil then
        Character:SetAttribute("Transparency", 0);
    end;

    local v24 = p22.playerMaid[p23.UserId];

    if v24 ~= nil then
        v24:DoCleaning();
    end;
end;

KnitClient.CreateController(u3.new());

return nil;