-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local TweenService = v2.TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PrismaticMarinaColors = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jellyfish", "jellyfish-kit-util").PrismaticMarinaColors;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "MarinaLobbyDisplayController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "MarinaLobbyDisplayController";
end;

function u3.KnitStart(u6) -- Line: 34
    -- upvalues: KnitController (copy), CollectionService (copy)
    KnitController.KnitStart(u6);

    local function _(p7) -- Line: 37
        -- upvalues: u6 (copy)
        if p7:IsA("Model") then
            u6:applyRGBEffect(p7);
        end;
    end;

    for i, v in CollectionService:GetTagged("PrismaticMarinaModel") do
        local _ = i - 1;

        if v:IsA("Model") then
            u6:applyRGBEffect(v);
        end;
    end;

    CollectionService:GetInstanceAddedSignal("PrismaticMarinaModel"):Connect(function(p8) -- Line: 45
        -- upvalues: u6 (copy)
        if p8:IsA("Model") then
            u6:applyRGBEffect(p8);
        end;
    end);

    local function _(p9) -- Line: 51
        -- upvalues: u6 (copy)
        if p9:IsA("Model") then
            u6:setUpAnimations(p9);
        end;
    end;

    for i, v in CollectionService:GetTagged("JellyfishLobbyDisplay") do
        local _ = i - 1;

        if v:IsA("Model") then
            u6:setUpAnimations(v);
        end;
    end;

    CollectionService:GetInstanceAddedSignal("JellyfishLobbyDisplay"):Connect(function(p10) -- Line: 59
        -- upvalues: u6 (copy)
        if p10:IsA("Model") then
            u6:setUpAnimations(p10);
        end;
    end);

    local function _(p11) -- Line: 65
        -- upvalues: u6 (copy)
        if p11:IsA("MeshPart") then
            u6:setUpRGBBanner(p11);
        end;
    end;

    for i, v in CollectionService:GetTagged("PrismaticBanner") do
        local _ = i - 1;

        if v:IsA("MeshPart") then
            u6:setUpRGBBanner(v);
        end;
    end;

    CollectionService:GetInstanceAddedSignal("PrismaticBanner"):Connect(function(p12) -- Line: 73
        -- upvalues: u6 (copy)
        if p12:IsA("MeshPart") then
            u6:setUpRGBBanner(p12);
        end;
    end);
end;

function u3.setUpRGBBanner(p13, u14) -- Line: 79
    -- upvalues: u1 (copy), TweenService (copy)
    local u15 = {
        Color3.fromRGB(206, 15, 0),
        Color3.fromRGB(206, 79, 0),
        Color3.fromRGB(48, 160, 0),
        Color3.fromRGB(0, 142, 169),
        Color3.fromRGB(0, 16, 242),
        Color3.fromRGB(181, 37, 112)
    };
    task.spawn(function() -- Line: 81
        -- upvalues: u1 (ref), u15 (copy), u14 (copy), TweenService (ref)
        local v16 = u1.new();
        local Color3Value = Instance.new("Color3Value");
        Color3Value.Value = u15[1];
        v16:GiveTask(Color3Value.Changed:Connect(function(p17) -- Line: 85
            -- upvalues: u14 (ref)
            u14.Color = p17;
        end));
        local v18 = 1;

        while u14.Parent ~= nil do
            local v19 = TweenService:Create(Color3Value, TweenInfo.new(3), {
                Value = u15[v18 + 1]
            });
            v19:Play();
            v19.Completed:Wait();
            local v20 = v18 + 1;
            v18 = #u15 <= v20 and 0 or v20;
        end;

        v16:DoCleaning();
    end);
end;

function u3.setUpAnimations(p21, p22) -- Line: 103
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    local AnimationController = Instance.new("AnimationController");
    AnimationController.Parent = p22;
    local Animator = Instance.new("Animator");
    Animator.Parent = AnimationController;
    local u23 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.JELLYFISH_IDLE));
    task.delay(math.random() * 2, function() -- Line: 109
        -- upvalues: u23 (copy)
        u23:Play(nil, nil, 1 - math.random() * 0.5);
    end);
end;

function u3.applyRGBEffect(p24, u25) -- Line: 113
    -- upvalues: u1 (copy), PrismaticMarinaColors (copy), ColorUtil (copy), TweenService (copy)
    local v26 = u25:WaitForChild("3DClothing");
    local u27 = { v26:WaitForChild("Head"):WaitForChild("Prismatic_InnerHat"), v26:WaitForChild("Head"):WaitForChild("Prismatic_Tentacles"), v26:WaitForChild("LowerTorso"):WaitForChild("Prismatic_Skirt") };

    local function _(p28) -- Line: 117
        return p28:IsA("Decal");
    end;

    local v29 = 0;
    local u30 = {};

    for i, child in v26:WaitForChild("Head"):WaitForChild("Prismatic_Tentacles"):GetChildren() do
        local _ = i - 1;

        if child:IsA("Decal") == true then
            v29 = v29 + 1;
            u30[v29] = child;
        end;
    end;

    task.spawn(function() -- Line: 131
        -- upvalues: u1 (ref), PrismaticMarinaColors (ref), u27 (copy), ColorUtil (ref), u30 (copy), u25 (copy), TweenService (ref)
        local v31 = u1.new();
        local Color3Value = Instance.new("Color3Value");
        Color3Value.Value = PrismaticMarinaColors[1];
        v31:GiveTask(Color3Value.Changed:Connect(function(u32) -- Line: 135
            -- upvalues: u27 (ref), ColorUtil (ref), u30 (ref)
            local function _(p33) -- Line: 136
                -- upvalues: u32 (copy)
                p33.Color = u32;
            end;

            for i, v in u27 do
                local _ = i - 1;
                v.Color = u32;
            end;

            local function _(p34) -- Line: 142
                -- upvalues: ColorUtil (ref), u32 (copy)
                p34.Color3 = ColorUtil.darken(u32, 0.3);
            end;

            for i, v in u30 do
                local _ = i - 1;
                v.Color3 = ColorUtil.darken(u32, 0.3);
            end;
        end));
        local v35 = 1;

        while u25.Parent ~= nil do
            local v36 = TweenService:Create(Color3Value, TweenInfo.new(2), {
                Value = PrismaticMarinaColors[v35 + 1]
            });
            v36:Play();
            v36.Completed:Wait();
            local v37 = v35 + 1;
            v35 = #PrismaticMarinaColors <= v37 and 0 or v37;
        end;

        v31:DoCleaning();
    end);
end;

KnitClient.CreateController(u3.new());

return nil;