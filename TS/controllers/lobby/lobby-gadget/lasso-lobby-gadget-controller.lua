-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local PlayerUtil = v1.PlayerUtil;
local WatchPlayer = v1.WatchPlayer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "LassoLobbyGadgetController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "LassoLobbyGadgetController";
    p5.cowboyHatMaidMap = {};
end;

function u3.KnitStart(u6) -- Line: 31
    -- upvalues: KnitController (copy), WatchPlayer (copy), LobbyGadgetType (copy)
    KnitController.KnitStart(u6);
    WatchPlayer(function(u7, p8) -- Line: 33
        -- upvalues: LobbyGadgetType (ref), u6 (copy)
        if u7:GetAttribute("LobbyGadgetType") == LobbyGadgetType.LASSO then
            u6:equipCowboyHat(u7);
        else
            u6:unequipCowboyHat(u7);
        end;

        p8:GiveTask(u7:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function() -- Line: 42
            -- upvalues: u7 (copy), LobbyGadgetType (ref), u6 (ref)
            if u7:GetAttribute("LobbyGadgetType") == LobbyGadgetType.LASSO then
                u6:equipCowboyHat(u7);

                return;
            end;

            u6:unequipCowboyHat(u7);
        end));
    end);
end;

function u3.equipCowboyHat(p9, p10) -- Line: 52
    -- upvalues: PlayerUtil (copy), u2 (copy), ReplicatedStorage (copy), WeldUtil (copy)
    local v11 = p9.cowboyHatMaidMap[p10];

    if v11 ~= nil then
        v11:DoCleaning();
    end;

    local v12 = PlayerUtil.waitForCharacter(p10);

    if not v12 then
        return nil;
    end;

    local v13 = u2.new();
    local v14 = ReplicatedStorage.Assets.Misc.CowboyHat:Clone();
    v13:GiveTask(v14);
    v14.Parent = v12;
    WeldUtil:weldAccessory(v12, v14);
    p9.cowboyHatMaidMap[p10] = v13;
end;

function u3.unequipCowboyHat(p15, p16) -- Line: 72
    local v17 = p15.cowboyHatMaidMap[p16];

    if v17 ~= nil then
        v17:DoCleaning();
    end;
end;

KnitClient.CreateController(u3.new());

return nil;