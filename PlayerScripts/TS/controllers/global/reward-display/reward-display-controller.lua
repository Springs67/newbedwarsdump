-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PartEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "part-effect-util").PartEffectUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "RewardController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "RewardController";
end;

function u5.KnitStart(u8) -- Line: 37
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u8);
    default.Client:Get("DisplayReward"):Connect(function(p9) -- Line: 39
        -- upvalues: u8 (copy)
        u8:spawnRewards(p9.rewards, p9.displayConfig);
    end);
    default.Client:Get("DisplayRewardOpening"):Connect(function(p10) -- Line: 42
        -- upvalues: u8 (copy)
        u8:startCaseOpening(p10.case, p10.rewards, p10.displayConfig, p10.owner);
    end);
end;

function u5.startCaseOpening(u11, p12, u13, p14, u15) -- Line: 46
    -- upvalues: u2 (copy), u3 (copy), Workspace (copy), PartEffectUtil (copy)
    local u16 = p12:Clone();
    local PrimaryPart = u16.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    local u17 = u2.new();
    u17:GiveTask(u16);
    local v18 = u3("Part", {
        Name = "Hitbox",
        Size = Vector3.new(8, 8, 8),
        Transparency = 1,
        CFrame = PrimaryPart:GetPivot(),
        Parent = u16,
        Children = { PrimaryPart }
    });
    u3("WeldConstraint", {
        Parent = v18,
        Part0 = v18,
        Part1 = PrimaryPart
    });
    local u19 = PrimaryPart;
    u16.PrimaryPart = v18;
    local u20 = v18;
    local v21 = u3("Attachment", {
        Parent = u20
    });
    u3("AlignOrientation", {
        RigidityEnabled = true,
        Mode = Enum.OrientationAlignmentMode.OneAttachment,
        Attachment0 = v21,
        CFrame = CFrame.new(),
        Parent = u20
    });

    local function _(p22) -- Line: 85
        if p22:IsA("BasePart") then
            p22.CollisionGroup = "RewardCase";
            p22.Anchored = false;
            p22.CanCollide = true;
        end;
    end;

    for i, descendant in u16:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CollisionGroup = "RewardCase";
            descendant.Anchored = false;
            descendant.CanCollide = true;
        end;
    end;

    u16.Parent = Workspace;
    u16:PivotTo(CFrame.new(p14.location));
    u11:launchPart(u20);
    task.delay(0.6, function() -- Line: 99
        -- upvalues: u16 (copy), u19 (copy), u17 (copy), PartEffectUtil (ref)
        local function _(p23) -- Line: 101
            if p23:IsA("BasePart") then
                p23.Anchored = true;
            end;
        end;

        for i, descendant in u16:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.Anchored = true;
            end;
        end;

        if u19 then
            u17:GiveTask(PartEffectUtil.applyMotionEffects(u19, {
                rotate = true,
                bob = true
            }));
        end;
    end);
    local displayRewardsDelaySec = p14.displayRewardsDelaySec;
    task.delay(0.75 + (displayRewardsDelaySec == nil and 1.15 or displayRewardsDelaySec) + 0.35, function() -- Line: 124
        -- upvalues: u11 (copy), u13 (copy), u20 (ref), u15 (copy), u17 (copy)
        task.delay(0.35, function() -- Line: 137
            -- upvalues: u11 (ref), u13 (ref), u20 (ref), u15 (ref), u17 (ref)
            u11:spawnRewards(u13, {
                aliveSec = 6,
                location = u20:GetPivot().Position
            }, u15);
            task.delay(6, function() -- Line: 143
                -- upvalues: u17 (ref)
                u17:DoCleaning();
            end);
        end);
    end);
end;

