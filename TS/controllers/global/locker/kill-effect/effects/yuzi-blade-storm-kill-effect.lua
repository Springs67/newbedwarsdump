-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v1.Linear;
local OutExpo = v1.OutExpo;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "YuziBladeStormKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 27
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 31
    -- upvalues: KillEffect (copy), u2 (copy)
    KillEffect.constructor(p7, p8);
    p7.maid = u2.new();
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(u9, p10, p11, u12) -- Line: 36
    -- upvalues: SoundManager (copy), GameSound (copy)
    u9:scheduleKillEffectCleanUp(5);
    local u13 = u9:createClone(p11, u12);
    u9:hideNametag(u13);
    u9:turnCharacterIntoJadeStatue(u13);
    local u14 = u9:createDaoModels();
    local u15 = u9:getPositionAboveClone(u13, 5);
    local u16 = u9:getCircularPositionAroundCenter(u9:getPositionBehindClone(u13, 4), #u14);
    local v18 = task.spawn(function() -- Line: 51
        -- upvalues: u9 (copy), u16 (copy), u14 (copy), u15 (copy), SoundManager (ref), GameSound (ref), u12 (copy), u13 (copy)
        u9:stabDaosBehindPlayer(u16, u14, 0.3, 0.4);
        task.wait(0.7);
        local v17 = u9:createDaoParentModel(u14);
        u9:moveDaosUp(v17, 5, 0.5);
        task.wait(0.5);
        u9:moveDaosAbovePlayerHead(v17, u15, 0.5);
        task.wait(0.5);
        u9:turnDaosInward(u14, 0.5);
        task.wait(0.5);
        SoundManager:playSound(GameSound.KILL_EFFECT_SLASH, {
            volumeMultiplier = 0.9,
            position = u12.Position
        });
        u9:stabPlayerWithDaos(u14, u13, 0.3);
        task.wait(0.3);
        SoundManager:playSound(GameSound.SHATTER_STRIKE_BREAK_1, {
            volumeMultiplier = 0.9,
            position = u12.Position
        });
        u9:shatterCharacter(u12);
        u9:tossCharacter(u13, Vector3.new(1, 0, 0));
        u9:fadeOutDaos(u14);
        task.wait(0.5);
        u9.maid:DoCleaning();
    end);
    u9.maid:GiveTask(v18);

    return u9.maid;
end;

function u5.fadeOutDaos(p19, p20) -- Line: 80
    -- upvalues: default (copy), OutExpo (copy)
    local function v25(p21) -- Line: 82
        -- upvalues: default (ref), OutExpo (ref)
        local function _(u22) -- Line: 84
            -- upvalues: default (ref), OutExpo (ref)
            if u22:IsA("BasePart") then
                default(0.5, OutExpo, function(p23) -- Line: 86
                    -- upvalues: u22 (copy)
                    u22.Transparency = p23;
                end, 0, 1):Play();
            end;
        end;

        for i, descendant in p21:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                default(0.5, OutExpo, function(p24) -- Line: 86
                    -- upvalues: descendant (copy)
                    descendant.Transparency = p24;
                end, 0, 1):Play();
            end;
        end;
    end;

    for i, v in p20 do
        v25(v, i - 1, p20);
    end;
end;

function u5.shatterCharacter(p26, p27) -- Line: 99
    -- upvalues: KnitClient (copy)
    local v28 = false;
    local v29 = 0;

    while true do
        if v28 then
            v29 = v29 + 1;
        else
            v28 = true;
        end;

        if v29 >= 8 then
            return;
        end;

        local BlockDebrisController = KnitClient.Controllers.BlockDebrisController;
        local Position = p27.Position;
        local v30 = Color3.fromRGB(56, 199, 153);
        local v31 = math.random() * 0.5;
        local v32 = math.random() * 0.5;
        local v33 = Vector3.new(v31, 1, v32);
        local v34 = {
            burnDebris = false,
            transparency = 0.35,
            material = Enum.Material.Glass
        };
        local v35 = 0.75 + math.random() * 0.4;
        local v36 = 0.5 + math.random() * 0.4;
        v34.size = Vector3.new(0.5, v35, v36);
        BlockDebrisController:createDebris(Position, v30, v33, v34);
    end;
end;

function u5.turnCharacterIntoJadeStatue(p37, p38) -- Line: 122
    -- upvalues: TweenService (copy), u3 (copy)
    for _, descendant in p38:GetDescendants() do
        if descendant:IsA("BasePart") then
            descendant.Material = Enum.Material.Glass;
            TweenService:Create(descendant, TweenInfo.new(0.55), {
                LocalTransparencyModifier = 0.35,
                Color = Color3.fromRGB(56, 199, 153)
            }):Play();

            if descendant:IsA("MeshPart") then
                descendant.TextureID = "";
            end;
        elseif descendant:IsA("Texture") or (descendant:IsA("Shirt") or (descendant:IsA("Clothing") or descendant:IsA("Highlight"))) then
            descendant:Destroy();
        end;
    end;

    u3("PointLight", {
        Brightness = 0.3,
        Range = 5,
        Shadows = false,
        Enabled = true,
        Color = Color3.fromRGB(59, 214, 156),
        Parent = p38
    });
end;

function u5.tossCharacter(p39, p40, u41) -- Line: 146
    p40:BreakJoints();
    local v42 = p40:GetDescendants();

    local function v46(p43) -- Line: 149
        -- upvalues: u41 (copy)
        if p43:IsA("BasePart") then
            p43.CanCollide = false;
            local Unit = (u41 + Vector3.new(0, 1, 0)).Unit;
            local v44 = math.random(10, 20);
            local v45 = math.random(30, 40);
            p43.AssemblyLinearVelocity = Unit * Vector3.new(v44, v45, math.random(10, 20));
        end;
    end;

    for i, v in v42 do
        v46(v, i - 1, v42);
    end;
end;

function u5.turnDaosInward(p47, p48, u49) -- Line: 163
    -- upvalues: default (copy), Linear (copy)
    local function _(u50) -- Line: 165
        -- upvalues: default (ref), u49 (copy), Linear (ref)
        task.spawn(function() -- Line: 166
            -- upvalues: u50 (copy), default (ref), u49 (ref), Linear (ref)
            local u51 = u50:GetPivot();
            local u52 = u51 * CFrame.Angles(-1.0471975511965976, 0, 0);
            default(u49, Linear, function(p53) -- Line: 170
                -- upvalues: u50 (ref), u51 (copy), u52 (copy)
                u50:PivotTo(u51:Lerp(u52, p53) * CFrame.Angles(0, p53 * 2 * 3.141592653589793, 0));
            end, 0, 1):Play();
        end);
    end;

    for i, v in p48 do
        local _ = i - 1;
        task.spawn(function() -- Line: 166
            -- upvalues: v (copy), default (ref), u49 (copy), Linear (ref)
            local u54 = v:GetPivot();
            local u55 = u54 * CFrame.Angles(-1.0471975511965976, 0, 0);
            default(u49, Linear, function(p56) -- Line: 170
                -- upvalues: v (ref), u54 (copy), u55 (copy)
                v:PivotTo(u54:Lerp(u55, p56) * CFrame.Angles(0, p56 * 2 * 3.141592653589793, 0));
            end, 0, 1):Play();
        end);
    end;
end;

function u5.stabPlayerWithDaos(p57, p58, u59, u60) -- Line: 182
    -- upvalues: default (copy), OutExpo (copy)
    local function _(u61, u62) -- Line: 184
        -- upvalues: u59 (copy), default (ref), u60 (copy), OutExpo (ref)
        task.spawn(function() -- Line: 185
            -- upvalues: u62 (copy), u61 (copy), u59 (ref), default (ref), u60 (ref), OutExpo (ref)
            task.wait(0.075 * u62);
            local u63 = u61:GetPivot();
            local u64 = CFrame.new(u59:GetPivot().Position) * u61:GetPivot().Rotation;
            default(u60, OutExpo, function(p65) -- Line: 191
                -- upvalues: u61 (ref), u63 (copy), u64 (copy)
                u61:PivotTo(u63:Lerp(u64, p65));
            end, 0, 1):Play();
        end);
    end;

    for i, v in p58 do
        local u66 = i - 1;
        task.spawn(function() -- Line: 185
            -- upvalues: u66 (copy), v (copy), u59 (copy), default (ref), u60 (copy), OutExpo (ref)
            task.wait(0.075 * u66);
            local u67 = v:GetPivot();
            local u68 = CFrame.new(u59:GetPivot().Position) * v:GetPivot().Rotation;
            default(u60, OutExpo, function(p69) -- Line: 191
                -- upvalues: v (ref), u67 (copy), u68 (copy)
                v:PivotTo(u67:Lerp(u68, p69));
            end, 0, 1):Play();
        end);
    end;
end;

function u5.moveDaosAbovePlayerHead(p70, u71, u72, p73) -- Line: 200
    -- upvalues: default (copy), Linear (copy)
    local u74 = u71:GetPivot();
    default(p73, Linear, function(p75) -- Line: 202
        -- upvalues: u71 (copy), u74 (copy), u72 (copy)
        u71:PivotTo(u74:Lerp(u72, p75) * CFrame.Angles(0, 0, p75 * 3.141592653589793));
    end, 0, 1):Play();
end;

function u5.moveDaosUp(p76, u77, p78, p79) -- Line: 209
    -- upvalues: default (copy), Linear (copy)
    local u80 = u77:GetPivot();
    local u81 = u80 + Vector3.new(0, p78, 0);
    default(p79, Linear, function(p82) -- Line: 214
        -- upvalues: u77 (copy), u80 (copy), u81 (copy)
        u77:PivotTo(u80:Lerp(u81, p82) * CFrame.Angles(0, 0, p82 * 3.141592653589793));
    end, 0, 1):Play();
end;

function u5.stabDaosBehindPlayer(p83, u84, u85, u86, u87) -- Line: 221
    -- upvalues: default (copy), OutExpo (copy)
    local function _(u88, u89) -- Line: 223
        -- upvalues: u84 (copy), u86 (copy), u85 (copy), default (ref), u87 (copy), OutExpo (ref)
        task.spawn(function() -- Line: 224
            -- upvalues: u84 (ref), u89 (copy), u86 (ref), u85 (ref), u88 (copy), default (ref), u87 (ref), OutExpo (ref)
            local v90 = u84[u89 + 1];
            local u91 = v90[1];
            local u92 = v90[2];
            task.wait(u89 * (u86 / #u85));
            u88:PivotTo(u91);
            default(u87, OutExpo, function(p93) -- Line: 230
                -- upvalues: u88 (ref), u91 (copy), u92 (copy)
                u88:PivotTo(u91:Lerp(u92 * CFrame.Angles(0, p93 * 3.141592653589793, 0), p93));
            end, 0, 1):Play();
        end);
    end;

    for i, v in u85 do
        local u94 = i - 1;
        task.spawn(function() -- Line: 224
            -- upvalues: u84 (copy), u94 (copy), u86 (copy), u85 (copy), v (copy), default (ref), u87 (copy), OutExpo (ref)
            local v95 = u84[u94 + 1];
            local u96 = v95[1];
            local u97 = v95[2];
            task.wait(u94 * (u86 / #u85));
            v:PivotTo(u96);
            default(u87, OutExpo, function(p98) -- Line: 230
                -- upvalues: v (ref), u96 (copy), u97 (copy)
                v:PivotTo(u96:Lerp(u97 * CFrame.Angles(0, p98 * 3.141592653589793, 0), p98));
            end, 0, 1):Play();
        end);
    end;
end;

function u5.getCircularPositionAroundCenter(p99, p100, p101) -- Line: 242
    local v102 = select(2, p100:ToOrientation());
    local v103 = false;
    local v104 = 0;
    local v105 = {};

    while true do
        if v103 then
            v104 = v104 + 1;
        else
            v103 = true;
        end;

        if v104 >= p101 then
            return v105;
        end;

        local v106 = v104 % p101 / p101 * 6.283185307179586 - v102;
        local v107 = math.cos(v106) * 4;
        local v108 = math.sin(v106) * 4;
        local v109 = p100 + Vector3.new(v107, v108, 0);
        local v110 = CFrame.lookAt(v109.Position, p100.Position, Vector3.new(0, 0, 1)) * CFrame.Angles(-1.5707963267948966, 0, 0);
        local v111 = math.cos(v106) * 12;
        local v112 = math.sin(v106) * 12;
        local v113 = p100 + Vector3.new(v111, v112, 0);
        local v114 = { CFrame.lookAt(v113.Position, p100.Position, Vector3.new(0, 0, 1)) * CFrame.Angles(-1.5707963267948966, 0, 0), v110 };
        table.insert(v105, v114);
    end;
end;

function u5.getPositionBehindClone(p115, p116, p117) -- Line: 279
    local Unit = (p116:GetPivot().LookVector * -1).Unit;

    return p116:GetPivot() + Unit * p117;
end;

function u5.getPositionAboveClone(p118, p119, p120) -- Line: 287
    local v121 = CFrame.Angles(-1.5707963267948966, 0, 0);

    return (p119:GetPivot() + Vector3.new(0, p120, 0)) * v121;
end;

function u5.createDaoParentModel(u122, p123) -- Line: 294
    -- upvalues: u3 (copy), Workspace (copy)
    local u124 = u3("Model", {
        Name = "DaoParentModel",
        Parent = Workspace
    });

    local function _(p125) -- Line: 300
        -- upvalues: u124 (copy), u122 (copy)
        p125.Parent = u124;
        u122.maid:GiveTask(p125);
    end;

    for i, v in p123 do
        local _ = i - 1;
        v.Parent = u124;
        u122.maid:GiveTask(v);
    end;

    u122.maid:GiveTask(u124);

    return u124;
end;

function u5.createDaoModels(u126) -- Line: 310
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    local v127 = ReplicatedStorage.Assets.Effects.DaoBladeStorm:Clone():GetChildren();

    local function _(p128) -- Line: 312
        -- upvalues: Workspace (ref), u126 (copy)
        p128.Parent = Workspace;
        u126.maid:GiveTask(p128);
    end;

    for i, v in v127 do
        local _ = i - 1;
        v.Parent = Workspace;
        u126.maid:GiveTask(v);
    end;

    return v127;
end;

function u5.createClone(p129, p130, p131) -- Line: 321
    -- upvalues: Workspace (copy), KillEffect (copy)
    p130.Archivable = true;
    local v132 = p130:Clone();
    v132.Name = "KillEffectCloneBladeStorm";
    v132.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    v132.HumanoidRootPart.Anchored = true;
    v132:PivotTo(p131);
    v132.Parent = Workspace;
    KillEffect.hideCharacter(p129, p130);
    p129.maid:GiveTask(v132);

    return v132;
end;

function u5.hideNametag(p133, p134) -- Line: 333
    local function _(p135) -- Line: 335
        if p135:IsA("BillboardGui") and p135.Name == "Nametag" then
            p135:Destroy();
        end;
    end;

    for i, descendant in p134:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BillboardGui") and descendant.Name == "Nametag" then
            descendant:Destroy();
        end;
    end;
end;

function u5.scheduleKillEffectCleanUp(u136, p137) -- Line: 344
    task.delay(p137, function() -- Line: 345
        -- upvalues: u136 (copy)
        u136.maid:DoCleaning();
    end);
end;

function u5.createDebugPart(p138, p139, p140) -- Line: 349
    -- upvalues: u3 (copy), Workspace (copy)
    local v141 = u3("Part", {
        Size = Vector3.new(1, 1, 1),
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Parent = Workspace,
        CFrame = p139,
        Color = p140
    });
    p138.maid:GiveTask(v141);

    return v141;
end;

return u5;