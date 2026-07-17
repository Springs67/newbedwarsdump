-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ConfigType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType;
local getConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig;
local WIND_DIRECTION = RuntimeLib.import(script, script.Parent, "ambience-settings").WIND_DIRECTION;
local NumberSequenceBuilder = RuntimeLib.import(script, script.Parent, "number-sequence-builder").NumberSequenceBuilder;
local Folder = Instance.new("Folder");
Folder.Name = "WindTrailAmbientEffects";
Folder.Parent = Workspace;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "WindLineEffectController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 30
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "WindLineEffectController";
end;

function u3.KnitStart(p6) -- Line: 38
    -- upvalues: getConfig (copy), ConfigType (copy)
    if not getConfig(ConfigType.ForceLobbyServer) then
        return nil;
    end;
end;

function u3.followPath(p7, p8, p9) -- Line: 60
    -- upvalues: TweenService (copy)
    local v10 = false;
    local v11 = 0;

    while true do
        if v10 then
            v11 = v11 + 1;
        else
            v10 = true;
        end;

        if v11 >= #p9 then
            return;
        end;

        local v12 = math.pow((v11 / #p9 - 0.5) * 4, 2) * 0.05 + 0.05;
        local v13 = p9[v11 + 1];
        local v14 = TweenService:Create(p8, TweenInfo.new(v12, Enum.EasingStyle.Linear), {
            Position = v13
        });
        v14:Play();
        v14.Completed:Wait();
    end;
end;

function u3.spawnWindParticle(u15) -- Line: 83
    -- upvalues: RuntimeLib (copy), Players (copy), WIND_DIRECTION (copy), u1 (copy), Folder (copy), NumberSequenceBuilder (copy)
    RuntimeLib.Promise.defer(function() -- Line: 84
        -- upvalues: Players (ref), WIND_DIRECTION (ref), u1 (ref), Folder (ref), NumberSequenceBuilder (ref), RuntimeLib (ref), u15 (copy)
        local LocalPlayer = Players.LocalPlayer;

        if LocalPlayer ~= nil then
            LocalPlayer = LocalPlayer.Character;

            if LocalPlayer ~= nil then
                LocalPlayer = LocalPlayer.PrimaryPart;

                if LocalPlayer ~= nil then
                    LocalPlayer = LocalPlayer.Position;
                end;
            end;
        end;

        if not LocalPlayer then
            return nil;
        end;

        local v16 = math.random() * 2 * 3.141592653589793;
        local v17 = math.random() * 15 + 30;
        local v18 = (15 + math.random() * 30) * math.cos(v16);
        local v19 = (15 + math.random() * 30) * math.sin(v16);
        local v20 = Vector3.new(v18, v17, v19);
        local Unit = (WIND_DIRECTION + Vector3.new(0.1, 0.1, 0.075) * (math.random() * 2 - 1)).Unit;
        local v21 = v20 + LocalPlayer + Unit * 52.5;
        local v22 = v21 + Unit * 105;
        local v23 = false;
        local v24 = 0;
        local u25 = {};

        while true do
            if v23 then
                v24 = v24 + 0.05;
            else
                v23 = true;
            end;

            if v24 >= 1 then
                local u26 = u1("Part", {
                    Name = "Wind",
                    Anchored = true,
                    CanCollide = false,
                    Transparency = 1,
                    Position = v21,
                    Parent = Folder
                });
                local Attachment = Instance.new("Attachment", u26);
                local Attachment2 = Instance.new("Attachment", u26);
                Attachment2.CFrame = Attachment2.CFrame + Vector3.new(0, 0.5, 0);
                u1("Trail", {
                    FaceCamera = true,
                    LightInfluence = 0.3,
                    Lifetime = 0.65,
                    Transparency = NumberSequenceBuilder.new():addKeypoint(0, 0.85):build(),
                    WidthScale = NumberSequenceBuilder.new():addKeypoint(0, 0.2):addKeypoint(0.5, 1):addKeypoint(1, 0.2):build(),
                    Attachment0 = Attachment,
                    Attachment1 = Attachment2,
                    Parent = u26
                });
                RuntimeLib.Promise.defer(function() -- Line: 157
                    -- upvalues: u15 (ref), u26 (copy), u25 (copy)
                    u15:followPath(u26, u25);
                    task.wait(0.65);
                    u26:Destroy();
                end);

                return;
            end;

            local v27 = CFrame.new(v21, v22);
            local v28 = math.sin(v24 * 3.141592653589793 * 2);
            local Position = (v27 * CFrame.new(0, v28 * 2, v24 * (v21 - v22).Magnitude)).Position;
            table.insert(u25, Position);
        end;
    end);
end;

return {
    WindLineEffectController = KnitClient.CreateController(u3.new())
};