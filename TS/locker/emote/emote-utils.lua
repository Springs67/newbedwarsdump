local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
return {
    ["EmoteUtils"] = {
        ["emoteDuration"] = 4,
        ["emoteCooldown"] = 1,
        ["getIconResult"] = function(p4) --[[ Name: getIconResult, Line 12 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u2
            --]]
            local v5 = u3[p4]
            if v5.randomIcons and #v5.randomIcons ~= 0 then
                return u2.randomArraySelectN(u2.shuffleArray(v5.randomIcons), 1)[1]
            else
                return nil
            end
        end
    }
}