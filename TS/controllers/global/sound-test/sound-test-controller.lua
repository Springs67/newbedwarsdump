-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local SoundTestApp = RuntimeLib.import(script, script.Parent, "sound-test-app").SoundTestApp;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "SoundTestController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "SoundTestController";
end;

function u2.KnitStart(p5) -- Line: 28
    -- upvalues: KnitController (copy), default (copy), u1 (copy), GameSound (copy), Flamework (copy), SoundTestApp (copy)
    KnitController.KnitStart(p5);
    default.Client:Get("OpenSoundTest"):Connect(function() -- Line: 30
        -- upvalues: u1 (ref), GameSound (ref), Flamework (ref), SoundTestApp (ref)
        local v6 = u1.keys(GameSound);
        local u7 = u1.values(GameSound);

        local function _(p8, p9) -- Line: 34
            -- upvalues: u7 (copy)
            return {
                Key = tostring(p8),
                AssetId = u7[p9 + 1]
            };
        end;

        local v10 = table.create(#v6);

        for i, v in v6 do
            v10[i] = {
                Key = tostring(v),
                AssetId = u7[i - 1 + 1]
            };
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "SoundTestApp",
            app = SoundTestApp
        }, {
            SoundMap = v10
        });
    end);
end;

KnitClient.CreateController(u2.new());

return nil;