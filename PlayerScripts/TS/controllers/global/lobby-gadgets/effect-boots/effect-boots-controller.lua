-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "EffectBootsController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 20
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 24
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p5);
    p5.Name = "EffectBootsController";
    p5.maid = u2.new();
end;

function u3.KnitStart(u6) -- Line: 29
    -- upvalues: KnitController (copy), ClientStore (copy), ItemType (copy), KnitClient2 (copy)
    KnitController.KnitStart(u6);
    ClientStore.changed:connect(function(p7, p8) -- Line: 31
        -- upvalues: u6 (copy), ItemType (ref), KnitClient2 (ref)
        local armor = p7.Inventory.observedInventory.inventory.armor;

        if p8.Inventory.observedInventory.inventory.armor == armor then
            return nil;
        end;

        local speedModifier = u6.speedModifier;

        if speedModifier ~= nil then
            speedModifier:Destroy();
        end;

        local jumpModifier = u6.jumpModifier;

        if jumpModifier ~= nil then
            jumpModifier:Destroy();
        end;

        u6.maid:DoCleaning();

        local function v14(u9) -- Line: 46
            -- upvalues: armor (copy)
            local function _(p10) -- Line: 47
                -- upvalues: u9 (copy)
                local v11;

                if p10 == "empty" then
                    v11 = false;
                else
                    v11 = p10.itemType == u9;
                end;

                return v11;
            end;

            local v12 = nil;

            for i, v in armor do
                local _ = i - 1;
                local v13;

                if v == "empty" then
                    v13 = false;
                else
                    v13 = v.itemType == u9;
                end;

                if v13 == true then
                    v12 = v;
                    break;
                end;
            end;

            return v12 ~= nil;
        end;

        if v14(ItemType.SPEED_BOOTS) then
            u6.speedModifier = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
                blockSprint = true,
                moveSpeedMultiplier = 2
            });
        end;

        if v14(ItemType.JUMP_BOOTS) then
            u6.jumpModifier = KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
                jumpHeightMultiplier = 2,
                airJumps = 1
            });
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;