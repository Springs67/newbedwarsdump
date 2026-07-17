-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "ClanSearchController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "ClanSearchController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p4);
end;

function u1.searchClan(p5, p6) -- Line: 28
    -- upvalues: default (copy)
    return default.Client:GetNamespace("Clans"):Get("SearchClans"):CallServerAsync(p6);
end;

function u1.getRecommenedClans(p7) -- Line: 31
    -- upvalues: Flamework (copy), default (copy)
    local v8 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/friends/friends-controller@FriendsController"):getFriends();
    local v9;

    if v8 == nil then
        v9 = v8;
    else
        local function _(p10) -- Line: 34
            return p10.userId;
        end;

        v9 = table.create(#v8);

        for i, v in v8 do
            local _ = i - 1;
            v9[i] = v.userId;
        end;
    end;

    local v11 = v9 == nil and {} or v9;

    return default.Client:GetNamespace("Clans"):Get("GetRecommendedClans"):CallServerAsync({
        friends = v11
    });
end;

function u1.getRandomClans(p12) -- Line: 54
    -- upvalues: default (copy)
    return default.Client:GetNamespace("Clans"):Get("GetRandomClans"):CallServerAsync();
end;

KnitClient.CreateController(u1.new());

return nil;