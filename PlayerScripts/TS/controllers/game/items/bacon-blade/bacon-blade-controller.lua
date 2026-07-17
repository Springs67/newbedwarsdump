-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v4.Debris;
local HttpService = v4.HttpService;
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BaconBladeBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "bacon-blade-balance").BaconBladeBalance;
local ProjectileUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = {
    GameSound.BACON_BLADE_DRIP_1,
    GameSound.BACON_BLADE_DRIP_2,
    GameSound.BACON_BLADE_DRIP_3,
    GameSound.BACON_BLADE_DRIP_4,
    GameSound.BACON_BLADE_DRIP_5,
    GameSound.BACON_BLADE_DRIP_6
};
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "BaconBladeController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 34
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 38
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "BaconBladeController";
end;

function u6.KnitStart(u9) -- Line: 42
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), default (copy), BaconBladeBalance (copy), Workspace (copy)
    KnitController.KnitStart(u9);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.BACON_BLADE, {
        sounds = {
            GameSound.BACON_BLADE_SWING_1,
            GameSound.BACON_BLADE_SWING_2,
            GameSound.BACON_BLADE_SWING_3,
            GameSound.BACON_BLADE_SWING_4,
            GameSound.BACON_BLADE_DRIP_1,
            GameSound.BACON_BLADE_DRIP_2,
            GameSound.BACON_BLADE_DRIP_3,
            GameSound.BACON_BLADE_DRIP_4,
            GameSound.BACON_BLADE_DRIP_5,
            GameSound.BACON_BLADE_DRIP_6,
            GameSound.BACON_BLADE_HIT_1,
            GameSound.BACON_BLADE_HIT_2,
            GameSound.BACON_BLADE_HIT_3,
            GameSound.BACON_BLADE_HIT_4
        }
    });
    default.Client:OnEvent("GreaseSpill", function(p10) -- Line: 47
        -- upvalues: BaconBladeBalance (ref), u9 (copy), Workspace (ref)
        local v11 = Random.new(p10.seed);

        if p10.isDripping then
            local v12 = v11:NextNumber() * 3.141592653589793 * 2;
            local position = p10.position;
            local v13 = math.cos(v12) * v11:NextNumber(10, 30);
            local v14 = math.sin(v12) * v11:NextNumber(10, 30);
            u9:launchGreaseSplash(position, Vector3.new(v13, 0, v14), BaconBladeBalance.GREASE_DURATION, v11, p10.playerHit, nil);
        else
            local v15 = v11:NextInteger(BaconBladeBalance.MIN_GREASE_ZONE_AMOUNT, BaconBladeBalance.MAX_GREASE_ZONE_AMOUNT);
            local v16 = false;
            local v17 = 0;

            while true do
                if true then
                    if v16 then
                        v17 = v17 + 1;
                    else
                        v16 = true;
                    end;
                end;

                if v17 >= v15 then
                    break;
                end;

                local v18 = v11:NextNumber() * 3.141592653589793 * 2;
                local v19 = p10.position + Vector3.new(0, 3, 0);
                local v20 = math.cos(v18) * v11:NextNumber(10, 30);
                local v21 = v11:NextInteger(5, 20);
                local v22 = math.sin(v18) * v11:NextNumber(10, 30);
                u9:launchGreaseSplash(v19, Vector3.new(v20, v21, v22), p10.expirationTime - Workspace:GetServerTimeNow(), v11, p10.playerHit, nil);
            end;
        end;
    end);
    default.Client:OnEvent("GreaseSpillEntity", function(p23) -- Line: 77
        -- upvalues: BaconBladeBalance (ref), u9 (copy), Workspace (ref)
        local v24 = Random.new(p23.seed);
        local v25 = v24:NextInteger(BaconBladeBalance.MIN_GREASE_ZONE_AMOUNT, BaconBladeBalance.MAX_GREASE_ZONE_AMOUNT);
        local v26 = false;
        local v27 = 0;

        while true do
            if v26 then
                v27 = v27 + 1;
            else
                v26 = true;
            end;

            if v27 >= v25 then
                return;
            end;

            local v28 = v24:NextNumber() * 3.141592653589793 * 2;
            local v29 = p23.position + Vector3.new(0, 3, 0);
            local v30 = math.cos(v28) * v24:NextNumber(10, 30);
            local v31 = v24:NextInteger(5, 20);
            local v32 = math.sin(v28) * v24:NextNumber(10, 30);
            u9:launchGreaseSplash(v29, Vector3.new(v30, v31, v32), p23.expirationTime - Workspace:GetServerTimeNow(), v24, nil, p23.entityHit);
        end;
    end);
end;

u6.greaseSpillInTween = RuntimeLib.async(function(p33, p34, p35) -- Line: 101
    -- upvalues: TweenService (copy)
    local v36 = TweenService:Create(p34, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Size = Vector3.new(p35, p34.Size.Y, p35)
    });
    v36:Play();
    v36.Completed:Wait();
end);
u6.greaseSpillOutTween = RuntimeLib.async(function(p37, p38, p39) -- Line: 108
    -- upvalues: TweenService (copy)
    local v40 = TweenService:Create(p38, TweenInfo.new(p39, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
        Size = Vector3.new(0, 0, 0)
    });
    v40:Play();
    v40.Completed:Wait();
end);

function u6.makeGreaseSlippery(p41, p42, p43) -- Line: 115
    p42.CanCollide = true;
    local v44 = p43:NextNumber(-1, 1);
    local v45 = p43:NextNumber(-1, 1);
    p42.AssemblyLinearVelocity = Vector3.new(v44, v45, p43:NextNumber(-1, 1)) * 20;
    p42.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 100, 0);
