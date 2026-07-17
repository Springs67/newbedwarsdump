-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ProtectorWandConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "protector-wand", "protector-wand-constants").ProtectorWandConstants;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local HelperPlayerText = RuntimeLib.import(script, script.Parent, "helper-player-text").HelperPlayerText;
local ProtectorWandTarget = RuntimeLib.import(script, script.Parent, "protector-wand-target").ProtectorWandTarget;
local v5 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "ProtectorWandController";
    end,

    __index = HandKnitController
});
v5.__index = v5;

function v5.constructor(p6) -- Line: 36
    -- upvalues: HandKnitController (copy), u2 (copy), RandomUtil (copy), GameSound (copy)
    HandKnitController.constructor(p6);
    p6.Name = "ProtectorWandController";
    p6.animationMaid = u2.new();
    p6.randomCastingSound = RandomUtil.fromList(GameSound.WAND_CAST_1, GameSound.WAND_CAST_2, GameSound.WAND_CAST_3);
end;

function v5.KnitStart(u7) -- Line: 42
    -- upvalues: HandKnitController (copy), default (copy), SoundManager (copy), Players (copy), u3 (copy), HelperPlayerText (copy)
    HandKnitController.KnitStart(u7);
    default.Client:OnEvent("WandPlayEffects", function(p8) -- Line: 44
        -- upvalues: SoundManager (ref)
        SoundManager:playSound(p8.playSound, {
            volumeMultiplier = 0.75,
            position = p8.targetPosition
        });
    end);
    default.Client:OnEvent("HelperTextNotif", function(p9) -- Line: 50
        -- upvalues: Players (ref), u3 (ref), HelperPlayerText (ref), u7 (copy)
        if p9.player == Players.LocalPlayer then
            local v10 = nil;

            if v10 then
                u3.unmount(v10);
            end;

            u7:helperPlayerTreeCheck(u3.mount(u3.createElement(HelperPlayerText, {
                HelperText = p9.helperText
            }), Players.LocalPlayer:WaitForChild("PlayerGui")), 3);

            return nil;
        end;
    end);
end;

