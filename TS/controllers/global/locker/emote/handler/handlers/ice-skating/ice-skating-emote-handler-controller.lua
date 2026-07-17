-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local RandomUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local AccessoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "IceSkatingEmoteHandlerController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 29
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "IceSkatingEmoteHandlerController";
end;

function u2.KnitStart(p5) -- Line: 37
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), Workspace (copy), EntityUtil (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), GameSound (copy), RandomUtil (copy), RunService (copy), ReplicatedStorage (copy), AccessoryUtil (copy), WeldUtil (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local ICE_SKATING = EmoteType.ICE_SKATING;
    local u6 = EmoteHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 45, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 51
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 55
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onEnable(u10, u11, u12, p13, u14) -- Line: 58
        -- upvalues: Workspace (ref), KnitClient (ref), EntityUtil (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), GameSound (ref), RandomUtil (ref), RunService (ref), ReplicatedStorage (ref), AccessoryUtil (ref), WeldUtil (ref)
        if not u12.PrimaryPart then
            return nil;
        end;

        local Archivable = u12.Archivable;
        u12.Archivable = true;
        u14:GiveTask(function() -- Line: 65
            -- upvalues: u12 (copy), Archivable (copy)
            u12.Archivable = Archivable;
        end);
        local u15 = u12:Clone();
        u15.Parent = Workspace;
        u14:GiveTask(u15);

        if not u15.PrimaryPart then
            return nil;
        end;

        local function _(p16) -- Line: 75
            if p16:IsA("BasePart") then
                p16.CanCollide = false;
                p16.CanQuery = false;
                p16.CanTouch = false;
            end;
        end;

        for i, descendant in u15:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.CanCollide = false;
                descendant.CanQuery = false;
                descendant.CanTouch = false;
            end;
        end;

        local u17 = {
            transparency = 1
        };
        KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(u12):addModifier(u17);

        local function _(p18, p19) -- Line: 90
            -- upvalues: EntityUtil (ref)
            local v20 = EntityUtil:getEntity(p18);

            if v20 and p19 then
                v20:hideNametag();

                return;
            end;

            if v20 ~= nil then
                v20:showNametag();
            end;
        end;

        local u21 = Players:GetPlayerByUserId(u11);

        if u21 then
            local v22 = EntityUtil:getEntity(u21);

            if v22 then
                v22:hideNametag();
            elseif v22 ~= nil then
                v22:showNametag();
            end;

            u14:GiveTask(function() -- Line: 104
                -- upvalues: u21 (copy), EntityUtil (ref)
                local v23 = EntityUtil:getEntity(u21);

                if v23 ~= nil then
                    v23:showNametag();
                end;
            end);
        end;

        u14:GiveTask(function() -- Line: 108
            -- upvalues: KnitClient (ref), u12 (copy), u17 (copy)
            KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(u12):removeModifier(u17);
        end);
        u15.PrimaryPart.Anchored = true;
        local Position = u12:GetPivot().Position;
        u15:PivotTo(CFrame.new(Position + Vector3.new(0, 0.5, 0)));
        local u24 = u15:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SKATING_MEDIUIM));
        u24:Play();
        u14:GiveTask(u10:playSound(GameSound.ICE_SKATING_FOOTSTEP_LOOP, u11, {
            volumeMultiplier = 0.1,
            position = u12:GetPivot().Position
        }));
        u14:GiveTask(u24:GetMarkerReachedSignal("step"):Connect(function() -- Line: 124
            -- upvalues: u10 (copy), RandomUtil (ref), GameSound (ref), u11 (copy), u15 (copy)
            u10:playSound(RandomUtil.fromList(GameSound.ICE_SKATING_FOOTSTEP_1, GameSound.ICE_SKATING_FOOTSTEP_2, GameSound.ICE_SKATING_FOOTSTEP_3, GameSound.ICE_SKATING_FOOTSTEP_4, GameSound.ICE_SKATING_FOOTSTEP_5, GameSound.ICE_SKATING_FOOTSTEP_6), u11, {
                volumeMultiplier = 0.2,
                position = u15:GetPivot().Position
            });
        end));
        u14:GiveTask(function() -- Line: 130
            -- upvalues: u24 (copy)
            u24:Stop();
            u24:Destroy();
        end);
        local u25 = u15:GetPivot();
        local u26 = 0;
        u14:GiveTask((RunService.Heartbeat:Connect(function(p27) -- Line: 136
            -- upvalues: u15 (copy), u26 (ref), u25 (copy)
            if not u15.PrimaryPart then
                return nil;
            end;

            u26 = u26 + p27;
            local v28 = math.sin(u26 * 3);
            local v29 = math.cos(u26 * 3);
            u15:PivotTo((u25 + Vector3.new(v28, 0, v29) * 5) * CFrame.Angles(0, math.rad(u26 * 2.0943951023931953 * 82.5 - 90), 0));
        end)));

        local function _(p30) -- Line: 149
            -- upvalues: AccessoryUtil (ref), u15 (copy), u14 (copy)
            if p30:IsA("Accessory") then
                local v31 = p30:Clone();
                AccessoryUtil:addAccessory(u15, v31);
                u14:GiveTask(v31);
            end;
        end;

        for i, child in ReplicatedStorage.Assets.Misc.IceSkates:GetChildren() do
            local _ = i - 1;

            if child:IsA("Accessory") then
                local v32 = child:Clone();
                AccessoryUtil:addAccessory(u15, v32);
                u14:GiveTask(v32);
            end;
        end;

        WeldUtil:weldCharacterAccessories(u15);
    end;

    function u7.onDisable(p33, p34, p35, p36) -- Line: 161
    end;

    EmoteHandlerController:registerHandler(ICE_SKATING, u7);
end;

KnitClient.CreateController(u2.new());

return nil;