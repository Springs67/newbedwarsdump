-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local OutQuad = v2.OutQuad;
local OutQuart = v2.OutQuart;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v4.Lighting;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local isSurfaceBlock = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").isSurfaceBlock;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local u5 = {
    GameSound.HALLOWEEN_LUCKY_BLOCK_GROW_1,
    GameSound.HALLOWEEN_LUCKY_BLOCK_GROW_2,
    GameSound.HALLOWEEN_LUCKY_BLOCK_GROW_3,
    GameSound.FLOWER_PLANT,
    GameSound.FLOWER_BLOOM,
    GameSound.HALLOWEEN_LUCKY_BLOCK_PLANT,
    GameSound.FROSTQUEEN_LYLA_FLOWERBLOOM,
    GameSound.FROSTQUEEN_LYLA_FLOWERPLANT_1,
    GameSound.FROSTQUEEN_LYLA_FLOWERPLANT_2,
    GameSound.FROSTQUEEN_LYLA_FLOWERPLANT_3
};
local u6 = { "Flower_Frost_Queen", "Flower_Nightmare_Victorious", "Flower_Platinum_Victorious", "Flower_Diamond_Victorious" };
local u7 = { "SpiritFlower1Small", "SpiritFlower2Small", "SpiritFlower3Small", "SpiritFlowerTall" };
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 34, Name: __tostring
        return "SpiritBlossomWinEffectController";
    end,

    __index = WinEffect
});
u8.__index = u8;

function u8.new(...) -- Line: 40
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 44
    -- upvalues: WinEffect (copy), WinEffectType (copy), u3 (copy), Workspace (copy)
    WinEffect.constructor(p10, WinEffectType.SPIRIT_BLOSSOM);
    p10.Name = "SpiritBlossomWinEffectController";
    p10.floweredBlocks = {};
    p10.flowerFolder = u3("Folder", {
        Name = "FlowerWinEffectModels",
        Parent = Workspace
    });
    p10.spiritFolder = u3("Folder", {
        Name = "SpiritWinEffectModels",
        Parent = Workspace
    });
end;

function u8.KnitStart(u11) -- Line: 57
    -- upvalues: WinEffect (copy), default2 (copy), Players (copy), KnitClient (copy), RunService (copy), SoundManager (copy), RandomUtil (copy), u5 (copy), ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy)
    WinEffect.KnitStart(u11);
    default2.Client:OnEvent("SpiritBlossomWinEffectSetupComplete", function(p12) -- Line: 59
        -- upvalues: Players (ref), u11 (copy), KnitClient (ref), RunService (ref), SoundManager (ref), RandomUtil (ref), u5 (ref), ReplicatedStorage (ref), Workspace (ref), GameQueryUtil (ref)
        local winningPlayer = p12.winningPlayer;

        if Players.LocalPlayer == winningPlayer then
            u11:orientCamera();
            KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                blockSprint = false,
                constantSpeedMultiplier = 6
            });
        end;

        local u13 = 0;
        local u14 = 0;
        RunService.Heartbeat:Connect(function() -- Line: 70
            -- upvalues: u13 (ref), winningPlayer (copy), u11 (ref), u14 (ref), SoundManager (ref), RandomUtil (ref), u5 (ref)
            if tick() - u13 < 0.1 then
                return nil;
            end;

            local Character = winningPlayer.Character;

            if not Character then
                return nil;
            end;

            if u11:addFlowersToBlocksAroundPlayer(winningPlayer, 20) and tick() - u14 > 0.25 + math.random() then
                local v15 = RandomUtil.fromList(unpack(u5));
                local v16 = {
                    volumeMultiplier = 2,
                    rollOffMaxDistance = 150,
                    rollOffMinDistance = 20
                };
                local PrimaryPart = Character.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Position;
                end;

                v16.position = PrimaryPart;
                SoundManager:playSound(v15, v16);
                u14 = tick();
            end;

            u13 = tick();
        end);
        u11:putTreeInCenter(p12.centerPos);

        if Players.LocalPlayer == winningPlayer then
            local u17 = ReplicatedStorage.Assets.Effects.SpiritBlossomGroundEffect:Clone();
            u17.Parent = Workspace;

            local function u21(p18, u19) -- Line: 103
                local function _(p20) -- Line: 105
                    -- upvalues: u19 (copy)
                    if p20:IsA("ParticleEmitter") then
                        p20.Enabled = u19;

                        if not u19 then
                            p20:Clear();
                        end;
                    end;
                end;

                for i, descendant in p18:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant.Enabled = u19;

                        if not u19 then
                            descendant:Clear();
                        end;
                    end;
                end;
            end;

            RunService.Heartbeat:Connect(function() -- Line: 117
                -- upvalues: winningPlayer (copy), u21 (copy), u17 (copy), GameQueryUtil (ref)
                local Character = winningPlayer.Character;

                if Character == nil then
                    u21(u17, false);

                    return nil;
                end;

                local v22 = RaycastParams.new();
                v22.FilterType = Enum.RaycastFilterType.Exclude;
                v22.FilterDescendantsInstances = { Character };
                local v23 = GameQueryUtil:raycast(Character:GetPivot().Position, Vector3.new(0, -200, 0), v22);
                local v24;

                if v23 == nil then
                    v24 = v23;
                else
                    v24 = v23.Instance;
                end;

                if not v24 then
                    u21(u17, false);

                    return nil;
                end;

                u21(u17, true);
                u17.Position = v23.Position + Vector3.new(0, 1, 0);
            end);
        end;
    end);
