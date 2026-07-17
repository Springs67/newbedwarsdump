-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local DamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "MagmaBlockComponent";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 15
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, p4) -- Line: 19
    -- upvalues: EntityUtil (copy), Players (copy), KnitClient (copy), DamageType (copy)
    p4.Touched:Connect(function(p5) -- Line: 20
        -- upvalues: EntityUtil (ref), Players (ref), KnitClient (ref), DamageType (ref)
        if not p5.Parent then
            return nil;
        end;

        local v6 = EntityUtil:getEntity(p5.Parent);
        local v7;

        if v6 == nil then
            v7 = v6;
        else
            v7 = v6:getInstance();
        end;

        if v7 == Players.LocalPlayer.Character then
            if v6 ~= nil then
                v6 = v6:isAlive();
            end;

            if v6 then
                KnitClient.Controllers.DamageController:requestSelfDeath(DamageType.MAGMA_BLOCK);
            end;
        end;
    end);
end;

function u1.Destroy(p8) -- Line: 40
end;

u1.Tag = "MagmaBlock";

return u1;