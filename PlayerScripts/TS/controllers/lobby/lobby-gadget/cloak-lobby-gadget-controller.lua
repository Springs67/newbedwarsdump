-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local WatchPlayer = v1.WatchPlayer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "CloakLobbyGadgetController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 27
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "CloakLobbyGadgetController";
    p7.playerMaid = {};
end;

function u5.KnitStart(u8) -- Line: 36
    -- upvalues: KnitController (copy), WatchPlayer (copy), LobbyGadgetType (copy)
    KnitController.KnitStart(u8);
    WatchPlayer(function(u9, p10) -- Line: 38
        -- upvalues: LobbyGadgetType (ref), u8 (copy)
        if u9:GetAttribute("LobbyGadgetType") == LobbyGadgetType.CLOAK then
            u8:equip(u9);
        else
            u8:unequip(u9);
        end;

        p10:GiveTask(u9:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function() -- Line: 47
            -- upvalues: u9 (copy), LobbyGadgetType (ref), u8 (ref)
            if u9:GetAttribute("LobbyGadgetType") == LobbyGadgetType.CLOAK then
                u8:equip(u9);

                return;
            end;

            u8:unequip(u9);
        end));
    end);
end;

function u5.equip(u11, u12) -- Line: 57
    task.spawn(function() -- Line: 58
        -- upvalues: u12 (copy), u11 (copy)
        if not u12.Character then
            return nil;
        end;

        u11.playerMaid[u12.UserId] = u11:equipCharacter(u12.Character);
    end);
end;

function u5.equipCharacter(p13, p14) -- Line: 68
    -- upvalues: u2 (copy), ReplicatedStorage (copy), WeldUtil (copy), EntityUtil (copy)
    local v15 = u2.new();
    local v16 = ReplicatedStorage.Assets.Misc.CloakCape:Clone();
    local v17 = ReplicatedStorage.Assets.Misc.CloakHood:Clone();
    v15:GiveTask(v16);
    v15:GiveTask(v17);
    v16.Parent = p14;
    v17.Parent = p14;
    WeldUtil:weldAccessory(p14, v16);
    WeldUtil:weldAccessory(p14, v17);
    local v18 = EntityUtil:getEntity(p14);

    if v18 ~= nil then
        v18 = v18:getInstance();
    end;

    if v18 then
        p13:playSmokePuff(v18);
    end;

    return v15;
end;

function u5.unequip(p19, p20) -- Line: 88
    local v21 = p19.playerMaid[p20.UserId];

    if v21 ~= nil then
        v21:DoCleaning();
    end;
end;

function u5.playSmokePuff(p22, p23) -- Line: 96
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), u3 (copy), GameQueryUtil (copy), EffectUtil (copy)
    local v24 = ReplicatedStorage.Assets.Effects.CloakSmokePuff:Clone();
    local v25 = {};
    local PrimaryPart = p23.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame;
    end;

    v25.CFrame = PrimaryPart;
    v25.Anchored = true;
    v25.CanQuery = false;
    v25.CanCollide = false;
    v25.Transparency = 1;
    v25.Parent = Workspace;
    local u26 = u3("Part", v25);
    GameQueryUtil:setQueryIgnored(u26, true);
    v24.Parent = u26;
    v24.Speed = NumberRange.new(5);
    EffectUtil:playEffects({ v24 }, p23);
    task.delay(5, function() -- Line: 115
        -- upvalues: u26 (copy)
        u26:Destroy();
    end);
end;

KnitClient.CreateController(u5.new());

return nil;