end;

function u8.onWin(p25, p26) -- Line: 143
    -- upvalues: SoundManager (copy), GameSound (copy), Lighting (copy), TweenService (copy)
    SoundManager:playSound(GameSound.SPIRIT_ISLAND, {
        fadeInTime = 2,
        fadeOutTime = 2
    });
    local v27 = Lighting:FindFirstChildOfClass("Atmosphere");

    if v27 then
        TweenService:Create(v27, TweenInfo.new(1), {
            Glare = 0.3,
            Haze = 10,
            Color = Color3.fromRGB(231, 195, 197),
            Decay = Color3.fromRGB(135, 70, 156)
        }):Play();
    end;
end;

function u8.spawnSpirit(p28, u29) -- Line: 159
    -- upvalues: RandomUtil (copy), ReplicatedStorage (copy), RunService (copy)
    local v30 = RandomUtil.fromList(unpack({ "PinkSpirit", "BlueSpirit", "PurpleSpirit" }));
    local u31 = ReplicatedStorage.Assets.Effects:FindFirstChild(v30);

    if u31 ~= nil then
        u31 = u31:Clone();
    end;

    if u31 == nil then
        return nil;
    end;

    u31:PivotTo(CFrame.new(u29));
    u31.Parent = p28.spiritFolder;
    local u32 = 0;
    RunService.Heartbeat:Connect(function(p33) -- Line: 173
        -- upvalues: u31 (copy), u32 (ref), u29 (copy)
        if not u31.Parent then
            return nil;
        end;

        u32 = u32 + p33;
        local v34 = math.sin(p33 * 2) * 5;
        local v35 = CFrame.new(u29);
        local v36 = CFrame.Angles(0, math.rad(u32 * 50), 0);
        local v37 = Vector3.new(0, v34, 0);
        u31:PivotTo(v35 * v36 + v37);
    end);
end;

function u8.putTreeInCenter(p38, p39) -- Line: 186
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy), default (copy), OutQuart (copy)
    local u40 = ReplicatedStorage.Assets.Effects.SpiritTree:Clone();

    if u40 == nil then
        return nil;
    end;

    local v41 = RaycastParams.new();
    v41.FilterType = Enum.RaycastFilterType.Include;
    v41.FilterDescendantsInstances = { Workspace.Map };
    local v42 = GameQueryUtil:raycast(p39, Vector3.new(0, -200, 0), v41);
    local v43;

    if v42 == nil then
        v43 = v42;
    else
        v43 = v42.Position;
    end;

    if v43 then
        p39 = v42.Position;
    end;

    u40:ScaleTo(0.2);
    u40:PivotTo(CFrame.new(p39));
    u40.Parent = Workspace;
    default(5, OutQuart, function(p44) -- Line: 207
        -- upvalues: u40 (copy)
        u40:ScaleTo(p44);
    end, 0.2, 3):Play();
end;

function u8.addFlowersToBlocksAroundPlayer(p45, p46, p47) -- Line: 212
    local v48 = p45:getSurroundingBlocks(p46, p47);

    if next(v48) == nil then
        return false;
    end;

    local v49 = 0;

    for i in v48 do
        if p45.floweredBlocks[i] == nil then
            p45:addFlowersToBlock(i);
            p45.floweredBlocks[i] = true;
            v49 = v49 + 1;
        end;
    end;

    return v49 > 0;
end;

