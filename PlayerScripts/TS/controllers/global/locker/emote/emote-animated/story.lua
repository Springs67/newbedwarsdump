-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v1.Linear;
local OutCirc = v1.OutCirc;
local OutExpo = v1.OutExpo;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local ServerStorage = v4.ServerStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;

return function(p5) -- Line: 20
    -- upvalues: u2 (copy), RunService (copy), Workspace (copy), u3 (copy), ServerStorage (copy), GameAnimationUtil (copy), AnimationType (copy), ReplicatedStorage (copy), GameQueryUtil (copy), WeldUtil (copy), default (copy), Linear (copy), OutExpo (copy), BLOCK_SIZE (copy), OutCirc (copy)
    local u6 = u2.new();
    task.spawn(function() -- Line: 22
        -- upvalues: RunService (ref)
        RunService:Run();
    end);
    local v7 = CFrame.new(30.913, 300.437, 469.703);
    local v8 = u3("Part", {
        Name = "Baseplate",
        Size = Vector3.new(30, 1, 30),
        Material = Enum.Material.SmoothPlastic,
        Position = v7.Position - Vector3.new(0, 8, 0),
        Anchored = true,
        Parent = Workspace
    });
    v8.Parent = Workspace;
    u6:GiveTask(v8);
    local u9 = ServerStorage.Assets.Villagers.alchemist:Clone();
    u9.PrimaryPart.Anchored = true;
    u9.Name = "AnimatedEmoteCharacter";
    u9.Parent = Workspace;
    u9:PivotTo(v7);
    u6:GiveTask(function() -- Line: 47
        -- upvalues: u9 (copy)
        u9:Destroy();
    end);
    local u10 = GameAnimationUtil:getAssetId(AnimationType.GRIM_REAPER_DEAD_TO_ME_EMOTE);
    local Animator = u9.Humanoid.Animator;

    if not u9.PrimaryPart then
        return nil;
    end;

    local Humanoid = u9.Humanoid;

    if not Humanoid then
        return nil;
    end;

    local u11 = ReplicatedStorage.Assets.Misc.ReaperScythe:Clone();
    u11.Parent = u9;

    local function _(p12) -- Line: 64
        -- upvalues: GameQueryUtil (ref)
        if p12:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(p12, true);
            p12.Transparency = 1;
        end;
    end;

    for i, descendant in u11:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(descendant, true);
            descendant.Transparency = 1;
        end;
    end;

    WeldUtil:weldCharacterAccessories(u9);
    local u13 = nil;
    u6:GiveTask((Animator.AnimationPlayed:Connect(function(p14) -- Line: 77
        -- upvalues: u10 (copy), u6 (copy), default (ref), Linear (ref), u11 (copy), OutExpo (ref), u13 (ref)
        local Animation = p14.Animation;

        if Animation ~= nil then
            Animation = Animation.AnimationId;
        end;

        if Animation ~= u10 then
            return nil;
        end;

        local v15;

        if p14 == nil then
            v15 = p14;
        else
            v15 = p14:GetMarkerReachedSignal("scythe_spawn"):Connect(function() -- Line: 88
                -- upvalues: default (ref), Linear (ref), u11 (ref), u6 (ref)
                default(1, Linear, function(u16) -- Line: 89
                    -- upvalues: u11 (ref)
                    local function _(p17) -- Line: 91
                        -- upvalues: u16 (copy)
                        if p17:IsA("BasePart") then
                            p17.Transparency = u16;
                        end;
                    end;

                    for i, descendant in u11:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("BasePart") then
                            descendant.Transparency = u16;
                        end;
                    end;
                end, 1, 0);
                u6:GiveTask(u11);
            end);
        end;

        u6:GiveTask(v15);

        if p14 ~= nil then
            p14 = p14:GetMarkerReachedSignal("scythe_hide"):Connect(function() -- Line: 107
                -- upvalues: default (ref), OutExpo (ref), u11 (ref), Linear (ref), u13 (ref)
                default(0.3, OutExpo, function(u18) -- Line: 108
                    -- upvalues: u11 (ref)
                    local function _(p19) -- Line: 110
                        -- upvalues: u18 (copy)
                        if p19:IsA("BasePart") then
                            p19.Transparency = u18;
                        end;
                    end;

                    for i, descendant in u11:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("BasePart") then
                            descendant.Transparency = u18;
                        end;
                    end;
                end, 0, 1);
                default(1, Linear, function(u20) -- Line: 119
                    -- upvalues: u13 (ref)
                    local function _(p21) -- Line: 121
                        -- upvalues: u20 (copy)
                        if p21:IsA("BasePart") and p21.Transparency ~= 1 then
                            p21.Transparency = u20;

                            return;
                        end;

                        if p21:IsA("TextLabel") then
                            p21.TextTransparency = u20;
                        end;
                    end;

                    for i, descendant in u13:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("BasePart") and descendant.Transparency ~= 1 then
                            descendant.Transparency = u20;
                        elseif descendant:IsA("TextLabel") then
                            descendant.TextTransparency = u20;
                        end;
                    end;
                end, 0, 1);
            end);
        end;

        u6:GiveTask(p14);
    end)));
    local CFrame2 = u9.PrimaryPart.CFrame;
    local v22 = u9.PrimaryPart.CFrame.RightVector * 5;
    local v23 = u9.PrimaryPart.CFrame.LookVector * 1.2;
    local v24 = Vector3.new(0, -Humanoid.HipHeight + 0.5, 0);
    local v25 = CFrame2 + v22 - v23 + v24;
    local v26 = v25 - Vector3.new(0, BLOCK_SIZE, 0);
    u13 = ReplicatedStorage.Assets.Misc.Gravestone:Clone();
    u13:PivotTo(v26);
    local GravestoneText = u13.Root.GravestoneModel.Gravestone.SurfaceGui.GravestoneText;
    GravestoneText.RichText = true;
    GravestoneText.Text = "Your Name Here";
    u13.Parent = Workspace;
    u6:GiveTask(u13);
    default(1, Linear, function(u27) -- Line: 151
        -- upvalues: u13 (ref)
        local function _(p28) -- Line: 153
            -- upvalues: u27 (copy)
            if p28:IsA("BasePart") and p28.Transparency ~= 1 then
                p28.Transparency = u27;

                return;
            end;

            if p28:IsA("TextLabel") then
                p28.TextTransparency = u27;
            end;
        end;

        for i, descendant in u13:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") and descendant.Transparency ~= 1 then
                descendant.Transparency = u27;
            elseif descendant:IsA("TextLabel") then
                descendant.TextTransparency = u27;
            end;
        end;
    end, 1, 0);
    local u29 = 0;
    u6:GiveTask(RunService.Heartbeat:Connect(function(p30) -- Line: 165
        -- upvalues: u29 (ref)
        u29 = u29 + p30;
    end));
    default(2, OutCirc, function(p31) -- Line: 168
        -- upvalues: u13 (ref), u29 (ref)
        local v32 = (math.sin(u29 * 60) - 1) / 20;
        local v33 = (math.sin(u29 * 70) - 1) / 20;
        local v34 = (math.cos(u29 * 80) - 1) / 20;
        u13:PivotTo(p31 + Vector3.new(v32, v33, v34));
    end, v26, v25);
    Animator:LoadAnimation((u3("Animation", {
        AnimationId = u10
    }))):Play();
    u6:GiveTask(function() -- Line: 179
        -- upvalues: RunService (ref)
        task.spawn(function() -- Line: 180
            -- upvalues: RunService (ref)
            RunService:Stop();
        end);
    end);

    return function() -- Line: 184
        -- upvalues: u6 (copy)
        u6:DoCleaning();
    end;
end;