function u5.spawnRewards(u24, p25, u26, u27) -- Line: 149
    -- upvalues: RewardUtils (copy), Workspace (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), FireworkType (copy), RandomUtil (copy), RunService (copy)
    local u28 = {};

    local function v32(p29) -- Line: 152
        -- upvalues: RewardUtils (ref), u24 (copy), u28 (copy)
        local v30 = RewardUtils.getRewardName(p29);
        local v31 = u24:createRewardDisplay({
            image = RewardUtils.getRewardImageId(p29)
        }, v30 .. " " .. tostring(RewardUtils.getRewardType(p29)));
        table.insert(u28, v31);
    end;

    for i, v in p25 do
        v32(v, i - 1, p25);
    end;

    local u33 = 0;
    local u34 = 0;

    local function v57(u35) -- Line: 165
        -- upvalues: Workspace (ref), u26 (copy), u33 (ref), u24 (copy), SoundManager (ref), GameSound (ref), u34 (ref), KnitClient (ref), FireworkType (ref), RandomUtil (ref), u27 (copy), RunService (ref), u28 (copy)
        u35.Parent = Workspace;
        u35.Position = u26.location;
        local velocity = u26.velocity;

        if not velocity then
            local v36 = math.cos(u33) * 33;
            local v37 = math.sin(u33) * 33;
            velocity = Vector3.new(v36, 40, v37);
        end;

        if u26.direction then
            local _ = velocity * u26.direction;
        end;

        local u56 = u24:launchPart(u35, velocity, function(u38) -- Line: 174
            -- upvalues: SoundManager (ref), GameSound (ref), u34 (ref), u35 (copy), KnitClient (ref), u26 (ref), FireworkType (ref), RandomUtil (ref), u27 (ref), RunService (ref)
            local u39 = SoundManager:playSound(GameSound.NEW_EMERALD_PICKUP, {
                playbackSpeedMultiplier = 1.1 - u34 * 0.1,
                position = u35.Position
            });
            u38:GiveTask(function() -- Line: 179
                -- upvalues: u39 (copy)
                local v40 = u39;

                if v40 ~= nil then
                    v40 = v40:Destroy();
                end;

                return v40;
            end);
            local fireworkType = u26.fireworkType;

            if fireworkType == nil then
                fireworkType = FireworkType.NEW_YEARS;
            end;

            KnitClient.Controllers.FireworkController:playFireworkEffect(u26.location, fireworkType);
            local u41 = SoundManager:playSound(RandomUtil.fromList(GameSound.FIREWORK_EXPLODE_1, GameSound.FIREWORK_EXPLODE_2, GameSound.FIREWORK_EXPLODE_3), {
                playbackSpeedMultiplier = 1.1 - u34 * 0.1,
                position = u35.Position
            });
            u38:GiveTask(function() -- Line: 197
                -- upvalues: u41 (copy)
                local v42 = u41;

                if v42 ~= nil then
                    v42 = v42:Destroy();
                end;

                return v42;
            end);
            local u43 = SoundManager:playSound(GameSound.EMERALD_GENERATOR_AURA, {
                rollOffMaxDistance = 120,
                rollOffMinDistance = 30,
                volumeMultiplier = 1.4,
                parent = u35
            });
            u38:GiveTask(function() -- Line: 210
                -- upvalues: u43 (copy)
                local v44 = u43;

                if v44 ~= nil then
                    v44 = v44:Destroy();
                end;

                return v44;
            end);
            local aliveSec = u26.aliveSec;

            if aliveSec ~= 0 and (aliveSec == aliveSec and aliveSec) then
                task.delay(u26.aliveSec - 1, function() -- Line: 222
                    -- upvalues: u27 (ref), u38 (copy), RunService (ref), u35 (ref)
                    local v45 = u27;

                    if v45 ~= nil then
                        v45 = v45.Character;
                    end;

                    if v45 then
                        local u46 = 0;
                        local UpperTorso = v45:FindFirstChild("UpperTorso");

                        if UpperTorso == nil then
                            return nil;
                        end;

                        local v47 = math.random(-2, 2);
                        local v48 = math.random(3, 4);
                        local u49 = Vector3.new(v47, v48, math.random(-2, 2));
                        u38:GiveTask(RunService.Heartbeat:Connect(function(p50) -- Line: 239
                            -- upvalues: UpperTorso (copy), u35 (ref), u46 (ref), u49 (copy)
                            if UpperTorso.Parent == nil then
                                return nil;
                            end;

                            if u35 == nil then
                                return nil;
                            end;

                            u46 = u46 + p50;
                            local v51 = math.clamp(u46 / 0.95, 0, 1);
                            local v52 = u35.Position:Lerp(UpperTorso.Position, (math.sqrt(v51)));
                            local v53 = math.sin(v51 * 3.141592653589793);
                            local v54 = v52 + u49 * Vector3.new(v53, v53, v53);
                            local v55 = CFrame.Angles(6.283185307179586 * (u46 % 2), 6.283185307179586 * (u46 % 3), 6.283185307179586 * (u46 % 1.5));
                            u35:PivotTo(CFrame.new(v54) * v55);
                        end));
                    end;
                end);
            end;
        end);

        if u26.aliveSec ~= nil then
            task.delay(u26.aliveSec, function() -- Line: 266
                -- upvalues: u56 (copy), u35 (copy)
                u56:DoCleaning();
                u35:Destroy();
            end);
        end;

        u33 = u33 + 6.283185307179586 / #u28;
        u34 = u34 + 1;
        task.wait(0.2);
    end;

    for i, v in u28 do
        v57(v, i - 1, u28);
    end;

    return u28;
end;

function u5.createRewardDisplay(p58, p59, p60) -- Line: 280
    -- upvalues: u3 (copy), ColorUtil (copy)
    local v61 = u3(
        "Part",
        {
            Name = "RewardPart",
            Transparency = 1,
            CollisionGroup = "RewardDisplay",
            CanQuery = true,
            CanCollide = true
        }
    );
    local v62 = u3("BillboardGui", {
        StudsOffset = Vector3.new(0, 6, 0),
        Brightness = 1.5,
        ResetOnSpawn = false,
        Size = UDim2.new(4, 20, 4, 20),
        Parent = v61,
        Children = { u3("TextLabel", {
                Name = "Name",
                TextSize = 14,
                RichText = true,
                TextScaled = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 10,
                Text = "<b>" .. p60 .. "</b>",
                Size = UDim2.fromScale(1, 0.25),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Top,
                Font = Enum.Font.Arial,
                Parent = v61
            }) }
    });
    local image = p59.image;

    if image == "" or not image then
        if p59.text then
            u3("TextLabel", {
                Name = "RewardText",
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Text = p59.text.value,
                Size = UDim2.fromScale(2.5, 0.3),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                TextColor3 = p59.text.color or ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center,
                Font = Enum.Font.LuckiestGuy,
                Parent = v62
            });
        end;

        return v61;
    end;

    u3("ImageLabel", {
        Name = "RewardImage",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 0.75),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        SizeConstraint = Enum.SizeConstraint.RelativeXY,
        Image = p59.image,
        Children = { u3("UIAspectRatioConstraint", {
                DominantAxis = Enum.DominantAxis.Width,
                AspectType = Enum.AspectType.FitWithinMaxSize
            }) },
        Parent = v62
    });

    return v61;
end;

function u5.launchPart(p63, p64, p65, p66) -- Line: 348
    -- upvalues: u2 (copy)
    local v67 = u2.new();
    p64.AssemblyLinearVelocity = p65 or Vector3.new(24, 40, 24);

    if p66 ~= nil then
        p66(v67);
    end;

    return v67;
end;

KnitClient.CreateController(u5.new());

return nil;