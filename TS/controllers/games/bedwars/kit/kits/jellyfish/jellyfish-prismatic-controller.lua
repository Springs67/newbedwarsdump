-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local PrismaticMarinaColors = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jellyfish", "jellyfish-kit-util").PrismaticMarinaColors;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "JellyfishPrismaticController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "JellyfishPrismaticController";
end;

function u3.KnitStart(u6) -- Line: 32
    -- upvalues: KnitController (copy), WatchCharacter (copy)
    KnitController.KnitStart(u6);
    WatchCharacter(function(u7, u8, p9) -- Line: 34
        -- upvalues: u6 (copy)
        if u6:isPrismaticSkinEquipped(u7) then
            u6:applyRGBEffect(u8);

            return;
        end;

        p9:GiveTask(u8:GetAttributeChangedSignal("KitSkin"):Connect(function() -- Line: 38
            -- upvalues: u6 (ref), u7 (copy), u8 (copy)
            if u6:isPrismaticSkinEquipped(u7) then
                u6:applyRGBEffect(u8);
            end;
        end));
    end);
end;

function u3.isPrismaticSkinEquipped(p10, p11) -- Line: 46
    -- upvalues: KnitClient (copy), isUsingKit (copy), BedwarsKit (copy), BedwarsKitSkin (copy)
    local Character = p11.Character;

    if not Character then
        return false;
    end;

    local v12 = KnitClient.Controllers.KitController:getKitSkin(Character);
    KnitClient.Controllers.KitController:getActiveKits(p11);
    local v13 = isUsingKit(p11, BedwarsKit.JELLYFISH) and v12 == BedwarsKitSkin.JELLYFISH_PRISMATIC;

    return v13;
end;

function u3.applyRGBEffect(p14, u15) -- Line: 55
    -- upvalues: u2 (copy), PrismaticMarinaColors (copy), ColorUtil (copy), TweenService (copy)
    local v16 = u15:WaitForChild("3DClothing");
    local u17 = { v16:WaitForChild("Head"):WaitForChild("Prismatic_InnerHat"), v16:WaitForChild("Head"):WaitForChild("Prismatic_Tentacles"), v16:WaitForChild("LowerTorso"):WaitForChild("Prismatic_Skirt") };

    local function _(p18) -- Line: 59
        return p18:IsA("Decal");
    end;

    local v19 = 0;
    local u20 = {};

    for i, child in v16:WaitForChild("Head"):WaitForChild("Prismatic_Tentacles"):GetChildren() do
        local _ = i - 1;

        if child:IsA("Decal") == true then
            v19 = v19 + 1;
            u20[v19] = child;
        end;
    end;

    task.spawn(function() -- Line: 73
        -- upvalues: u2 (ref), PrismaticMarinaColors (ref), u17 (copy), ColorUtil (ref), u20 (copy), u15 (copy), TweenService (ref)
        local v21 = u2.new();
        local Color3Value = Instance.new("Color3Value");
        Color3Value.Value = PrismaticMarinaColors[1];
        v21:GiveTask(Color3Value.Changed:Connect(function(u22) -- Line: 77
            -- upvalues: u17 (ref), ColorUtil (ref), u20 (ref)
            local function _(p23) -- Line: 78
                -- upvalues: u22 (copy)
                p23.Color = u22;
            end;

            for i, v in u17 do
                local _ = i - 1;
                v.Color = u22;
            end;

            local function _(p24) -- Line: 84
                -- upvalues: ColorUtil (ref), u22 (copy)
                p24.Color3 = ColorUtil.darken(u22, 0.3);
            end;

            for i, v in u20 do
                local _ = i - 1;
                v.Color3 = ColorUtil.darken(u22, 0.3);
            end;
        end));
        local v25 = 1;

        while u15.Parent ~= nil do
            local v26 = TweenService:Create(Color3Value, TweenInfo.new(2), {
                Value = PrismaticMarinaColors[v25 + 1]
            });
            v26:Play();
            v26.Completed:Wait();
            local v27 = v25 + 1;
            v25 = #PrismaticMarinaColors <= v27 and 0 or v27;
        end;

        v21:DoCleaning();
    end);
end;

KnitClient.CreateController(u3.new());

return nil;