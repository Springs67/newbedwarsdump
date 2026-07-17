-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local GroupMotor = v3.GroupMotor;
local SingleMotor = v3.SingleMotor;
local Spring = v3.Spring;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local UserInputService = v6.UserInputService;
local Workspace = v6.Workspace;
local ModelBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "model-skybox", "model-skybox").ModelBillboard;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SceneKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey;
local MazeRoleName = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "types", "maze").MazeRoleName;
local SimpleStateObject = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "simple-state-object").SimpleStateObject;
local BaseSceneController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "base-scene-controller").BaseSceneController;
local IlluminatorTableUi = RuntimeLib.import(script, script.Parent, "illuminator-table-ui").IlluminatorTableUi;
local u7 = Color3.fromRGB(153, 255, 128);
Color3.fromRGB(173, 71, 41);
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "IlluminatorRoleController";
    end,

    __index = BaseSceneController
});
u8.__index = u8;

function u8.new(...) -- Line: 44
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 48
    -- upvalues: BaseSceneController (copy), SceneKey (copy), u4 (copy), SimpleStateObject (copy)
    BaseSceneController.constructor(p10, SceneKey.HALLOWEEN_MAZE);
    p10.Name = "IlluminatorRoleController";
    p10.maid = u4.new();
    p10.proximityPrompts = {};
    p10.bigFlashlightActivated = false;
    p10.enabledEnemies = {};
    p10.stateObject = SimpleStateObject.new({
        lightOpen = nil
    }, true);
    p10.lastSentFlashlightPosition = -1;
end;

function u8.KnitStart(p11) -- Line: 60
    -- upvalues: BaseSceneController (copy)
    BaseSceneController.KnitStart(p11);
end;

function u8.onSceneLoadingScreenStart(p12) -- Line: 63
end;

