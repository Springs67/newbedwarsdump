local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").StringUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitServer
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.RunService
local u6 = v4.Workspace
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "rotation", "lucky-block-spawn-type").LuckyBlockThemeToBlock
return {
    ["LuckyBlockRotationUtil"] = {
        ["getLuckyBlockIcon"] = function(p9) --[[ Name: getLuckyBlockIcon, Line 13 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u7
            --]]
            local v10 = u8[p9]
            if v10 then
                if u7(v10).block then
                    local v11 = u7(v10).block
                    if v11 ~= nil then
                        v11 = v11.luckyBlock
                    end
                    if v11 then
                        return u7(v10).image
                    else
                        return nil
                    end
                else
                    return nil
                end
            else
                return nil
            end
        end,
        ["getLuckyBlockTextures"] = function(p12) --[[ Name: getLuckyBlockTextures, Line 32 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u7
            --]]
            local v13 = u8[p12]
            if not v13 then
                return nil
            end
            local v14 = u7(v13).block
            if v14 ~= nil then
                v14 = v14.luckyBlock
            end
            if not v14 then
                return nil
            end
            local v15 = u7(v13).block
            if v15 ~= nil then
                v15 = v15.greedyMesh
                if v15 ~= nil then
                    v15 = v15.textures
                end
            end
            return v15
        end,
        ["getNameOfTheme"] = function(p16) --[[ Name: getNameOfTheme, Line 60 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            local v17 = {}
            for v18, v19 in string.split(p16, "_") do
                local _ = v18 - 1
                local v20 = u2.capitalizeFirstLetter(v19)
                table.insert(v17, v20)
            end
            return table.concat(v17, " ") .. " Lucky Blocks"
        end,
        ["getCurrentRotation"] = function() --[[ Name: getCurrentRotation, Line 75 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u3
                [3] = u6
            --]]
            if u5:IsServer() then
                return u3.Services.LuckyBlockRotationService:getCurrentRotation()
            else
                return u6:GetAttribute("LuckyBlockTheme")
            end
        end
    }
}