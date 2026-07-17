-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchPlayer = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local BlockHuntTeamId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-team-id").BlockHuntTeamId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "BlockHuntHunterController";
    end,

    __index = GameKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p3, { GameType.BLOCK_HUNT });
    p3.Name = "BlockHuntHunterController";
end;

function u1.onGameInit(p4) -- Line: 28
    -- upvalues: default (copy), KnitClient (copy), BlockHuntTeamId (copy), WatchPlayer (copy), EntityUtil (copy)
    default.Client:Get("BHSetHunter"):Connect(function(u5) -- Line: 30
        -- upvalues: KnitClient (ref), BlockHuntTeamId (ref), WatchPlayer (ref), EntityUtil (ref)
        local v6 = KnitClient.Controllers.TeamController:getPlayerTeam(u5.player);

        if v6 ~= nil then
            v6 = v6.id;
        end;

        if v6 ~= BlockHuntTeamId.HUNTERS then
            return nil;
        end;

        WatchPlayer(function(p7) -- Line: 39
            -- upvalues: u5 (copy), EntityUtil (ref)
            if p7 == u5.player then
                return nil;
            end;

            if p7.Team == u5.player.Team then
                return nil;
            end;

            local v8 = EntityUtil:getEntity(p7);

            if not v8 then
                return nil;
            end;

            v8:hideNametag();
        end);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;