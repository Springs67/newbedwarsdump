-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local ExpireList = v1.ExpireList;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local VendingMachineConst = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-const").VendingMachineConst;
local VendingMachineState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-state").VendingMachineState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "VendingMachineController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 36
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 40
    -- upvalues: KnitController (copy), ExpireList (copy), default (copy)
    KnitController.constructor(p7);
    p7.Name = "VendingMachineController";
    p7.animationCooldowns = ExpireList.new(2);
    p7.vendingMachineNamespace = default.Client:GetNamespace("VendingMachine");
end;

function u5.KnitStart(p8) -- Line: 46
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), getItemMeta (copy), VendingMachineConst (copy), KnitClient2 (copy), DeviceUtil (copy), VendingMachineState (copy), u3 (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), default (copy), Workspace (copy), RunService (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy)
    KnitController.KnitStart(p8);
    WatchCollectionTag("VendingMachine", function(u9) -- Line: 48
        -- upvalues: getItemMeta (ref), VendingMachineConst (ref), KnitClient2 (ref), DeviceUtil (ref), VendingMachineState (ref), u3 (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref), default (ref)
        local v10 = getItemMeta(VendingMachineConst.COST_ITEM);
        local u11 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ObjectText = "Use Vending Machine",
            RequiresLineOfSight = false,
            MaxActivationDistance = 8,
            HoldDuration = 1,
            Parent = u9,
            ActionText = tostring(VendingMachineConst.COST_AMOUNT) .. " " .. v10.displayName,
            ClickablePrompt = DeviceUtil.isMobileControls()
        });
        u9:GetAttributeChangedSignal("VendingMachineState"):Connect(function() -- Line: 59
            -- upvalues: u9 (copy), VendingMachineState (ref), u11 (copy)
            if u9:GetAttribute("VendingMachineState") == VendingMachineState.IDLE then
                u11.Enabled = true;

                return;
            end;

            u11.Enabled = false;
        end);
        u11.PromptButtonHoldBegan:Connect(function(p12) -- Line: 67
            -- upvalues: u3 (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref), u11 (copy)
            local u13 = u3.new();
            local u14 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.OPEN_CRATE);
            u13:GiveTask(function() -- Line: 70
                -- upvalues: u14 (copy)
                local v15 = u14;

                if v15 ~= nil then
                    v15:Stop();
                end;

                local v16 = u14;

                if v16 ~= nil then
                    v16:Destroy();
                end;
            end);
            u11.PromptButtonHoldEnded:Connect(function() -- Line: 80
                -- upvalues: u13 (copy)
                u13:DoCleaning();
            end);
        end);
        u11.Triggered:Connect(function(p17) -- Line: 84
            -- upvalues: default (ref), u9 (copy)
            default.Client:GetNamespace("VendingMachine"):Get("OpenVendingMachine"):CallServer(u9);
        end);
    end);
    WatchCollectionTag("VendingMachine", function(p18) -- Line: 89
        -- upvalues: u3 (ref), Workspace (ref), RunService (ref)
        local LuckyBlock = p18:WaitForChild("LuckyBlock");
        local Position = LuckyBlock.Position;
        local u19 = u3.new();
        local u20 = Workspace:GetServerTimeNow();
        u19:GiveTask(RunService.Heartbeat:Connect(function(p21) -- Line: 94
            -- upvalues: u20 (ref), Position (copy), LuckyBlock (copy)
            u20 = u20 + p21;
            local v22 = math.sin(u20 / 2) * 1 + 0.3;
            local v23 = Vector3.new(0, v22, 0);
            LuckyBlock.CFrame = CFrame.new(Position + v23) * CFrame.Angles(math.sin(u20 / 3) * 3.141592653589793 * 2, math.cos(u20 / 4) * 3.141592653589793 * 2, math.sin(u20 / 3.5) * 3.141592653589793 * 2 + 1.0471975511965976);
        end));
        LuckyBlock.AncestryChanged:Connect(function(p24, p25) -- Line: 103
            -- upvalues: u19 (copy)
            if p25 == nil then
                u19:DoCleaning();
            end;
        end);
    end);
    p8.vendingMachineNamespace:OnEvent("VendingMachineSelfDestruct", function(p26) -- Line: 110
        -- upvalues: SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), KnitClient2 (ref)
        local u27 = p26 + Vector3.new(0, 5, 0);
        task.spawn(function() -- Line: 114
            -- upvalues: SoundManager (ref), GameSound (ref), u27 (ref), ReplicatedStorage (ref), Workspace (ref), KnitClient2 (ref)
            SoundManager:playSound(GameSound.TNT_EXPLODE_1, {
                rollOffMaxDistance = 100,
                position = u27
            });
            local v28 = ReplicatedStorage.Assets.Effects.RocketLauncherExplode:Clone();
            v28.Parent = Workspace;
            v28:PivotTo(CFrame.new(u27));
            KnitClient2.Controllers.FancyExplosionController:createExplosion({
                radius = 15,
                randomSizeOffset = 10,
                randomPositionOffset = 1,
                rotationSpeed = 15,
                inDuration = 0.3,
                outDuration = 0.3,
                position = u27,
                model = v28
            }):await();
            v28:Destroy();
        end);
        local v29 = false;
        local v30 = 0;

        while true do
            if v29 then
                v30 = v30 + 1;
            else
                v29 = true;
            end;

            if v30 >= math.random() * 2 + 2 then
                return;
            end;

            task.spawn(function() -- Line: 146
                -- upvalues: ReplicatedStorage (ref), Workspace (ref), u27 (ref)
                local v31 = ReplicatedStorage.Assets.Effects.RocketLauncherDebris:Clone();
                v31.Parent = Workspace;
                v31.Position = u27;
                local v32 = math.random() * 3.141592653589793 * 2;
                local v33 = math.cos(v32) * 40;
                local v34 = math.sin(v32) * 40;
                v31:ApplyImpulse(Vector3.new(v33, 70, v34) * v31.Mass);
                task.wait(1);
                v31:Destroy();
            end);
        end;
    end);
end;

function u5.getClosestVendingMachine(p35, u36) -- Line: 162
    -- upvalues: CollectionService (copy)
    local v37 = CollectionService:GetTagged("VendingMachine");
    table.sort(v37, function(p38, p39) -- Line: 164
        -- upvalues: u36 (copy)
        return (p38.Position - u36).Magnitude < (p39.Position - u36).Magnitude;
    end);

    local function _(p40) -- Line: 173
        return true;
    end;

    local v41 = nil;

    for i, v in v37 do
        local _ = i - 1;

        if true == true then
            v41 = v;
            break;
        end;
    end;

    return v41;
end;

KnitClient.CreateController(u5.new());

return nil;