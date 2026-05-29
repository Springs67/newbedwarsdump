local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-types").TournamentDivision
return {
    ["TournamentTeamUtil"] = {
        ["LOWER_DIVISION_CUTOFF"] = 1550,
        ["UPPER_DIVISION_CUTOFF"] = 2020,
        ["EXPIRATION_TIME"] = 1296000,
        ["MAX_TEAM_NAME_LENGTH"] = 20,
        ["MAX_TEAM_MEMBERS"] = 8,
        ["MAX_TEAM_INVITES"] = 12,
        ["TEAM_NAME_EDIT_COOLDOWN"] = 30,
        ["TEAM_ICON_EDIT_COOLDOWN"] = 30,
        ["convertNameToTag"] = function(p4) --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            local v5 = 0
            local v6 = {}
            for v7, v8 in string.split(p4, " ") do
                if v7 - 1 < 3 == true then
                    v5 = v5 + 1
                    v6[v5] = v8
                end
            end
            local v9 = table.create(#v6)
            for v10, v11 in v6 do
                local _ = v10 - 1
                v9[v10] = u2.slice(v11, 0, 1)
            end
            return string.upper(table.concat(v9, ""))
        end,
        ["convertDivisionToText"] = function(p12) --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            return p12 == u3.Division_I and "Division I" or (p12 == u3.Division_II and "Division II" or (p12 == u3.Division_III and "Division III" or "Division III"))
        end
    }
}