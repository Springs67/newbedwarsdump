-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local v4 = {};
local u5 = setmetatable({}, {
    __index = v4
});
u5.TEAMMATES = 0;
v4[0] = "TEAMMATES";
u5.ENEMY = 1;
v4[1] = "ENEMY";
u5.ALL = 2;
v4[2] = "ALL";
u5.ENTITY = 3;
v4[3] = "ENTITY";
local u6 = ConstantManager.registerConstants(script, {
    RayDistance = 60,
    Origin = 30
});
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "TargetSelector";
    end
});
u7.__index = u7;

function u7.new(...) -- Line: 44
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 48
end;

function u7.enableTargetSelector(u10, u11, u12) -- Line: 50
    -- upvalues: ReplicatedStorage (copy), RunService (copy), Workspace (copy), EntityUtil (copy), Players (copy), u6 (copy), RuntimeLib (copy), PlayerEntity (copy), ClientSyncEvents (copy)
    u10.maid:DoCleaning();
    u10.targetBillboard = ReplicatedStorage.Assets.Misc.TargetSelectorBillboard:Clone();
    u10.maid:GiveTask(u10.targetBillboard);
    u10.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 54
        -- upvalues: Workspace (ref), u10 (copy), EntityUtil (ref), Players (ref), u12 (copy), u6 (ref), u11 (copy), RuntimeLib (ref), PlayerEntity (ref), ReplicatedStorage (ref), ClientSyncEvents (ref)
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            u10:removeTarget();

            return nil;
        end;

        if not EntityUtil:getLocalPlayerEntity() then
            u10:removeTarget();

            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if not Character then
            return nil;
        end;

        local v13 = u12;

        if v13 ~= nil then
            v13 = v13.overrideOriginDistance;
        end;

        if v13 == nil then
            v13 = u6.Origin;
        end;

        local v14 = CurrentCamera * Vector3.new(0, 0, -1 * v13);
        local v15 = u10:getTargets(u11, (v14 - Character).Magnitude, v14);
        local Unit = Ray.new(CurrentCamera.Position, CurrentCamera.LookVector).Unit;
        local v16 = (1 / 0);
        local v17 = nil;

        for _, v in v15 do
            local v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28;

            if RuntimeLib.instanceof(v, PlayerEntity) then
                local v29 = v:getPlayer();

                if v29 ~= nil then
                    v29 = v29:HasTag("PlayerHidden");
                end;

                if not v29 then
                    v18 = v:getInstance().PrimaryPart;

                    if v18 then
                        v19 = v18.Position;
                        v20 = Unit:ClosestPoint(v19);
                        v21 = (v19 - v20).Magnitude;

                        if u6.RayDistance >= v21 then
                            v22 = u12;

                            if v22 ~= nil then
                                v22 = v22.distance;
                            end;

                            if v22 ~= 0 and (v22 == v22 and v22) then
                                v22 = (Character - v19).Magnitude > u12.distance;
                            end;

                            if v22 == 0 or (v22 ~= v22 or not v22) then
                                v23 = u12;

                                if v23 ~= nil then
                                    v23 = v23.requireSight;
                                end;

                                if v23 then
                                    v24 = u10:canSee(v);

                                    if v24.success then
                                        v25 = u12;

                                        if v25 ~= nil then
                                            v25 = v25.callback;
                                        end;

                                        if v25 then
                                            v25 = not u12.callback(v);
                                        end;

                                        if not v25 then
                                            v26 = u12;

                                            if v26 ~= nil then
                                                v26 = v26.positionDistanceOnly;
                                            end;

                                            if v26 then
                                                v27 = (v19 - Character).Magnitude;

                                                if v27 < v16 then
                                                    v17 = v;
                                                    v16 = v27;
                                                end;
                                            else
                                                v28 = v21 + (Unit.Origin - v20).Magnitude / 3;

                                                if v28 < v16 then
                                                    v17 = v;
                                                    v16 = v28;
                                                end;
                                            end;
                                        end;
                                    else
                                        print("Can see result", v24.message);
                                    end;
                                else
                                    v25 = u12;

                                    if v25 ~= nil then
                                        v25 = v25.callback;
                                    end;

                                    if v25 then
                                        v25 = not u12.callback(v);
                                    end;

                                    if not v25 then
                                        v26 = u12;

                                        if v26 ~= nil then
                                            v26 = v26.positionDistanceOnly;
                                        end;

                                        if v26 then
                                            v27 = (v19 - Character).Magnitude;

                                            if v27 < v16 then
                                                v17 = v;
                                                v16 = v27;
                                            end;
                                        else
                                            v28 = v21 + (Unit.Origin - v20).Magnitude / 3;

                                            if v28 < v16 then
                                                v17 = v;
                                                v16 = v28;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            else
                v18 = v:getInstance().PrimaryPart;

                if v18 then
                    v19 = v18.Position;
                    v20 = Unit:ClosestPoint(v19);
                    v21 = (v19 - v20).Magnitude;

                    if u6.RayDistance >= v21 then
                        v22 = u12;

                        if v22 ~= nil then
                            v22 = v22.distance;
                        end;

                        if v22 ~= 0 and (v22 == v22 and v22) then
                            v22 = (Character - v19).Magnitude > u12.distance;
                        end;

                        if v22 == 0 or (v22 ~= v22 or not v22) then
                            v23 = u12;

                            if v23 ~= nil then
                                v23 = v23.requireSight;
                            end;

                            if v23 then
                                v24 = u10:canSee(v);

                                if v24.success then
                                    v25 = u12;

                                    if v25 ~= nil then
                                        v25 = v25.callback;
                                    end;

                                    if v25 then
                                        v25 = not u12.callback(v);
                                    end;

                                    if not v25 then
                                        v26 = u12;

                                        if v26 ~= nil then
                                            v26 = v26.positionDistanceOnly;
                                        end;

                                        if v26 then
                                            v27 = (v19 - Character).Magnitude;

                                            if v27 < v16 then
                                                v17 = v;
                                                v16 = v27;
                                            end;
                                        else
                                            v28 = v21 + (Unit.Origin - v20).Magnitude / 3;

                                            if v28 < v16 then
                                                v17 = v;
                                                v16 = v28;
                                            end;
                                        end;
                                    end;
                                else
                                    print("Can see result", v24.message);
                                end;
                            else
                                v25 = u12;

                                if v25 ~= nil then
                                    v25 = v25.callback;
                                end;

                                if v25 then
                                    v25 = not u12.callback(v);
                                end;

                                if not v25 then
                                    v26 = u12;

                                    if v26 ~= nil then
                                        v26 = v26.positionDistanceOnly;
                                    end;

                                    if v26 then
                                        v27 = (v19 - Character).Magnitude;

                                        if v27 < v16 then
                                            v17 = v;
                                            v16 = v27;
                                        end;
                                    else
                                        v28 = v21 + (Unit.Origin - v20).Magnitude / 3;

                                        if v28 < v16 then
                                            v17 = v;
                                            v16 = v28;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;

        local v30;

        if u10.target == v17 then
            v30 = false;
        else
            v30 = true;
            u10:removeTarget();

            if v17 and v17:getInstance().PrimaryPart then
                local v31 = Color3.fromRGB(255, 0, 0);
                local v32 = EntityUtil:getLocalPlayerEntity();

                if not v32 then
                    return nil;
                end;

                if not v17:canAttack(v32) then
                    v31 = Color3.fromRGB(0, 255, 13);
                end;

                if not u10.targetBillboard then
                    u10.targetBillboard = ReplicatedStorage.Assets.Misc.TargetSelectorBillboard:Clone();
                end;

                u10.targetBillboard.Parent = v17:getInstance();
                u10.targetBillboard.Enabled = true;

                if not u10.customBillboard then
                    u10.targetBillboard.ImageLabel.ImageColor3 = v31;
                end;
            end;
        end;

        u10.target = v17;

        if v30 then
            ClientSyncEvents.NewSelectorTarget:fire(v17);
        end;
    end));
