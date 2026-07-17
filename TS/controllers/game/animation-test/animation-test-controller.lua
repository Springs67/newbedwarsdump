-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local ProdAnimations = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "prod-animations").ProdAnimations;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local AnimationTestApp = RuntimeLib.import(script, script.Parent, "animation-test-app").AnimationTestApp;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "AnimationTestController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "AnimationTestController";
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: KnitController (copy), default (copy), u1 (copy), ProdAnimations (copy), AnimationType (copy), Flamework (copy), AnimationTestApp (copy)
    KnitController.KnitStart(p5);
    default.Client:Get("OpenAnimationTest"):Connect(function() -- Line: 31
        -- upvalues: u1 (ref), ProdAnimations (ref), AnimationType (ref), Flamework (ref), AnimationTestApp (ref)
        local v6 = u1.keys(ProdAnimations);
        local u7 = u1.values(ProdAnimations);

        local function _(p8, p9) -- Line: 35
            -- upvalues: AnimationType (ref), u7 (copy)
            return {
                Key = AnimationType[p8],
                AssetId = u7[p9 + 1]
            };
        end;

        local v10 = table.create(#v6);

        for i, v in v6 do
            v10[i] = {
                Key = AnimationType[v],
                AssetId = u7[i - 1 + 1]
            };
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "AnimationTestApp",
            app = AnimationTestApp
        }, {
            AnimationMap = v10
        });
    end);
end;

KnitClient.CreateController(u2.new());

return nil;