local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["SettingsGamepadControlsPage"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(_, p3) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local _ = p3.useState
        return u2.createFragment()
    end)
}