function u8.onSceneStart(u13) -- Line: 65
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), GroupMotor (copy), default2 (copy), Spring (copy), SingleMotor (copy), WatchCollectionTag (copy), KnitClient2 (copy), Players (copy), default (copy), KnitClient (copy), MazeRoleName (copy), scaleModel (copy), u5 (copy), UserInputService (copy), RunService (copy), u7 (copy), CollectionService (copy)
    u13.bigFlashlight = ReplicatedStorage.Assets.Effects.BigFlashlight:Clone();
    u13.bigFlashlight.Parent = Workspace;

    if u13.bigFlashlight.PrimaryPart then
        u13.bigFlashlight.PrimaryPart.CanQuery = false;
    end;

    u13.maid:GiveTask(function() -- Line: 72
        -- upvalues: u13 (copy)
        local bigFlashlight = u13.bigFlashlight;

        if bigFlashlight ~= nil then
            bigFlashlight:Destroy();
        end;

        u13.bigFlashlight = nil;
    end);
    u13.bigFlashlightPosition = Vector3.new();
    u13.bigFlashlightMotor = GroupMotor.new({
        x = 0,
        y = 0,
        z = 0
    });
    local u15 = u13.bigFlashlightMotor:onStep(function(p14) -- Line: 85
        -- upvalues: u13 (copy)
        local x = p14.x;
        local y = p14.y;
        local z = p14.z;
        local bigFlashlight = u13.bigFlashlight;

        if bigFlashlight ~= nil then
            bigFlashlight:PivotTo(CFrame.new(x, y + 47.5, z));
        end;
    end);
    u13.maid:GiveTask(function() -- Line: 94
        -- upvalues: u13 (copy)
        local bigFlashlightMotor = u13.bigFlashlightMotor;

        if bigFlashlightMotor ~= nil then
            bigFlashlightMotor:destroy();
        end;

        u13.bigFlashlightMotor = nil;
    end);
    u13.maid:GiveTask(function() -- Line: 101
        -- upvalues: u15 (copy)
        u15:disconnect();
    end);
    local u16 = {
        dampingRatio = 0.75,
        frequency = 2
    };
    default2.Client:OnEvent("ReplicateFlashlightPositionToClient", function(p17) -- Line: 108
        -- upvalues: u13 (copy), Spring (ref), u16 (copy)
        u13.bigFlashlightPosition = p17;
        local bigFlashlightMotor = u13.bigFlashlightMotor;

        if bigFlashlightMotor ~= nil then
            bigFlashlightMotor:setGoal({
                x = Spring.new(p17.X, u16),
                y = Spring.new(p17.Y, u16),
                z = Spring.new(p17.Z, u16)
            });
        end;
    end);
    default2.Client:WaitFor("SendFlashlightPositionToServer"):andThen(function(p18) -- Line: 119
        -- upvalues: u13 (copy)
        u13.sendFlashlightPositionToServer = p18;
    end);
    u13.bigFlashlightActivatedMotor = SingleMotor.new(0);
    local u20 = u13.bigFlashlightActivatedMotor:onStep(function(p19) -- Line: 123
        -- upvalues: u13 (copy)
        if u13.bigFlashlight then
            u13:animateFlashlight(p19, u13.bigFlashlight, 25);
        end;
    end);
    u13.maid:GiveTask(function() -- Line: 128
        -- upvalues: u13 (copy), u20 (copy)
        local bigFlashlightActivatedMotor = u13.bigFlashlightActivatedMotor;

        if bigFlashlightActivatedMotor ~= nil then
            bigFlashlightActivatedMotor:destroy();
        end;

        u13.bigFlashlightActivatedMotor = nil;
        u20:disconnect();
    end);
    default2.Client:OnEvent("FlashlightActivated", function(p21) -- Line: 136
        -- upvalues: u13 (copy), Spring (ref)
        local bigFlashlightActivatedMotor = u13.bigFlashlightActivatedMotor;

        if bigFlashlightActivatedMotor ~= nil then
            bigFlashlightActivatedMotor:setGoal(Spring.new(p21 and 1 or 0, {
                dampingRatio = 0.75,
                frequency = 4
            }));
        end;

        u13.bigFlashlightActivated = p21;
    end);
    u13.maid:GiveTask(WatchCollectionTag("MazeInteractionPart", function(p22) -- Line: 146
        -- upvalues: KnitClient2 (ref), u13 (copy), Players (ref), default (ref), KnitClient (ref)
        if p22:IsA("BasePart") then
            local v23 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
                ActionText = "Maze",
                ObjectText = "Open",
                HoldDuration = 1,
                Enabled = false,
                RequiresLineOfSight = false,
                MaxActivationDistance = 8,
                Parent = p22
            });
            table.insert(u13.proximityPrompts, v23);
            v23.Triggered:Connect(function(p24) -- Line: 158
                -- upvalues: Players (ref), default (ref), KnitClient (ref), u13 (ref)
                if p24 == Players.LocalPlayer then
                    default.Debug("Proximity prompt triggered");
                    local smallMaze = KnitClient.Controllers.HalloweenMazeSceneController.smallMaze;

                    if smallMaze ~= nil then
                        local v25 = smallMaze:FindFirstChildWhichIsA("Highlight");

                        if v25 ~= nil then
                            v25:Destroy();
                        end;
                    end;

                    u13:openLightMap();
                end;
            end);
        end;
    end));
    task.delay(1, function() -- Line: 174
        -- upvalues: u13 (copy), WatchCollectionTag (ref), KnitClient2 (ref), Players (ref), MazeRoleName (ref), ReplicatedStorage (ref), scaleModel (ref), Workspace (ref)
        u13.maid:GiveTask(WatchCollectionTag("ActiveMazeBoss", function(p26) -- Line: 175
            -- upvalues: KnitClient2 (ref), Players (ref), MazeRoleName (ref), ReplicatedStorage (ref), scaleModel (ref), Workspace (ref)
            local v27 = p26:FindFirstAncestorOfClass("Model");

            if v27 and (v27 == KnitClient2.Controllers.HalloweenMazeSceneController.smallMaze and p26:IsA("BasePart")) then
                p26.Transparency = 1;

                if Players.LocalPlayer:GetAttribute("MazeRole") == MazeRoleName.ILLUMINATOR then
                    local v28 = ReplicatedStorage.Assets.Misc.SkullDeathIndicator:Clone();
                    scaleModel(v28, 0.4);
                    local CFrame2 = p26.CFrame;
                    local v29 = CFrame.new(0, 0.3, 0);
                    local v30 = CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0);
                    v28:PivotTo(CFrame2 * v29 * v30);
                    v28.Parent = Workspace;
                end;
            end;
        end));
    end);

    if Players.LocalPlayer:GetAttribute("MazeRole") == MazeRoleName.ILLUMINATOR then
        for _, v in u13.proximityPrompts do
            v.Enabled = true;
        end;

        u13.maid:GiveTask(function() -- Line: 196
            -- upvalues: u13 (copy)
            for _, v in u13.proximityPrompts do
                v.Enabled = false;
            end;
        end);
    end;

    u13.maid:GiveTask(KnitClient2.Controllers.HalloweenMazeSceneController.roleChanged:Connect(function(p31) -- Line: 202
        -- upvalues: default (ref), MazeRoleName (ref), u13 (copy)
        default.Debug("Role changed {role}", p31);

        if p31 == MazeRoleName.ILLUMINATOR then
            for _, v in u13.proximityPrompts do
                v.Enabled = true;
            end;

            u13.maid:GiveTask(function() -- Line: 208
                -- upvalues: u13 (ref)
                for _, v in u13.proximityPrompts do
                    v.Enabled = false;
                end;
            end);
        end;
    end));
    u13.maid:GiveTask(u13.stateObject.changed:Connect(function(p32, p33) -- Line: 215
        -- upvalues: u13 (copy), default (ref), u5 (ref), Workspace (ref)
        if p32.lightOpen ~= p33.lightOpen then
            for _, v in u13.proximityPrompts do
                v.Enabled = p32.lightOpen == nil;
            end;

            if p32.lightOpen == nil and p33.lightOpen ~= nil then
                default.Debug("destroying flashlight");
                p33.lightOpen.flashlight:Destroy();
                u5.unmount(p33.lightOpen.tree);
                Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;

                for _, v in p33.lightOpen.enemyBillboards do
                    v:destroy();
                end;

                p33.lightOpen.lightMotor:destroy();
            end;
        end;
    end));
    local u34 = Vector3.new();
    u13.maid:GiveTask(UserInputService.TouchMoved:Connect(function(p35, p36) -- Line: 233
        -- upvalues: u34 (ref)
        if not p36 then
            u34 = p35.Position;
        end;
    end));
    u13.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 238
        -- upvalues: u13 (copy), u7 (ref), CollectionService (ref), Workspace (ref)
        for _, v in u13.enabledEnemies do
            v:SetAttribute("Visible", false);
            local lightOpen = u13.stateObject:getState().lightOpen;

            if lightOpen then
                local v37 = lightOpen.enemyBillboards[v];

                if v37 then
                    v37.billboardGui.AlwaysOnTop = false;
                    v37.viewportFrame.Ambient = u7;
                    v37.viewportFrame.ImageTransparency = 0.5;
                end;
            end;
        end;

        table.clear(u13.enabledEnemies);

        if u13.bigFlashlightPosition and u13.bigFlashlightActivated then
            local v38 = OverlapParams.new();

            local function _(p39) -- Line: 255
                if p39:IsA("Model") then
                    return p39.PrimaryPart;
                end;

                return nil;
            end;

            local v40 = 0;
            local v41 = {};

            for i, v in CollectionService:GetTagged("inventory-entity") do
                local _ = i - 1;
                local v42;

                if v:IsA("Model") then
                    v42 = v.PrimaryPart;
                else
                    v42 = nil;
                end;

                if v42 ~= nil then
                    v40 = v40 + 1;
                    v41[v40] = v42;
                end;
            end;

            v38.FilterDescendantsInstances = v41;
            v38.FilterType = Enum.RaycastFilterType.Whitelist;

            for _, v in Workspace:GetPartBoundsInRadius(u13.bigFlashlightPosition + Vector3.new(0, 47.5, 0), 25, v38) do
                if v:IsA("BasePart") then
                    local Parent = v.Parent;
                    local v43;

                    if Parent == nil then
                        v43 = Parent;
                    else
                        v43 = Parent:IsA("Model");
                    end;

                    if v43 then
                        v43 = CollectionService:HasTag(Parent, "entity");
                    end;

                    if v43 then
                        Parent:SetAttribute("Visible", true);
                        table.insert(u13.enabledEnemies, Parent);
                        local lightOpen = u13.stateObject:getState().lightOpen;

                        if lightOpen then
                            local v44 = lightOpen.enemyBillboards[Parent];

                            if v44 then
                                v44.billboardGui.AlwaysOnTop = true;
                                v44.viewportFrame.Ambient = Color3.fromRGB(255, 255, 204);
                                v44.viewportFrame.ImageTransparency = 0;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end));
    u13.maid:GiveTask(function() -- Line: 307
        -- upvalues: Workspace (ref), KnitClient2 (ref)
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
        Workspace.CurrentCamera.FieldOfView = KnitClient2.Controllers.FovController:getBaseFOV();
    end);
    u13.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 311
        -- upvalues: u13 (copy), Spring (ref), Workspace (ref), UserInputService (ref), u34 (ref)
        local lightOpen = u13.stateObject:getState().lightOpen;

        if lightOpen then
            lightOpen.lightMotor:setGoal(Spring.new(lightOpen.flashlightActivated and 1 or 0, {
                dampingRatio = 0.75,
                frequency = 4
            }));
            local CurrentCamera = Workspace.CurrentCamera;
            local lookAt = CFrame.lookAt;
            local x = lightOpen.motor:getValue().x;
            local v45 = lightOpen.motor:getValue().y + 2.5;
            local v46 = lightOpen.motor:getValue().z + 1;
            local v47 = Vector3.new(x, v45, v46);
            local x2 = lightOpen.motor:getValue().x;
            local y = lightOpen.motor:getValue().y;
            local z = lightOpen.motor:getValue().z;
            CurrentCamera.CFrame = lookAt(v47, (Vector3.new(x2, y, z)));
            local v48 = UserInputService:GetMouseLocation() or Vector2.new(u34.X, u34.Y);
            local v49 = Workspace.CurrentCamera:ViewportPointToRay(v48.X, v48.Y);
            local v50 = RaycastParams.new();
            v50.FilterDescendantsInstances = { lightOpen.lightMapPart };
            v50.FilterType = Enum.RaycastFilterType.Whitelist;
            local v51 = Workspace:Raycast(v49.Origin, v49.Direction * 100, v50);
            Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
            Workspace.CurrentCamera.FieldOfView = 60;

            if lightOpen.motor:getValue().x == 0 then
                local v52 = {
                    dampingRatio = 1,
                    frequency = 4
                };
                lightOpen.motor:setGoal({
                    x = Spring.new(lightOpen.position.X, v52),
                    y = Spring.new(lightOpen.position.Y, v52),
                    z = Spring.new(lightOpen.position.Z, v52)
                });
            end;

            local v53;

            if v51 == nil then
                v53 = v51;
            else
                v53 = v51.Position;
            end;

            if v53 then
                local v54 = CFrame.new(lightOpen.position);

                if v51 ~= nil then
                    v51 = v51.Position;
                end;

                local v55 = v54:PointToObjectSpace(v51);
                local v56 = math.clamp(v55.X, -lightOpen.size.X / 2, lightOpen.size.X / 2);
                local v57 = math.clamp(v55.Z, -lightOpen.size.Y / 2, lightOpen.size.Y / 2);

                if os.clock() - u13.lastSentFlashlightPosition > 0.05 and u13.sendFlashlightPositionToServer then
                    u13.lastSentFlashlightPosition = os.clock();
                    u13.sendFlashlightPositionToServer:SendToServer(Vector2.new(v56, v57));
                end;

                local position = lightOpen.position;
                local v58 = Vector3.new(v56, 0, v57);
                local v59 = CFrame.new(position + v58) * CFrame.new(0, 0.5, 0);
                local v60 = {
                    dampingRatio = 1,
                    frequency = 0.5
                };
                lightOpen.motor:setGoal({
                    x = Spring.new(v59.Position.X, v60),
                    y = Spring.new(v59.Position.Y, v60),
                    z = Spring.new(v59.Position.Z, v60)
                });
            end;
        end;
    end));