function v5.beginAutoTargeting(u11, p12, u13, u14, u15, u16) -- Line: 64
    -- upvalues: RunService (copy), Workspace (copy), Players (copy), KnitClient (copy), GameWorldUtil (copy), ProtectorWandConstants (copy), ItemType (copy), u3 (copy), ProtectorWandTarget (copy)
    p12:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 65
        -- upvalues: Workspace (ref), u11 (copy), Players (ref), KnitClient (ref), GameWorldUtil (ref), ProtectorWandConstants (ref), u13 (copy), ItemType (ref), u3 (ref), ProtectorWandTarget (ref), u14 (copy), u15 (copy), u16 (copy)
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            u11:removeTarget(u11.wandTargetIconTree, u11.wandTargetEntity);

            return nil;
        end;

        local u17 = Players.LocalPlayer:GetAttribute("Team");

        if u17 == 0 or (u17 ~= u17 or not u17) then
            return nil;
        end;

        if not KnitClient.Controllers.TeamController:getTeamById((tostring(u17))) then
            return nil;
        end;

        local function _(p18) -- Line: 87
            -- upvalues: Players (ref), u17 (copy)
            local v19 = Players:GetPlayerFromCharacter(p18:getInstance());
            local v20 = v19 and not v19:HasTag("PlayerHidden") and v19:GetAttribute("Team") == u17;

            return v20;
        end;

        local v21 = 0;
        local v22 = {};

        for i, v in GameWorldUtil.getEntitiesWithinRadius(CurrentCamera * Vector3.new(0, 0, 0), ProtectorWandConstants.WAND_TARGETTING_RANGE) do
            local _ = i - 1;
            local v23 = Players:GetPlayerFromCharacter(v:getInstance());
            local v24 = v23 and not v23:HasTag("PlayerHidden") and v23:GetAttribute("Team") == u17;

            if v24 == true then
                v21 = v21 + 1;
                v22[v21] = v;
            end;
        end;

        local Unit = Ray.new(CurrentCamera.Position, CurrentCamera.LookVector).Unit;
        local v25 = nil;

        if u13.itemType == ItemType.VILLAIN_PROTECTOR_WAND then
            for _, v in v22 do
                local v26 = Players:GetPlayerFromCharacter(v:getInstance());

                if v26 == Players.LocalPlayer then
                    v25 = v:getInstance();

                    if v26:GetAttribute("WandHealing") == true and v26:GetAttribute("WandBubbleProtect") == true then
                        v25 = nil;
                    end;

                    break;
                end;
            end;

            if u11.wandTargetEntity ~= v25 then
                u11:removeTarget(u11.wandTargetIconTree, u11.wandTargetEntity);

                if v25 then
                    local v27 = u11:getPerspectiveCam() == 0;
                    u11.wandTargetIconTree = u3.mount(u3.createElement(ProtectorWandTarget, {
                        icon = u14,
                        iconColor = u15,
                        iconSize = u16,
                        hideIconFirstPerson = v27 and true or false
                    }), v25.PrimaryPart);
                end;
            end;

            u11.wandTargetEntity = v25;
        end;

        if u13.itemType == ItemType.HERO_PROTECTOR_WAND then
            table.sort(v22, function(p28, p29) -- Line: 134
                -- upvalues: Unit (copy)
                local Position = p28:getInstance():GetPivot().Position;
                local v30 = Unit:ClosestPoint(Position);
                local Magnitude = (Position - v30).Magnitude;
                local Magnitude2 = (Unit.Origin - v30).Magnitude;
                local Position2 = p29:getInstance():GetPivot().Position;
                local v31 = Unit:ClosestPoint(Position2);

                return Magnitude + Magnitude2 / 3 < (Position2 - v31).Magnitude + (Unit.Origin - v31).Magnitude / 3;
            end);

            for _, v in v22 do
                if v:getPlayer() ~= Players.LocalPlayer then
                    local Position = v:getInstance():GetPivot().Position;

                    if (Position - CurrentCamera.Position):Dot(CurrentCamera.LookVector) >= 0 then
                        local Character = Players.LocalPlayer.Character;

                        if Character ~= nil then
                            Character = Character.PrimaryPart;

                            if Character ~= nil then
                                Character = Character.Position;
                            end;
                        end;

                        if (Position - Unit:ClosestPoint(Position)).Magnitude <= ProtectorWandConstants.WAND_TARGETTING_RANGE and Character then
                            v25 = v:getInstance();
                            local v32 = Players:GetPlayerFromCharacter(v25);

                            if not v32 then
                                return nil;
                            end;

                            if v32:GetAttribute("WandHealing") == true and v32:GetAttribute("WandBubbleProtect") == true then
                                v25 = nil;
                            end;

                            break;
                        end;
                    end;
                end;
            end;

            if u11.wandTargetEntity ~= v25 then
                u11:removeTarget(u11.wandTargetIconTree, u11.wandTargetEntity);

                if v25 then
                    u11.wandTargetIconTree = u3.mount(u3.createElement(ProtectorWandTarget, {
                        hideIconFirstPerson = false,
                        icon = u14,
                        iconColor = u15,
                        iconSize = u16
                    }), v25.PrimaryPart);
                end;
            end;

            u11.wandTargetEntity = v25;
        end;
    end));
end;

function v5.getPerspectiveCam(p33) -- Line: 207
    -- upvalues: KnitClient (copy)
    return KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();
end;

function v5.endAutoTargeting(p34, p35) -- Line: 210
    if p35 then
        p34:removeTarget(p34.wandTargetIconTree, p34.wandTargetEntity);
        p35:DoCleaning();
    end;
end;

function v5.removeTarget(p36, p37, p38) -- Line: 216
    -- upvalues: u3 (copy)
    p36.wandTargetIconTree = p37;
    p36.wandTargetEntity = p38;

    if p36.wandTargetEntity then
        p36.wandTargetEntity = nil;
    end;

    if p36.wandTargetIconTree then
        u3.unmount(p36.wandTargetIconTree);
    end;
end;

function v5.helperPlayerTreeCheck(p39, u40, p41) -- Line: 226
    -- upvalues: u3 (copy)
    local v42 = u40 and p41;

    if v42 ~= 0 and (v42 == v42 and v42) then
        task.delay(p41, function() -- Line: 229
            -- upvalues: u3 (ref), u40 (copy)
            u3.unmount(u40);
        end);
    end;
end;

