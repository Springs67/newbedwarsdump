local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-meta").SettingMeta
return {
    ["makeStarterSettings"] = function(_) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        local v5 = u2.entries(u4)
        local v6 = {}
        for v7 = 1, #v5 do
            local v8 = v5[v7]
            local _ = v7 - 1
            v6[v8[1]] = v8[2].defaultValue
        end
        return v6
    end,
    ["SettingsUtil"] = {
        ["getBoolean"] = function(p9) --[[ Name: getBoolean, Line 36 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            if u3.string(p9) then
                p9 = string.lower(p9)
            end
            local v10 = p9 == true
            local v11 = (v10 or p9 == "true") and true or v10
            local v12 = (v11 or p9 == 1) and true or v11
            local v13 = (v12 or p9 == "1") and true or v12
            local v14 = (v13 or p9 == "on") and true or v13
            if v14 or p9 == "yes" then
                return true
            else
                local v15 = p9 == false and true or v14
                local v16 = (v15 or p9 == "false") and true or v15
                local v17 = (v16 or p9 == 0) and true or v16
                local v18 = (v17 or p9 == "0") and true or v17
                if (v18 or p9 == "off") and true or v18 or p9 == "no" then
                    return false
                else
                    return nil
                end
            end
        end
    }
}