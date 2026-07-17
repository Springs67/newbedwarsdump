-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "DeepseaDaveyController";
    end,

    __index = BaseKitController
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 30
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p6, BedwarsKit.DAVEY);
    p6.Name = "DeepseaDaveyController";
    p6.combatSet = {};
end;

function u4.onKitLocalActivated(p7, p8) -- Line: 35
end;

function u4.onKitLocalDeactivated(p9) -- Line: 37
end;

function u4.onKitReplicationActivated(u10, p11) -- Line: 39
    -- upvalues: WatchCharacter (copy), KnitClient (copy), BedwarsKitSkin (copy), EntityUtil (copy)
    p11:GiveTask(WatchCharacter(function(p12, p13, p14) -- Line: 40
        -- upvalues: KnitClient (ref), BedwarsKitSkin (ref), EntityUtil (ref), u10 (copy)
        if KnitClient.Controllers.KitSkinController:getKitSkin(p13) ~= BedwarsKitSkin.DAVEY_DEEPSEA then
            return nil;
        end;

        if not EntityUtil:getEntity(p12) then
            return nil;
        end;

        p14:GiveTask((u10:setUpCombatListener(p12)));
    end));
    p11:GiveTask(WatchCharacter(function(p15, p16) -- Line: 52
        -- upvalues: KnitClient (ref), BedwarsKitSkin (ref), u10 (copy)
        if KnitClient.Controllers.KitSkinController:getKitSkin(p16) ~= BedwarsKitSkin.DAVEY_DEEPSEA then
            return nil;
        end;

        local v17 = u10:getFishModel(p16);
        local pufferfish = p16:WaitForChild("pufferfish", 1);

        if pufferfish ~= nil then
            pufferfish = pufferfish:WaitForChild("Handle", 1);
        end;

        if pufferfish then
            pufferfish.Transparency = 1;
        end;

        if v17 then
            u10:setUpTrack(p15, v17);
        end;
    end));
end;

function u4.onKitReplicationDeactivated(p18) -- Line: 71
end;

function u4.onInnateAbilityEnabled(p19, p20, p21) -- Line: 73
end;

function u4.onAbilityUsed(p22, p23, p24) -- Line: 75
end;

function u4.setUpCombatListener(u25, u26) -- Line: 77
    -- upvalues: u3 (copy), KnitClient2 (copy), MatchState (copy), EntityUtil (copy), Workspace (copy), AnimationUtil (copy)
    local v27 = u3.new();
    v27:GiveTask((task.spawn(function() -- Line: 79
        -- upvalues: KnitClient2 (ref), MatchState (ref), EntityUtil (ref), u26 (copy), u25 (copy), Workspace (ref), AnimationUtil (ref)
        while true do
            local v28 = task.wait(1);

            if v28 == 0 or (v28 ~= v28 or not v28) then
                break;
            end;

            if KnitClient2.Controllers.MatchController:getMatchState() == MatchState.RUNNING then
                local v29 = EntityUtil:getEntity(u26);

                if v29 and not v29:isDead() then
                    if u25.combatSet[v29] == nil then
                        if v29:getLastSwordHitTime() + 1 > Workspace:GetServerTimeNow() then
                            u25.combatSet[v29] = true;
                            local v30 = u25:getFishModel(v29:getInstance());

                            if v30 then
                                AnimationUtil:playAnimation(v30, "rbxassetid://18241229092");
                            end;
                        end;
                    elseif v29:getLastSwordHitTime() + 3 < Workspace:GetServerTimeNow() then
                        u25.combatSet[v29] = nil;
                        local v31 = u25:getFishModel(v29:getInstance());

                        if v31 then
                            AnimationUtil:playAnimation(v31, "rbxassetid://18241231624");
                        end;
                    end;
                end;
            end;
        end;
    end)));

    return v27;
end;

function u4.setUpTrack(p32, p33, p34) -- Line: 117
    -- upvalues: AnimationUtil (copy)
    AnimationUtil:playAnimation(p34, "rbxassetid://18241231624");
end;

function u4.getFishModel(p35, p36) -- Line: 120
    local pufferfish = p36:WaitForChild("pufferfish", 1);

    if pufferfish ~= nil then
        pufferfish = pufferfish:WaitForChild("Handle", 1);

        if pufferfish ~= nil then
            pufferfish = pufferfish:WaitForChild("rig", 1);
        end;
    end;

    return pufferfish;
end;

KnitClient.CreateController(u4.new());

return nil;