local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "production-config").ProductionConfig
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioConfig
return {
    ["getConfig"] = function(p5) --[[ Name: getConfig, Line 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u4
        --]]
        local v6 = u3[p5]
        if u2:IsStudio() then
            local v7 = u4[p5]
            if v7 ~= nil then
                return v7
            end
        end
        return v6
    end
}