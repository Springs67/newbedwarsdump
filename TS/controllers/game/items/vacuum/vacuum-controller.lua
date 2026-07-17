-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local ExpireList = v1.ExpireList;
local MobileButton = v1.MobileButton;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CollectableEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local VacuumConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vacuum", "vacuum-constants").VacuumConstants;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local VacuumGUI = RuntimeLib.import(script, script.Parent, "vacuum-gui").VacuumGUI;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "VacuumController";
    end,

    __index = ProjectileSourceController
});
u5.__index = u5;

function u5.new(...) -- Line: 34
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 38
    -- upvalues: ProjectileSourceController (copy), ExpireList (copy), default (copy), u2 (copy)
    ProjectileSourceController.constructor(p7);
    p7.Name = "VacuumController";
    p7.collectingGhosts = ExpireList.new(2);
    p7.entityRemovedRemote = default.Client:Get("CollectableEntityRemoved");
    p7.guiMaid = u2.new();
end;

function u5.KnitStart(u8) -- Line: 45
    -- upvalues: ProjectileSourceController (copy), CollectableEntityType (copy), Players (copy)
    ProjectileSourceController.KnitStart(u8);
    u8.entityRemovedRemote:Connect(function(p9) -- Line: 47
        -- upvalues: CollectableEntityType (ref), Players (ref), u8 (copy)
        if p9.entityType ~= CollectableEntityType.GHOST then
            return nil;
        end;

        if p9.collector ~= Players.LocalPlayer then
            return nil;
        end;

        u8.collectingGhosts:remove(p9.id);
    end);
end;

function u5.isRelevantItem(p10, p11) -- Line: 57
    -- upvalues: ItemType (copy)
    return p11.itemType == ItemType.VACUUM;
end;

function u5.onEnable(u12, p13, u14) -- Line: 60
    -- upvalues: ProjectileSourceController (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), Flamework (copy), DeviceUtil (copy), u3 (copy), MobileButton (copy), BedwarsImageId (copy), BedwarsUI (copy), VacuumGUI (copy)
    ProjectileSourceController.onEnable(u12, p13, u14);
    u12:setupYield(function() -- Line: 62
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref)
        local u15 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.VACUUM_IDLE, {
            looped = true
        });

        return function() -- Line: 66
            -- upvalues: u15 (copy)
            local v16 = u15;

            if v16 ~= nil then
                v16:Stop();
            end;
        end;
    end);
    local v20 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "use-vacuum",

        boundFunction = function(p17, p18, p19) -- Line: 77, Name: boundFunction
            -- upvalues: u12 (copy), u14 (copy)
            if not u12:getNearbyGhost() then
                return Enum.ContextActionResult.Pass;
            end;

            if p18 == Enum.UserInputState.Begin or p18 == Enum.UserInputState.End then
                u12:useVacuum(p19, u14);
            end;

            return Enum.ContextActionResult.Sink;
        end,

        priority = Enum.ContextActionPriority.Medium.Value
    });
    u12.maid:GiveTask(v20);

    if DeviceUtil.isMobileControls() then
        u12:setupYield(function() -- Line: 92
            -- upvalues: u3 (ref), MobileButton (ref), BedwarsImageId (ref), BedwarsUI (ref), u12 (copy), u14 (copy), Players (ref)
            local u22 = u3.mount(u3.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u3.createElement(MobileButton, {
                    Image = BedwarsImageId.SHOOT_MOBILE,
                    Position = BedwarsUI:getActionMobileButtonPosition(),

                    OnPressDown = function(p21) -- Line: 99, Name: OnPressDown
                        -- upvalues: u12 (ref), u14 (ref)
                        u12:useVacuum(p21, u14);
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 104
                -- upvalues: u3 (ref), u22 (copy)
                u3.unmount(u22);
            end;
        end);
    end;

    local v23 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u3.createElement(VacuumGUI, {
        InitialGhostCount = u12:getGhostCount()
    }));
    u12.guiMaid:GiveTask(v23);
end;

function u5.onDisable(p24) -- Line: 115
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.onDisable(p24);
    p24.guiMaid:DoCleaning();
end;

function u5.useVacuum(u25, p26, p27) -- Line: 119
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy), VacuumConstants (copy)
    if p26.UserInputState == Enum.UserInputState.End then
        local animationTrack = u25.animationTrack;

        if animationTrack ~= nil then
            animationTrack:Stop(0.1);
        end;

        local animationTrack2 = u25.animationTrack;

        if animationTrack2 ~= nil then
            animationTrack2:Destroy();
        end;

        return nil;
    end;

    local v28 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.VACUUM_STARTUP, {
        looped = false
    });
    u25.animationTrack = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.VACUUM_SUCK, {
        looped = true
    });

    if u25.animationTrack then
        u25.maid:GiveTask(function() -- Line: 138
            -- upvalues: u25 (copy)
            local animationTrack = u25.animationTrack;

            if animationTrack ~= nil then
                animationTrack:Stop(0.1);
            end;

            local animationTrack2 = u25.animationTrack;

            if animationTrack2 ~= nil then
                animationTrack2:Destroy();
            end;
        end);
    end;

    if v28 ~= nil then
        v28.Stopped:Wait();
    end;

    while true do
        local v29 = task.wait(0.1);

        if v29 ~= 0 and (v29 == v29 and v29) then
            v29 = p27();

            if v29 then
                if p26.UserInputState == Enum.UserInputState.End then
                    v29 = false;
                else
                    v29 = u25:getGhostCount() < VacuumConstants.MAX_GHOST_COUNT;
                end;
            end;
        end;

        if v29 == 0 or (v29 ~= v29 or not v29) then
            local animationTrack = u25.animationTrack;

            if animationTrack ~= nil then
                animationTrack:Stop(0.1);
            end;

            local animationTrack2 = u25.animationTrack;

            if animationTrack2 ~= nil then
                animationTrack2:Destroy();
            end;

            return;
        end;

        u25:tryVacuumNearbyGhost();
    end;
