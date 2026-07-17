-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local TweenService = v1.TweenService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "CoinFountainEmoteController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 25
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "CoinFountainEmoteController";
end;

function u2.KnitStart(p5) -- Line: 33
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), GameAnimationUtil (copy), AnimationType (copy), ReplicatedStorage (copy), Workspace (copy), TweenService (copy), GameSound (copy), RuntimeLib (copy), RunService (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local COIN_FOUNTAIN = EmoteType.COIN_FOUNTAIN;
    local u6 = EmoteHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 41, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 47
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 51
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onEnable(u10, u11, u12, p13, u14) -- Line: 54
        -- upvalues: GameAnimationUtil (ref), AnimationType (ref), ReplicatedStorage (ref), Workspace (ref), TweenService (ref), GameSound (ref), RuntimeLib (ref), RunService (ref)
        local u15 = 0;
        local u16 = {};
        local u17 = u12:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.ENVELOPE_THROW));
        u17:Play();
        u14:GiveTask(function() -- Line: 63
            -- upvalues: u17 (copy)
            u17:Stop();
            u17:Destroy();
        end);
        u17:GetMarkerReachedSignal("queue"):Connect(function() -- Line: 67
            -- upvalues: ReplicatedStorage (ref), Workspace (ref), u12 (copy), u14 (copy), TweenService (ref), u10 (copy), GameSound (ref), u11 (copy), RuntimeLib (ref), RunService (ref), u16 (copy), u15 (ref), GameAnimationUtil (ref), AnimationType (ref)
            local u18 = ReplicatedStorage.Assets.Misc.RedEnvelope:Clone();
            u18.Parent = Workspace;
            u18.Anchored = true;
            u18.CanCollide = false;

            local function _(p19) -- Line: 74
                -- upvalues: u18 (copy)
                if p19:IsA("BasePart") then
                    u18.CanCollide = false;
                end;
            end;

            for i, descendant in u18:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    u18.CanCollide = false;
                end;
            end;

            local CFrame2 = u12.PrimaryPart.CFrame;
            u18:PivotTo(CFrame2 + Vector3.new(0, 0.25, 0));
            u14:GiveTask(u18);
            local u20 = CFrame2 + CFrame2.LookVector.Unit * 5;
            local u21 = TweenService:Create(u18, TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
                CFrame = u20
            });
            local u22 = u10:playSound(GameSound.WIND_HIT_SHOUD_1, u11, {
                rollOffMaxDistance = 50,
                position = u12:GetPivot().Position
            });
            u14:GiveTask(function() -- Line: 98
                -- upvalues: u21 (copy), u22 (copy)
                u21:Cancel();
                u21:Destroy();
                u22:Stop();
                u22:Destroy();
            end);
            u21:Play();
            local u45 = RuntimeLib.Promise.new(function(p23) -- Line: 105
                -- upvalues: u21 (copy)
                u21.Completed:Wait();
                p23(true);
            end):andThen(function() -- Line: 108
                -- upvalues: RunService (ref), u18 (copy), u20 (copy), u16 (ref), u15 (ref), ReplicatedStorage (ref), Workspace (ref), u12 (ref), GameAnimationUtil (ref), AnimationType (ref), u10 (ref), GameSound (ref), u11 (ref), u14 (ref)
                local u24 = 0;
                local u34 = RunService.Heartbeat:Connect(function(p25) -- Line: 111
                    -- upvalues: u24 (ref), u18 (ref), u20 (ref)
                    if u24 >= 1 then
                        u24 = 0;
                    end;

                    local v26 = u20:Lerp(u20, p25);
                    local v27 = CFrame.new(math.noise(-u24 * 80) * 0.7, 0, math.noise(-u24 * 80, -8888, -u24 * 80) * 0.7);
                    local Angles = CFrame.Angles;
                    local v28 = math.noise(-u24 * 80) * 4;
                    local v29 = math.rad(v28);
                    local v30 = math.noise(0, 0, (-u24 + -u24) * 80) * 4;
                    local v31 = math.rad(v30);
                    local v32 = math.noise(-u24 * 80, -8888, -u24 * 80) * 4;
                    local v33 = Angles(v29, v31, (math.rad(v32)));
                    u18:PivotTo(v26 * v27 * v33);
                    u24 = u24 + p25;
                end);

                if #u16 > 0 then
                    local function _(p35) -- Line: 125
                        p35:Destroy();
                    end;

                    for i, v in u16 do
                        local _ = i - 1;
                        v:Destroy();
                    end;

                    table.clear(u16);
                end;

                local u36 = 0;
                local u41 = RunService.Heartbeat:Connect(function(p37) -- Line: 135
                    -- upvalues: u15 (ref), u16 (ref), u36 (ref), ReplicatedStorage (ref), Workspace (ref), u20 (ref)
                    u15 = u15 + p37;

                    if u15 <= 0.2 then
                        return nil;
                    end;

                    u15 = 0;

                    if not u16 then
                        return nil;
                    end;

                    local v38;

                    if #u16 >= 6 then
                        u36 = u36 + 1;

                        if u36 >= #u16 then
                            u36 = 0;
                        end;

                        v38 = u16[u36 + 1];

                        if not v38 then
                            v38 = ReplicatedStorage.Assets.Misc.GoldCoin:Clone();
                            u16[u36 + 1] = v38;
                            v38.Parent = Workspace;
                        end;
                    else
                        v38 = ReplicatedStorage.Assets.Misc.GoldCoin:Clone();
                        table.insert(u16, v38);
                        v38.Parent = Workspace;
                    end;

                    local v39 = math.random(2, 4);
                    local v40 = math.random(-4, 4) / 10;
                    v38:PivotTo(u20);
                    v38.AssemblyLinearVelocity = Vector3.new(0, 0, 0);
                    v38:ApplyAngularImpulse((Vector3.new(v39, v39, v39)));
                    v38:ApplyImpulse(Vector3.new(v40, 1, v40) * 18);
                end);
                local u42 = u12:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.CELEBRATION));
                u42:Play();
                local u43 = u10:playSound(GameSound.COIN_FOUNTAIN_LOOP, u11, {
                    rollOffMaxDistance = 25,
                    looped = true,
                    position = u12:GetPivot().Position
                });
                u14:GiveTask(function() -- Line: 187
                    -- upvalues: u18 (ref), u16 (ref), u42 (copy), u43 (copy), u34 (copy), u41 (copy)
                    u18:Destroy();

                    if u16 and #u16 > 0 then
                        local function _(p44) -- Line: 192
                            p44:Destroy();
                        end;

                        for i, v in u16 do
                            local _ = i - 1;
                            v:Destroy();
                        end;

                        table.clear(u16);
                    end;

                    u42:Stop();
                    u42:Destroy();
                    u43:Stop();
                    u43:Destroy();
                    u34:Disconnect();
                    u41:Disconnect();
                end);
            end);
            u14:GiveTask(function() -- Line: 210
                -- upvalues: u45 (copy)
                return u45:cancel();
            end);
        end);
    end;

    function u7.onDisable(p46, p47, p48, p49) -- Line: 215
    end;

    EmoteHandlerController:registerHandler(COIN_FOUNTAIN, u7);
end;

KnitClient.CreateController(u2.new());

return nil;