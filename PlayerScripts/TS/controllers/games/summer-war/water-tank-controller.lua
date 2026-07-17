-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local WaterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "water-gun", "water-gun-util").WaterType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "water-guns", "water-gun-util");
local WATER_ATTRIBUTE = v5.WATER_ATTRIBUTE;
local WATER_REFILL_PER_TICK = v5.WATER_REFILL_PER_TICK;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "WaterTankController";
    end,

    __index = GameKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 37
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 41
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p8, { GameType.SUMMER_WARS });
    p8.Name = "WaterTankController";
    p8.prompts = {};
end;

function u6.KnitStart(p9) -- Line: 46
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p9);
end;

function u6.onGameInit(u10) -- Line: 49
    -- upvalues: WatchCollectionTag (copy), u2 (copy), u3 (copy), Theme (copy), DeviceUtil (copy), EntityUtil (copy), ItemType (copy), default (copy), Players (copy), WATER_ATTRIBUTE (copy), SoundManager (copy), GameSound (copy), WATER_REFILL_PER_TICK (copy), ClientSyncEvents (copy), RunService (copy)
    WatchCollectionTag("WaterTank", function(u11) -- Line: 50
        -- upvalues: u2 (ref), u3 (ref), Theme (ref), DeviceUtil (ref), u10 (copy), EntityUtil (ref), ItemType (ref), default (ref), Players (ref), WATER_ATTRIBUTE (ref), SoundManager (ref), GameSound (ref), WATER_REFILL_PER_TICK (ref), ClientSyncEvents (ref), RunService (ref)
        local u12 = u2.new();
        local u13 = false;
        local u14 = u3("ProximityPrompt", {
            ActionText = "Refill Water",
            ObjectText = "Water Tank",
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            HoldDuration = 2,
            Parent = u11,
            KeyboardKeyCode = Theme.promptKeyboardKey,
            ClickablePrompt = DeviceUtil.isMobileControls()
        });
        u10:updateWaterTankType(u11);
        u11:GetAttributeChangedSignal("WaterType"):Connect(function() -- Line: 64
            -- upvalues: u10 (ref), u11 (copy)
            u10:updateWaterTankType(u11);
        end);
        local u15 = nil;
        u14.Triggered:Connect(function(p16) -- Line: 68
            -- upvalues: EntityUtil (ref), ItemType (ref), default (ref), u11 (copy), u15 (ref)
            print("Trigger");
            local v17 = EntityUtil:getLocalPlayerEntity();

            if v17 ~= nil then
                v17 = v17:getHandItemInstanceFromCharacter();

                if v17 ~= nil then
                    v17 = v17.Name;
                end;
            end;

            if v17 == ItemType.EMPTY_BALLOON then
                default.Client:Get("FillWaterBalloon"):SendToServer({
                    waterTank = u11
                });
            else
                default.Client:Get("WaterTankRefillStop"):SendToServer();
            end;

            local v18 = u15;

            if v18 ~= nil then
                v18:Stop();
            end;
        end);
        u14.PromptButtonHoldBegan:Connect(function(p19) -- Line: 90
            -- upvalues: u13 (ref), EntityUtil (ref), ItemType (ref), default (ref), u11 (copy), u14 (copy), Players (ref), WATER_ATTRIBUTE (ref), u15 (ref), SoundManager (ref), GameSound (ref)
            u13 = true;
            local v20 = EntityUtil:getLocalPlayerEntity();

            if v20 ~= nil then
                v20 = v20:getHandItemInstanceFromCharacter();

                if v20 ~= nil then
                    v20 = v20.Name;
                end;
            end;

            if v20 ~= ItemType.EMPTY_BALLOON then
                default.Client:Get("WaterTankRefillStart"):SendToServer({
                    waterTank = u11
                });
            end;

            local v21 = math.max(0, 5 - u14.HoldDuration);
            local v22 = Players.LocalPlayer:GetAttribute(WATER_ATTRIBUTE);
            local v23 = Players.LocalPlayer:GetAttribute("WATER_CAPACITY");
            local _ = (v22 == nil and 0 or v22) / (v23 == nil and 100 or v23);
            u15 = SoundManager:playModifiableSound(GameSound.WATER_FILL_UP);
            u15.TimePosition = math.max(0, v21);
        end);
        u14.PromptShown:Connect(function() -- Line: 121
            -- upvalues: Players (ref), WATER_ATTRIBUTE (ref), WATER_REFILL_PER_TICK (ref), EntityUtil (ref), ItemType (ref), u11 (copy), u14 (copy), u12 (copy), ClientSyncEvents (ref), u13 (ref), RunService (ref)
            print("Shown");
            local v24 = Players.LocalPlayer:GetAttribute(WATER_ATTRIBUTE);
            local v25 = Players.LocalPlayer:GetAttribute("WATER_CAPACITY");
            local u26 = math.ceil(((v25 == nil and 100 or v25) - (v24 == nil and 0 or v24)) / WATER_REFILL_PER_TICK) / 2;
            local v27 = EntityUtil:getLocalPlayerEntity();

            if v27 ~= nil then
                v27 = v27:getHandItemInstanceFromCharacter();
            end;

            local v28 = "Refill Water";

            if v27 ~= nil then
                v27 = v27.Name;
            end;

            if v27 == ItemType.EMPTY_BALLOON then
                v28 = "Fill Water Balloon";
                u26 = 1;
            elseif Players.LocalPlayer:GetAttribute("WaterType") ~= u11:GetAttribute("WaterType") then
                u26 = 5;
            end;

            u14.ActionText = v28;

            if u14.HoldDuration ~= u26 then
                u14.HoldDuration = u26;
                u14.Enabled = false;
                task.delay(0.25, function() -- Line: 154
                    -- upvalues: u14 (ref)
                    u14.Enabled = true;
                end);
            end;

            u12:GiveTask(ClientSyncEvents.HandItemRendered:connect(function(p29) -- Line: 158
                -- upvalues: EntityUtil (ref), ItemType (ref), u26 (ref), u14 (ref)
                local entity = p29.entity;
                local v30 = EntityUtil:getLocalPlayerEntity();

                if v30 ~= nil then
                    v30 = v30:getInstance();
                end;

                if entity == v30 then
                    local v31;

                    if p29.itemType == ItemType.EMPTY_BALLOON then
                        v31 = "Fill Water Balloon";
                        u26 = 1;
                    else
                        v31 = "Refill Water";
                    end;

                    u14.Enabled = false;
                    u14.ActionText = v31;
                    task.delay(0.1, function() -- Line: 173
                        -- upvalues: u14 (ref)
                        u14.Enabled = true;
                    end);
                end;
            end));
            u12:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal(WATER_ATTRIBUTE):Connect(function() -- Line: 178
                -- upvalues: u13 (ref), Players (ref), WATER_ATTRIBUTE (ref), WATER_REFILL_PER_TICK (ref), u14 (ref), RunService (ref)
                if u13 then
                    return nil;
                end;

                local v32 = Players.LocalPlayer:GetAttribute(WATER_ATTRIBUTE);
                local v33 = Players.LocalPlayer:GetAttribute("WATER_CAPACITY");
                local v34 = math.ceil(((v33 == nil and 100 or v33) - (v32 == nil and 0 or v32)) / WATER_REFILL_PER_TICK) / 2;

                if u14.HoldDuration ~= v34 then
                    u14.HoldDuration = v34;
                    u14.Enabled = false;
                    RunService.Heartbeat:Wait();
                    u14.Enabled = true;
                end;
            end));
            u12:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("WATER_CAPACITY"):Connect(function() -- Line: 200
                -- upvalues: u13 (ref), Players (ref), WATER_ATTRIBUTE (ref), WATER_REFILL_PER_TICK (ref), u14 (ref), RunService (ref)
                if u13 then
                    return nil;
                end;

                local v35 = Players.LocalPlayer:GetAttribute(WATER_ATTRIBUTE);
                local v36 = Players.LocalPlayer:GetAttribute("WATER_CAPACITY");
                u14.HoldDuration = math.ceil(((v36 == nil and 100 or v36) - (v35 == nil and 0 or v35)) / WATER_REFILL_PER_TICK) / 2;
                u14.Enabled = false;
                RunService.Heartbeat:Wait();
                u14.Enabled = true;
            end));
        end);
        u14.PromptHidden:Connect(function() -- Line: 221
            -- upvalues: u12 (copy)
            u12:DoCleaning();
        end);
        u14.PromptButtonHoldEnded:Connect(function(p37) -- Line: 224
            -- upvalues: u13 (ref), default (ref), u15 (ref)
            u13 = false;
            default.Client:Get("WaterTankRefillStop"):SendToServer();
            local v38 = u15;

            if v38 ~= nil then
                v38:Stop();
            end;
        end);
    end);