end;

function u8.onSceneShutdown(p61) -- Line: 374
    p61.maid:DoCleaning();
end;

function u8.openLightMap(u62) -- Line: 377
    -- upvalues: default (copy), CollectionService (copy), ReplicatedStorage (copy), Workspace (copy), KnitClient2 (copy), Players (copy), MazeRoleName (copy), ModelBillboard (copy), GroupMotor (copy), SingleMotor (copy), u5 (copy), IlluminatorTableUi (copy)
    if u62.stateObject:getState().lightOpen ~= nil then
        default.Debug("Returning because light already open");

        return nil;
    end;

    local v63 = CollectionService:GetTagged("MazeInteractionPart")[1];

    if v63 and v63:IsA("BasePart") then
        local u64 = ReplicatedStorage.Assets.Effects.Flashlight:Clone();
        u64.Parent = Workspace;
        default.Debug("Flashlight created");
        local bigMaze = KnitClient2.Controllers.HalloweenMazeSceneController.bigMaze;

        if bigMaze then
            default.Debug("Setting up billboards");

            for _, v in Players:GetPlayers() do
                if v:GetAttribute("MazeRole") ~= MazeRoleName.ILLUMINATOR and v.Character then
                    local u65 = ModelBillboard.new(v.Character, v63.Position, bigMaze.PrimaryPart.Position);
                    u65.scale = 1;
                    u62.maid:GiveTask(function() -- Line: 395
                        -- upvalues: u65 (copy)
                        u65:destroy();
                    end);
                    local u66 = 100;
                    v.Character:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 399
                        -- upvalues: v (copy), u66 (ref), u65 (copy)
                        local Character = v.Character;

                        if Character ~= nil then
                            Character = Character:GetAttribute("Health");
                        end;

                        if Character < u66 then
                            u66 = Character;
                            u65.viewportFrame.ImageColor3 = Color3.fromRGB(255, 0, 0);
                            task.delay(0.3, function() -- Line: 408
                                -- upvalues: u65 (ref)
                                u65.viewportFrame.ImageColor3 = Color3.fromRGB(255, 255, 255);
                            end);
                        end;
                    end);
                end;
            end;

            local v67 = GroupMotor.new({
                x = 56.3,
                y = 52.5,
                z = 59
            });
            v67:onStep(function(p68) -- Line: 420
                -- upvalues: u64 (copy)
                u64:PivotTo(CFrame.new(p68.x, p68.y, p68.z));
            end);
            local v69 = SingleMotor.new(1);
            v69:onStep(function(p70) -- Line: 427
                -- upvalues: u62 (copy), u64 (copy)
                u62:animateFlashlight(p70, u64, 0.25);
            end);
            u62:toggleFlashlight(true);
            u62.stateObject:set("lightOpen", {
                flashlightActivated = true,
                tree = u5.mount(u5.createElement(IlluminatorTableUi, {
                    clicked = function(p71) -- Line: 475, Name: clicked
                        -- upvalues: u62 (copy)
                        u62:toggleFlashlight(p71);
                    end,

                    position = v63.Position,
                    size = Vector2.new(5, 5),
                    whitelistParts = { v63 }
                }), Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")),
                flashlight = u64,
                motor = v67,
                enemyBillboards = {},
                position = v63.Position,
                lightMotor = v69,
                size = Vector2.new(5, 5),
                lightMapPart = v63
            });
        end;
    end;
end;

function u8.animateFlashlight(p72, p73, p74, p75) -- Line: 494
    -- upvalues: Linear (copy)
    local v76 = math.clamp(p73, 0, 1);
    local v77 = Linear(math.max(0.5, v76) - 0.5, 0, 1, 0.5);
    local v78 = Vector3.new(p75, p75, p75);
    local v79 = Vector3.new(p75 / 2, p75 / 2, p75 / 2) * v76;
    p74.Sphere.Size = v78 + v79;
    p74.Floor.SurfaceGui.ImageLabel.ImageTransparency = 1 - v77;

    if p74.PrimaryPart then
        p74.PrimaryPart.CanQuery = false;
    end;

    for _, descendant in p74:GetDescendants() do
        if descendant.Name ~= "Sphere" then
            if descendant:IsA("BasePart") then
                descendant.LocalTransparencyModifier = 1 - v77;
            elseif descendant:IsA("Beam") then
                descendant.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(Linear(v76, 0.1, 0.7, 1), 0),
                    NumberSequenceKeypoint.new(Linear(v76, 0.21, 0.7, 1), 1),
                    NumberSequenceKeypoint.new(1, 1)
                });
            elseif descendant:IsA("PointLight") or descendant:IsA("SpotLight") then
                descendant.Enabled = v76 > 0.7;
            end;
        end;
    end;
end;

function u8.toggleFlashlight(p80, p81) -- Line: 517
    -- upvalues: u2 (copy), default2 (copy)
    local v82 = p80.stateObject:getState();

    if v82 and v82.lightOpen then
        local v83 = u2.copy(v82.lightOpen);
        v83.flashlightActivated = p81;
        p80.stateObject:set("lightOpen", v83);
        default2.Client:Get("ToggleFlashlight"):SendToServer(v83.flashlightActivated);
    end;
end;

KnitClient.CreateController(u8.new());

return nil;