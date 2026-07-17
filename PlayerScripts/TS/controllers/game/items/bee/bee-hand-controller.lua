-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "BeeHandController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 26
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p5, ...);
    p5.Name = "BeeHandController";
    p5.maid = u1.new();
end;

function u3.KnitStart(p6) -- Line: 31
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p6);
end;

function u3.toggleAllBeehivePrompts(p7, p8) -- Line: 34
    -- upvalues: CollectionService (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy)
    for _, v in CollectionService:GetTagged("beehive") do
        if v:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId then
            local v9 = v:FindFirstChildOfClass("ProximityPrompt");

            if v9 then
                v9.Enabled = p8;
                p7.maid:GiveTask(v9.TriggerEnded:Connect(function(p10) -- Line: 42
                    -- upvalues: Players (ref), GameAnimationUtil (ref), AnimationType (ref)
                    if p10 == Players.LocalPlayer then
                        GameAnimationUtil:playAnimation(p10, AnimationType.PUNCH);
                    end;
                end));
            end;
        end;
    end;
end;

function u3.onEnable(p11, p12) -- Line: 51
    p11:toggleAllBeehivePrompts(true);
end;

function u3.onDisable(p13) -- Line: 54
    p13.maid:DoCleaning();
    p13:toggleAllBeehivePrompts(false);
end;

function u3.isRelevantItem(p14, p15) -- Line: 58
    -- upvalues: ItemType (copy)
    return p15.itemType == ItemType.BEE;
end;

KnitClient.CreateController(u3.new());

return nil;