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
    ["SummonerKitCastBarUI"] = v6.new(u5)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u5
            [3] = u8
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
        local v22, u23 = v12({})
        local _, u24 = v12({})
        v13(function() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u5
                [3] = u23
                [4] = u24
                [5] = u21
                [6] = u9
                [7] = u8
                [8] = u19
            --]]
            if u10.PlayerSpellLevel > 1 then
                local v25 = false
                local v26 = 0
                local v27 = {}
                local v28 = {}
                while true do
                    if true then
                        if v25 then
                            v26 = v26 + 1
                        else
                            v25 = true
                        end
                    end
                    if v26 >= u10.PlayerSpellLevel then
                        break
                    end
                    local v29 = Color3.fromRGB(255, 255, 255)
                    table.insert(v27, v29)
                end
                local v30 = false
                local v31 = 0
                while true do
                    if true then
                        if v30 then
                            v31 = v31 + 1
                        else
                            v30 = true
                        end
                    end
                    if v31 >= u10.PlayerSpellLevel - 1 then
                        break
                    end
                    local v32 = u5.createFragment({
                        ["Divider"] = u5.createElement("Frame", {
                            ["BackgroundTransparency"] = 0,
                            ["BorderSizePixel"] = 0,
                            ["ZIndex"] = 5,
                            ["Size"] = UDim2.fromScale(0.05, 1.2),
                            ["AnchorPoint"] = Vector2.new(0, 0.5),
                            ["Position"] = UDim2.fromScale((v31 + 1) / u10.PlayerSpellLevel, 0.5),
                            ["BackgroundColor3"] = v27[v31 + 1]
                        })
                    })
                    table.insert(v28, v32)
                end
                u23(v28)
                u24(v27)
            end
            u21(false)
            local v33 = u10.StartTime
            if v33 == nil then
                v33 = u9:GetServerTimeNow()
            end
            local u34 = u10.EndTime
            local u35 = u34 - v33
            local u36 = nil
            u36 = u8.Heartbeat:Connect(function(_) --[[ Line: 87 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u34
                    [3] = u9
                    [4] = u19
                    [5] = u10
                    [6] = u5
                    [7] = u23
                    [8] = u24
                    [9] = u21
                    [10] = u36
                --]]
                local v37 = u35 - (u34 - u9:GetServerTimeNow())
                local v38 = v37 / u35
                local v39 = math.clamp(v38, 0, 1)
                u19(v39)
                if u10.PlayerSpellLevel > 1 then
                    local v40 = false
                    local v41 = 0
                    local v42 = {}
                    local v43 = {}
                    while true do
                        if true then
                            if v40 then
                                v41 = v41 + 1
                            else
                                v40 = true
                            end
                        end
                        if v41 >= u10.PlayerSpellLevel then
                            break
                        end
                        if v41 + 1 / u10.PlayerSpellLevel <= v39 then
                            local v44 = Color3.fromRGB(255, 201, 38)
                            table.insert(v42, v44)
                        else
                            local v45 = Color3.fromRGB(204, 204, 204)
                            table.insert(v42, v45)
                        end
                    end
                    local v46 = false
                    local v47 = 0
                    while true do
                        if true then
                            if v46 then
                                v47 = v47 + 1
                            else
                                v46 = true
                            end
                        end
                        if v47 >= u10.PlayerSpellLevel - 1 then
                            break
                        end
                        local v48 = u5.createFragment({
                            ["Divider"] = u5.createElement("Frame", {
                                ["BackgroundTransparency"] = 0,
                                ["BorderSizePixel"] = 0,
                                ["ZIndex"] = 5,
                                ["Size"] = UDim2.fromScale(0.01, 1),
                                ["AnchorPoint"] = Vector2.new(0, 0.5),
                                ["Position"] = UDim2.fromScale((v47 + 1) / u10.PlayerSpellLevel, 0.5),
                                ["BackgroundColor3"] = v42[v47 + 1]
                            })
                        })
                        table.insert(v43, v48)
                    end
                    u23(v43)
                    u24(v42)
                end
                if u35 < v37 then
                    if u10.HideOnComplete then
                        u21(true)
                        u19(0)
                    end
                    u36:Disconnect()
                end
            end)
            return function() --[[ Line: 162 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                u36:Disconnect()
            end
        end, { u10.EndTime, u10.StartTime })
        local v49 = {
            ["Size"] = u10.Size,
            ["Position"] = u10.Position,
            ["AnchorPoint"] = u10.AnchorPoint
        }
        local v50 = {}
        local v51 = #v50
        local v52 = {
            ["LayoutOrder"] = 1,
            ["Progress"] = v18,
            ["Hide"] = v20,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v53 = u10.ProgressBarConfig
        if v53 then
            for v54, v55 in v53 do
                v52[v54] = v55
            end
        end
        local v56 = {}
        local v57 = #v56
        local v58 = u10[u5.Children]
        if v58 then
            for v59, v60 in v58 do
                if type(v59) == "number" then
                    v56[v57 + v59] = v60
                else
                    v56[v59] = v60
                end
            end
        end
        v50[v51 + 1] = u5.createElement(u4, v52, v56)
        local v61 = #v22 > 0
        if v61 then
            local v62 = {
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0, 0.5)
            }
            local v63 = {}
            local v64 = #v63
            for v65, v66 in v22 do
                v63[v64 + v65] = v66
            end
            v61 = u5.createFragment({
                ["PillDividersWrapper"] = u5.createElement(u3, v62, v63)
            })
        end
        if v61 then
            v50[v51 + 2] = v61
        end
        return u5.createElement(u3, v49, v50)
    end)
}