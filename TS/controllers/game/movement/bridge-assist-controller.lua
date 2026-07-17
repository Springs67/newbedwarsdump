-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u4 = { Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 0, 1), Vector3.new(0, 0, -1) };
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "BridgeAssistController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 26
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "BridgeAssistController";
end;

function u5.KnitStart(u8) -- Line: 34
    -- upvalues: KnitController (copy), DeviceUtil (copy), PlaceUtil (copy), RunService (copy)
    KnitController.KnitStart(u8);

    if not DeviceUtil.isMobileControls() and PlaceUtil.isProduction() then
        return nil;
    end;

    RunService.Heartbeat:Connect(function() -- Line: 40
        -- upvalues: u8 (copy)
        debug.profilebegin("bridge-assist");
        u8:stepBridgeAssist();
        debug.profileend();
    end);
    RunService:BindToRenderStep("bridge-assist", Enum.RenderPriority.Character.Value + 1, function() -- Line: 45
        -- upvalues: u8 (copy)
        local v9 = u8:getHumanoid();

        if not v9 then
            return nil;
        end;

        u8.attemptedMoveDirection = v9.MoveDirection;

        if u8.targetMoveDirection then
            v9:Move(u8.targetMoveDirection);
            u8.targetMoveDirection = nil;
        end;
    end);
end;

function u5.stepBridgeAssist(p10) -- Line: 57
    -- upvalues: Players (copy), u4 (copy), GameQueryUtil (copy)
    local Character = Players.LocalPlayer.Character;

    if not (Character and Character.PrimaryPart) then
        return nil;
    end;

    if not p10:getHumanoid() then
        return nil;
    end;

    local attemptedMoveDirection = p10.attemptedMoveDirection;

    if not attemptedMoveDirection or attemptedMoveDirection.Magnitude == 0 then
        return nil;
    end;

    for _, v in u4 do
        local v11 = v:Dot(attemptedMoveDirection);
        local v12 = math.acos(v11);

        if math.abs(v12) < 0.5759586531581288 then
            local v13 = RaycastParams.new();
            v13.FilterType = Enum.RaycastFilterType.Blacklist;
            v13.FilterDescendantsInstances = { Character };

            if not GameQueryUtil:raycast(Character.PrimaryPart.Position, Vector3.new(0, -18, 0), v13) then
                local v14 = false;
                local v15 = p10:getFloorBlock();

                if #v15 ~= 0 then
                    for _, v2 in v15 do
                        local Unit = ((Character.PrimaryPart.Position - v2.Position) * Vector3.new(1, 0, 1)).Unit;
                        local v16 = math.sign(Unit.X);
                        local v17 = math.sign(Unit.Z);
                        local v18 = attemptedMoveDirection:Dot(Vector3.new(v16, 0, v17) * (math.abs(attemptedMoveDirection.X) > math.abs(attemptedMoveDirection.Z) and Vector3.new(0, 0, 1) or Vector3.new(1, 0, 0)));
                        local v19 = math.acos(v18);

                        if math.deg(v19) > 90 then
                            v14 = true;
                        end;
                    end;

                    if not v14 then
                        p10.targetMoveDirection = v;
                    end;

                    return nil;
                end;
            end;
        end;
    end;
end;

function u5.getFloorBlock(p20) -- Line: 110
    -- upvalues: Players (copy), u2 (copy), Workspace (copy), GameQueryUtil (copy), BlockEngine (copy)
    local Character = Players.LocalPlayer.Character;
    local Humanoid = Character:FindFirstChild("Humanoid");
    local PrimaryPart = Character.PrimaryPart;
    local v21 = u2("Part", {
        Name = "BridgeAssistHelper",
        Transparency = 1,
        CanCollide = false,
        Anchored = true,
        Size = Vector3.new(PrimaryPart.Size.X, 1, PrimaryPart.Size.Z),
        Parent = Workspace
    });
    v21.CFrame = PrimaryPart.CFrame - Vector3.new(0, Humanoid.HipHeight + PrimaryPart.Size.Y / 2, 0);
    local v22 = OverlapParams.new();
    v22.FilterDescendantsInstances = { Character };
    v22.FilterType = Enum.RaycastFilterType.Blacklist;

    local function _(p23) -- Line: 129
        -- upvalues: GameQueryUtil (ref), BlockEngine (ref)
        if GameQueryUtil:isQueryIgnored(p23) then
            return nil;
        end;

        return BlockEngine:getBlockInstanceFromChild(p23);
    end;

    local v24 = 0;
    local v25 = {};

    for i, v in Workspace:GetPartsInPart(v21, v22) do
        local _ = i - 1;
        local v26;

        if GameQueryUtil:isQueryIgnored(v) then
            v26 = nil;
        else
            v26 = BlockEngine:getBlockInstanceFromChild(v);
        end;

        if v26 ~= nil then
            v24 = v24 + 1;
            v25[v24] = v26;
        end;
    end;

    v21:Destroy();

    return v25;
end;

function u5.getHumanoid(p27) -- Line: 150
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;
    local v28;

    if Character == nil then
        v28 = Character;
    else
        v28 = Character.PrimaryPart;
    end;

    if v28 then
        return Character:FindFirstChild("Humanoid");
    end;

    return nil;
end;

KnitClient.CreateController(u5.new());

return nil;