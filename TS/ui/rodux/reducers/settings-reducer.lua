-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-util").makeStarterSettings();

return {
    SettingsReducer = function(p3, p4) -- Line: 6, Name: SettingsReducer
        -- upvalues: u2 (copy), u1 (copy)
        if p3 == nil then
            p3 = u2;
        end;

        if p4.type == "SettingsUpdateAll" then
            return u1.deepCopy(p4.settings);
        end;

        if p4.type ~= "SettingsUpdateSome" then
            return p3;
        end;

        local v5 = u1.deepCopy(p3);

        for _, v in u1.keys(p4.settings) do
            v5[v] = p4.settings[v];
        end;

        return v5;
    end
};