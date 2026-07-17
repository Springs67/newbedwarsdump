-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local Promise = v1.Promise;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "UgcController";
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
    p4.Name = "UgcController";
    p4.cachedOwnedUgcData = false;
end;

function u2.KnitStart(u5) -- Line: 28
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("SendOwnedUGC"):Connect(function(p6) -- Line: 30
        -- upvalues: ClientStore (ref), u5 (copy)
        ClientStore:dispatch({
            type = "LobbySetOwnedUGC",
            ugc = p6
        });
        u5.cachedOwnedUgcData = true;
    end);
end;

function u2.hasRequestedOwnedUgcData(p7) -- Line: 38
    return p7.cachedOwnedUgcData;
end;

function u2.getOwnedUGC(p8, p9) -- Line: 41
    -- upvalues: Promise (copy), ClientStore (copy)
    if p8.cachedOwnedUgcData and not p9 then
        return Promise.new(function(p10) -- Line: 43
            -- upvalues: ClientStore (ref)
            return p10(ClientStore:getState().Lobby.ownedUGC);
        end);
    end;

    return p8:requestOwnedUgcData();
end;

function u2.requestOwnedUgcData(u11) -- Line: 50
    -- upvalues: default (copy), ClientStore (copy)
    local v12 = default.Client:Get("GetOwnedUGCRequest"):CallServerAsync();
    v12:andThen(function(p13) -- Line: 52
        -- upvalues: ClientStore (ref), u11 (copy)
        ClientStore:dispatch({
            type = "LobbySetOwnedUGC",
            ugc = p13
        });
        u11.cachedOwnedUgcData = true;
    end);

    return v12;
end;

KnitClient.CreateController(u2.new());

return nil;