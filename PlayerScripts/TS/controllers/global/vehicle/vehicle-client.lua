-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;

return {
    VehicleClient = {
        constructor = function(p2, p3) -- Line: 9, Name: constructor
            p2.vehicleModel = p3;
            p2.enginePowerRatio = 0;
        end,

        onEnable = function(p4) -- Line: 13, Name: onEnable
        end,

        enable = function(u5, u6) -- Line: 15, Name: enable
            -- upvalues: Players (copy), u1 (copy), default (copy)
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:FindFirstChild("Humanoid");
            end;

            if not Character then
                return nil;
            end;

            local u7 = u1.new();
            u7:GiveTask(function() -- Line: 25
                -- upvalues: u5 (copy)
                u5:onDisable();
            end);
            u7:GiveTask(u6:GetPropertyChangedSignal("Occupant"):Connect(function() -- Line: 28
                -- upvalues: u6 (copy), Character (copy), u7 (copy)
                if u6.Occupant == nil or u6.Occupant ~= Character then
                    u7:DoCleaning();
                end;
            end));
            local u8 = true;
            u7:GiveTask(function() -- Line: 35
                -- upvalues: u8 (ref)
                u8 = false;
            end);
            task.spawn(function() -- Line: 38
                -- upvalues: default (ref), u8 (ref), u5 (copy)
                local u9 = default.Client:GetNamespace("Vehicle"):Get("SetEnginePower");
                local u10 = -1;

                while true do
                    local v11 = task.wait(0.1);

                    if v11 ~= 0 and (v11 == v11 and v11) then
                        v11 = u8;
                    end;

                    if v11 == 0 or (v11 ~= v11 or not v11) then
                        return;
                    end;

                    task.spawn(function() -- Line: 49
                        -- upvalues: u10 (ref), u5 (ref), u9 (copy)
                        if u10 ~= u5.enginePowerRatio then
                            u10 = u5.enginePowerRatio;
                            u9:SendToServer(u5.vehicleModel, u5.enginePowerRatio);
                        end;
                    end);
                end;
            end);
        end,

        onDisable = function(p12) -- Line: 58, Name: onDisable
        end,

        setEnginePowerRatio = function(p13, p14) -- Line: 60, Name: setEnginePowerRatio
            p13.enginePowerRatio = p14;
        end
    }
};