end;

function u5.tryVacuumNearbyGhost(p30) -- Line: 172
    -- upvalues: default (copy)
    local v31 = p30:getNearbyGhost();

    if not v31 then
        return nil;
    end;

    local v32 = v31:GetAttribute("Id");

    if p30.collectingGhosts:has(v32) then
        return nil;
    end;

    p30.collectingGhosts:add(v32);
    default.Client:Get("CollectCollectableEntity"):SendToServer({
        id = v32
    });
end;

function u5.getNearbyGhost(p33) -- Line: 190
    -- upvalues: Players (copy), CollectionService (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame;
        end;
    end;

    if not Character then
        return nil;
    end;

    local u34 = Character.Position + Character.LookVector.Unit * 15;

    local function _(p35) -- Line: 206
        -- upvalues: u34 (copy)
        return (p35:GetPivot().Position - u34).Magnitude < 15;
    end;

    local v36 = nil;

    for i, v in CollectionService:GetTagged("ghost") do
        local _ = i - 1;

        if (v:GetPivot().Position - u34).Magnitude < 15 == true then
            v36 = v;
            break;
        end;
    end;

    return v36;
end;

function u5.onStartCharging(p37) -- Line: 221
end;

function u5.onStopCharging(p38) -- Line: 223
end;

function u5.onLaunch(u39, u40) -- Line: 225
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    task.spawn(function() -- Line: 226
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref), u40 (copy), u39 (copy)
        local u41 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.VACUUM_LAUNCH, {
            looped = false
        });

        if not u40() and u41 ~= nil then
            u41:Stop();
        end;

        if u41 then
            u39.maid:GiveTask(function() -- Line: 237
                -- upvalues: u41 (copy)
                return u41:Stop();
            end);
        end;
    end);
    u39:setLocalGhostCount(u39:getGhostCount() - 1);
end;

function u5.canLaunch(p42) -- Line: 244
    return p42:getGhostCount() > 0;
end;

function u5.onStartReload(p43, p44) -- Line: 247
end;

function u5.getGhostCount(p45) -- Line: 249
    -- upvalues: Players (copy)
    local v46 = Players.LocalPlayer:GetAttribute("Vacuum_GhostCount");

    return v46 == nil and 0 or v46;
end;

function u5.setLocalGhostCount(p47, p48) -- Line: 257
    -- upvalues: Players (copy)
    Players.LocalPlayer:SetAttribute("Vacuum_GhostCount", p48);
end;

KnitClient.CreateController(u5.new());

return nil;