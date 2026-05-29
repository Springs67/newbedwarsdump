local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.RunService
local u9 = v7.Workspace
return {
    ["VoidHunterMarkDurationUI"] = v6.new(u5)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u8
            [3] = u5
            [4] = u4
            [5] = u3
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local v14 = u10.StartTime
        if v14 == nil then
            v14 = u9:GetServerTimeNow()
        end
        local v15 = u10.EndTime
        local v16 = v15 - v14
        local v17 = (v16 - (v15 - u9:GetServerTimeNow())) / v16
        local v18, u19 = v12((math.clamp(v17, 0, 1)))
        local v20, u21 = v12(false)
        local _, _ = v12("Spell Level 0")
        local v22, _ = v12({})
        local _, _ = v12({})
        v13(function() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u10
                [3] = u9
                [4] = u8
                [5] = u19
            --]]
            u21(false)
            local v23 = u10.StartTime
            if v23 == nil then
                v23 = u9:GetServerTimeNow()
            end
            local u24 = u10.EndTime
            local u25 = u24 - v23
            local u26 = nil
            u26 = u8.Heartbeat:Connect(function(_) --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u24
                    [3] = u9
                    [4] = u19
                    [5] = u10
                    [6] = u21
                    [7] = u26
                --]]
                local v27 = u25 - (u24 - u9:GetServerTimeNow())
                local v28 = v27 / u25
                u19((math.clamp(v28, 0, 1)))
                if u25 < v27 then
                    if u10.HideOnComplete then
                        u21(true)
                        u19(0)
                    end
                    u26:Disconnect()
                end
            end)
            return function() --[[ Line: 50 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26:Disconnect()
            end
        end, { u10.EndTime, u10.StartTime })
        local v29 = {
            ["Size"] = u10.Size,
            ["Position"] = u10.Position,
            ["AnchorPoint"] = u10.AnchorPoint
        }
        local v30 = {}
        local v31 = #v30
        local v32 = {
            ["LayoutOrder"] = 1,
            ["Progress"] = v18,
            ["Hide"] = v20,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v33 = u10.ProgressBarConfig
        if v33 then
            for v34, v35 in v33 do
                v32[v34] = v35
            end
        end
        local v36 = {}
        local v37 = #v36
        local v38 = u10[u5.Children]
        if v38 then
            for v39, v40 in v38 do
                if type(v39) == "number" then
                    v36[v37 + v39] = v40
                else
                    v36[v39] = v40
                end
            end
        end
        v30[v31 + 1] = u5.createElement(u4, v32, v36)
        local v41 = #v22 > 0
        if v41 then
            local v42 = {
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0, 0.5)
            }
            local v43 = {}
            local v44 = #v43
            for v45, v46 in v22 do
                v43[v44 + v45] = v46
            end
            v41 = u5.createFragment({
                ["PillDividersWrapper"] = u5.createElement(u3, v42, v43)
            })
        end
        if v41 then
            v30[v31 + 2] = v41
        end
        return u5.createElement(u3, v29, v30)
    end)
}