end;

function u6.createRay(p39, p40) -- Line: 234
    -- upvalues: u3 (copy), Workspace (copy), GameQueryUtil (copy)
    local v41 = Color3.fromRGB(0, 163, 255);
    local v42 = u3("Part", {
        CastShadow = false,
        Size = Vector3.new(1, 12, 12),
        Orientation = Vector3.new(0, 0, 90),
        Transparency = 0.25,
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Parent = Workspace,
        CFrame = p40.CFrame,
        Shape = Enum.PartType.Cylinder,
        Color = v41,
        Material = Enum.Material.ForceField
    });
    GameQueryUtil:setQueryIgnored(v42, true);

    return v42;
end;

function u6.updateWaterTankType(p43, p44) -- Line: 254
    -- upvalues: WaterType (copy)
    local v45 = Color3.fromRGB(0, 110, 255);
    local v46 = "Water Tank";
    local v47 = Color3.fromRGB(255, 255, 255);
    local v48 = p44:GetAttribute("WaterType");

    if v48 == WaterType.FROSTY then
        v45 = Color3.fromRGB(255, 255, 255);
        v47 = Color3.fromRGB(134, 255, 219);
        v46 = "Ice Water Tank";
    elseif v48 == WaterType.SLIME then
        v45 = Color3.fromRGB(0, 255, 13);
        v47 = Color3.fromRGB(200, 255, 0);
        v46 = "Slime Liquid Tank";
    end;

    local Effect = p44:WaitForChild("Effect", 1);
    local v49;

    if Effect == nil then
        v49 = Effect;
    else
        v49 = Effect:FindFirstChildOfClass("ParticleEmitter");
    end;

    if Effect ~= nil then
        Effect = Effect:FindFirstChildOfClass("BillboardGui");
    end;

    if v49 then
        v49.Color = ColorSequence.new(v45);
    end;

    if Effect then
        local Frame = Effect:FindFirstChild("Frame");

        if Frame ~= nil then
            Frame = Frame:FindFirstChild("Title");
        end;

        if Frame then
            Frame.Text = v46;
            Frame.TextColor3 = v45;

            if v45 == Color3.fromRGB(255, 255, 255) then
                Frame.TextStrokeColor3 = Color3.fromRGB(0, 110, 255);
                Frame.TextStrokeTransparency = 0;
            else
                Frame.TextStrokeTransparency = 1;
            end;
        end;
    end;

    local Watertank = p44:WaitForChild("Watertank", 1);

    if Watertank ~= nil then
        Watertank = Watertank:FindFirstChildOfClass("SurfaceAppearance");
    end;

    if Watertank then
        Watertank.Color = v47;
    end;
end;

KnitClient.CreateController(u6.new());

return nil;