-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local GameQueryUtil = v1.GameQueryUtil;
local PlayerUtil = v1.PlayerUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PetMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "pet", "pet-meta").PetMeta;
local PetAnimationPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "pet", "pet-types").PetAnimationPriority;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "PetController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "PetController";
    p6.playerMaidMap = {};
end;

function u4.KnitStart(u7) -- Line: 41
    -- upvalues: KnitController (copy), WatchCharacter (copy)
    KnitController.KnitStart(u7);
    WatchCharacter(function(u8, p9, p10) -- Line: 43
        -- upvalues: u7 (copy)
        local function _(p11) -- Line: 44
            -- upvalues: u7 (ref)
            local v12 = p11:GetAttribute("PetType");

            if v12 then
                u7:setupPlayerPet(p11, v12);
            end;
        end;

        local v13 = u8:GetAttribute("PetType");

        if v13 then
            u7:setupPlayerPet(u8, v13);
        end;

        p10:GiveTask(u8:GetAttributeChangedSignal("PetType"):Connect(function() -- Line: 51
            -- upvalues: u8 (copy), u7 (ref)
            local v14 = u8;
            local v15 = v14:GetAttribute("PetType");

            if v15 then
                u7:setupPlayerPet(v14, v15);
            end;
        end));
        p10:GiveTask(function() -- Line: 54
            -- upvalues: u7 (ref), u8 (copy)
            u7:removePlayerPet(u8);
        end);
    end);
end;

function u4.removePlayerPet(p16, p17) -- Line: 59
    local v18 = p16.playerMaidMap[p17];

    if v18 ~= nil then
        v18:Destroy();
    end;

    p16.playerMaidMap[p17] = nil;
end;

