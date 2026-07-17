-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local RunService = v5.RunService;
local UserInputService = v5.UserInputService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local TurretId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
local getProjectileTypeByEncoding = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "encoding", "projectile-type-encoding").getProjectileTypeByEncoding;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "VoidTurretAttackController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 41
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 45
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p8);
    p8.Name = "VoidTurretAttackController";
    p8.maid = u3.new();
end;

function u6.KnitStart(u9) -- Line: 50
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), ClientStore (copy), CollectionService (copy), TurretId (copy), Flamework (copy), UserInputService (copy), RunService (copy), Workspace (copy), EntityUtil (copy), GameWorldUtil (copy), u4 (copy), GameQueryUtil (copy), EntityDamageEventZap (copy), getProjectileTypeByEncoding (copy), u3 (copy), KnitClient (copy)
    KnitController.KnitStart(u9);
    ClientSyncEvents.AbilityUsed:connect(function(p10) -- Line: 52
        -- upvalues: AbilityId (ref), u9 (copy), Players (ref)
        if p10.ability ~= AbilityId.VOID_TURRET_FIRE then
            return nil;
        end;

        local extra = p10.extra;
        u9:playAttackAnimation(extra.fromTurret, extra.target, p10.userCharacter == Players.LocalPlayer.Character);
    end);
    ClientStore.changed:connect(function(p11, p12) -- Line: 59
        -- upvalues: u9 (copy), CollectionService (ref), TurretId (ref), Flamework (ref), AbilityId (ref), UserInputService (ref), RunService (ref), Workspace (ref), EntityUtil (ref), GameWorldUtil (ref), u4 (ref), GameQueryUtil (ref)
        local selectedTurret = p11.Game.selectedTurret;

        if selectedTurret == p12.Game.selectedTurret then
            return nil;
        end;

        u9.maid:DoCleaning();
        local v13 = selectedTurret == nil;

        if not v13 then
            local v14 = CollectionService:GetTags(selectedTurret);
            local v15 = table.find(v14, TurretId.VOID_TURRET) ~= nil;
            v13 = not v15;
        end;

        if v13 then
            return nil;
        end;

        task.spawn(function() -- Line: 75
            -- upvalues: u9 (ref), Flamework (ref), AbilityId (ref)
            u9.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.VOID_TURRET_FIRE, nil):expect());
        end);
        u9.maid:GiveTask(UserInputService.InputBegan:Connect(function(p16, p17) -- Line: 78
            -- upvalues: u9 (ref), Flamework (ref), AbilityId (ref), selectedTurret (copy)
            if not p17 and (u9:isAcceptableInput(p16) and p16.UserInputState == Enum.UserInputState.Begin) then
                if not u9.target then
                    return nil;
                end;

                if Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(AbilityId.VOID_TURRET_FIRE) then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.VOID_TURRET_FIRE, p16, {
                        target = u9.target,
                        fromTurret = selectedTurret
                    });
                end;
            end;
        end));
        u9.maid:GiveTask(function() -- Line: 95
            -- upvalues: u9 (ref)
            u9:removeTarget();
        end);
        u9.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 98
            -- upvalues: Workspace (ref), u9 (ref), EntityUtil (ref), GameWorldUtil (ref), u4 (ref)
            local CurrentCamera = Workspace.CurrentCamera;

            if CurrentCamera ~= nil then
                CurrentCamera = CurrentCamera.CFrame;
            end;

            if not CurrentCamera then
                u9:removeTarget();

                return nil;
            end;

            local v18 = EntityUtil:getLocalPlayerEntity();

            if not v18 then
                u9:removeTarget();

                return nil;
            end;

            local v19 = GameWorldUtil.getEntitiesWithinRadius(CurrentCamera * Vector3.new(0, 0, -20), 20);
            local Unit = Ray.new(CurrentCamera.Position, CurrentCamera.LookVector).Unit;
            local v20 = (1 / 0);
            local v21 = nil;

            for _, v in v19 do
                if v18:canAttack(v) then
                    local Position = v:getInstance():GetPrimaryPartCFrame().Position;
                    local v22 = Unit:ClosestPoint(Position);
                    local Magnitude = (Position - v22).Magnitude;

                    if Magnitude <= 6 then
                        local v23 = Magnitude + (Unit.Origin - v22).Magnitude / 3;

                        if v23 < v20 then
                            v21 = v:getInstance();
                            v20 = v23;
                        end;
                    end;
                end;
            end;

            if u9.target ~= v21 then
                u9:removeTarget();

                if v21 then
                    u9.targetIcon = u4("BillboardGui", {
                        AlwaysOnTop = true,
                        Parent = v21.PrimaryPart,
                        Size = UDim2.new(0.8, 10, 0.8, 10),
                        Children = { u4("ImageLabel", {
                                Image = "rbxassetid://9429977101",
                                BackgroundTransparency = 1,
                                Size = UDim2.fromScale(1, 1),
                                ScaleType = Enum.ScaleType.Fit,
                                ImageColor3 = Color3.fromRGB(255, 37, 222)
                            }) }
                    });
                end;
            end;

            u9.target = v21;
        end));
        CollectionService:GetInstanceAddedSignal(TurretId.VULCAN_TURRET):Connect(function(p24) -- Line: 156
            -- upvalues: GameQueryUtil (ref)
            p24:SetAttribute("ProjectilesIgnore", true);

            for _, descendant in p24:GetDescendants() do
                GameQueryUtil:setQueryIgnored(descendant, true);
            end;
        end);
    end);
    EntityDamageEventZap.On(function(p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38) -- Line: 163
        -- upvalues: getProjectileTypeByEncoding (ref), Players (ref), u3 (ref), KnitClient (ref)
        local v39;

        if p32 == nil then
            v39 = p32;
        else
            v39 = p32.projectileData;
        end;

        if v39 then
            local v40 = getProjectileTypeByEncoding(p32.projectileData.projectileType);

            if (v40 == "turretBullet" or v40 == "turretArtilleryBullet") and p25 == Players.LocalPlayer.Character then
                local u41 = u3.new();
                u41:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    moveSpeedMultiplier = 0.5
                }));
                task.delay(0.1, function() -- Line: 176
                    -- upvalues: u41 (copy)
                    u41:DoCleaning();
                end);
            end;
        end;
    end);
