local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
return {
    ["createSounds"] = function(...) --[[ Name: createSounds, Line 4 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v2 = 0
        local v3 = {}
        for v4, v5 in { ... } do
            local _ = v4 - 1
            local v6 = u1:createSound(v5)
            if v6 ~= nil then
                v2 = v2 + 1
                v3[v2] = v6
            end
        end
        return v3
    end
}