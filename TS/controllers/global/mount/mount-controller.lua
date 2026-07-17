-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local ActionButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ActionButton;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local MountMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta;
local MountUsedActionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountUsedActionType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "MountController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 30
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "MountController";
    local v8 = Enum.KeyCode:GetEnumItems();

    local function _(p9) -- Line: 38
        return p9.Name;
    end;

    local v10 = table.create(#v8);

    for i, v in v8 do
        local _ = i - 1;
        v10[i] = v.Name;
    end;

    p7.keycodeNames = v10;
    p7.activeMounts = {};
end;

function u5.KnitStart(u11) -- Line: 50
    -- upvalues: KnitController (copy), RunService (copy), Workspace (copy), default2 (copy), MountMeta (copy), MountUsedActionType (copy), u1 (copy), Players (copy), Flamework (copy), u3 (copy), ActionButton (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u11);
    RunService.Heartbeat:Connect(function() -- Line: 52
        -- upvalues: u11 (copy), Workspace (ref)
        debug.profilebegin("mount-controller");

        for i, v in u11:getActiveMounts() do
            if not v.model:IsDescendantOf(Workspace) then
                u11:removeMount(i, v.mountType);
            end;
        end;

        debug.profileend();
    end);
    default2.Client:OnEvent("MountUsed", function(p12, p13, p14, p15) -- Line: 61
        -- upvalues: MountMeta (ref), MountUsedActionType (ref), u1 (ref), u11 (copy), Players (ref), Flamework (ref), u3 (ref), ActionButton (ref), default2 (ref), ClientSyncEvents (ref)
        local v16 = MountMeta[p13];
        local Character = p14.Character;

        if Character == nil then
            return nil;
        end;

        if p12 ~= MountUsedActionType.MOUNT then
            if p12 == MountUsedActionType.DISMOUNT then
                u11:removeMount(p14, p13);
            end;

            return;
        end;

        local v17 = u1.new();
        local v18 = u11:weldMountToCharacter(p13, Character);

        if not v18 then
            return nil;
        end;

        v17:GiveTask(v18);

        if p14 == Players.LocalPlayer and not p15 then
            local v19 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("Dismount");

            if v19 ~= nil then
                local function _(p20) -- Line: 79
                    -- upvalues: u11 (ref)
                    return table.find(u11.keycodeNames, p20.Name) ~= nil;
                end;

                local v21 = 0;
                v19 = {};

                for i, v in v19 do
                    local _ = i - 1;

                    if table.find(u11.keycodeNames, v.Name) ~= nil == true then
                        v21 = v21 + 1;
                        v19[v21] = v;
                    end;
                end;

                if v19 ~= nil then
                    v19 = table.remove(v19, 1);
                end;
            end;

            v17:GiveTask((Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u3.createElement(ActionButton, {
                actionName = "dismount-" .. p13,
                interactionKey = v19,

                onActivated = function() -- Line: 103, Name: onActivated
                    -- upvalues: default2 (ref)
                    default2.Client:Get("Dismount"):SendToServer();
                end,

                text = "Dismount " .. v16.displayName
            }))));
        end;

        u11.activeMounts[p14] = {
            maid = v17,
            mountType = p13,
            model = v18
        };
        ClientSyncEvents.GenericMountMounted:fire(p14, p13, v18, Character);
    end);
end;

function u5.removeMount(p22, p23, p24) -- Line: 125
    -- upvalues: MountMeta (copy), ClientSyncEvents (copy)
    local v25 = p22.activeMounts[p23];
    local Character = p23.Character;

    if v25 then
        if p24 and p24 ~= v25.mountType then
            return nil;
        end;

        local v26 = MountMeta[v25.mountType];
        local v27;

        if v25 == nil then
            v27 = v25;
        else
            v27 = v25.mountType;
        end;

        ClientSyncEvents.GenericMountDismounted:fire(p23, v27);

        if v25.model and (Character and Character.Humanoid) then
            local mountHipYOffset = v26.mountHipYOffset;

            if mountHipYOffset == nil then
                mountHipYOffset = v25.model.PrimaryPart.Size.Y / 2 - 0.1;
            end;

            local Humanoid = Character.Humanoid;
            Humanoid.HipHeight = Humanoid.HipHeight - mountHipYOffset;
        end;

        if v25 ~= nil then
            v25.maid:DoCleaning();
        end;

        if p24 then
            local v28 = p22.activeMounts[p23];

            if v28 ~= nil then
                v28 = v28.mountType;
            end;

            p24 = v28 ~= p24;
        end;

        if p24 then
            return nil;
        end;

        p22.activeMounts[p23] = nil;
    end;
end;

function u5.getActiveMounts(p29) -- Line: 171
    return p29.activeMounts;
end;

function u5.getMountModelFromPlayer(p30, p31) -- Line: 174
    local v32 = p30.activeMounts[p31];

    if v32 ~= nil then
        v32 = v32.model;
    end;

    return v32;
end;

function u5.getMountTypeFromPlayer(p33, p34) -- Line: 184
    local v35 = p33.activeMounts[p34];

    if v35 ~= nil then
        v35 = v35.mountType;
    end;

    return v35;
end;

function u5.getMountModel(p36, p37) -- Line: 194
    -- upvalues: MountMeta (copy), ReplicatedStorage (copy)
    local v38 = MountMeta[p37];

    if type(v38.model) ~= "string" then
        return v38.model();
    end;

    local v39 = ReplicatedStorage.Assets.Mounts:FindFirstChild(v38.model);

    if v39 ~= nil then
        v39 = v39:Clone();
    end;

    return v39;
end;

function u5.weldMountToCharacter(p40, p41, p42) -- Line: 209
    -- upvalues: MountMeta (copy), default (copy), u2 (copy)
    local v43 = MountMeta[p41];
    local v44 = p40:getMountModel(p41);

    if v44 == nil or v44.PrimaryPart == nil then
        default.Error("Error creating mount {mountType}. model not found", p41);

        return nil;
    end;

    v44:PivotTo(p42:GetPivot() * CFrame.new(0, -v44.PrimaryPart.Size.Y, 0));
    local mountHipYOffset = v43.mountHipYOffset;

    if mountHipYOffset == nil then
        mountHipYOffset = v44.PrimaryPart.Size.Y / 2 - 0.1;
    end;

    local Humanoid = p42.Humanoid;
    Humanoid.HipHeight = Humanoid.HipHeight + mountHipYOffset;
    u2("WeldConstraint", {
        Part0 = p42.HumanoidRootPart,
        Part1 = v44.PrimaryPart,
        Parent = v44.PrimaryPart
    });
    v44.Parent = p42;

    return v44;
end;

KnitClient.CreateController(u5.new());

return nil;