-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "BrbSignController";
    end,

    __index = HandKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: HandKnitController (copy), default (copy), u1 (copy)
    HandKnitController.constructor(p4);
    p4.Name = "BrbSignController";
    p4.playerMaid = {};
    p4.request = default.Client:Get("AfkSignRequest");
    p4.partialInvisibility = {
        transparency = 0.9
    };
    p4.fullInvisibility = {
        transparency = 1
    };
    p4.localMaid = u1.new();
    p4.isActive = false;
end;

function u2.KnitStart(p5) -- Line: 40
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p5);
end;

function u2.isRelevantItem(p6, p7) -- Line: 43
    -- upvalues: ItemType (copy)
    return p7.itemType == ItemType.BRB_SIGN;
end;

function u2.onEnable(p8, p9, p10) -- Line: 46
    p8:hookLocalPlayer();
    p8:active();
end;

function u2.onDisable(p11) -- Line: 51
    p11:deactive();
    p11.localMaid:DoCleaning();
end;

function u2.active(p12) -- Line: 56
    -- upvalues: AnimationUtil (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy)
    local u13 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HOLDING_SIGN), {
        looped = true
    });
    p12.localMaid:GiveTask(function() -- Line: 63
        -- upvalues: u13 (copy)
        local v14 = u13;

        if v14 ~= nil then
            v14:Stop();
        end;

        local v15 = u13;

        if v15 ~= nil then
            v15:Destroy();
        end;
    end);
end;

function u2.deactive(p16) -- Line: 74
    p16.localMaid:DoCleaning();
end;

function u2.hookLocalPlayer(u17) -- Line: 78
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    local u18 = Character;
    local u19 = 0;

    if not u18 then
        return nil;
    end;

    u17.localMaid:GiveTask(task.spawn(function() -- Line: 91
        -- upvalues: Players (ref), u17 (copy), u18 (ref), u19 (ref)
        while true do
            local v20;

            while true do
                local v21 = task.wait(1);

                if v21 == 0 or (v21 ~= v21 or not v21) then
                    return;
                end;

                v20 = Players.LocalPlayer.Character;

                if v20 ~= nil then
                    v20 = v20.PrimaryPart;

                    if v20 ~= nil then
                        v20 = v20.Position;
                    end;
                end;

                if not u17.isActive and u18 then
                    break;
                end;

                if not u18 then
                    if v20 then
                        u18 = v20;
                    end;
                end;

                u19 = 0;
                local Character2 = Players.LocalPlayer.Character;

                if Character2 ~= nil then
                    Character2 = Character2.PrimaryPart;

                    if Character2 ~= nil then
                        Character2 = Character2.Position;
                    end;
                end;

                if Character2 then
                    if (Character2 - u18).Magnitude > 1 then
                        u17:deactive();
                    end;

                    if v20 then
                        u18 = v20;
                    end;
                end;

                u17:deactive();
            end;

            if v20 then
                if (v20 - u18).Magnitude < 1 then
                    u19 = u19 + 1;
                end;

                if u19 > 1 then
                    u17:active();
                    u19 = 0;
                end;

                if v20 then
                    u18 = v20;
                end;
            end;
        end;
    end));
end;

KnitClient.CreateController(u2.new());

return nil;