function v5.castToTarget(p43, p44, p45, p46, u47, p48, p49, p50) -- Line: 234
    -- upvalues: Players (copy), u3 (copy), HelperPlayerText (copy), AbilityId (copy), default (copy), u2 (copy), Flamework (copy), SoundManager (copy)
    local v51 = Players:GetPlayerFromCharacter(p43.wandTargetEntity);

    if not v51 then
        if p50 then
            u3.unmount(p50);
        end;

        p43:helperPlayerTreeCheck(u3.mount(u3.createElement(HelperPlayerText, {
            HelperText = "No Teammate Nearby!"
        }), Players.LocalPlayer:WaitForChild("PlayerGui")), 3);

        return nil;
    end;

    local UserId = v51.UserId;
    local v52;

    if p45 == AbilityId.VILLAIN_WAND_HEAL or p45 == AbilityId.HERO_WAND_HEAL then
        v52 = default.Client:Get("WandHealPlayer"):CallServer({
            targetPlayerUserId = UserId,
            handItem = p44
        });
        local v53;

        if u47 then
            if p48 == 0 or p48 ~= p48 then
                v53 = p48;
            elseif p48 then
                v53 = p49;
            else
                v53 = p48;
            end;
        else
            v53 = u47;
        end;

        if v53 ~= 0 and (v53 == v53 and v53) then
            local v54 = nil;

            if v54 then
                v54:DoCleaning();
            end;

            local u55 = u2.new();
            u55:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u47));
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u47, p48, {
                cooldownBar = {
                    color = p49
                }
            });
            u55:GiveTask(function() -- Line: 272
                -- upvalues: Flamework (ref), u47 (copy)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(u47);
            end);
            task.delay(p48, function() -- Line: 275
                -- upvalues: u55 (ref)
                if u55 then
                    u55:DoCleaning();
                    u55 = nil;
                end;
            end);
        end;
    else
        v52 = false;
    end;

    if p45 == AbilityId.VILLAIN_WAND_BUBBLE or p45 == AbilityId.HERO_WAND_BUBBLE then
        v52 = default.Client:Get("WandBubbleProtection"):CallServer({
            targetPlayerUserId = UserId,
            handItem = p44
        });
    end;

    if v52 then
        SoundManager:playSound(p46, {
            position = nil,
            volumeMultiplier = 0.75
        });
    end;

    p43:playCastAnimation();
end;

function v5.playCastAnimation(p56) -- Line: 298
    -- upvalues: Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.WAND_CAST));
end;

function v5.setUpAnimations(p57) -- Line: 303
    -- upvalues: Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local LocalPlayer = Players.LocalPlayer;
    local Character = LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local Humanoid = Character.Humanoid;
    local u58 = false;
    local u59 = AnimationUtil:playAnimation(LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.WAND_IDLE));
    p57.animationMaid:GiveTask(function() -- Line: 313
        -- upvalues: u59 (ref)
        local v60 = u59;

        if v60 ~= nil then
            v60:Stop();
        end;

        local v61 = u59;

        if v61 ~= nil then
            v61:Destroy();
        end;
    end);
    p57.animationMaid:GiveTask(Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 323
        -- upvalues: Humanoid (copy), u58 (ref), u59 (ref), AnimationUtil (ref), LocalPlayer (copy), GameAnimationUtil (ref), AnimationType (ref)
        if Humanoid.MoveDirection.Magnitude > 0 and (Humanoid:GetState() == Enum.HumanoidStateType.Running and not u58) then
            local v62 = u59;

            if v62 ~= nil then
                v62:Stop();
            end;

            local v63 = u59;

            if v63 ~= nil then
                v63:Destroy();
            end;

            u58 = true;
        end;

        if Humanoid.MoveDirection.Magnitude == 0 and Humanoid:GetState() == Enum.HumanoidStateType.Running then
            u58 = false;
            local v64 = u59;

            if v64 ~= nil then
                v64:Stop();
            end;

            local v65 = u59;

            if v65 ~= nil then
                v65:Destroy();
            end;

            u58 = false;
            u59 = AnimationUtil:playAnimation(LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.WAND_IDLE));
        end;
    end));
end;

function v5.cleanUpAnimations(p66) -- Line: 350
    p66.animationMaid:DoCleaning();
end;

function v5.onEnable(p67, p68, p69) -- Line: 353
end;

function v5.onDisable(p70) -- Line: 355
end;

return {
    ProtectorWandController = v5
};