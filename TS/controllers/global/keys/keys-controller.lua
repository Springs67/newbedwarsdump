-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local UILayers = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local MissingKeysModal = RuntimeLib.import(script, script.Parent, "ui", "missing-keys-modal").MissingKeysModal;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "KeysController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p3);
    p3.Name = "KeysController";
    p3.keysRemotes = default.Client:GetNamespace("Keys");
end;

function u1.KnitStart(p4) -- Line: 29
    -- upvalues: KnitController (copy), ClientStore (copy), Flamework (copy), MissingKeysModal (copy), UILayers (copy)
    KnitController.KnitStart(p4);
    p4.keysRemotes:Get("KeysDataUpdate"):Connect(function(p5) -- Line: 31
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "SetKeysPartial",
            data = {
                keysData = p5
            }
        });
    end);
    p4.keysRemotes:Get("NotifyMissingQueueKeys"):Connect(function(p6) -- Line: 39
        -- upvalues: Flamework (ref), MissingKeysModal (ref), UILayers (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "MissingKeyModal",
            app = MissingKeysModal,
            layer = UILayers.MAIN
        }, {
            MissingKeys = p6.missingKeys,
            QueueType = p6.queueType
        });
    end);
end;

KnitClient.CreateController(u1.new());

return nil;