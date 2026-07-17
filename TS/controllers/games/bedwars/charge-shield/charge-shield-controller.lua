-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local StarterPlayer = v6.StarterPlayer;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local ChargeShieldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "charge-shield", "charge-shield-util").ChargeShieldUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local CHARGE_SHIELD = CooldownId.CHARGE_SHIELD;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "ChargeShieldController";
    end,

    __index = HandKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 38
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 42
    -- upvalues: HandKnitController (copy), u3 (copy), default (copy)
    HandKnitController.constructor(p9);
    p9.Name = "ChargeShieldController";
    p9.maid = u3.new();
    p9.remotes = default.Client:GetNamespace("ChargeShield");
    p9.chargeShieldUse = p9.remotes:WaitFor("ChargeShieldUse");
    p9.chargeShieldHit = p9.remotes:WaitFor("ChargeShieldHit");
    p9.chargeShieldActivated = p9.remotes:WaitFor("ChargeShieldActivated");
end;

function u7.KnitStart(u10) -- Line: 51
    -- upvalues: HandKnitController (copy), Players (copy), RuntimeLib (copy), ChargeShieldUtil (copy)
    HandKnitController.KnitStart(u10);
    u10.chargeShieldActivated:andThen(function(p11) -- Line: 54
        -- upvalues: Players (ref), u10 (copy), RuntimeLib (ref), ChargeShieldUtil (ref)
        p11:Connect(function(p12) -- Line: 55
            -- upvalues: Players (ref), u10 (ref), RuntimeLib (ref), ChargeShieldUtil (ref)
            if not p12.player.Character or p12.player == Players.LocalPlayer then
                return nil;
            end;

            local u13 = u10:attachParticlesToCharacter(p12.player.Character);
            RuntimeLib.Promise.delay(ChargeShieldUtil.CHARGE_DURATION):andThen(function() -- Line: 61
                -- upvalues: u10 (ref), u13 (copy)
                u10:cleanupParticles(u13);
            end);
        end);
    end);
end;

function u7.useChargeShield(u14) -- Line: 69
    -- upvalues: Flamework (copy), CHARGE_SHIELD (copy), ChargeShieldUtil (copy), Players (copy), KnitClient2 (copy), GameAnimationUtil (copy), AnimationType (copy), u4 (copy), RunService (copy), StarterPlayer (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(CHARGE_SHIELD) then
        if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CHARGE_SHIELD) < 0.25 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(CHARGE_SHIELD, "buffer", function() -- Line: 72
                -- upvalues: u14 (copy)
                if u14:isEnabled() then
                    u14:useChargeShield();
                end;
            end);
        end;

        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CHARGE_SHIELD, ChargeShieldUtil.CHARGE_SHIELD_COOLDOWN_SEC);
    u14.chargeShieldUse:andThen(function(p15) -- Line: 82
        p15:SendToServer();
    end);
    local Character = Players.LocalPlayer.Character;
    local u16 = Character:FindFirstChildOfClass("Humanoid");
    local u17 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        blockSprint = true,
        moveSpeedMultiplier = 2.85
    });
    u14.maid:GiveTask(u17);
    KnitClient2.Controllers.JumpHeightController:setJumpHeight(0);
    local u18 = u14:attachParticlesToCharacter(Character);
    local u19 = nil;
    local u20 = u14.chargeShieldHit:expect():Connect(function() -- Line: 108
        -- upvalues: u19 (ref)
        u19();

        return nil;
    end);
    u14.maid:GiveTask(function() -- Line: 112
        -- upvalues: u20 (copy)
        u20:Disconnect();
    end);
    local u21 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.CHARGE_SHIELD_CHARGE, {
        looped = true
    });
    u14.maid:GiveTask(function() -- Line: 119
        -- upvalues: u21 (copy)
        local v22 = u21;

        if v22 ~= nil then
            v22:Stop();
        end;
    end);
    local PrimaryPart = Character.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.AssemblyMass;
    end;

    local u23 = PrimaryPart == nil and 0 or PrimaryPart;
    local u24 = 0;
    local u25 = u23 * 110;
    local u26 = u4("BodyForce", {
        Name = "ChargeForce",
        Force = Vector3.new(),
        Parent = Character.PrimaryPart
    });
    RunService:BindToRenderStep("charge", 300, function(p27) -- Line: 143
        -- upvalues: u24 (ref), ChargeShieldUtil (ref), u19 (ref), Character (copy), u25 (ref), u23 (copy), u26 (copy), u16 (copy)
        if u24 >= ChargeShieldUtil.CHARGE_DURATION then
            u19();

            return nil;
        end;

        local v28 = Vector3.new(Character.PrimaryPart.CFrame.LookVector.X, 0, Character.PrimaryPart.CFrame.LookVector.Z);
        u25 = u23 * 110;
        u26.Force = v28 * Vector3.new(u25, 1, u25);
        u16:Move(Vector3.new(0, 0, -1), true);
        u24 = u24 + p27;
    end);
    u14.maid:GiveTask(function() -- Line: 158
        -- upvalues: u19 (ref)
        u19();
    end);

    u19 = function() -- Line: 162, Name: cleanUpRenderStepped
        -- upvalues: RunService (ref), Character (copy), u18 (ref), u21 (copy), u20 (copy), u17 (copy), u24 (ref), KnitClient2 (ref), StarterPlayer (ref)
        RunService:UnbindFromRenderStep("charge");

        if Character.Parent then
            local PrimaryPart2 = Character.PrimaryPart;

            if PrimaryPart2 ~= nil then
                PrimaryPart2 = PrimaryPart2:FindFirstChild("ChargeForce");
            end;

            if PrimaryPart2 then
                PrimaryPart2:Destroy();
            end;

            local function _(p29) -- Line: 175
                p29:Destroy();
            end;

            for i, v in u18 do
                local _ = i - 1;
                v:Destroy();
            end;

            u18 = {};
        end;

        local v30 = u21;

        if v30 ~= nil then
            v30:Stop();
        end;

        u20:Disconnect();
        u17.Destroy();
        u24 = 0;
        KnitClient2.Controllers.JumpHeightController:setJumpHeight(StarterPlayer.CharacterJumpHeight);
    end;
