-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local TeamController = RuntimeLib.import(script, script.Parent.Parent.Parent, "team", "team-controller").TeamController;
local v2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "BreakBedEffectController";
    end,

    __index = KnitController
});
v2.__index = v2;

function v2.constructor(p3, p4) -- Line: 21
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p3);
    p3.breakBedEffectType = p4;
    p3.Name = "BreakBedEffectController";
    p3.Client = {};
    p3.maid = u1.new();
end;

function v2.KnitStart(u5) -- Line: 28
    -- upvalues: KnitController (copy), default (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("BedBreakEffectTriggered"):Connect(function(p6) -- Line: 30
        -- upvalues: u5 (copy)
        if p6.effectType ~= u5.breakBedEffectType then
            return nil;
        end;

        u5:onBedBreak(p6.player, p6.cframe, p6.teamId, p6.centerBedPosition);
    end);
    ClientSyncEvents.StartBedBreakEffectPreview:connect(function(p7) -- Line: 36
        -- upvalues: u5 (copy)
        if p7.effectType ~= u5.breakBedEffectType then
            return nil;
        end;

        p7.maid = u5.maid;
        u5:onBedBreak(p7.player, p7.cframe, p7.teamId, p7.centerBedPosition);
    end);
end;

function v2.createBedDebris(u8, u9, u10, u11) -- Line: 44
    -- upvalues: TeamController (copy), KnitClient (copy), ItemType (copy), BlockEngine (copy)
    local v12 = math.random(0, 0.2);
    local u13 = Vector3.new(v12, 0.2, math.random(0, 0.2));
    local v14 = TeamController:getTeamById(u9:GetAttribute("TeamId"));

    if v14 ~= nil then
        v14 = v14.color;
    end;

    local v15 = u9:GetChildren();

    local function v20(p16) -- Line: 52
        -- upvalues: KnitClient (ref), ItemType (ref), BlockEngine (ref), u9 (copy), u13 (copy), u10 (copy), u11 (copy), u8 (copy)
        if p16:IsA("MeshPart") then
            local v17, v18;

            if p16.Name == "Legs" then
                Color3.new(0.38, 0.31, 0.21);
                v17 = false;
                v18 = 0;
            else
                local _ = p16.Color;
                v17 = false;
                v18 = 0;
            end;

            while true do
                if true then
                    if v17 then
                        v18 = v18 + 1;
                    else
                        v17 = true;
                    end;
                end;

                if v18 >= math.random(2, 4) then
                    break;
                end;

                local v19 = KnitClient.Controllers.BlockDebrisController:convertBlockToDebris(p16, ItemType.BED, BlockEngine:getBlockPosition(u9.Position), u13, nil, u10, u11, 6, nil, Enum.Material.SmoothPlastic, p16.Color);
                u8.maid:GiveTask(v19);
            end;
        end;
    end;

    for i, v in v15 do
        v20(v, i - 1, v15);
    end;
end;

return {
    BreakBedEffectController = v2
};