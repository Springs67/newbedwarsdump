-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "ShopkeeperController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 16
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 20
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "ShopkeeperController";
end;

function u1.KnitStart(p4) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p4);
end;

function u1.getShopkeeperModel(p5, p6, u7) -- Line: 27
    -- upvalues: CollectionService (copy)
    if p6 == "item_shop" then
        local function _(p8) -- Line: 30
            -- upvalues: u7 (copy)
            return p8:GetAttribute("TeamId") == u7;
        end;

        local v9 = nil;

        for i, v in CollectionService:GetTagged("BedwarsItemShop") do
            local _ = i - 1;

            if v:GetAttribute("TeamId") == u7 == true then
                v9 = v;
                break;
            end;
        end;

        if v9 ~= nil then
            v9 = v9:FindFirstChildWhichIsA("Model");
        end;

        return v9;
    end;

    if p6 ~= "upgrade_shop" then
        return;
    end;

    local function _(p10) -- Line: 51
        -- upvalues: u7 (copy)
        return p10:GetAttribute("GeneratorTeam") == u7;
    end;

    local v11 = nil;

    for i, v in CollectionService:GetTagged("TeamUpgradeShopkeeper") do
        local _ = i - 1;

        if v:GetAttribute("GeneratorTeam") == u7 == true then
            v11 = v;
            break;
        end;
    end;

    if v11 ~= nil then
        v11 = v11:FindFirstChildWhichIsA("Model");
    end;

    return v11;
end;

KnitClient.CreateController(u1.new());

return nil;