local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-melees").BedWarsDaggers
return {
    ["isDagger"] = function(p2) --[[ Name: isDagger, Line 4 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return table.find(u1, p2) ~= nil
    end
}