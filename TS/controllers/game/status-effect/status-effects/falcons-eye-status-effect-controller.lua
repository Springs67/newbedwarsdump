-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "FalconsEyeStatusEffectController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 25
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "FalconsEyeStatusEffectController";
    p6.maidMap = {};
end;

function u4.KnitStart(u7) -- Line: 34
    -- upvalues: KnitController (copy), default (copy), Players (copy), ClientSyncEvents (copy), StatusEffectType (copy)
    KnitController.KnitStart(u7);
    default.Client:Get("FalconsEyeMarked"):Connect(function(p8) -- Line: 36
        -- upvalues: Players (ref), u7 (copy)
        local v9 = Players:GetPlayerFromCharacter(p8.target);

        if Players.LocalPlayer == p8.giver then
            u7:setEffects(p8.target);
        end;

        if v9 and Players.LocalPlayer == v9 then
            u7:setEffects(p8.target);
        end;
    end);
    default.Client:Get("FalconsEyeUnmarked"):Connect(function(p10) -- Line: 45
        -- upvalues: Players (ref), u7 (copy)
        local v11 = Players:GetPlayerFromCharacter(p10.target);

        if Players.LocalPlayer ~= p10.giver and Players.LocalPlayer ~= v11 then
            return nil;
        end;

        local v12 = u7.maidMap[p10.target];

        if not v12 then
            return nil;
        end;

        v12:DoCleaning();
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p13) -- Line: 58
        -- upvalues: StatusEffectType (ref), u7 (copy)
        if p13.statusEffect == StatusEffectType.FALCONS_EYE then
            local v14 = u7.maidMap[p13.entityInstance];

            if not v14 then
                return nil;
            end;

            v14:DoCleaning();
        end;
    end);
end;

function u4.setEffects(p15, p16, p17, p18) -- Line: 70
    -- upvalues: u2 (copy), ColorUtil (copy), EntityUtil (copy), Players (copy), CollectionService (copy), u1 (copy)
    local u19 = u2("BillboardGui", {
        ResetOnSpawn = false,
        AlwaysOnTop = true,
        Parent = p16.PrimaryPart,
        Size = UDim2.fromScale(3, 3),
        Children = { u2("ImageLabel", {
                ImageTransparency = 0.25,
                BackgroundTransparency = 1,
                Image = "rbxassetid://16830265561",
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = p17 or UDim2.new(1.5, 0, 1.5, 0),
                ImageColor3 = p18 or ColorUtil.WHITE
            }) }
    });
    local v20 = EntityUtil:getPlayerFromEntityInstance(p16);

    if v20 and v20 == Players.LocalPlayer then
        CollectionService:AddTag(u19, "FirstPersonHidden");
    end;

    if not p15.maidMap[p16] then
        p15.maidMap[p16] = u1.new();
    end;

    p15.maidMap[p16]:GiveTask(function() -- Line: 101
        -- upvalues: u19 (copy)
        u19:Destroy();
    end);
end;

KnitClient.CreateController(u4.new());

return nil;