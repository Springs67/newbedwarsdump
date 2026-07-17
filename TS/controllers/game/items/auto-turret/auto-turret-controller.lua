-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local Workspace = v2.Workspace;
local ProjectileHandler = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local TurretId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "AutoTurretController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 28
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "AutoTurretController";
    p5.turret = nil;
    p5.lastShotTime = 0;
    p5.turrets = {};
    p5.turretSet = {};
end;

function u3.KnitStart(u6) -- Line: 40
    -- upvalues: KnitController (copy), CollectionService (copy), TurretId (copy), Players (copy), default (copy)
    KnitController.KnitStart(u6);
    CollectionService:GetInstanceAddedSignal(TurretId.AUTO_TURRET):Connect(function(u7) -- Line: 42
        -- upvalues: Players (ref), u6 (copy), default (ref)
        if u7:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId then
            table.insert(u6.turrets, u7);
            u6.turretSet[u7] = true;
            local u8 = nil;
            task.spawn(function() -- Line: 52
                -- upvalues: u6 (ref), u7 (copy), u7 (copy), u8 (ref), default (ref), Players (ref)
                while true do
                    local v9 = task.wait(1);

                    if v9 == 0 or (v9 ~= v9 or (not v9 or (u6.turretSet[u7] == nil or not u7))) then
                        break;
                    end;

                    if u8 == nil or not u6:validateTarget(u7, u8) then
                        u8 = u6:findTarget(u7);
                    end;

                    if u8 then
                        local v10 = u8;

                        if v10 ~= nil then
                            v10 = v10:getInstance().PrimaryPart;

                            if v10 ~= nil then
                                v10 = v10.Position;
                            end;
                        end;

                        local Rotate = u7:WaitForChild("Rotate", 3);

                        if Rotate and v10 then
                            Rotate.CFrame = CFrame.lookAt(Rotate.Position, v10);
                            default.Client:Get("AutoTurretFired"):SendToServer({
                                turret = u7,
                                targetPosition = v10
                            });
                        end;

                        u6:fire(Players.LocalPlayer, u7, u8);
                    end;
                end;
            end);
        end;
    end);
    CollectionService:GetInstanceRemovedSignal(TurretId.AUTO_TURRET):Connect(function(p11) -- Line: 87
        -- upvalues: u6 (copy)
        u6.turretSet[p11] = nil;
    end);
    default.Client:Get("angleChanged"):Connect(function(p12) -- Line: 92
        if not (p12.targetPosition and p12.turret) then
            return nil;
        end;

        local Rotate = p12.turret:WaitForChild("Rotate", 3);

        if Rotate then
            Rotate.CFrame = CFrame.lookAt(Rotate.Position, p12.targetPosition);
        end;
    end);
end;

function u3.fire(p13, p14, p15, p16) -- Line: 102
    -- upvalues: Workspace (copy), getItemMeta (copy), ItemType (copy), ProjectileHandler (copy), KnitClient2 (copy)
    if not p15:IsDescendantOf(Workspace) then
        return nil;
    end;

    local block = getItemMeta(ItemType.AUTO_TURRET).block;

    if block ~= nil then
        block = block.projectileSource;
    end;

    if not (block and p16) then
        return nil;
    end;

    local v17 = ProjectileHandler.new(1, 1, "autoTurretBullet", nil, p16:getInstance():GetPrimaryPartCFrame().Position, Vector3.new(0, 0, 0));
    KnitClient2.Controllers.ProjectileController:launchProjectile(ItemType.AUTO_TURRET, nil, v17, p15, block);
end;

function u3.findTarget(p18, p19) -- Line: 117
    -- upvalues: GameWorldUtil (copy), Players (copy)
    local v20 = GameWorldUtil.getEntitiesWithinRadius(p19.Position, 50);

    if #v20 == 0 then
        return nil;
    end;

    local v21 = nil;

    for _, v in v20 do
        if not Players:GetPlayerFromCharacter(v:getInstance()) then
            if p18:validateTarget(p19, v) then
                return v;
            end;

            v21 = v;
        end;
    end;

    return v21;
end;

function u3.validateTarget(p22, p23, p24) -- Line: 134
    if not p22:canSee(p23, p24) then
        return false;
    end;

    local v25 = not p24;

    if not v25 then
        if p24 == nil then
            v25 = p24;
        else
            v25 = p24:isDead();
        end;
    end;

    if v25 then
        return false;
    end;

    return (p24:getInstance():GetPrimaryPartCFrame().Position - p23.Position).Magnitude <= 50;
