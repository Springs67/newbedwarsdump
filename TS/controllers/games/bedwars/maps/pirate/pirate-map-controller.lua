-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PirateMap = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "maps", "pirate", "pirate-map").PirateMap;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local MapKnitController = RuntimeLib.import(script, script.Parent.Parent, "map-knit-controller").MapKnitController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "PirateMapController";
    end,

    __index = MapKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 33
    -- upvalues: MapKnitController (copy), PirateMap (copy)
    MapKnitController.constructor(p7, PirateMap.MAPS);
    p7.Name = "PirateMapController";
end;

function u5.onMapInit(p8) -- Line: 37
    p8:decorateNpcs();
end;

function u5.onMatchStart(p9) -- Line: 40
    -- upvalues: KnitClient2 (copy)
    KnitClient2.Controllers.PirateTreasureController:preloadAssets();
    p9:setupBarrels();
end;

function u5.setupBarrels(p10) -- Line: 44
    -- upvalues: WatchCollectionTag (copy), KnitClient2 (copy), PirateMap (copy), DeviceUtil (copy), u3 (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy)
    WatchCollectionTag("ExplosiveBarrel", function(u11) -- Line: 45
        -- upvalues: KnitClient2 (ref), PirateMap (ref), DeviceUtil (ref), u3 (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), default (ref)
        local v12 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Pick Up",
            ObjectText = "Explosive Barrel",
            RequiresLineOfSight = false,
            HoldDuration = 1,
            Parent = u11,
            MaxActivationDistance = PirateMap.BarrelPromptMaxDistance,
            ClickablePrompt = DeviceUtil.isMobileControls()
        });
        local u13 = u3.new();
        v12.PromptButtonHoldBegan:Connect(function(p14) -- Line: 57
            -- upvalues: Players (ref), GameAnimationUtil (ref), AnimationType (ref), KnitClient2 (ref), u13 (copy)
            if p14 ~= Players.LocalPlayer then
                return nil;
            end;

            if not p14.Character then
                return nil;
            end;

            local u15 = GameAnimationUtil:playAnimation(p14, AnimationType.OPEN_CRATE, {
                looped = true
            });
            local u16 = KnitClient2.Controllers.ViewmodelController:playAnimation(AnimationType.OPEN_CRATE, {
                looped = true
            });
            u13:GiveTask(function() -- Line: 71
                -- upvalues: u15 (copy), u16 (copy)
                local v17 = u15;

                if v17 ~= nil then
                    v17:Stop();
                end;

                local v18 = u15;

                if v18 ~= nil then
                    v18:Destroy();
                end;

                local v19 = u16;

                if v19 ~= nil then
                    v19:Stop();
                end;

                local v20 = u16;

                if v20 ~= nil then
                    v20:Destroy();
                end;
            end);
        end);
        v12.PromptButtonHoldEnded:Connect(function(p21) -- Line: 90
            -- upvalues: Players (ref), u13 (copy)
            if p21 ~= Players.LocalPlayer then
                return nil;
            end;

            u13:DoCleaning();
        end);
        v12.Triggered:Connect(function(p22) -- Line: 96
            -- upvalues: GameAnimationUtil (ref), AnimationType (ref), default (ref), u11 (copy)
            GameAnimationUtil:playAnimation(p22, AnimationType.TENNIS_RACKET_HIT);
            default.Client:Get("CollectGunpowderBarrel"):CallServer({
                barrelPos = u11.Position
            });
        end);
    end);
end;

function u5.decorateNpcs(p23) -- Line: 104
    -- upvalues: WatchCollectionTag (copy), ReplicatedStorage (copy), WeldUtil (copy)
    WatchCollectionTag("NpcModel", function(u24) -- Line: 105
        -- upvalues: ReplicatedStorage (ref), WeldUtil (ref)
        task.delay(1, function() -- Line: 107
            -- upvalues: u24 (copy), ReplicatedStorage (ref), WeldUtil (ref)
            local v25 = u24:FindFirstChildOfClass("Humanoid");

            if not v25 then
                return nil;
            end;

            v25:AddAccessory((ReplicatedStorage.Assets.Misc.Parrot:Clone()));
            WeldUtil:weldCharacterAccessories(u24);
        end);
    end);
end;

KnitClient.CreateController(u5.new());

return nil;