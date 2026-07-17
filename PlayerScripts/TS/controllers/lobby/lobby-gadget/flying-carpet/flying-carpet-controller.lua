-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local VehicleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "FlyingCarpetController";
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
    p7.Name = "FlyingCarpetController";
    p7.animMap = {};
end;

function u5.KnitStart(u8) -- Line: 39
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), KnitClient (copy), GameSound (copy), Players (copy), CollectionService (copy), VehicleType (copy), u3 (copy), AnimationType (copy), AnimationUtil (copy), GameAnimationUtil (copy), SoundManager (copy), KnitClient2 (copy)
    KnitController.KnitStart(u8);
    ClientSyncEvents.StartConsuming:connect(function(p9) -- Line: 41
        -- upvalues: ItemType (ref), KnitClient (ref), GameSound (ref), Players (ref)
        if p9.itemType ~= ItemType.FLYING_CARPET_DEPLOY then
            return nil;
        end;

        if p9:isCancelled() then
            return nil;
        end;

        KnitClient.Controllers.PreloadController:runPreload({
            sounds = { GameSound.FLYING_CARPET_DEPLOY, GameSound.FLYING_CARPET_IDLE }
        });

        if Players.LocalPlayer:GetAttribute("IsInVehicle") == true then
            p9:setCancelled(true);
        end;
    end);
    CollectionService:GetInstanceAddedSignal(VehicleType.FLYING_CARPET):Connect(function(u10) -- Line: 55
        -- upvalues: u3 (ref), KnitClient (ref), AnimationType (ref), AnimationUtil (ref), GameAnimationUtil (ref), SoundManager (ref), GameSound (ref), KnitClient2 (ref), Players (ref), u8 (copy)
        local u11 = u3.new();
        KnitClient.Controllers.PreloadController:runPreload({
            animations = { AnimationType.SIT_FLAT, AnimationType.FLYING_CARPET_IDLE }
        });
        u10.Destroying:Connect(function() -- Line: 61
            -- upvalues: u11 (copy)
            u11:DoCleaning();
        end);
        task.spawn(function() -- Line: 65
            -- upvalues: u10 (copy), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
            AnimationUtil:playAnimation(u10:WaitForChild("AnimationController"):WaitForChild("Animator"), GameAnimationUtil:getAssetId(AnimationType.FLYING_CARPET_IDLE), {
                looped = true
            });
        end);
        task.spawn(function() -- Line: 72
            -- upvalues: u10 (copy), SoundManager (ref), GameSound (ref)
            local FlyingCarpet = u10:WaitForChild("FlyingCarpet");

            if not FlyingCarpet then
                return nil;
            end;

            SoundManager:playSound(GameSound.FLYING_CARPET_IDLE, {
                looped = true,
                parent = FlyingCarpet
            });
        end);
        task.spawn(function() -- Line: 83
            -- upvalues: u10 (copy), KnitClient2 (ref), Players (ref), u8 (ref), u11 (copy)
            local Passenger = u10:WaitForChild("Passenger");
            local u12 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
                Name = "FlyingCarpetPassengerPrompt",
                ActionText = "Passenger",
                ObjectText = "Flying Carpet",
                RequiresLineOfSight = false,
                MaxActivationDistance = 3,
                ClickablePrompt = true,
                HoldDuration = 0,
                Parent = Passenger
            });
            local v13 = Players.LocalPlayer:GetAttribute("FlyingCarpetPilot");

            if v13 ~= 0 and (v13 == v13 and (v13 ~= "" and v13)) then
                u12.Enabled = false;
            end;

            local u14 = -1;
            u12.Triggered:Connect(function(p15) -- Line: 100
                -- upvalues: u12 (copy), u8 (ref), Passenger (copy), u14 (ref)
                u12.Enabled = false;
                u8:mountPassenger(p15, Passenger);
                u14 = p15.UserId;
            end);
            u11:GiveTask(Passenger:GetPropertyChangedSignal("Occupant"):Connect(function() -- Line: 105
                -- upvalues: Passenger (copy), Players (ref), u12 (copy), u8 (ref), u14 (ref)
                if not Passenger.Occupant then
                    local v16 = Players.LocalPlayer:GetAttribute("FlyingCarpetPilot");

                    if v16 == 0 or (v16 ~= v16 or (v16 == "" or not v16)) then
                        u12.Enabled = true;
                    end;

                    local v17 = u8.animMap[u14];

                    if v17 ~= nil then
                        v17:Stop();
                    end;

                    if v17 ~= nil then
                        v17:Destroy();
                    end;

                    u14 = -1;
                end;
            end));
            u11:GiveTask(function() -- Line: 125
                -- upvalues: u8 (ref), u14 (ref)
                local v18 = u8.animMap[u14];

                if v18 ~= nil then
                    v18:Stop();
                end;

                if v18 ~= nil then
                    v18:Destroy();
                end;

                u14 = -1;
            end);
        end);
    end);
end;

function u5.mountPassenger(p19, p20, p21) -- Line: 142
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    local Character = p20.Character;

    if Character ~= nil then
        Character = Character:FindFirstChildOfClass("Humanoid");
    end;

    if Character then
        p21:Sit(Character);
    end;

    local v22 = p20.Character.Humanoid.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SIT_FLAT));
    v22.Priority = Enum.AnimationPriority.Movement;
    v22:Play();
    p19.animMap[p20.UserId] = v22;
end;

KnitClient.CreateController(u5.new());

return nil;