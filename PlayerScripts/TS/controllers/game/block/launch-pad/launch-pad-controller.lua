-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "octo-tree", "out");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "LaunchPadController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 30
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "LaunchPadController";
    p6.launchpadData = {};
    p6.lastLaunch = -1;
    p6.launched = false;
    p6.usedCount = 0;
    p6.lastUsed = 0;
end;

function u4.KnitStart(u7) -- Line: 43
    -- upvalues: KnitController (copy), u2 (copy), WatchCollectionTag (copy), Players (copy), u1 (copy), MapUtil (copy), CollectionService (copy), RunService (copy), BLOCK_SIZE (copy), default (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u7);
    local u8 = u2.new();
    WatchCollectionTag("launch-pad", function(p9) -- Line: 46
        -- upvalues: Players (ref), u1 (ref), u8 (copy), MapUtil (ref), u7 (copy)
        local v10 = p9:GetAttribute("PlacedByUserId");
        local v11;

        if p9:GetAttribute("IgnoreTeam") or (v10 == nil or v10 == 0) then
            v11 = nil;
        else
            local v12 = Players:GetPlayerByUserId(v10);

            if v12 == nil then
                return nil;
            end;

            v11 = v12:GetAttribute("Team");
        end;

        if p9:GetAttribute("ClientPlaced") then
            return nil;
        end;

        local v13 = u1.new();
        local u14 = u8:CreateNode(p9.Position, {
            launchpad = p9,
            ownerTeam = v11
        });
        MapUtil.getOrCreate(u7.launchpadData, p9, {
            maid = v13
        });
        v13:GiveTask(function() -- Line: 68
            -- upvalues: u8 (ref), u14 (copy)
            u8:RemoveNode(u14);
        end);
    end);
    CollectionService:GetInstanceRemovedSignal("launch-pad"):Connect(function(p15) -- Line: 72
        -- upvalues: u7 (copy)
        local v16 = u7.launchpadData[p15];

        if v16 then
            v16.maid:DoCleaning();
            u7.launchpadData[p15] = nil;
        end;
    end);
    RunService.Heartbeat:Connect(function() -- Line: 83
        -- upvalues: Players (ref), u8 (copy), BLOCK_SIZE (ref), u7 (copy)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if not Character then
            return nil;
        end;

        for _, v in u8:SearchRadius(Character, 6) do
            if ((v.Position - Character) * Vector3.new(1, 0, 1)).Magnitude <= BLOCK_SIZE / 2 then
                u7:attemptLaunch(v.Object.launchpad, v.Object.ownerTeam);

                return nil;
            end;
        end;
    end);
    default.Client:OnEvent("LaunchPadUsed", function(p17) -- Line: 104
        -- upvalues: Players (ref), ClientSyncEvents (ref)
        if p17.player ~= Players.LocalPlayer then
            ClientSyncEvents.LaunchPadUsed:fire(p17.launchpad);
        end;
    end);
end;

function u4.attemptLaunch(u18, u19, p20) -- Line: 110
    -- upvalues: Players (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), Workspace (copy), default (copy), ClientSyncEvents (copy)
    if p20 ~= nil and Players.LocalPlayer:GetAttribute("Team") ~= p20 then
        return nil;
    end;

    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local v21 = EntityUtil:getLocalPlayerEntity();

    if v21 and StatusEffectUtil:isActive(v21:getInstance(), StatusEffectType.GROUNDED) then
        return nil;
    end;

    if v21 and StatusEffectUtil:isActive(v21:getInstance(), StatusEffectType.FROSTED) then
        return nil;
    end;

    if Workspace:GetServerTimeNow() - u18.lastLaunch < 1 then
        return nil;
    end;

    u18.lastLaunch = Workspace:GetServerTimeNow();
    local u22 = u19:GetAttribute("Strength");
    local u23 = u19:GetAttribute("Direction") or Vector3.new(0, 1, 0);
    local _ = Character.HumanoidRootPart.AssemblyLinearVelocity;
    task.spawn(function() -- Line: 134
        -- upvalues: default (ref), u19 (copy), Workspace (ref), u18 (copy), Character (copy), u22 (copy), u23 (copy)
        default.Client:Get("UseLaunchPad"):SendToServer({
            launchPad = u19
        });
        local v24 = Workspace:GetServerTimeNow();

        if u18.lastUsed + 5 < v24 then
            u18.usedCount = 0;
        end;

        u18.lastUsed = v24;
        local v25 = 1 - math.min(0.7, u18.usedCount * 0.05);
        local v26 = u18;
        v26.usedCount = v26.usedCount + 1;
        Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
        local v27 = u22;
        local v28 = Character.PrimaryPart.AssemblyMass * 100 * (v27 == nil and 1 or v27) * v25;
        Character.PrimaryPart:ApplyImpulse(Vector3.new(v28, v28, v28) * u23);
    end);
    u18.launched = true;
    ClientSyncEvents.LaunchPadUsed:fire(u19);
end;

KnitClient.CreateController(u4.new());

return nil;