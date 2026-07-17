-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local PvPArenaAugmentType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PvPArenaBaseAugmentController = RuntimeLib.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "PvPArenaTargetedStrikeAugmentController";
    end,

    __index = PvPArenaBaseAugmentController
});
u3.__index = u3;

function u3.new(...) -- Line: 21
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 25
    -- upvalues: PvPArenaBaseAugmentController (copy), PvPArenaAugmentType (copy), u1 (copy)
    PvPArenaBaseAugmentController.constructor(p5, PvPArenaAugmentType.TARGETED_STRIKE);
    p5.Name = "PvPArenaTargetedStrikeAugmentController";
    p5.billboardMaid = u1.new();
end;

function u3.onGameInit(u6) -- Line: 30
    -- upvalues: default (copy), Players (copy)
    default.Client:Get("PvPArenaTargetedStrikeTriggered"):Connect(function(p7) -- Line: 31
        -- upvalues: Players (ref), u6 (copy)
        if Players.LocalPlayer == p7.applyingPlayer then
            u6:applyEffects(p7.markedPlayer);
        end;
    end);
    default.Client:Get("PvPArenaTargetedStrikeRemoved"):Connect(function(p8) -- Line: 36
        -- upvalues: u6 (copy)
        u6.billboardMaid:DoCleaning();
    end);
end;

function u3.onActivated(p9) -- Line: 40
end;

function u3.applyEffects(p10, p11) -- Line: 42
    -- upvalues: EntityUtil (copy), u2 (copy)
    local v12 = EntityUtil:getEntity(p11);

    if v12 ~= nil then
        v12 = v12:getInstance();
    end;

    if not v12 then
        return nil;
    end;

    local u13 = u2("BillboardGui", {
        ResetOnSpawn = false,
        AlwaysOnTop = true,
        Parent = v12.PrimaryPart,
        Size = UDim2.fromScale(3, 3),
        Children = { u2("ImageLabel", {
                ImageTransparency = 0.25,
                BackgroundTransparency = 1,
                Image = "rbxassetid://16830265561",
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1, 0, 1, 0),
                ImageColor3 = Color3.fromRGB(255, 0, 0)
            }) }
    });
    p10.billboardMaid:GiveTask(function() -- Line: 66
        -- upvalues: u13 (copy)
        u13:Destroy();
    end);
end;

KnitClient.CreateController(u3.new());

return nil;