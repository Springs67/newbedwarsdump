-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local HeatBar = RuntimeLib.import(script, script.Parent, "ui", "heat-bar").HeatBar;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "HairDryerController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 28
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 32
    -- upvalues: HandKnitController (copy), u1 (copy), default (copy)
    HandKnitController.constructor(p5);
    p5.Name = "HairDryerController";
    p5.maid = u1.new();
    p5.actionRemote = default.Client:Get("HairDryerAction");
    p5.animationMaid = u1.new();
    p5.inUse = false;
end;

function u3.KnitStart(u6) -- Line: 40
    -- upvalues: HandKnitController (copy), default (copy), EntityUtil (copy), SoundManager (copy), GameSound (copy), Players (copy), Flamework (copy), CooldownId (copy)
    HandKnitController.KnitStart(u6);
    default.Client:Get("HairDryerEffect"):Connect(function(u7) -- Line: 42
        -- upvalues: EntityUtil (ref), SoundManager (ref), GameSound (ref), Players (ref), u6 (copy)
        local v8 = EntityUtil:getEntity(u7.player);

        if not v8 then
            return nil;
        end;

        local v9 = v8:getHandItemInstanceFromCharacter();

        if v9 ~= nil then
            v9 = v9:FindFirstChild("Handle");
        end;

        if not v9 then
            return nil;
        end;

        local Effects = v9:FindFirstChild("Effects");

        if Effects ~= nil then
            local function _(p10) -- Line: 59
                -- upvalues: u7 (copy)
                if p10:IsA("Beam") then
                    p10.Enabled = u7.on;
                end;
            end;

            for i, child in Effects:GetChildren() do
                local _ = i - 1;

                if child:IsA("Beam") then
                    child.Enabled = u7.on;
                end;
            end;
        end;

        local Character = u7.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if u7.on then
            if Character then
                SoundManager:playSound(GameSound.HAIR_DRYER_START, {
                    position = v9.Position
                });
            end;

            local v11 = v9:FindFirstChildOfClass("Sound");

            if v11 then
                v11:Play();
            end;
        else
            if Character then
                SoundManager:playSound(GameSound.HAIR_DRYER_END, {
                    position = v9.Position
                });
            end;

            local v12 = v9:FindFirstChildOfClass("Sound");

            if v12 then
                v12:Stop();
            end;

            if u7.player == Players.LocalPlayer then
                u6:stopHairDryer();
            end;
        end;
    end);
    Players.LocalPlayer:GetAttributeChangedSignal("HairDryerHeat"):Connect(function() -- Line: 101
        -- upvalues: Players (ref), u6 (copy), Flamework (ref), CooldownId (ref)
        local v13 = Players.LocalPlayer:GetAttribute("HairDryerHeat");

        if (v13 == nil and 0 or v13) >= 100 then
            u6:stopHairDryer();
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.HAIR_DRYER, 10);
        end;
    end);
end;

function u3.isRelevantItem(p14, p15) -- Line: 113
    -- upvalues: ItemType (copy)
    return p15.itemType == ItemType.HAIR_DRYER;
end;

function u3.onEnable(u16, p17, p18) -- Line: 116
    -- upvalues: Flamework (copy), u2 (copy), HeatBar (copy)
    u16.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "use-hair-dryer",

        boundFunction = function(p19, p20, p21) -- Line: 120, Name: boundFunction
            -- upvalues: u16 (copy)
            if p20 == Enum.UserInputState.Begin then
                u16:useHairDryer();

                return;
            end;

            if p20 == Enum.UserInputState.End then
                u16:stopHairDryer();
            end;
        end
    }));
    u16.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u2.createFragment({
        HeatBar = u2.createElement(HeatBar)
    })));
end;

function u3.onDisable(p22) -- Line: 132
    p22:stopHairDryer();
    p22.maid:DoCleaning();
end;

function u3.useHairDryer(p23) -- Line: 136
    -- upvalues: Flamework (copy), CooldownId (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(CooldownId.HAIR_DRYER) then
        return nil;
    end;

    local u24 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.TORNADO_LAUNCHER_HOLD, {
        looped = true
    });

    if u24 then
        p23.animationMaid:GiveTask(function() -- Line: 144
            -- upvalues: u24 (copy)
            u24:Stop();
            u24:Destroy();
        end);
    end;

    p23.inUse = true;
    p23.actionRemote:SendToServer({
        start = true
    });
end;

function u3.stopHairDryer(p25) -- Line: 154
    -- upvalues: Players (copy), Flamework (copy), CooldownId (copy)
    p25.animationMaid:DoCleaning();
    p25.actionRemote:SendToServer({
        start = false
    });
    local v26 = Players.LocalPlayer:GetAttribute("HairDryerHeat");

    if (v26 == nil and 0 or v26) < 100 and (p25.inUse and Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.HAIR_DRYER) < 2) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.HAIR_DRYER, 2);
    end;

    p25.inUse = false;
end;

KnitClient.CreateController(u3.new());

return nil;