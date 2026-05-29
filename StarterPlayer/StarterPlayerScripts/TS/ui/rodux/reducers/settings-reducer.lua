local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-util").makeStarterSettings()
return {
    ["SettingsReducer"] = function(p4, p5) --[[ Name: SettingsReducer, Line 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        if p4 == nil then
            p4 = u3
        end
        if p5.type == "SettingsUpdateAll" then
            return u2.deepCopy(p5.settings)
        end
        if p5.type ~= "SettingsUpdateSome" then
            return p4
        end
        local v6 = u2.deepCopy(p4)
        for _, v7 in u2.keys(p5.settings) do
            v6[v7] = p5.settings[v7]
        end
        return v6
    end
}