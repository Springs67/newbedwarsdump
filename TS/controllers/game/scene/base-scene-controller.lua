-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v1 = setmetatable({}, {
    __tostring = function() -- Line: 9, Name: __tostring
        return "BaseSceneController";
    end,

    __index = KnitController
});
v1.__index = v1;

function v1.constructor(p2, p3) -- Line: 15
    -- upvalues: KnitController (copy)
    KnitController.constructor(p2);
    p2.Name = "BaseSceneController";
    p2.active = false;
    p2.sceneKey = p3;
end;

function v1.KnitStart(u4) -- Line: 21
    -- upvalues: ClientSyncEvents (copy)
    ClientSyncEvents.SceneStarted:connect(function(p5) -- Line: 23
        -- upvalues: u4 (copy)
        if p5.sceneKey ~= u4.sceneKey then
            if u4.active then
                u4:onSceneShutdown();
                u4.active = false;
            end;

            return;
        end;

        u4.active = true;
        u4.sceneAssets = p5.sceneAssets;
        u4:onSceneStart();
    end);
    ClientSyncEvents.SceneLoadingScreenStart:connect(function(p6) -- Line: 36
        -- upvalues: u4 (copy)
        if p6.sceneActivatedFrom == u4.sceneKey then
            u4:onSceneLoadingScreenStart();
        end;
    end);
end;

return {
    BaseSceneController = v1
};