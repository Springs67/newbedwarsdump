return {
    ["perlinNoise3D"] = function(p1, p2, p3, p4) --[[ Name: perlinNoise3D, Line 2 ]]
        local v5 = p4 == nil and {} or p4
        local v6 = v5.seed
        local v7 = v6 == nil and 0 or v6
        local v8 = Random.new(v7):NextInteger(-1000000, 1000000)
        local v9 = v5.scale
        local v10 = v9 == nil and 50 or v9
        local v11 = math
        local v12 = math
        local v13 = v5.octaves
        local v14 = v13 == nil and 4 or v13
        local v15 = v12.floor(v14)
        local v16 = v11.max(1, v15)
        local v17 = v5.persistence
        local v18 = v17 == nil and 0.5 or v17
        local v19 = v5.lacunarity
        local v20 = v19 == nil and 2 or v19
        local v21 = v5.offsetX
        local v22 = (v21 == nil and 0 or v21) + v8
        local v23 = v5.offsetY
        local v24 = (v23 == nil and 0 or v23) + v8
        local v25 = v5.offsetZ
        local v26 = (v25 == nil and 0 or v25) + v8
        local v27 = 1 / v10
        local v28 = false
        local v29 = 0
        local v30 = 1
        local v31 = 0
        local v32 = 0
        while true do
            if v28 then
                v29 = v29 + 1
            else
                v28 = true
            end
            if v29 >= v16 then
                return v31 / v32
            end
            local v33 = (p1 + v22) * v27
            local v34 = (p2 + v24) * v27
            local v35 = (p3 + v26) * v27
            v31 = v31 + math.noise(v33, v34, v35) * v30
            v32 = v32 + v30
            v30 = v30 * v18
            v27 = v27 * v20
        end
    end
}