function u4.setupPlayerPet(u19, u20, p21) -- Line: 70
    -- upvalues: PlayerUtil (copy), u2 (copy), PetMeta (copy), default (copy), Workspace (copy), default2 (copy), Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), RunService (copy), GameQueryUtil (copy)
    local u22 = PlayerUtil.waitForCharacter(u20);

    if not u22 then
        return nil;
    end;

    u19:removePlayerPet(u20);
    local v23 = u2.new();
    local u24 = PetMeta[p21];
    local model = u24.model;

    if model == nil or model.PrimaryPart == nil then
        default.Error("Error creating pet {petType}. model not found", p21);

        return nil;
    end;

    local u25 = model:Clone();
    u25.PrimaryPart.Anchored = true;
    local scaleMultiplier = u24.scaleMultiplier;

    if scaleMultiplier ~= 0 and (scaleMultiplier == scaleMultiplier and scaleMultiplier) then
        u25:ScaleTo(u24.scaleMultiplier * u25:GetScale());
    end;

    u25:PivotTo(u22:GetPivot());
    u25.Parent = Workspace;
    v23:GiveTask(u25);

    local function _(p26) -- Line: 93
        if p26:IsA("BasePart") then
            p26.CanCollide = false;
        end;
    end;

    for i, descendant in u25:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
        end;
    end;

    local Humanoid = u22:WaitForChild("Humanoid");

    if not Humanoid then
        v23:Destroy();

        return nil;
    end;

    local u27 = u25:FindFirstChildWhichIsA("Animator", true);

    if not u27 then
        v23:Destroy();

        return nil;
    end;

    local u28 = Vector3.new();
    local u29 = nil;
    local u30 = nil;
    local u31 = nil;
    v23:GiveTask(default2.Client:Get("EmotePlaying"):Connect(function(p32) -- Line: 115
        -- upvalues: Players (ref), u22 (copy), u29 (ref), u24 (copy), u31 (ref), AnimationUtil (ref), u27 (copy), GameAnimationUtil (ref)
        local v33 = Players:GetPlayerFromCharacter(u22);

        if not v33 then
            return nil;
        end;

        if p32 == v33 then
            local v34 = u29 and u24.animations.dance;

            if v34 ~= 0 and (v34 == v34 and v34) then
                u31 = AnimationUtil:playAnimation(u27, GameAnimationUtil:getAssetId(u24.animations.dance), {
                    looped = true
                });
            end;
        end;
    end));
    local u35 = 0;
    local v36 = u22:GetPivot();
    local v37 = -Humanoid.HipHeight - u25:GetExtentsSize().Y / 2;
    local heightOffset = u24.heightOffset;
    local spawnHeightOffset = u24.spawnHeightOffset;
    local u38 = v36 * CFrame.new(0, v37 + (heightOffset == nil and 0 or heightOffset) + (spawnHeightOffset == nil and 0 or spawnHeightOffset), 3);
    local Position = u22:GetPivot().Position;
    v23:GiveTask(RunService.Heartbeat:Connect(function(p39) -- Line: 144
        -- upvalues: u25 (copy), u38 (ref), u35 (ref), GameQueryUtil (ref), u22 (copy), Position (ref), u24 (copy), Humanoid (copy), u28 (ref), u30 (ref), u29 (ref), AnimationUtil (ref), u27 (copy), GameAnimationUtil (ref), u31 (ref)
        u25:PivotTo(u25:GetPivot():Lerp(u38, 0.04));
        u35 = u35 + p39;

        if u35 < 0.1 then
            return nil;
        end;

        u35 = 0;
        local v40 = RaycastParams.new();
        v40.CollisionGroup = "Players";
        local v41 = {};
        local v42 = u25:GetDescendants();
        table.move(v42, 1, #v42, #v41 + 1, v41);
        v40.FilterDescendantsInstances = v41;
        v40.FilterType = Enum.RaycastFilterType.Exclude;
        local v43 = GameQueryUtil:raycast((u22:GetPivot() * CFrame.new(0, 0, 3)).Position, Vector3.new(0, -10, 0), v40);

        if (u22:GetPivot().Position - Position).Magnitude > 0.05 then
            if v43 then
                local Position2 = v43.Position;
                local v44 = u25:GetExtentsSize().Y / 2;
                local heightOffset2 = u24.heightOffset;
                local v45 = Vector3.new(0, v44 + (heightOffset2 == nil and 0 or heightOffset2), 0);
                local v46 = CFrame.new(Position2 + v45);
                local v47 = CFrame;
                local v48 = select(2, CFrame.new(u25:GetPivot().Position, u22:GetPivot().Position):ToOrientation());
                local rotationOffset = u24.rotationOffset;
                u38 = v46 * v47.Angles(0, v48 + ((rotationOffset == 0 or (rotationOffset ~= rotationOffset or not rotationOffset)) and 0 or math.rad(u24.rotationOffset)), 0);
            else
                local v49 = u22:GetPivot();
                local v50 = -Humanoid.HipHeight - u25:GetExtentsSize().Y / 2;
                local heightOffset2 = u24.heightOffset;
                u38 = v49 * CFrame.new(0, v50 + (heightOffset2 == nil and 0 or heightOffset2), 3);
            end;
        end;

        Position = u22:GetPivot().Position;

        if (u25:GetPivot().Position - u28).Magnitude < 0.05 then
            if u30 then
                u30:Stop();
                u30 = nil;
            end;

            if not u29 then
                u29 = AnimationUtil:playAnimation(u27, GameAnimationUtil:getAssetId(u24.animations.idle), {
                    looped = true
                });
            end;
        else
            if u29 then
                u29:Stop();
                u29 = nil;
            end;

            if u31 then
                u31:Stop();
                u31 = nil;
            end;

            if not u30 then
                u30 = AnimationUtil:playAnimation(u27, GameAnimationUtil:getAssetId(u24.animations.walk), {
                    looped = true
                });
            end;
        end;

        u28 = u25:GetPivot().Position;
    end));
    v23:GiveTask(u19:setupPetPassiveAnims(u24, u27, u31, u29));
    v23:GiveTask(function() -- Line: 222
        -- upvalues: u19 (copy), u20 (copy)
        local playerMaidMap = u19.playerMaidMap;
        local v51 = u20;
        local v52 = playerMaidMap[v51] ~= nil;
        playerMaidMap[v51] = nil;

        return v52;
    end);
    u19.playerMaidMap[u20] = v23;

    return v23;
end;

function u4.setupPetPassiveAnims(p53, u54, u55, u56, u57) -- Line: 236
    -- upvalues: u2 (copy), RunService (copy), RandomUtil (copy), PetAnimationPriority (copy), AnimationUtil (copy), GameAnimationUtil (copy), SoundManager (copy)
    local v58 = u2.new();
    local u59 = time() + math.random(5, 15);
    local passiveActions = u54.animations.passiveActions;

    if passiveActions then
        v58:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 241
            -- upvalues: u59 (ref), u56 (copy), u57 (ref), RandomUtil (ref), PetAnimationPriority (ref), passiveActions (copy), AnimationUtil (ref), u55 (copy), GameAnimationUtil (ref), SoundManager (ref), u54 (copy)
            if u59 < time() then
                if u56 then
                    return nil;
                end;

                local u60;

                if u57 then
                    u60 = RandomUtil.fromList(PetAnimationPriority.OVERRIDE, PetAnimationPriority.OVERLAY);
                else
                    u60 = PetAnimationPriority.OVERLAY;
                end;

                local function _(p61) -- Line: 252
                    -- upvalues: u60 (ref)
                    return p61.type == u60;
                end;

                local v62 = 0;
                local v63 = {};

                for i, v in passiveActions do
                    local _ = i - 1;

                    if v.type == u60 == true then
                        v62 = v62 + 1;
                        v63[v62] = v;
                    end;
                end;

                local function _(p64) -- Line: 265
                    return p64.id;
                end;

                local v65 = table.create(#v63);

                for i, v in v63 do
                    local _ = i - 1;
                    v65[i] = v.id;
                end;

                local function _(p66) -- Line: 275
                    -- upvalues: u60 (ref)
                    return p66.type == u60;
                end;

                local v67 = 0;
                local v68 = {};

                for i, v in passiveActions do
                    local _ = i - 1;

                    if v.type == u60 == true then
                        v67 = v67 + 1;
                        v68[v67] = v;
                    end;
                end;

                if #v68 == 0 then
                    return nil;
                end;

                local v69 = RandomUtil.fromList(unpack(v68));
                local v70 = AnimationUtil:playAnimation(u55, GameAnimationUtil:getAssetId(v69.id));
                local sound = v69.sound;

                if sound ~= "" and sound then
                    local Parent = u55.Parent;

                    if Parent ~= nil then
                        Parent = Parent.Parent;
                    end;

                    if Parent and Parent.PrimaryPart then
                        SoundManager:playSound(v69.sound, {
                            rollOffMaxDistance = 220,
                            position = Parent.PrimaryPart.Position
                        });
                    end;
                end;

                if v70 ~= nil then
                    v70.Stopped:Once(function() -- Line: 311
                        -- upvalues: u57 (ref), AnimationUtil (ref), u55 (ref), GameAnimationUtil (ref), u54 (ref)
                        if not u57 then
                            u57 = AnimationUtil:playAnimation(u55, GameAnimationUtil:getAssetId(u54.animations.idle), {
                                looped = true
                            });
                        end;
                    end);
                end;

                u59 = time() + math.random(5, 15);
            end;
        end));
    end;

    return v58;
end;

KnitClient.CreateController(u4.new());

return nil;