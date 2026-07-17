-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local RunService = v3.RunService;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "BarrierBlockController";
    end,

    __index = HandKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 27
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p6);
    p6.Name = "BarrierBlockController";
    p6.maid = u1.new();
end;

function u4.KnitStart(p7) -- Line: 32
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p7);
end;

function u4.isRelevantItem(p8, p9) -- Line: 35
    -- upvalues: ItemType (copy)
    return p9.itemType == ItemType.BARRIER;
end;

function u4.onEnable(p10) -- Line: 38
    p10:revealBarriers();
end;

function u4.onDisable(p11) -- Line: 41
    -- upvalues: CollectionService (copy)
    p11.maid:DoCleaning();

    local function _(p12) -- Line: 45
        local v13 = p12:FindFirstChildOfClass("SelectionBox");

        if v13 then
            v13.Visible = false;
        end;
    end;

    for i, v in CollectionService:GetTagged("BARRIER_BLOCK") do
        local _ = i - 1;
        local v14 = v:FindFirstChildOfClass("SelectionBox");

        if v14 then
            v14.Visible = false;
        end;
    end;
end;

function u4.revealBarriers(p15) -- Line: 55
    -- upvalues: RunService (copy), Players (copy), CollectionService (copy), u2 (copy)
    local u16 = 0;
    local v23 = RunService.Heartbeat:Connect(function(p17) -- Line: 58
        -- upvalues: u16 (ref), Players (ref), CollectionService (ref), u2 (ref)
        if u16 > time() then
            return nil;
        end;

        u16 = time() + 0.1;
        local Character = Players.LocalPlayer.Character;

        if not Character then
            return nil;
        end;

        if Character ~= nil then
            Character = Character:GetPivot();
        end;

        local v18 = CollectionService:GetTagged("BARRIER_BLOCK");

        local function v22(p19) -- Line: 74
            -- upvalues: Character (copy), u2 (ref)
            local v20 = (Character.Position - p19.Position).Magnitude <= 30;
            local v21 = p19:FindFirstChildOfClass("SelectionBox");

            if not v20 then
                if v21 then
                    v21.Visible = false;
                end;

                return;
            end;

            if v21 then
                v21.Visible = true;

                return;
            end;

            u2("SelectionBox", {
                LineThickness = 0.04,
                Transparency = 0,
                SurfaceTransparency = 0.6,
                Adornee = p19,
                Parent = p19,
                Color3 = Color3.fromRGB(255, 61, 61),
                SurfaceColor3 = Color3.fromRGB(186, 41, 41)
            });
        end;

        for i, v in v18 do
            v22(v, i - 1, v18);
        end;
    end);
    p15.maid:GiveTask(v23);
end;

return {
    BarrierBlockController = KnitClient.CreateController(u4.new())
};