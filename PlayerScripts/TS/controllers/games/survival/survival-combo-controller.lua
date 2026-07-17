-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SurvivalComboUi = RuntimeLib.import(script, script.Parent, "survival-combo-ui").SurvivalComboUi;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "SurvivalComboController";
    end,

    __index = GameKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 21
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 25
    -- upvalues: GameKnitController (copy), GameType (copy), u1 (copy)
    GameKnitController.constructor(p5, { GameType.SURVIVAL });
    p5.Name = "SurvivalComboController";
    p5.maid = u1.new();
end;

function u3.onGameInit(u6) -- Line: 30
    -- upvalues: default (copy), u2 (copy), SurvivalComboUi (copy), Players (copy)
    default.Client:Get("SurvivalComboUpdate"):Connect(function(p7) -- Line: 31
        -- upvalues: u6 (copy), u2 (ref), SurvivalComboUi (ref), Players (ref)
        u6.maid:DoCleaning();

        if p7.combo.chain > 0 then
            local u8 = u2.mount(u2.createElement(SurvivalComboUi, {
                Chain = p7.combo.chain
            }), Players.LocalPlayer:WaitForChild("PlayerGui"));
            u6.maid:GiveTask(function() -- Line: 37
                -- upvalues: u2 (ref), u8 (copy)
                u2.unmount(u8);
            end);
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;