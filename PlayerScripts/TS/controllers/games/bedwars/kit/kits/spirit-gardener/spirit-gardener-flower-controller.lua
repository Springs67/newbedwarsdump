-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local SpiritGardenerFlowerHealthUi = RuntimeLib.import(script, script.Parent, "ui", "spirit-gardener-flower-health-ui").SpiritGardenerFlowerHealthUi;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "SpiritGardenerFlowerController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "SpiritGardenerFlowerController";
end;

function u4.KnitStart(u7) -- Line: 31
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), KnitClient (copy), Players (copy), BedwarsKit (copy), u2 (copy), GameQueryUtil (copy), u3 (copy), SpiritGardenerFlowerHealthUi (copy)
    KnitController.KnitStart(u7);
    WatchCollectionTag("SpiritGardenerFlower", function(p8) -- Line: 34
        -- upvalues: KnitClient (ref), Players (ref), BedwarsKit (ref), u2 (ref), GameQueryUtil (ref), u3 (ref), SpiritGardenerFlowerHealthUi (ref)
        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.SPIRIT_GARDENER) then
            return nil;
        end;

        if p8:GetAttribute("PlacedByUserId") ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        p8:SetAttribute("NoHealthbar", true);
        local v9 = u2("Part", {
            Name = "FlowerHealth",
            Size = Vector3.new(1, 1, 1),
            Transparency = 1,
            Anchored = true,
            CanCollide = false,
            CFrame = CFrame.new(p8.Position),
            Parent = p8
        });
        GameQueryUtil:setQueryIgnored(v9, true);
        u3.mount(u3.createElement(SpiritGardenerFlowerHealthUi, {
            billboardPart = v9,
            spiritGardenerFlower = p8
        }), v9, "FlowerHealthBillboard");
    end);
    WatchCollectionTag("SpiritGardenerFlower", function(u10) -- Line: 58
        -- upvalues: u7 (copy)
        local stage_1 = u10:WaitForChild("stage_1");
        local stage_2 = u10:WaitForChild("stage_2");
        local stage_3 = u10:WaitForChild("stage_3");

        if not (stage_1 and (stage_2 and stage_3)) then
            return nil;
        end;

        u10:GetAttributeChangedSignal("FlowerDamaged"):Connect(function() -- Line: 65
            -- upvalues: u10 (copy), u7 (ref), stage_2 (copy), stage_3 (copy)
            local v11 = u10:GetAttribute("FlowerDamaged");

            if v11 == 0 or (v11 ~= v11 or (v11 == "" or not v11)) then
                u7:changeTransparencyOfDescendants(stage_2, 0);
                u7:changeTransparencyOfDescendants(stage_3, 1);
                u10:SetAttribute("CurrentStage", 2);

                return;
            end;

            u7:changeTransparencyOfDescendants(stage_2, 1);
            u7:changeTransparencyOfDescendants(stage_3, 0);
            u10:SetAttribute("CurrentStage", 3);
        end);
        u10:GetAttributeChangedSignal("HasFullyGrown"):Connect(function() -- Line: 77
            -- upvalues: u10 (copy), u7 (ref), stage_1 (copy), stage_2 (copy)
            local v12 = u10:GetAttribute("HasFullyGrown");

            if v12 ~= 0 and (v12 == v12 and (v12 ~= "" and v12)) then
                u7:changeTransparencyOfDescendants(stage_1, 1);
                u7:changeTransparencyOfDescendants(stage_2, 0);
                u10:SetAttribute("CurrentStage", 2);
            end;
        end);
    end);
end;

function u4.changeTransparencyOfDescendants(p13, u14, u15) -- Line: 87
    local function _(p16) -- Line: 89
        -- upvalues: u14 (copy), u15 (copy)
        if p16 ~= u14 then
            if p16:IsA("MeshPart") then
                p16.Transparency = u15;
            end;

            if p16:IsA("ParticleEmitter") then
                p16.Enabled = u15 == 0;
            end;
        end;
    end;

    for i, descendant in u14:GetDescendants() do
        local _ = i - 1;

        if descendant ~= u14 then
            if descendant:IsA("MeshPart") then
                descendant.Transparency = u15;
            end;

            if descendant:IsA("ParticleEmitter") then
                descendant.Enabled = u15 == 0;
            end;
        end;
    end;
end;

KnitClient.CreateController(u4.new());

return nil;