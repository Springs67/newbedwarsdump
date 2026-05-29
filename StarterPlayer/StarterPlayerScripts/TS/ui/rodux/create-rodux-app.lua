local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u4 = u3.StoreProvider
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent, "store").ClientStore
return {
    ["BuildRoduxApp"] = function(p7, p8, p9, u10) --[[ Name: BuildRoduxApp, Line 9 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u4
            [4] = u6
        --]]
        local u11 = p8 == nil and {} or p8
        local u12 = p9 == nil and {} or p9
        local v21 = u3.connect(function(p13) --[[ Line: 16 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u11
            --]]
            local v14 = u10
            if v14 ~= nil then
                v14 = v14.disableStore
            end
            if v14 == false then
                p13 = nil
            end
            local v15 = {
                ["store"] = p13
            }
            for v16, v17 in u11 do
                v15[v16] = v17
            end
            return v15
        end, function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            local v18 = {}
            for v19, v20 in u12 do
                v18[v19] = v20
            end
            return v18
        end)(p7)
        local v22 = {
            ["store"] = u6
        }
        return u2.createElement(u4, v22, { u2.createElement(v21) })
    end,
    ["CreateRoduxApp"] = function(p23, p24, p25, p26, u27) --[[ Name: CreateRoduxApp, Line 42 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u2
            [4] = u4
            [5] = u6
        --]]
        local u28 = p25 == nil and {} or p25
        local u29 = p26 == nil and {} or p26
        local v30
        if u27 == nil then
            v30 = u27
        else
            v30 = u27.Parent
        end
        if v30 == nil then
            v30 = u5.LocalPlayer:WaitForChild("PlayerGui")
        end
        local v39 = u3.connect(function(p31) --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u28
            --]]
            local v32 = u27
            if v32 ~= nil then
                v32 = v32.disableStore
            end
            if v32 == false then
                p31 = nil
            end
            local v33 = {
                ["store"] = p31
            }
            for v34, v35 in u28 do
                v33[v34] = v35
            end
            return v33
        end, function() --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            local v36 = {}
            for v37, v38 in u29 do
                v36[v37] = v38
            end
            return v36
        end)(p24)
        local v40 = {
            ["store"] = u6
        }
        return u2.mount(u2.createElement(u4, v40, { u2.createElement(v39) }), v30, p23)
    end
}