local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers")
local u5 = v4.GetTarmacAsset
local u6 = v4.GetTarmacAssetFromPath
local u7 = {
    ["t"] = 0,
    ["d"] = 1,
    ["l"] = 2,
    ["f"] = 3,
    ["r"] = 4,
    ["b"] = 5
}
return {
    ["SetupItemMetaBlockTextures"] = function(p8, p9) --[[ Name: SetupItemMetaBlockTextures, Line 16 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
            [3] = u5
            [4] = u7
            [5] = u3
        --]]
        os.clock()
        for _, v10 in u2.entries(p8) do
            local v11 = v10[1]
            local v12 = v10[2]
            local v13 = u6({ p9 == nil and "blocks" or p9, v11 })
            if v13 then
                local v14 = false
                local v15 = 0
                local v16 = {}
                while true do
                    if true then
                        if v14 then
                            v15 = v15 + 1
                        else
                            v14 = true
                        end
                    end
                    if v15 >= 6 then
                        break
                    end
                    table.insert(v16, "")
                end
                for _, v17 in u2.keys(v13) do
                    local v18 = v12.image
                    if v18 == "" then
                        v18 = false
                    end
                    local v19 = not v18
                    if v19 then
                        v19 = v17 == "icon"
                    end
                    if v19 then
                        v12.image = u5(v17, v13).Image
                    elseif v17 == "s" then
                        local v20 = u5(v17, v13).Image
                        local v21 = false
                        local v22 = 0
                        while true do
                            if true then
                                if v21 then
                                    v22 = v22 + 1
                                else
                                    v21 = true
                                end
                            end
                            if v22 >= #v16 then
                                break
                            end
                            if v16[v22 + 1] == "" then
                                v16[v22 + 1] = v20
                            end
                        end
                    elseif type(v17) == "string" then
                        local v23 = u5(v17, v13).Image
                        for _, v24 in u2.keys(u7) do
                            if u3.includes(v17, v24) then
                                v16[u7[v24] + 1] = v23
                            end
                        end
                    end
                end
                if v12.block and v12.block.greedyMesh then
                    v12.block.greedyMesh.textures = v16
                end
            end
        end
        for _, v25 in u2.entries(p8) do
            local v26 = v25[1]
            local v27 = v25[2]
            if v27.block and (v27.block.greedyMesh and #v27.block.greedyMesh.textures == 0) then
                warn("[Item Meta]: Missing block texture for: " .. v26)
            end
        end
    end
}