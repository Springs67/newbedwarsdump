-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "octo-tree", "out");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "BananaPeelController";
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
    p6.Name = "BananaPeelController";
end;

function u4.KnitStart(p7) -- Line: 31
    -- upvalues: KnitController (copy), u2 (copy), CollectionService (copy), RuntimeLib (copy), ReplicatedStorage (copy), Players (copy), BLOCK_SIZE (copy), KnitClient2 (copy)
    KnitController.KnitStart(p7);
    local u8 = u2.new();
    CollectionService:GetInstanceAddedSignal("banana_peel"):Connect(RuntimeLib.async(function(u9) -- Line: 34
        -- upvalues: ReplicatedStorage (ref), u8 (copy)
        local v10 = #ReplicatedStorage.Assets.Misc.BananaPeel:GetDescendants();
        local u11 = #u9:GetDescendants();
        u9.DescendantAdded:Connect(function() -- Line: 38
            -- upvalues: u11 (ref)
            u11 = u11 + 1;
        end);

        while u11 < v10 do
            task.wait();
        end;

        local u12 = u8:CreateNode(u9:GetPivot().Position, {});
        u9.AncestryChanged:Connect(function() -- Line: 45
            -- upvalues: u9 (copy), u8 (ref), u12 (copy)
            if u9.Parent then
                return nil;
            end;

            u8:RemoveNode(u12);
        end);
    end));
    task.spawn(function() -- Line: 52
        -- upvalues: Players (ref), u8 (copy), BLOCK_SIZE (ref), KnitClient2 (ref)
        while true do
            local v13 = task.wait(0.1);

            if v13 == 0 or (v13 ~= v13 or not v13) then
                break;
            end;

            local Character = Players.LocalPlayer.Character;

            if Character then
                local Position = Character:GetPivot().Position;

                if Position and (#u8:GetNearest(Position, BLOCK_SIZE, 1) ~= 0 and Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Physics) then
                    KnitClient2.Controllers.TaserController:taseSelf(0.5);
                end;
            end;
        end;
    end);
end;

KnitClient.CreateController(u4.new());

return nil;