end;

function u6.launchGreaseSplash(u46, u47, p48, u49, u50, p51, p52) -- Line: 120
    -- upvalues: BaconBladeBalance (copy), ReplicatedStorage (copy), GameQueryUtil (copy), u3 (copy), EntityUtil (copy), ProjectileUtil (copy), HttpService (copy), BlockEngine (copy), u2 (copy), Debris (copy)
    if u50 == nil then
        u50 = Random.new();
    end;

    local u53 = u50:NextNumber(BaconBladeBalance.MIN_SPLASH_SIZE, BaconBladeBalance.MAX_SPLASH_SIZE);
    local v54 = ReplicatedStorage.Assets.Effects.GreasePart:Clone();
    v54.Anchored = false;
    v54.Size = Vector3.new(u53, u53, u53);
    GameQueryUtil:setQueryIgnored(v54, true);
    local u55 = u3("Model", {
        Children = { v54 }
    });
    u55.PrimaryPart = v54;
    local v56;

    if p51 then
        v56 = EntityUtil:getEntity(p51);
    else
        v56 = nil;
    end;

    ProjectileUtil.fireProjectile(v56, u55, "grease:" .. HttpService:GenerateGUID(false), u47, p48, 196.2, function(u57, p58) -- Line: 139
        -- upvalues: BlockEngine (ref), u47 (copy), u2 (ref), u46 (copy), u53 (copy), u50 (ref), u49 (copy), u55 (copy)
        local v59 = BlockEngine:getHandlerRegistry():getHandler(p58.Name);

        if v59 then
            local function _(p60) -- Line: 143
                -- upvalues: BlockEngine (ref), u57 (copy)
                return (BlockEngine:getWorldPosition(p60) - u57).Magnitude <= 3.1;
            end;

            local v61 = nil;

            for i, v in v59:getContainedPositions(p58) do
                local _ = i - 1;

                if (BlockEngine:getWorldPosition(v) - u57).Magnitude <= 3.1 == true then
                    v61 = v;
                    break;
                end;
            end;

            if v61 then
                local u62 = nil;

                for _, v in Enum.NormalId:GetEnumItems() do
                    if BlockEngine:getStore():getBlockAt(v61 + Vector3.FromNormalId(v)) == nil then
                        local v63 = BlockEngine:getWorldPosition(v61) + Vector3.FromNormalId(v) * 1.5;
                        local Magnitude = (v63 - (u57 + (u47 - u57).Unit)).Magnitude;

                        if u62 == nil or Magnitude < u62.distance then
                            u62 = {
                                surface = v,
                                distance = Magnitude,
                                surfacePosition = v63
                            };
                        end;
                    end;
                end;

                task.spawn(function() -- Line: 182
                    -- upvalues: u62 (ref), u57 (copy), u2 (ref), u46 (ref), u53 (ref), u50 (ref), u49 (ref)
                    if u62 then
                        local v64 = Vector3.FromNormalId(u62.surface);
                        local v65;

                        if math.abs(v64.X) == 1 then
                            v65 = u62.surfacePosition.X;
                        else
                            v65 = u57.X;
                        end;

                        local v66;

                        if math.abs(v64.Y) == 1 then
                            v66 = u62.surfacePosition.Y;
                        else
                            v66 = u57.Y;
                        end;

                        local v67;

                        if math.abs(v64.Z) == 1 then
                            v67 = u62.surfacePosition.Z;
                        else
                            v67 = u57.Z;
                        end;

                        local u68 = u2.new();
                        local u69 = u46:createGreaseSplashPart(Vector3.new(v65, v66, v67), u53, v64, u50);
                        u68:GiveTask(u69);
                        u46:makeGreaseSlippery(u69, u50);
                        u46:greaseSpillInTween(u69, u53 * 2):andThen(function() -- Line: 193
                            -- upvalues: u46 (ref), u69 (copy), u49 (ref), u68 (copy)
                            u46:greaseSpillOutTween(u69, u49):expect();
                            u68:DoCleaning();
                        end);
                    end;
                end);
            end;
        end;

        u55:Destroy();
    end, nil, nil, {
        playerCollisionDisabled = true,
        detectHitTerrain = true,
        collisionDisabled = p52 ~= nil
    });
    Debris:AddItem(u55, 10);
end;

function u6.createGreaseSplashPart(p70, p71, p72, p73, p74) -- Line: 210
    -- upvalues: ReplicatedStorage (copy), GameQueryUtil (copy), u5 (copy), SoundManager (copy), Workspace (copy)
    if p74 == nil then
        p74 = Random.new();
    end;

    local v75 = ReplicatedStorage.Assets.Effects.GreasePart:Clone();
    GameQueryUtil:setQueryIgnored(v75, true);
    SoundManager:playSound(u5[p74:NextInteger(1, #u5) + 1], {
        rollOffMaxDistance = 150,
        position = p71,
        playbackSpeedMultiplier = p74:NextNumber(1, 1.5)
    });
    local v76 = p74:NextNumber(0.1, 1);
    v75.Size = Vector3.new(p72, v76, p72);
    v75.CFrame = CFrame.lookAt(p71, p71 + p73) * CFrame.Angles(1.5707963267948966, 0, 0);
    v75.Parent = Workspace;

    return v75;
end;

KnitClient.CreateController(u6.new());

return nil;