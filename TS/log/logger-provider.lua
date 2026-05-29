local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "extra-log-data").ExtraLogDataProperties
return {
    ["LoggerProvider"] = {
        ["getLogger"] = function(p4) --[[ Name: getLogger, Line 14 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u3
            --]]
            return u2.Default():ForProperty(u3.Namespace, p4)
        end
    }
}