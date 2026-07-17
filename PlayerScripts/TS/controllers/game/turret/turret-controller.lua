-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local Players = v1.Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "TurretController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "TurretController";
end;

function u2.KnitStart(p5) -- Line: 27
    -- upvalues: KnitController (copy), CollectionService (copy), ClientStore (copy)
    KnitController.KnitStart(p5);
    CollectionService:GetInstanceRemovedSignal("Turret"):Connect(function(p6) -- Line: 30
        -- upvalues: ClientStore (ref)
        if ClientStore:getState().Game.selectedTurret ~= p6 then
            return nil;
        end;

        ClientStore:dispatch({
            type = "SetSpectatedTurret",
            selectedTurret = nil
        });
    end);
end;

function u2.getNextTurret(p7, p8) -- Line: 40
    -- upvalues: ClientStore (copy)
    local v9 = p7:getTurrets(p8);
    local selectedTurret = ClientStore:getState().Game.selectedTurret;

    if selectedTurret == nil then
        return v9[1];
    end;

    local v10 = (table.find(v9, selectedTurret) or 0) - 1;
    local v11 = v9[(v10 == -1 and 0 or v10) + 1 + 1];

    if v11 == nil then
        return v9[1];
    end;

    return v11;
end;

function u2.getBackTurret(p12, p13) -- Line: 57
    -- upvalues: ClientStore (copy)
    local v14 = p12:getTurrets(p13);
    local selectedTurret = ClientStore:getState().Game.selectedTurret;

    if selectedTurret == nil then
        return v14[1];
    end;

    local v15 = v14[(table.find(v14, selectedTurret) or 0) - 1 - 1 + 1];

    if v15 == nil then
        return v14[#v14 - 1 + 1];
    end;

    return v15;
end;

function u2.getTurrets(p16, p17) -- Line: 71
    -- upvalues: CollectionService (copy), Players (copy)
    local function _(p18) -- Line: 73
        -- upvalues: Players (ref)
        return p18:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId;
    end;

    local v19 = 0;
    local v20 = {};

    for i, v in CollectionService:GetTagged(p17) do
        local _ = i - 1;

        if v:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId == true then
            v19 = v19 + 1;
            v20[v19] = v;
        end;
    end;

    return v20;
end;

KnitClient.CreateController(u2.new());

return nil;