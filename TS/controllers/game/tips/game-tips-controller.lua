-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local v4 = {};
local u5 = setmetatable({}, {
    __index = v4
});
u5.BED_DEFENSE = "bed_defense";
v4.bed_defense = "BED_DEFENSE";
u5.DIAMOND_GUARDIANS = "diamond_guardians";
v4.diamond_guardians = "DIAMOND_GUARDIANS";
u5.TITAN = "titan";
v4.titan = "TITAN";
u5.BHAA = "bhaa";
v4.bhaa = "BHAA";
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "GameTipsController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 44
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 48
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "GameTipsController";
    p8.tipsQueued = false;
    p8.tipsShown = {};
end;

function u6.KnitStart(u9) -- Line: 54
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), MatchState (copy), KnitClient2 (copy), GamePlayerUtil (copy), Players (copy), GameType (copy), CollectionService (copy), BlockEngine (copy), ItemType (copy), u5 (ref), default (copy), StatefulEntityTag (copy)
    KnitController.KnitStart(u9);
    ClientSyncEvents.MatchStateChange:connect(function(p10) -- Line: 56
        -- upvalues: MatchState (ref), u9 (copy), KnitClient2 (ref), GamePlayerUtil (ref), Players (ref), GameType (ref), CollectionService (ref), BlockEngine (ref), ItemType (ref), u5 (ref)
        if p10.matchState == MatchState.RUNNING and not u9.tipsQueued then
            local u11 = KnitClient2.Controllers.MatchController:getQueueMeta();
            local u12 = GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId();
            task.delay(180, function() -- Line: 61
                -- upvalues: u11 (copy), GameType (ref), CollectionService (ref), u12 (copy), BlockEngine (ref), ItemType (ref), u9 (ref), u5 (ref)
                local v13 = u11;

                if v13 ~= nil then
                    v13 = v13.game;
                end;

                if v13 ~= GameType.BEDWARS then
                    return nil;
                end;

                local v14 = CollectionService:GetTagged("bed:" .. tostring(u12));
                local v15 = v14[1];
                local u16 = { Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 0, 1), Vector3.new(0, 0, -1), Vector3.new(0, 1, 0) };
                local u17 = false;
                local v18 = BlockEngine:getHandlerRegistry():getHandler(ItemType.BED);

                if v18 ~= nil then
                    local v19 = v18:getContainedPositions(v15);

                    local function v24(u20) -- Line: 76
                        -- upvalues: BlockEngine (ref), u17 (ref), u16 (copy)
                        local function _(p21) -- Line: 77
                            -- upvalues: BlockEngine (ref), u20 (copy), u17 (ref)
                            local v22 = BlockEngine:getStore():getBlockAt(u20 + p21);

                            if v22 and v22.Name ~= "bed" then
                                u17 = true;
                            end;
                        end;

                        for i, v in u16 do
                            local _ = i - 1;
                            local v23 = BlockEngine:getStore():getBlockAt(u20 + v);

                            if v23 and v23.Name ~= "bed" then
                                u17 = true;
                            end;
                        end;
                    end;

                    for i, v in v19 do
                        v24(v, i - 1, v19);
                    end;
                end;

                if not u17 then
                    u9:showTip(u5.BED_DEFENSE, "Your bed is unprotected! Remember you can build blocks around the bed to defend it.", { v14[1]:FindFirstChild("Bed", true) });
                end;
            end);
            u9.tipsQueued = true;
        end;
    end);
    default.Client:Get("DiamondGuardiansSpawned"):Connect(function() -- Line: 102
        -- upvalues: u9 (copy), u5 (ref), CollectionService (ref), StatefulEntityTag (ref)
        u9:showTip(u5.DIAMOND_GUARDIANS, "Diamond guardians at generators can be slain for extra diamonds.", CollectionService:GetTagged("GameEntity_" .. StatefulEntityTag.DIAMOND_GUARDIAN));
    end);
    default.Client:Get("BossSpawned"):Connect(function(p25) -- Line: 106
        -- upvalues: u9 (copy), u5 (ref), CollectionService (ref), StatefulEntityTag (ref)
        if p25.bossType == "Golem" or (p25.bossType == "SpiritGolem" or p25.bossType == "VoidGolem") then
            u9:showTip(u5.TITAN, "Titans can be slain to grant enormous buffs to the entire team!", CollectionService:GetTagged("GameEntity_" .. StatefulEntityTag.GOLEM_BOSS));
        end;

        if p25.bossType == "Bhaa" then
            u9:showTip(u5.BHAA, "Bhaa grants an extra life to every member on the team if slain!", CollectionService:GetTagged("GameEntity_" .. StatefulEntityTag.BHAA));
        end;
    end);
end;

function u6.showTip(u26, p27, p28, u29) -- Line: 115
    -- upvalues: KnitClient (copy)
    if table.find(u26.tipsShown, p27) ~= nil then
        return nil;
    end;

    local u30 = {};
    KnitClient.Controllers.TipsController:showTip(p28, {
        duration = 10,

        onMount = function() -- Line: 124, Name: onMount
            -- upvalues: u29 (copy), u26 (copy), u30 (copy)
            local v31 = u29;

            if v31 ~= nil then
                local function _(p32) -- Line: 127
                    -- upvalues: u26 (ref), u30 (ref)
                    local v33 = u26:highlight(p32);
                    table.insert(u30, v33);
                end;

                for i, v in v31 do
                    local _ = i - 1;
                    local v34 = u26:highlight(v);
                    table.insert(u30, v34);
                end;
            end;
        end,

        onDismount = function() -- Line: 136, Name: onDismount
            -- upvalues: u30 (copy)
            local function _(p35) -- Line: 137
                return p35:Destroy();
            end;

            for i, v in u30 do
                local _ = i - 1;
                v:Destroy();
            end;

            return nil;
        end
    });
    table.insert(u26.tipsShown, p27);
end;

function u6.highlight(p36, p37) -- Line: 150
    -- upvalues: u2 (copy)
    local v38 = Color3.fromRGB(0, 255, 255);

    return u2("Highlight", {
        Name = "TipHighlight",
        FillTransparency = 0.7,
        Parent = p37,
        FillColor = v38,
        OutlineColor = v38
    });
end;

KnitClient.CreateController(u6.new());

return nil;