-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ExpireList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ExpireList;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local DamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local KnockbackUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "KnockbackController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 27
    -- upvalues: u2 (copy)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 31
    -- upvalues: KnitController (copy), ExpireList (copy)
    KnitController.constructor(p4);
    p4.Name = "KnockbackController";
    p4.lastKnockbackTime = 0;
    p4.recentlyReceivedKnockback = ExpireList.new(0.3);
end;

function u2.KnitStart(u5) -- Line: 37
    -- upvalues: EntityDamageEventZap (copy), DamageType (copy), Players (copy), Workspace (copy), default (copy), KnockbackUtil (copy)
    EntityDamageEventZap.On(function(p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19) -- Line: 38
        -- upvalues: DamageType (ref), Players (ref), u5 (copy), Workspace (ref), default (ref), KnockbackUtil (ref)
        local v20 = p8 ~= DamageType.FALL and (p6 == Players.LocalPlayer.Character and p6.PrimaryPart);

        if v20 then
            local v21;

            if p9 then
                v21 = Vector3.new(p9.X, p9.Y, p9.Z);
            else
                v21 = nil;
            end;

            if v21 == nil and (p10 and p10.PrimaryPart) then
                v21 = p10.PrimaryPart.Position;
            end;

            local v22;

            if p11 == nil then
                v22 = p11;
            else
                v22 = p11.disabled;
            end;

            if not v22 then
                local PrimaryPart = Players.LocalPlayer.Character.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.AssemblyMass;
                end;

                local v23 = Players:GetPlayerFromCharacter(p10);

                if v23 then
                    local v24 = u5.recentlyReceivedKnockback:getValues();

                    if #v24 > 0 and v24[1] ~= v23.UserId then
                        return nil;
                    end;
                end;

                if Workspace:GetServerTimeNow() - u5.lastKnockbackTime <= 0.05 then
                    return nil;
                end;

                u5.lastKnockbackTime = Workspace:GetServerTimeNow();

                if v23 then
                    u5.recentlyReceivedKnockback:add(v23.UserId);
                end;

                if p12 ~= nil then
                    default.Client:Get("AckKnockback"):SendToServer({
                        knockbackId = p12,
                        playerPosition = v20.Position
                    });
                end;

                KnockbackUtil.applyKnockback(v20, (PrimaryPart == 0 or (PrimaryPart ~= PrimaryPart or not PrimaryPart)) and 0 or PrimaryPart, v21, p11);
            end;
        end;
    end);
end;

function u2.getLastKnockbackTime(p25) -- Line: 95
    return p25.lastKnockbackTime;
end;

return {
    KnockbackController = KnitClient.CreateController(u2.new())
};