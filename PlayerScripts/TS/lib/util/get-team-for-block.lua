-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "store").ClientStore;

return {
    default = function(p1) -- Line: 5, Name: getTeamForBlock
        -- upvalues: Players (copy), ClientStore (copy)
        local u2 = Players:GetPlayerByUserId((p1:GetAttribute("PlacedByUserId")));

        if u2 == nil then
            return nil;
        end;

        local function _(p3) -- Line: 12
            -- upvalues: u2 (copy)
            local Team = u2.Team;

            if Team ~= nil then
                Team = Team.Name;
            end;

            return p3.name == Team;
        end;

        local v4 = nil;

        for i, v in ClientStore:getState().Game.teams do
            local _ = i - 1;
            local Team = u2.Team;

            if Team ~= nil then
                Team = Team.Name;
            end;

            if v.name == Team == true then
                v4 = v;
                break;
            end;
        end;

        return v4;
    end
};