local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers")
local u5 = v4.GetTarmacAsset
local u6 = v4.GetTarmacAssetFromPath
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "texture-packs", "texture-packs").getTexturePackMeta
local u9 = {
    ["t"] = 0,
    ["d"] = 1,
    ["l"] = 2,
    ["f"] = 3,
    ["r"] = 4,
    ["b"] = 5
}
return {
    ["TexturePackHandler"] = {
        ["setupTexturePack"] = function(p10) --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u2
                [3] = u7
                [4] = u6
                [5] = u5
                [6] = u9
                [7] = u3
            --]]
            local v11 = u8(p10)
            if v11.blockTextures then
                return nil
            end
            local v12 = u8(p10).tarmacAssetPath
            for _, v13 in u2.entries(u7) do
                local v14 = v13[1]
                local v15 = v13[2]
                if v15.block and v15.block.greedyMesh then
                    local v16 = u6({ v12, v14 })
                    if v16 then
                        local v17 = false
                        local v18 = 0
                        local v19 = {}
                        while true do
                            if true then
                                if v17 then
                                    v18 = v18 + 1
                                else
                                    v17 = true
                                end
                            end
                            if v18 >= 6 then
                                break
                            end
                            table.insert(v19, "")
                        end
                        for _, v20 in u2.keys(v16) do
                            local v21 = v15.image
                            if v21 == "" then
                                v21 = false
                            end
                            local v22 = not v21
                            if v22 then
                                v22 = v20 == "icon"
                            end
                            if v22 then
                                v15.image = u5(v20, v16).Image
                            elseif v20 == "s" then
                                local v23 = u5(v20, v16).Image
                                local v24 = false
                                local v25 = 0
                                while true do
                                    if true then
                                        if v24 then
                                            v25 = v25 + 1
                                        else
                                            v24 = true
                                        end
                                    end
                                    if v25 >= #v19 then
                                        break
                                    end
                                    if v19[v25 + 1] == "" then
                                        v19[v25 + 1] = v23
                                    end
                                end
                            elseif type(v20) == "string" then
                                local v26 = u5(v20, v16).Image
                                for _, v27 in u2.keys(u9) do
                                    if u3.includes(v20, v27) then
                                        v19[u9[v27] + 1] = v26
                                    end
                                end
                            end
                        end
                        if v11.blockTextures == nil then
                            v11.blockTextures = {}
                        end
                        v11.blockTextures[v14] = v19
                    end
                end
            end
            for _, v28 in u2.entries(u7) do
                local v29 = v28[1]
                local v30 = v28[2]
                if v30.block and (v30.block.greedyMesh and #v30.block.greedyMesh.textures == 0) then
                    warn("[Item Meta]: Missing block texture for: " .. v29)
                end
            end
        end
    }
}