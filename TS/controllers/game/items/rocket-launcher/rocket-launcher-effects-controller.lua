-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacterAnimation = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacterAnimation;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "RocketLauncherEffectsController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 27
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5, ...);
    p5.Name = "RocketLauncherEffectsController";
end;

function u3.KnitStart(p6) -- Line: 35
    -- upvalues: KnitController (copy), default (copy), ReplicatedStorage (copy), Workspace (copy), KnitClient2 (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy), InventoryUtil (copy), ItemType (copy), WeldUtil (copy)
    KnitController.KnitStart(p6);
    default.Client:WaitFor("RocketLauncherMissileExplode"):andThen(function(p7) -- Line: 38
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), KnitClient2 (ref)
        return p7:Connect(function(u8) -- Line: 39
            -- upvalues: ReplicatedStorage (ref), Workspace (ref), KnitClient2 (ref)
            task.spawn(function() -- Line: 45
                -- upvalues: ReplicatedStorage (ref), Workspace (ref), u8 (copy), KnitClient2 (ref)
                local v9 = ReplicatedStorage.Assets.Effects.RocketLauncherExplode:Clone();
                v9.Parent = Workspace;
                v9:PivotTo(CFrame.new(u8.position));
                KnitClient2.Controllers.FancyExplosionController:createExplosion({
                    radius = 15,
                    randomSizeOffset = 10,
                    randomPositionOffset = 1,
                    rotationSpeed = 15,
                    inDuration = 0.3,
                    outDuration = 0.3,
                    position = u8.position,
                    model = v9
                }):await();
                v9:Destroy();
            end);
            local v10 = false;
            local v11 = 0;

            while true do
                if v10 then
                    v11 = v11 + 1;
                else
                    v10 = true;
                end;

                if v11 >= math.random() * 2 + 2 then
                    return;
                end;

                task.spawn(function() -- Line: 73
                    -- upvalues: ReplicatedStorage (ref), Workspace (ref), u8 (copy)
                    local v12 = ReplicatedStorage.Assets.Effects.RocketLauncherDebris:Clone();
                    v12.Parent = Workspace;
                    v12.Position = u8.position;
                    local v13 = math.random() * 3.141592653589793 * 2;
                    local v14 = math.cos(v13) * 40;
                    local v15 = math.sin(v13) * 40;
                    v12:ApplyImpulse(Vector3.new(v14, 70, v15) * v12.Mass);
                    task.wait(1);
                    v12:Destroy();
                end);
            end;
        end);
    end);
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.ROCKET_LAUNCHER_SHOT), GameAnimationUtil:getAssetId(AnimationType.ROCKET_LAUNCHER_RELOAD) }, function(p16, u17) -- Line: 90
        -- upvalues: GameAnimationUtil (ref), AnimationType (ref), InventoryUtil (ref), ItemType (ref), ReplicatedStorage (ref), WeldUtil (ref)
        local Character = p16.Character;

        if not Character then
            return nil;
        end;

        local Animation = u17.Animation;

        if Animation ~= nil then
            Animation = Animation.AnimationId;
        end;

        if Animation == GameAnimationUtil:getAssetId(AnimationType.ROCKET_LAUNCHER_SHOT) then
            local hand = InventoryUtil.getInventory(p16).hand;

            if hand ~= nil then
                hand = hand.tool;
            end;

            if hand and hand.Name == ItemType.ROCKET_LAUNCHER then
                hand.Handle.Missile.Transparency = 1;

                local function _(p18) -- Line: 110
                    if p18:IsA("ParticleEmitter") then
                        p18:Emit(5);
                    end;
                end;

                for i, descendant in hand:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant:Emit(5);
                    end;
                end;
            end;
        end;

        if Animation == GameAnimationUtil:getAssetId(AnimationType.ROCKET_LAUNCHER_RELOAD) then
            local hand = InventoryUtil.getInventory(p16).hand;

            if hand ~= nil then
                hand = hand.tool;
            end;

            if hand and hand.Name == ItemType.ROCKET_LAUNCHER then
                u17:GetMarkerReachedSignal("grab_missile"):Connect(function() -- Line: 128
                    -- upvalues: ReplicatedStorage (ref), u17 (copy), hand (copy), Character (copy), WeldUtil (ref)
                    local u19 = ReplicatedStorage:WaitForChild("Items"):WaitForChild("rocket_launcher_missile"):Clone();
                    u17:GetMarkerReachedSignal("insert_missile"):Connect(function() -- Line: 130
                        -- upvalues: u19 (copy), hand (ref)
                        u19:Destroy();

                        if hand.Parent and hand:FindFirstChild("Handle") then
                            hand.Handle.Missile.Transparency = 0;
                        end;
                    end);
                    local v20 = Character:FindFirstChildWhichIsA("Humanoid");

                    if v20 ~= nil then
                        v20:AddAccessory(u19);
                    end;

                    WeldUtil:weldCharacterAccessories(Character);
                end);
            end;
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;