end;

function u7.getBillboard(p33) -- Line: 200
    return p33.targetBillboard;
end;

function u7.setCustomBillboard(p34, p35) -- Line: 203
    local targetBillboard = p34.targetBillboard;

    if targetBillboard ~= nil then
        targetBillboard:Destroy();
    end;

    p34.targetBillboard = p35;
    p34.customBillboard = true;
end;

function u7.removeCustomBillboard(p36) -- Line: 211
    local targetBillboard = p36.targetBillboard;

    if targetBillboard ~= nil then
        targetBillboard:Destroy();
    end;

    p36.customBillboard = false;
end;

function u7.setTargetIcon(p37, p38) -- Line: 218
    if p37.targetBillboard then
        p37.targetBillboard.ImageLabel.Image = p38;
    end;
end;

function u7.disableTargetSelector(p39) -- Line: 223
    p39:removeTarget();
    p39.maid:DoCleaning();
end;

function u7.getTargets(p40, p41, p42, p43) -- Line: 227
    -- upvalues: Players (copy), EntityUtil (copy), GameWorldUtil (copy), RuntimeLib (copy), PlayerEntity (copy), u5 (ref)
    local v44 = {};
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    local v45 = EntityUtil:getLocalPlayerEntity();

    if not Character then
        return v44;
    end;

    for _, v in GameWorldUtil.getEntitiesWithinRadius(p43, p42) do
        if not RuntimeLib.instanceof(v, PlayerEntity) or v:getPlayer() ~= Players.LocalPlayer then
            local PrimaryPart = v:getInstance().PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Position;
            end;

            if PrimaryPart then
                local v46;

                if p42 == 0 or (p42 ~= p42 or not p42) then
                    v46 = p42;
                elseif p43 then
                    v46 = p42 < (p43 - PrimaryPart).Magnitude;
                else
                    v46 = p43;
                end;

                if v46 == 0 or (v46 ~= v46 or not v46) then
                    if p41 == u5.ALL then
                        table.insert(v44, v);
                    elseif p41 == u5.TEAMMATES and (RuntimeLib.instanceof(v, PlayerEntity) and Players.LocalPlayer.Team == v:getPlayer().Team) then
                        table.insert(v44, v);
                    elseif p41 == u5.ENEMY and (RuntimeLib.instanceof(v, PlayerEntity) and Players.LocalPlayer.Team ~= v:getPlayer().Team) then
                        table.insert(v44, v);
                    else
                        local v47 = p41 == u5.ENTITY;

                        if v47 then
                            if v45 == nil then
                                v47 = v45;
                            else
                                v47 = v45:canAttack(v);
                            end;
                        end;

                        if v47 then
                            table.insert(v44, v);
                        end;
                    end;
                end;
            end;
        end;
    end;

    return v44;
