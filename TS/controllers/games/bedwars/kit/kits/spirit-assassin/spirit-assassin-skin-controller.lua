-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local TweenService = v2.TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local u3 = {
    Color3.fromRGB(255, 89, 89),
    Color3.fromRGB(218, 133, 65),
    Color3.fromRGB(91, 154, 76),
    Color3.fromRGB(82, 124, 174),
    Color3.fromRGB(180, 128, 255)
};
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "SpiritAssassinSkinController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "SpiritAssassinSkinController";
end;

function u4.KnitStart(u7) -- Line: 32
    -- upvalues: KnitController (copy), Players (copy), WatchCharacter (copy)
    KnitController.KnitStart(u7);
    local _ = Players.LocalPlayer;
    WatchCharacter(function(u8, u9, p10) -- Line: 35
        -- upvalues: u7 (copy)
        if u7:isPrismaticSkinEquipped(u8) then
            u7:applyRGBEffect(u9);

            return;
        end;

        p10:GiveTask(u9:GetAttributeChangedSignal("KitSkin"):Connect(function() -- Line: 39
            -- upvalues: u7 (ref), u8 (copy), u9 (copy)
            if u7:isPrismaticSkinEquipped(u8) then
                u7:applyRGBEffect(u9);
            end;
        end));
    end);
end;

function u4.isPrismaticSkinEquipped(p11, p12) -- Line: 47
    -- upvalues: KnitClient (copy), isUsingKit (copy), BedwarsKit (copy), BedwarsKitSkin (copy)
    local Character = p12.Character;

    if not Character then
        return false;
    end;

    local v13 = KnitClient.Controllers.KitController:getKitSkin(Character);
    KnitClient.Controllers.KitController:getActiveKits(p12);
    local v14 = isUsingKit(p12, BedwarsKit.SPIRIT_ASSASSIN) and v13 == BedwarsKitSkin.SPIRIT_ASSASSIN_PRISMATIC;

    return v14;
end;

function u4.applyRGBEffect(p15, u16) -- Line: 56
    -- upvalues: u1 (copy), u3 (copy), TweenService (copy)
    local u17 = {
        u16:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("Hair"),
        u16:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("Neon1"),
        u16:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("Neon2"),
        u16:WaitForChild("3DClothing"):WaitForChild("LeftUpperLeg"):WaitForChild("Neon"),
        u16:WaitForChild("3DClothing"):WaitForChild("RightUpperLeg"):WaitForChild("Neon"),
        u16:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon1"),
        u16:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon2"),
        u16:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon3")
    };
    task.spawn(function() -- Line: 58
        -- upvalues: u1 (ref), u3 (ref), u17 (copy), u16 (copy), TweenService (ref)
        local v18 = u1.new();
        local Color3Value = Instance.new("Color3Value");
        Color3Value.Value = u3[1];
        v18:GiveTask(Color3Value.Changed:Connect(function(u19) -- Line: 62
            -- upvalues: u17 (ref)
            local function _(p20) -- Line: 63
                -- upvalues: u19 (copy)
                p20.Color = u19;
            end;

            for i, v in u17 do
                local _ = i - 1;
                v.Color = u19;
            end;
        end));
        local v21 = 1;

        while u16.Parent ~= nil do
            local v22 = TweenService:Create(Color3Value, TweenInfo.new(1), {
                Value = u3[v21 + 1]
            });
            v22:Play();
            v22.Completed:Wait();
            local v23 = v21 + 1;
            v21 = #u3 <= v23 and 0 or v23;
        end;

        v18:DoCleaning();
    end);
end;

KnitClient.CreateController(u4.new());

return nil;