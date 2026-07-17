-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "MissionsController";
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
    p3.Name = "MissionsController";
end;

function u1.KnitStart(u4) -- Line: 25
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy)
    KnitController.KnitStart(u4);
    default.Client:OnEvent("SetAllMissionData", function(p5) -- Line: 28
        -- upvalues: u4 (copy), ClientStore (ref)
        u4.missionData = p5.missionData;
        ClientStore:dispatch({
            type = "LobbySetMissionsData",
            missionsData = p5.missionData
        });
    end);
    default.Client:OnEvent("UpdateMissionProgress", function(p6) -- Line: 35
        -- upvalues: u4 (copy), ClientStore (ref)
        local missionData = u4.missionData;

        if missionData ~= nil then
            missionData.progress[p6.missionId] = p6.progress;
        end;

        local nextStage = p6.nextStage;

        if nextStage ~= 0 and (nextStage == nextStage and nextStage) then
            local missionData2 = u4.missionData;

            if missionData2 ~= nil then
                missionData2.stages[p6.missionId] = p6.nextStage;
            end;
        end;

        if u4.missionData then
            ClientStore:dispatch({
                type = "LobbySetMissionsData",
                missionsData = u4.missionData
            });
        end;
    end);
end;

function u1.getMissionData(u7) -- Line: 61
    -- upvalues: RuntimeLib (copy), default (copy), ClientStore (copy)
    local missionData = u7.missionData;

    if missionData then
        return RuntimeLib.Promise.new(function(p8) -- Line: 64
            -- upvalues: missionData (copy)
            p8(missionData);
        end);
    end;

    local v9 = default.Client:Get("LoadMissionData"):CallServerAsync();
    v9:andThen(function(p10) -- Line: 69
        -- upvalues: ClientStore (ref), u7 (copy)
        ClientStore:dispatch({
            type = "LobbySetMissionsData",
            missionsData = p10
        });
        u7.missionData = p10;
    end);

    return v9;
end;

KnitClient.CreateController(u1.new());

return nil;