end;

function u6.removeTarget(p42) -- Line: 184
    p42.target = nil;
    local targetIcon = p42.targetIcon;

    if targetIcon ~= nil then
        targetIcon:Destroy();
    end;
end;

function u6.isAcceptableInput(p43, p44) -- Line: 191
    -- upvalues: KnitClient2 (copy)
    local v45 = KnitClient2.Controllers.KeybindLoadController:getKeybinds();
    local v46;

    if v45 == nil then
        v46 = v45;
    else
        v46 = v45.keyboard;

        if v46 ~= nil then
            v46 = v46.controlActions.Attack;
        end;
    end;

    local v47 = v46 or Enum.UserInputType.MouseButton1;

    if v45 ~= nil then
        v45 = v45.gamepad;

        if v45 ~= nil then
            v45 = v45.controlActions.Attack;
        end;
    end;

    return false or (p44.UserInputType == v47 and true or p44.KeyCode == v47) or p44.UserInputType == Enum.UserInputType.Touch or (v45 or Enum.KeyCode.ButtonR2) == p44.KeyCode;
end;

function u6.playAttackAnimation(p48, u49, u50, p51) -- Line: 235
    -- upvalues: u3 (copy), SoundManager (copy), GameSound (copy), RuntimeLib (copy), default (copy), Linear (copy)
    local u52 = u3.new();
    local VOID_CRAB_BEAM_ATTACK = GameSound.VOID_CRAB_BEAM_ATTACK;
    local v53 = {
        rollOffMaxDistance = 100
    };
    local v54;

    if p51 then
        v54 = nil;
    else
        v54 = u49;
    end;

    v53.parent = v54;
    local u55 = SoundManager:playSound(VOID_CRAB_BEAM_ATTACK, v53);
    u52:GiveTask(function() -- Line: 241
        -- upvalues: u55 (copy)
        local v56 = u55;

        if v56 ~= nil then
            v56:Stop();
        end;

        local v57 = u55;

        if v57 ~= nil then
            v57:Destroy();
        end;
    end);
    u52:GiveTask(u49.AncestryChanged:Connect(function() -- Line: 251
        -- upvalues: u49 (copy), u52 (copy)
        if u49.Parent then
            return nil;
        end;

        u52:DoCleaning();
    end));
    u52:GiveTask(u50.AncestryChanged:Connect(function() -- Line: 257
        -- upvalues: u50 (copy), u52 (copy)
        if u50.Parent then
            return nil;
        end;

        u52:DoCleaning();
    end));
    local BulletOrigin = u49:WaitForChild("Head"):WaitForChild("BulletOrigin");
    local TargetBeam = BulletOrigin:WaitForChild("TargetBeam");
    local BlastBeam = BulletOrigin:WaitForChild("BlastBeam");
    TargetBeam.Enabled = true;

    local function handleTarget(p58) -- Line: 267
        -- upvalues: TargetBeam (copy), BlastBeam (copy)
        if p58 ~= nil then
            p58 = p58:FindFirstChild("UpperTorso");

            if p58 ~= nil then
                p58 = p58:FindFirstChild("BodyFrontAttachment");
            end;
        end;

        TargetBeam.Attachment1 = p58;
        BlastBeam.Attachment1 = p58;
    end;

    if u50 ~= nil then
        u50 = u50:FindFirstChild("UpperTorso");

        if u50 ~= nil then
            u50 = u50:FindFirstChild("BodyFrontAttachment");
        end;
    end;

    TargetBeam.Attachment1 = u50;
    BlastBeam.Attachment1 = u50;
    local u63 = RuntimeLib.Promise.delay(1.8):andThen(function() -- Line: 281
        -- upvalues: TargetBeam (copy), BlastBeam (copy), default (ref), Linear (ref), u52 (copy)
        TargetBeam.Enabled = false;
        BlastBeam.Enabled = true;
        local u60 = default(0.1, Linear, function(p59) -- Line: 284
            -- upvalues: BlastBeam (ref)
            BlastBeam.Width0 = 0.1 + p59 * 0.4;
            BlastBeam.Width1 = 0.2 + p59 * 0.6;
        end);
        u52:GiveTask(function() -- Line: 288
            -- upvalues: u60 (copy)
            return u60:Cancel();
        end);
        task.delay(0.3, function() -- Line: 291
            -- upvalues: BlastBeam (ref), default (ref), Linear (ref), u52 (ref)
            if not BlastBeam.Parent then
                return nil;
            end;

            local u62 = default(0.05, Linear, function(p61) -- Line: 295
                -- upvalues: BlastBeam (ref)
                BlastBeam.Width0 = 0.5 * (1 - p61);
                BlastBeam.Width1 = 0.8 * (1 - p61);
            end);
            u52:GiveTask(function() -- Line: 299
                -- upvalues: u62 (copy)
                return u62:Cancel();
            end);
        end);
    end);
    u52:GiveTask(function() -- Line: 305
        -- upvalues: u63 (copy)
        return u63:cancel();
    end);
end;

KnitClient.CreateController(u6.new());

return nil;