local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-unlock-definition").armorTrimUnlockDefinition
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "progress", "armor-trim-progress-util").ArmorTrimProgressUtil
return {
    ["ArmorTrimUnlock"] = {
        ["getNextUnlock"] = function(p7, p8) --[[ Name: getNextUnlock, Line 11 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u4
                [3] = u6
                [4] = u5
                [5] = u2
            --]]
            if #p7 >= #u3.keys(u4) then
                return {
                    ["isSuccess"] = false,
                    ["errorReason"] = "All Armor Trims unlocked."
                }
            end
            local v9 = true
            for v10, v11 in p7 do
                local _ = v10 - 1
                if not u6.isNextArmorTrimUnlockable(v11.xpEarned) then
                    v9 = false
                    break
                end
            end
            if not v9 then
                return {
                    ["isSuccess"] = false,
                    ["errorReason"] = "Player has an armor trim that isn\'t at the max tier."
                }
            end
            local u12 = u5.getUnlockableArmorTrims(p7, p8)
            if #u12 == 0 then
                return {
                    ["isSuccess"] = false,
                    ["errorReason"] = "No Armor Trims to unlock."
                }
            end
            local function v19(p13) --[[ Line: 52 ]]
                --[[
                Upvalues:
                    [1] = u4
                --]]
                local v14 = math
                local v15 = u4[p13]
                if v15 ~= nil then
                    v15 = v15.unlockWeight
                end
                local v16 = v15 == nil and 0 or v15
                local v17 = v14.floor(v16)
                local v18
                if v17 == 0 or (v17 ~= v17 or not v17) then
                    v18 = v17
                else
                    v18 = v17 > 1
                end
                return v18 ~= 0 and (v18 == v18 and v18) and {
                    ["trim"] = p13,
                    ["count"] = v17 - 1
                } or nil
            end
            local v20 = 0
            local v21 = {}
            for v22, v23 in u12 do
                local v24 = v19(v23, v22 - 1, u12)
                if v24 ~= nil then
                    v20 = v20 + 1
                    v21[v20] = v24
                end
            end
            local function v31(p25) --[[ Line: 84 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                local v26 = false
                local v27 = 0
                while true do
                    if v26 then
                        v27 = v27 + 1
                    else
                        v26 = true
                    end
                    local v28 = p25.count
                    if v27 >= math.floor(v28) then
                        return
                    end
                    local v29 = p25.trim
                    local v30 = u12
                    table.insert(v30, v29)
                end
            end
            for v32, v33 in v21 do
                v31(v33, v32 - 1, v21)
            end
            return {
                ["isSuccess"] = true,
                ["trim"] = u2.fromList(unpack(u12))
            }
        end
    }
}