end;

function u7.onEnable(u31, p32, p33) -- Line: 194
    -- upvalues: u3 (copy), Flamework (copy), CHARGE_SHIELD (copy), DeviceUtil (copy), u5 (copy), MobileButton (copy), BedwarsImageId (copy), BedwarsUI (copy), Players (copy)
    u31:setupYield(function() -- Line: 195
        -- upvalues: u3 (ref), Flamework (ref), CHARGE_SHIELD (ref)
        local u34 = u3.new();
        u34:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CHARGE_SHIELD));

        return function() -- Line: 198
            -- upvalues: u34 (copy)
            u34:DoCleaning();
        end;
    end);
    local v38 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "use-charge-shield",

        boundFunction = function(p35, p36, p37) -- Line: 207, Name: boundFunction
            -- upvalues: u31 (copy)
            if p36 == Enum.UserInputState.Begin then
                u31:useChargeShield();
            end;
        end
    });
    u31.maid:GiveTask(v38);

    if DeviceUtil.isMobileControls() then
        u31:setupYield(function() -- Line: 216
            -- upvalues: u5 (ref), MobileButton (ref), BedwarsImageId (ref), BedwarsUI (ref), u31 (copy), Players (ref)
            local u39 = u5.mount(u5.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u5.createElement(MobileButton, {
                    Image = BedwarsImageId.SHIELD_OFF_MOBILE,
                    Position = BedwarsUI:getActionMobileButtonPosition(),

                    OnClick = function() -- Line: 223, Name: OnClick
                        -- upvalues: u31 (ref)
                        u31:useChargeShield();
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 228
                -- upvalues: u5 (ref), u39 (copy)
                u5.unmount(u39);
            end;
        end);
    end;
end;

function u7.onDisable(p40) -- Line: 234
    p40.maid:DoCleaning();
end;

function u7.isRelevantItem(p41, p42) -- Line: 237
    -- upvalues: ItemType (copy)
    return p42.itemType == ItemType.CHARGE_SHIELD;
end;

function u7.attachParticlesToCharacter(p43, p44) -- Line: 240
    -- upvalues: ReplicatedStorage (copy)
    local u45 = {};
    local v46 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("ChargeShieldFireParticle"):FindFirstChildWhichIsA("Attachment"):Clone();
    table.insert(u45, v46);
    v46.Parent = p44.PrimaryPart;
    local ChargeShieldShoeTrail = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("ChargeShieldShoeTrail");
    local LeftFoot = p44:FindFirstChild("LeftFoot");
    local RightFoot = p44:FindFirstChild("RightFoot");

    local function _(p47) -- Line: 251
        -- upvalues: u45 (copy), LeftFoot (copy), RightFoot (copy)
        local v48 = p47:Clone();
        local v49 = p47:Clone();
        local v50 = u45;
        table.insert(v50, v48);
        table.insert(v50, v49);
        v48.Parent = LeftFoot;
        v49.Parent = RightFoot;
    end;

    for i, child in ChargeShieldShoeTrail:GetChildren() do
        local _ = i - 1;
        local v51 = child:Clone();
        local v52 = child:Clone();
        table.insert(u45, v51);
        table.insert(u45, v52);
        v51.Parent = LeftFoot;
        v52.Parent = RightFoot;
    end;

    LeftFoot:FindFirstChild("TrailTop").Attachment0 = LeftFoot:FindFirstChild("TrailAttachmentTop");
    LeftFoot:FindFirstChild("TrailTop").Attachment1 = LeftFoot:FindFirstChild("TrailAttachmentMid");
    LeftFoot:FindFirstChild("TrailBottom").Attachment0 = LeftFoot:FindFirstChild("TrailAttachmentMid");
    LeftFoot:FindFirstChild("TrailBottom").Attachment1 = LeftFoot:FindFirstChild("TrailAttachmentBottom");
    RightFoot:FindFirstChild("TrailTop").Attachment0 = RightFoot:FindFirstChild("TrailAttachmentTop");
    RightFoot:FindFirstChild("TrailTop").Attachment1 = RightFoot:FindFirstChild("TrailAttachmentMid");
    RightFoot:FindFirstChild("TrailBottom").Attachment0 = RightFoot:FindFirstChild("TrailAttachmentMid");
    RightFoot:FindFirstChild("TrailBottom").Attachment1 = RightFoot:FindFirstChild("TrailAttachmentBottom");

    return u45;
end;

function u7.cleanupParticles(p53, p54) -- Line: 277
    local function _(p55) -- Line: 279
        p55:Destroy();
    end;

    for i, v in p54 do
        local _ = i - 1;
        v:Destroy();
    end;
end;

KnitClient.CreateController(u7.new());

return nil;