function u8.addFlowersToBlock(p50, p51) -- Line: 228
    -- upvalues: BlockEngine (copy), RandomUtil (copy), u6 (copy), ReplicatedStorage (copy), u7 (copy), default (copy), OutQuad (copy), OutQuart (copy)
    local v52 = BlockEngine:getWorldPosition(p51);

    if math.random() < 0.03 then
        local v53 = math.random(-1, 1);
        local v54 = 4 + math.random(0, 8);
        p50:spawnSpirit(v52 + Vector3.new(v53, v54, math.random(-1, 1)));
    end;

    if math.random() < 0.3 then
        return nil;
    end;

    local v55 = math.random() < 0.85 and "Flower" or "Spirit";
    local u56 = nil;

    if v55 == "Flower" then
        local v57 = RandomUtil.fromList(unpack(u6));
        u56 = ReplicatedStorage.Assets.Effects.Lyla:FindFirstChild(v57);

        if u56 ~= nil then
            u56 = u56:Clone();
        end;
    elseif v55 == "Spirit" then
        local v58 = RandomUtil.fromList(unpack(u7));
        u56 = ReplicatedStorage.Assets.Effects:FindFirstChild(v58);

        if u56 ~= nil then
            u56 = u56:Clone();
        end;
    end;

    if u56 == nil then
        return nil;
    end;

    local function _(p59) -- Line: 259
        if p59:IsA("ParticleEmitter") or (p59:IsA("Trail") or p59:IsA("Beam")) then
            p59:Destroy();
        end;
    end;

    for i, descendant in u56:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") or (descendant:IsA("Trail") or descendant:IsA("Beam")) then
            descendant:Destroy();
        end;
    end;

    local v60 = CFrame.new(v52);
    local v61 = math.random(-1, 1);
    local v62 = Vector3.new(v61, -1, math.random(-1, 1));
    local Angles = CFrame.Angles;
    local v63 = math.random(0, 360);
    local v64 = Angles(0, math.rad(v63), 0);
    u56:PivotTo((v60 + v62) * v64);
    u56:ScaleTo(0.25);
    u56.Parent = p50.flowerFolder;
    local Position = u56:GetPivot().Position;
    local u65 = u56:GetPivot().Position + Vector3.new(0, 1, 0);
    default(0.9 + math.random() * 0.2, OutQuad, function(p66) -- Line: 278
        -- upvalues: u56 (ref), Position (copy), u65 (copy)
        local v67 = u56;

        if v67 ~= nil then
            v67:PivotTo(CFrame.new(Position:Lerp(u65, p66)));
        end;
    end, 0, 1):Play();
    default(0.9 + math.random() * 0.2, OutQuart, function(p68) -- Line: 285
        -- upvalues: u56 (ref)
        local v69 = u56;

        if v69 ~= nil then
            v69:ScaleTo(p68);
        end;
    end, 0.25, 1):Play();
end;

function u8.getSurroundingBlocks(p70, p71, p72) -- Line: 293
    -- upvalues: BLOCK_SIZE (copy), BlockEngine (copy)
    local Character = p71.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return {};
    end;

    local v73 = p71.Character.PrimaryPart.CFrame + p71.Character.PrimaryPart.CFrame.LookVector * -1 * (p72 / 2);
    local v74 = Vector3.new(p72, p72 * 6, p72);
    local v75 = false;
    local v76 = 0;
    local v77 = {};

    while true do
        if v75 then
            v76 = v76 + BLOCK_SIZE;
        else
            v75 = true;
        end;

        if v76 >= v74.X then
            return v77;
        end;

        local v78 = false;
        local v79 = 0;

        while true do
            if true then
                if v78 then
                    v79 = v79 + BLOCK_SIZE;
                else
                    v78 = true;
                end;
            end;

            if v79 >= v74.Y then
                break;
            end;

            local v80 = false;
            local v81 = 0;

            while true do
                if true then
                    if v80 then
                        v81 = v81 + BLOCK_SIZE;
                    else
                        v80 = true;
                    end;
                end;

                if v81 >= v74.Z then
                    break;
                end;

                local v82 = v73 * (Vector3.new(v76, v79, v81) - v74 / 2);
                local v83 = BlockEngine:getBlockPosition(v82);

                if p70:validatePosition(p71, v82, p72) then
                    v77[v83] = true;
                end;
            end;
        end;
    end;
end;

function u8.makeDebugPart(p84, p85, p86) -- Line: 360
    -- upvalues: Workspace (copy)
    local Part = Instance.new("Part");
    Part.Size = Vector3.new(1, 1, 1);
    Part.Position = p85;
    Part.Anchored = true;
    Part.CanCollide = false;
    Part.CanQuery = false;
    Part.CanTouch = false;
    Part.Color = p86;
    Part.Parent = Workspace;
    Part.Transparency = 0.6;
    task.delay(1, function() -- Line: 371
        -- upvalues: Part (copy)
        Part:Destroy();
    end);
end;

function u8.validatePosition(p87, p88, p89, p90) -- Line: 375
    -- upvalues: BLOCK_SIZE (copy), BlockEngine (copy), isSurfaceBlock (copy)
    local Character = p88.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return false;
    end;

    local Position = p88.Character.PrimaryPart.Position;

    if p89.Y > Position.Y then
        return false;
    end;

    if p89.Y < Position.Y - BLOCK_SIZE * 30 then
        return false;
    end;

    local v91 = Vector3.new(Position.X, 0, Position.Z);
    local v92 = Vector3.new(p89.X, 0, p89.Z);
    local v93 = BlockEngine:getBlockPosition(p89);

    return (v92 - v91).Magnitude <= p90 and isSurfaceBlock(v93) and true or false;
end;

function u8.orientCamera(p94) -- Line: 399
    -- upvalues: Workspace (copy), Players (copy)
    if Workspace.CurrentCamera then
        Players.LocalPlayer.CameraMaxZoomDistance = 100;
        Players.LocalPlayer.CameraMinZoomDistance = 60;
    end;
end;

KnitClient.CreateController(u8.new());

return nil;