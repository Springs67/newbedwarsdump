-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local ExpireList = v1.ExpireList;
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local TimeToMakeSnowCone = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "snow-cone", "snow-cone-loot-table").TimeToMakeSnowCone;
local SnowConeMachineState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "snow-cone", "snow-cone-machine-state").SnowConeMachineState;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local SnowConeQueueUI = RuntimeLib.import(script, script.Parent, "snow-cone-queue-ui").SnowConeQueueUI;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "SnowConeMachineController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 44
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 48
    -- upvalues: KnitController (copy), ExpireList (copy)
    KnitController.constructor(p8);
    p8.Name = "SnowConeMachineController";
    p8.upgradeCooldowns = ExpireList.new(2);
    p8.isPreloaded = false;
end;

function u6.KnitStart(u9) -- Line: 54
    -- upvalues: KnitController (copy), default (copy), WatchCollectionTag (copy), KnitClient (copy), AnimationType (copy), KnitClient2 (copy), BalanceFile (copy), DeviceUtil (copy), ClientStore (copy), Flamework (copy), InventoryUtil (copy), ItemType (copy), u3 (copy), GameAnimationUtil (copy), Players (copy), ReplicatedStorage (copy), EffectUtil (copy), TimeToMakeSnowCone (copy), SnowConeMachineState (copy), SoundManager (copy), GameSound (copy), WatchCharacterAnimation (copy), EntityUtil (copy), WeldUtil (copy)
    KnitController.KnitStart(u9);
    default.Client:Get("MakeSnowCone");
    local u10 = default.Client:Get("RepairSnowConeMachine");
    WatchCollectionTag("BrokenSnowConeMachine", function(u11) -- Line: 58
        -- upvalues: u9 (copy), KnitClient (ref), AnimationType (ref), KnitClient2 (ref), BalanceFile (ref), DeviceUtil (ref), ClientStore (ref), Flamework (ref), InventoryUtil (ref), ItemType (ref), u3 (ref), GameAnimationUtil (ref), Players (ref), u10 (copy)
        if not u9.isPreloaded then
            KnitClient.Controllers.PreloadController:runPreload({
                animations = { AnimationType.REPAIR_SNOW_CONE_MACHINE }
            });
            u9.isPreloaded = true;
        end;

        local u12 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ObjectText = "Repair Snow Cone Machine",
            RequiresLineOfSight = false,
            MaxActivationDistance = 6,
            HoldDuration = 3.68,
            Parent = u11,
            ActionText = tostring(BalanceFile.RepairSnowConeMachinePrice) .. " Diamonds",
            ClickablePrompt = DeviceUtil.isMobileControls()
        });
        u12.PromptButtonHoldBegan:Connect(function(p13) -- Line: 74
            -- upvalues: u11 (copy), ClientStore (ref), u12 (copy), Flamework (ref), InventoryUtil (ref), ItemType (ref), BalanceFile (ref), u3 (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref)
            local v14 = u11:GetAttribute("Team");
            local myTeam = ClientStore:getState().Game.myTeam;

            if myTeam ~= nil then
                myTeam = myTeam.id;
            end;

            if v14 ~= myTeam then
                u12:InputHoldEnd();
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "You can only repair your team\'s Snow Cone Machine."
                });

                return nil;
            end;

            if not InventoryUtil.hasEnough(p13, ItemType.DIAMOND, BalanceFile.RepairSnowConeMachinePrice) then
                u12:InputHoldEnd();
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "You need " .. tostring(BalanceFile.RepairSnowConeMachinePrice) .. " diamonds to repair the Snow Cone Machine."
                });

                return nil;
            end;

            local u15 = u3.new();
            local u16 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.REPAIR_SNOW_CONE_MACHINE);
            u15:GiveTask(function() -- Line: 96
                -- upvalues: u16 (copy)
                local v17 = u16;

                if v17 ~= nil then
                    v17:Stop();
                end;

                local v18 = u16;

                if v18 ~= nil then
                    v18:Destroy();
                end;
            end);
            u12.PromptButtonHoldEnded:Connect(function() -- Line: 106
                -- upvalues: u15 (copy)
                u15:DoCleaning();
            end);
        end);
        u12.Triggered:Connect(function(p19) -- Line: 110
            -- upvalues: u10 (ref), u11 (copy)
            u10:CallServer(u11);
        end);
    end);
    WatchCollectionTag("SnowConeMachine", function(u20) -- Line: 114
        -- upvalues: ReplicatedStorage (ref), u9 (copy), EffectUtil (ref), KnitClient2 (ref), DeviceUtil (ref), ClientStore (ref), Players (ref), u3 (ref), TimeToMakeSnowCone (ref), SnowConeMachineState (ref), SoundManager (ref), GameSound (ref)
        local u21 = ReplicatedStorage.Assets.Effects.SnowBlast:Clone();
        u21.Parent = u20;
        u21.Position = u20.Position + Vector3.new(0, 2.75, 0);
        u9:hookSnowConeQueueBillboard(u20);
        task.spawn(function() -- Line: 121
            -- upvalues: EffectUtil (ref), u21 (copy)
            EffectUtil:playEffects(u21:GetChildren(), nil, {
                destroyAfterSec = 3,
                sizeMultiplier = 2
            });
        end);
        local v22 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "1 Emerald",
            ObjectText = "Make Snow Cone",
            RequiresLineOfSight = false,
            MaxActivationDistance = 6,
            HoldDuration = 0.5,
            Parent = u20,
            ClickablePrompt = DeviceUtil.isMobileControls()
        });
        local v23 = u20:GetAttribute("Team");
        local myTeam = ClientStore:getState().Game.myTeam;

        if myTeam ~= nil then
            myTeam = myTeam.id;
        end;

        if v23 ~= myTeam then
            v22.Enabled = false;
        end;

        v22.Triggered:Connect(function(p24) -- Line: 144
            -- upvalues: Players (ref), u9 (ref), u20 (copy)
            if p24 ~= Players.LocalPlayer then
                return nil;
            end;

            u9:makeSnowCone(u20);
        end);
        local u25 = u3.new();
        u20:GetAttributeChangedSignal("SnowConeMachineState"):Connect(function() -- Line: 151
            -- upvalues: u20 (copy), TimeToMakeSnowCone (ref), u25 (copy), SnowConeMachineState (ref), SoundManager (ref), GameSound (ref)
            local v26 = u20:GetAttribute("SnowConeMachineState");
            local Model = u20:FindFirstChild("Model");

            if Model ~= nil then
                Model = Model:FindFirstChild("Button");
            end;

            if not Model then
                return nil;
            end;

            local v27 = TimeToMakeSnowCone / 10;
            u25:DoCleaning();

            if v26 == SnowConeMachineState.GENERATING then
                task.spawn(function() -- Line: 167
                    -- upvalues: SoundManager (ref), GameSound (ref), u20 (ref), u25 (ref)
                    local u28 = SoundManager:playSound(GameSound.SNOW_CONE_MACHINE_MAKING, {
                        rollOffMaxDistance = 100,
                        looped = true,
                        position = u20.Position
                    });
                    u25:GiveTask(function() -- Line: 173
                        -- upvalues: u28 (copy)
                        local v29 = u28;

                        if v29 ~= nil then
                            v29:Stop();
                        end;

                        local v30 = u28;

                        if v30 ~= nil then
                            v30:Destroy();
                        end;
                    end);
                    local SpiralTrailBW = u20:FindFirstChild("SpiralTrailBW");

                    if SpiralTrailBW then
                        local u31 = require(SpiralTrailBW);
                        task.spawn(function() -- Line: 186
                            -- upvalues: u31 (copy), u20 (ref)
                            u31:Init(u20, {
                                Size = 0.15,
                                Offset = 0.065,
                                Frequency = 1,
                                Color = Color3.fromRGB(135, 177, 255)
                            });
                        end);
                    end;
                end);
                local v32 = false;
                local v33 = 0;
                local v34 = true;

                while true do
                    if true then
                        if v32 then
                            v33 = v33 + 1;
                        else
                            v32 = true;
                        end;
                    end;

                    if v33 >= 10 then
                        break;
                    end;

                    if v34 then
                        Model.Color = Color3.fromRGB(105, 237, 112);
                        Model.Material = Enum.Material.Neon;
                        Model.Transparency = 0;
                    else
                        Model.Color = Color3.fromRGB(255, 255, 255);
                        Model.Material = Enum.Material.Neon;
                        Model.Transparency = 0.5;
                    end;

                    task.wait(v27);
                    v34 = not v34;
                end;
            else
                Model.Color = Color3.fromRGB(85, 159, 255);
                Model.Material = Enum.Material.SmoothPlastic;
                Model.Transparency = 0.2;
            end;
        end);
    end);
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.REPAIR_SNOW_CONE_MACHINE) }, function(p35, p36) -- Line: 242
        -- upvalues: u9 (copy), Players (ref), EntityUtil (ref), u3 (ref), ReplicatedStorage (ref), WeldUtil (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
        local Character = p35.Character;

        if not Character then
            return nil;
        end;

        if u9.upgradeCooldowns:has(p35.UserId) and p35.UserId ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        u9.upgradeCooldowns:add(p35.UserId);
        local v37 = EntityUtil:getEntity(p35);

        if not v37 then
            return nil;
        end;

        if not Character.PrimaryPart then
            return nil;
        end;

        local Position = Character.PrimaryPart.Position;

        if not Position then
            return nil;
        end;

        local u38 = u9:getClosestBrokenSnowConeMachine(Position);

        if not u38 then
            return nil;
        end;

        local u39 = u3.new();
        local v40 = v37:getItemInHandClient();

        if v40 then
            for _, descendant in v40:GetDescendants() do
                if descendant:IsA("BasePart") then
                    local Transparency = descendant.Transparency;
                    descendant.Transparency = 1;
                    u39:GiveTask(function() -- Line: 273
                        -- upvalues: descendant (copy), Transparency (copy)
                        descendant.Transparency = Transparency;
                    end);
                end;
            end;
        end;

        local u41 = Character == Players.LocalPlayer.Character;
        local u42 = ReplicatedStorage.Assets.Effects.RepairEnchantTableHammer:Clone();
        u42.Parent = Character;
        WeldUtil:weldCharacterAccessories(Character);
        local u43 = nil;
        u43 = p36:GetMarkerReachedSignal("hammer_1"):Connect(function() -- Line: 284
            -- upvalues: u43 (ref), EffectUtil (ref), u38 (copy), SoundManager (ref), GameSound (ref), u41 (copy), Character (copy)
            u43:Disconnect();
            EffectUtil:playEffects(u38.HammerEffect:GetChildren(), nil);
            local SNOW_CONE_MACHINE_REPAIR_HAMMER_1 = GameSound.SNOW_CONE_MACHINE_REPAIR_HAMMER_1;
            local v44 = {};
            local v45;

            if u41 then
                v45 = nil;
            else
                v45 = Character.PrimaryPart;

                if v45 ~= nil then
                    v45 = v45.Position;
                end;
            end;

            v44.position = v45;
            SoundManager:playSound(SNOW_CONE_MACHINE_REPAIR_HAMMER_1, v44);
        end);
        local u46 = nil;
        u46 = p36:GetMarkerReachedSignal("hammer_2"):Connect(function() -- Line: 305
            -- upvalues: u46 (ref), EffectUtil (ref), u38 (copy), SoundManager (ref), GameSound (ref), u41 (copy), Character (copy)
            u46:Disconnect();
            EffectUtil:playEffects(u38.HammerEffect:GetChildren(), nil);
            local SNOW_CONE_MACHINE_REPAIR_HAMMER_2 = GameSound.SNOW_CONE_MACHINE_REPAIR_HAMMER_2;
            local v47 = {};
            local v48;

            if u41 then
                v48 = nil;
            else
                v48 = Character.PrimaryPart;

                if v48 ~= nil then
                    v48 = v48.Position;
                end;
            end;

            v47.position = v48;
            SoundManager:playSound(SNOW_CONE_MACHINE_REPAIR_HAMMER_2, v47);
        end);
        local u49 = nil;
        u49 = p36:GetMarkerReachedSignal("hammer_3"):Connect(function() -- Line: 326
            -- upvalues: u49 (ref), EffectUtil (ref), u38 (copy), SoundManager (ref), GameSound (ref), u41 (copy), Character (copy)
            u49:Disconnect();
            EffectUtil:playEffects(u38.HammerEffect:GetChildren(), nil);
            local SNOW_CONE_MACHINE_REPAIR_HAMMER_3 = GameSound.SNOW_CONE_MACHINE_REPAIR_HAMMER_3;
            local v50 = {};
            local v51;

            if u41 then
                v51 = nil;
            else
                v51 = Character.PrimaryPart;

                if v51 ~= nil then
                    v51 = v51.Position;
                end;
            end;

            v50.position = v51;
            SoundManager:playSound(SNOW_CONE_MACHINE_REPAIR_HAMMER_3, v50);
        end);
        local u52 = nil;
        u52 = p36:GetMarkerReachedSignal("hammer_4"):Connect(function() -- Line: 347
            -- upvalues: u52 (ref), EffectUtil (ref), u38 (copy), SoundManager (ref), GameSound (ref), u41 (copy), Character (copy)
            u52:Disconnect();
            EffectUtil:playEffects(u38.HammerEffect:GetChildren(), nil);
            local SNOW_CONE_MACHINE_REPAIR_HAMMER_4 = GameSound.SNOW_CONE_MACHINE_REPAIR_HAMMER_4;
            local v53 = {};
            local v54;

            if u41 then
                v54 = nil;
            else
                v54 = Character.PrimaryPart;

                if v54 ~= nil then
                    v54 = v54.Position;
                end;
            end;

            v53.position = v54;
            SoundManager:playSound(SNOW_CONE_MACHINE_REPAIR_HAMMER_4, v53);
        end);
        p36.Stopped:Connect(function() -- Line: 367
            -- upvalues: u42 (copy), u39 (copy)
            u42:Destroy();
            u39:DoCleaning();
        end);
    end);
    default.Client:OnEvent("SnowConeMade", function(u55) -- Line: 372
        -- upvalues: ReplicatedStorage (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
        task.spawn(function() -- Line: 373
            -- upvalues: ReplicatedStorage (ref), u55 (copy), EffectUtil (ref)
            local v56 = ReplicatedStorage.Assets.Effects.SnowBlast:Clone();
            v56.Parent = u55.snowConeMachine;
            v56.Position = u55.snowConeMachine.Position + Vector3.new(0, 2.75, 0);
            EffectUtil:playEffects(v56:GetChildren(), nil, {
                destroyAfterSec = 3,
                sizeMultiplier = 1.25
            });
        end);
        SoundManager:playSound(GameSound.BEDWARS_PURCHASE_ITEM, {
            position = u55.snowConeMachine.Position
        });
        SoundManager:playSound(GameSound.SNOW_CONE_MACHINE_MAKING_FINISH, {
            position = u55.snowConeMachine.Position
        });
    end);
end;

function u6.getClosestBrokenSnowConeMachine(p57, u58) -- Line: 392
    -- upvalues: CollectionService (copy)
    local v59 = CollectionService:GetTagged("BrokenSnowConeMachine");
    table.sort(v59, function(p60, p61) -- Line: 394
        -- upvalues: u58 (copy)
        return (p60.Position - u58).Magnitude < (p61.Position - u58).Magnitude;
    end);

    local function _(p62) -- Line: 403
        return true;
    end;

    local v63 = nil;

    for i, v in v59 do
        local _ = i - 1;

        if true == true then
            v63 = v;
            break;
        end;
    end;

    return v63;
end;

function u6.getClosestSnowConeMachine(p64, u65) -- Line: 418
    -- upvalues: CollectionService (copy)
    local v66 = CollectionService:GetTagged("SnowConeMachine");
    table.sort(v66, function(p67, p68) -- Line: 420
        -- upvalues: u65 (copy)
        return (p67.Position - u65).Magnitude < (p68.Position - u65).Magnitude;
    end);

    local function _(p69) -- Line: 429
        return true;
    end;

    local v70 = nil;

    for i, v in v66 do
        local _ = i - 1;

        if true == true then
            v70 = v;
            break;
        end;
    end;

    return v70;
end;

function u6.makeSnowCone(p71, p72) -- Line: 444
    -- upvalues: Players (copy), default (copy)
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

    default.Client:Get("MakeSnowCone"):CallServer({
        snowConeMachine = p72
    });
end;

function u6.hookSnowConeQueueBillboard(p73, p74) -- Line: 460
    -- upvalues: u4 (copy), SnowConeQueueUI (copy)
    u4.mount(u4.createElement("BillboardGui", {
        StudsOffsetWorldSpace = Vector3.new(0, 3, 1),
        ResetOnSpawn = false,
        MaxDistance = 30,
        AlwaysOnTop = true,
        Adornee = p74,
        Size = UDim2.fromScale(3, 3)
    }, { u4.createElement(SnowConeQueueUI, {
            SnowConeMachine = p74
        }) }), p74, "SnowConeQueueBillboard");
end;

KnitClient.CreateController(u6.new());

return nil;