end;

function u7.getTargetEntity(p48) -- Line: 287
    return p48.target;
end;

function u7.removeTarget(p49) -- Line: 290
    p49.target = nil;

    if p49.targetBillboard then
        p49.targetBillboard.Enabled = false;
    end;
end;

function u7.canSee(p50, p51) -- Line: 296
    -- upvalues: Players (copy), GameQueryUtil (copy), CollectionService (copy)
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return {
            success = false,
            message = "No local player character"
        };
    end;

    if not p51 then
        return {
            success = false,
            message = "No entity"
        };
    end;

    local v52 = Character:FindFirstChildWhichIsA("Humanoid");

    if v52 ~= nil then
        v52 = v52:FindFirstChild("BodyHeightScale");
    end;

    if v52 ~= nil then
        v52 = v52.Value;
    end;

    local v53 = 5 * (v52 == nil and 1 or v52);

    local function getBottomPosition(p54) -- Line: 324
        if not p54.PrimaryPart then
            return nil;
        end;

        local v55 = p54:FindFirstChildWhichIsA("Humanoid");

        return p54.PrimaryPart.Position + Vector3.new(0, -1 * ((not v55 and 0 or v55.HipHeight) + p54.PrimaryPart.Size.Y / 2), 0);
    end;

    local v56;

    if Character.PrimaryPart then
        local v57 = Character:FindFirstChildWhichIsA("Humanoid");
        v56 = Character.PrimaryPart.Position + Vector3.new(0, -1 * ((not v57 and 0 or v57.HipHeight) + Character.PrimaryPart.Size.Y / 2), 0);
    else
        v56 = nil;
    end;

    local v58 = p51:getInstance();
    local v59;

    if v58.PrimaryPart then
        local v60 = v58:FindFirstChildWhichIsA("Humanoid");
        v59 = v58.PrimaryPart.Position + Vector3.new(0, -1 * ((not v60 and 0 or v60.HipHeight) + v58.PrimaryPart.Size.Y / 2), 0);
    else
        v59 = nil;
    end;

    if not (v56 and v59) then
        return {
            success = false,
            message = "No bottom position" .. tostring(v56) .. tostring(v59)
        };
    end;

    local v61 = v56 + Vector3.new(0, v53, 0);
    local v62 = v59 + Vector3.new(0, v53, 0);

    local function isRayBlocked(p63, p64, p65) -- Line: 349
        -- upvalues: GameQueryUtil (ref)
        local v66 = RaycastParams.new();
        v66.FilterDescendantsInstances = p65;
        v66.FilterType = Enum.RaycastFilterType.Blacklist;

        return GameQueryUtil:raycast(p63, p64 - p63, v66) ~= nil;
    end;

    local function isLineSegmentBlocked(p67, p68, p69) -- Line: 360
        -- upvalues: GameQueryUtil (ref)
        local v70 = RaycastParams.new();
        v70.FilterDescendantsInstances = p69;
        v70.FilterType = Enum.RaycastFilterType.Blacklist;
        local v71 = GameQueryUtil:raycast(p67, p68 - p67, v70) ~= nil;

        if not v71 then
            local v72 = RaycastParams.new();
            v72.FilterDescendantsInstances = p69;
            v72.FilterType = Enum.RaycastFilterType.Blacklist;
            v71 = GameQueryUtil:raycast(p68, p67 - p68, v72) ~= nil;
        end;

        return v71;
    end;

    local v73 = { Character, p51:getInstance() };
    local v74 = CollectionService:GetTagged("DontBlockSwordRaycast");
    table.move(v74, 1, #v74, #v73 + 1, v73);
    local v75 = RaycastParams.new();
    v75.FilterDescendantsInstances = v73;
    v75.FilterType = Enum.RaycastFilterType.Blacklist;
    local v76 = GameQueryUtil:raycast(v56, v59 - v56, v75) ~= nil;

    if not v76 then
        local v77 = RaycastParams.new();
        v77.FilterDescendantsInstances = v73;
        v77.FilterType = Enum.RaycastFilterType.Blacklist;
        v76 = GameQueryUtil:raycast(v59, v56 - v59, v77) ~= nil;
    end;

    local v78 = RaycastParams.new();
    v78.FilterDescendantsInstances = v73;
    v78.FilterType = Enum.RaycastFilterType.Blacklist;
    local v79 = GameQueryUtil:raycast(v61, v62 - v61, v78) ~= nil;

    if not v79 then
        local v80 = RaycastParams.new();
        v80.FilterDescendantsInstances = v73;
        v80.FilterType = Enum.RaycastFilterType.Blacklist;
        v79 = GameQueryUtil:raycast(v62, v61 - v62, v80) ~= nil;
    end;

    local v81 = (v56 + v61) / 2;
    local v82 = (v59 + v62) / 2;
    local v83 = RaycastParams.new();
    v83.FilterDescendantsInstances = v73;
    v83.FilterType = Enum.RaycastFilterType.Blacklist;
    local v84 = GameQueryUtil:raycast(v81, v82 - v81, v83) ~= nil;

    if not v84 then
        local v85 = RaycastParams.new();
        v85.FilterDescendantsInstances = v73;
        v85.FilterType = Enum.RaycastFilterType.Blacklist;
        v84 = GameQueryUtil:raycast(v82, v81 - v82, v85) ~= nil;
    end;

    return {
        success = not (v76 and (v79 and v84)),
        message = "Line segment check result" .. tostring(v76) .. tostring(v79) .. tostring(v84)
    };
end;

u7.maid = v2.new();

return {
    TargetType = u5,
    TargetSelector = u7
};