end;

function u3.canSee(p26, p27, p28) -- Line: 156
    -- upvalues: GameQueryUtil (copy)
    if not p28 then
        return false;
    end;

    local function getBottomPosition(p29) -- Line: 161
        local v30 = p29:FindFirstChildWhichIsA("Humanoid");

        if not p29.PrimaryPart then
            return nil;
        end;

        if v30 then
            return p29.PrimaryPart.Position + Vector3.new(0, -1 * (v30.HipHeight + p29.PrimaryPart.Size.Y / 2), 0);
        end;

        return nil;
    end;

    local v31 = p27.Position - Vector3.new(0, 1.5, 0);
    local v32 = p28:getInstance();
    local v33 = v32:FindFirstChildWhichIsA("Humanoid");
    local v34;

    if v32.PrimaryPart and v33 then
        v34 = v32.PrimaryPart.Position + Vector3.new(0, -1 * (v33.HipHeight + v32.PrimaryPart.Size.Y / 2), 0);
    else
        v34 = nil;
    end;

    if not (v31 and v34) then
        return false;
    end;

    local v35 = v31 + Vector3.new(0, 4, 0);
    local v36 = v34 + Vector3.new(0, 4, 0);

    local function isRayBlocked(p37, p38, p39) -- Line: 184
        -- upvalues: GameQueryUtil (ref)
        local v40 = RaycastParams.new();
        v40.FilterDescendantsInstances = p39;
        v40.FilterType = Enum.RaycastFilterType.Blacklist;

        return GameQueryUtil:raycast(p37, p38 - p37, v40) ~= nil;
    end;

    local function isLineSegmentBlocked(p41, p42, p43) -- Line: 194
        -- upvalues: GameQueryUtil (ref)
        local v44 = RaycastParams.new();
        v44.FilterDescendantsInstances = p43;
        v44.FilterType = Enum.RaycastFilterType.Blacklist;
        local v45 = GameQueryUtil:raycast(p41, p42 - p41, v44) ~= nil;

        if not v45 then
            local v46 = RaycastParams.new();
            v46.FilterDescendantsInstances = p43;
            v46.FilterType = Enum.RaycastFilterType.Blacklist;
            v45 = GameQueryUtil:raycast(p42, p41 - p42, v46) ~= nil;
        end;

        return v45;
    end;

    local v47 = { p27, p28:getInstance() };
    local v48 = RaycastParams.new();
    v48.FilterDescendantsInstances = v47;
    v48.FilterType = Enum.RaycastFilterType.Blacklist;
    local v49 = GameQueryUtil:raycast(v31, v34 - v31, v48) ~= nil;

    if not v49 then
        local v50 = RaycastParams.new();
        v50.FilterDescendantsInstances = v47;
        v50.FilterType = Enum.RaycastFilterType.Blacklist;
        v49 = GameQueryUtil:raycast(v34, v31 - v34, v50) ~= nil;
    end;

    local v51 = not v49;

    if not v51 then
        local v52 = RaycastParams.new();
        v52.FilterDescendantsInstances = v47;
        v52.FilterType = Enum.RaycastFilterType.Blacklist;
        local v53 = GameQueryUtil:raycast(v35, v36 - v35, v52) ~= nil;

        if not v53 then
            local v54 = RaycastParams.new();
            v54.FilterDescendantsInstances = v47;
            v54.FilterType = Enum.RaycastFilterType.Blacklist;
            v53 = GameQueryUtil:raycast(v36, v35 - v36, v54) ~= nil;
        end;

        v51 = not v53;

        if not v51 then
            local v55 = (v31 + v35) / 2;
            local v56 = (v34 + v36) / 2;
            local v57 = RaycastParams.new();
            v57.FilterDescendantsInstances = v47;
            v57.FilterType = Enum.RaycastFilterType.Blacklist;
            local v58 = GameQueryUtil:raycast(v55, v56 - v55, v57) ~= nil;

            if not v58 then
                local v59 = RaycastParams.new();
                v59.FilterDescendantsInstances = v47;
                v59.FilterType = Enum.RaycastFilterType.Blacklist;
                v58 = GameQueryUtil:raycast(v56, v55 - v56, v59) ~= nil;
            end;

            v51 = not v58;
        end;
    end;

    return v51;
end;

KnitClient.CreateController(u3.new());

return nil;