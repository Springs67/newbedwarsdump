-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "PvpArenaAugmentAbilityKeybindController";
    end,

    __index = GameKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 17
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 21
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p4, { GameType.PVP_ARENA });
    p4.Name = "PvpArenaAugmentAbilityController";
    p4.abilityKeybindMap = {};
end;

function u2.KnitStart(p5) -- Line: 26
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p5);
end;

function u2.registerAbilities(u6, p7) -- Line: 29
    local function _(p8) -- Line: 31
        -- upvalues: u6 (copy)
        local v9 = u6:getNextAvailableKeybind();

        if not v9 then
            return nil;
        end;

        u6.abilityKeybindMap[p8] = v9;
    end;

    for i, v in p7 do
        local _ = i - 1;
        local v10 = u6:getNextAvailableKeybind();

        if v10 then
            u6.abilityKeybindMap[v] = v10;
        end;
    end;
end;

function u2.getAbilityType(p11, p12) -- Line: 44
    return p11.abilityKeybindMap[p12];
end;

function u2.getNextAvailableKeybind(p13) -- Line: 49
    -- upvalues: u1 (copy)
    for _, v in { "KitPrimary", "KitSecondary", "KitTertiary", "MiscPrimary", "MiscSecondary" } do
        if table.find(u1.values(p13.abilityKeybindMap), v) == nil then
            return v;
        end;
    end;

    return nil;
end;

KnitClient.CreateController(u2.new());

return nil;