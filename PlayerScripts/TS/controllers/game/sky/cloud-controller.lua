-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local CloudNoise = RuntimeLib.import(script, script.Parent, "cloud-noise").CloudNoise;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "CloudController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: KnitController (copy), u2 (copy), Workspace (copy)
    KnitController.constructor(p5);
    p5.Name = "CloudController";
    p5.clouds = {};
    p5.cloudFolder = u2("Folder", {
        Name = "Clouds",
        Parent = Workspace
    });
end;

function u3.KnitStart(u6) -- Line: 39
    -- upvalues: KnitClient2 (copy), QueueType (copy), CloudNoise (copy)
    local _, u7 = KnitClient2.Controllers.MatchController:getQueueTypeAsync():await();

    if u7 == QueueType.SURVIVAL then
        return nil;
    end;

    if UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value <= Enum.SavedQualitySetting.QualityLevel2.Value then
        return nil;
    end;

    KnitClient2.Controllers.MapController:getCFrame("center"):andThen(function(p8) -- Line: 51
        -- upvalues: KnitClient2 (ref), CloudNoise (ref), u6 (copy), u7 (copy), QueueType (ref)
        local v9 = p8 or KnitClient2.Controllers.MapController:getCFramesFolder():GetChildren()[1].Value;
        local v10 = false;
        local v11 = 0;

        while true do
            if v10 then
                v11 = v11 + 1;
            else
                v10 = true;
            end;

            if v11 >= 80 then
                return;
            end;

            local v12 = false;
            local v13 = 0;

            while true do
                if true then
                    if v12 then
                        v13 = v13 + 1;
                    else
                        v12 = true;
                    end;
                end;

                if v13 >= 80 then
                    break;
                end;

                if CloudNoise[v11 + 1][v13] ~= nil then
                    u6:spawnCloud(v11, u7 == QueueType.LB_ONEBLOCK and -560 or 840, v13, v9.Position);
                end;
            end;
        end;
    end);
end;

function u3.spawnCloud(p14, p15, p16, p17, p18) -- Line: 90
    -- upvalues: u2 (copy)
    local v19 = Vector3.new(150 * (p15 - 40), p16, 150 * (40 - p17)) + p18;
    local v20 = u2("Part", {
        Size = Vector3.new(150, 65, 150),
        CastShadow = false,
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        CanQuery = false,
        Material = Enum.Material.Plastic,
        Color = Color3.fromRGB(255, 255, 255),
        TopSurface = Enum.SurfaceType.Smooth,
        Position = v19,
        Parent = p14.cloudFolder
    });
    table.insert(p14.clouds, v20);
end;

KnitClient.CreateController(u3.new());

return nil;