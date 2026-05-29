local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").HttpService
return {
    ["ALCHEMIST_FLASK_STAGE_ATTR"] = "AlchemistFlaskStage",
    ["ALCHEMIST_FLASK_BREW_SEQ_ATTR"] = "AlchemistFlaskBrewSeq",
    ["encodeAlchemistFlaskStage"] = function(p2) --[[ Name: encodeAlchemistFlaskStage, Line 8 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return #p2 == 0 and "" or u1:JSONEncode(p2)
    end,
    ["parseAlchemistFlaskStage"] = function(u3) --[[ Name: parseAlchemistFlaskStage, Line 14 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if typeof(u3) ~= "string" then
            return {}
        end
        if u3 == "" then
            return {}
        end
        local v4, v5 = pcall(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u3
            --]]
            return u1:JSONDecode(u3)
        end)
        return (not v4 or v5 == nil) and {} or v5
    end,
    ["countStagedIngredient"] = function(p6, p7) --[[ Name: countStagedIngredient, Line 32 ]]
        local v8 = 0
        for _, v9 in p6 do
            if v9 == p7 then
                v8 = v8 + 1
            end
        end
        return v8
    end
}