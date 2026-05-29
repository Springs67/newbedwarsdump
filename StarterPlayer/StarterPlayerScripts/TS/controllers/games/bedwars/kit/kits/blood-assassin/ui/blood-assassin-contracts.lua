local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, script.Parent, "contract-card").ContractCard
return {
    ["BloodAssassinContracts"] = v7.new(u6)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u3
            [4] = u4
            [5] = u8
        --]]
        local v11 = p10.useEffect
        local u12, u13 = p10.useState(30)
        local u14 = u6.createRef()
        v11(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u14
                [3] = u13
            --]]
            local u15 = u5.new()
            local u16 = u14:getValue()
            if u16 then
                u16:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 19 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                        [2] = u16
                    --]]
                    local v17 = u13
                    local v18 = u16.AbsoluteSize.Y / 172 * 30
                    v17((math.round(v18)))
                end)
                local v19 = u13
                local v20 = u16.AbsoluteSize.Y / 172 * 30
                v19((math.round(v20)))
            end
            return function() --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15:DoCleaning()
            end
        end, {})
        local v21 = 3
        if p9.activeContract then
            v21 = 2
        elseif p9.availableContracts then
            v21 = 3 - #p9.availableContracts
        end
        local v22 = false
        local v23 = 0
        local v24 = {}
        while true do
            if v22 then
                v23 = v23 + 1
            else
                v22 = true
            end
            if v23 >= v21 then
                local v25 = {
                    ["Size"] = UDim2.fromScale(0.948, 0.9513513513513514),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                local v26 = { u6.createElement("UIListLayout", {
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["FillDirection"] = Enum.FillDirection.Vertical,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
                    }), u6.createElement("TextLabel", {
                        ["Size"] = UDim2.fromScale(0.9472573839662447, 0.24431818181818182),
                        [u6.Ref] = u14,
                        ["TextSize"] = u12,
                        ["Text"] = "Your decay will strengthen through the completion of contracts. Tougher opponents will unlock greater powers.",
                        ["BackgroundColor3"] = u3.BLACK,
                        ["TextColor3"] = u3.hexColor(13290186),
                        ["BackgroundTransparency"] = 1,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextYAlignment"] = Enum.TextYAlignment.Top,
                        ["TextWrapped"] = true,
                        ["LayoutOrder"] = 0
                    }) }
                local v27 = #v26
                local v28 = {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.7102272727272727)
                }
                local v29 = { u6.createElement("UIListLayout", {
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["FillDirection"] = Enum.FillDirection.Vertical,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["Padding"] = UDim.new(0.02, 0)
                    }), u6.createElement("TextLabel", {
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["RichText"] = true,
                        ["LayoutOrder"] = 0,
                        ["Text"] = p9.activeContract == nil and (#p9.availableContracts == 0 and "AWAITING MORE CONTRACTS..." or "CONTRACTS <font color=\"rgb(173, 173, 173)\">(PICK ONE)</font>") or "ACTIVE CONTRACT",
                        ["Size"] = UDim2.fromScale(1, 0.08),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center,
                        ["TextColor3"] = u3.hexColor(16729156),
                        ["Font"] = Enum.Font.ArialBold
                    }), u6.createElement(u4, {
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(0, 0.048)
                    }) }
                local v30 = #v29
                local v31
                if p9.activeContract == nil then
                    v31 = false
                else
                    local v32 = u6.createElement
                    local v33 = u8
                    local v34 = {
                        ["LayoutOrder"] = 2,
                        ["ActiveContract"] = true,
                        ["ContractInfo"] = p9.activeContract,
                        ["Size"] = UDim2.fromScale(0.9936708860759493, 0.284)
                    }
                    local v35 = u12 * 0.75
                    v34.DescriptionTextSize = math.round(v35)
                    v31 = v32(v33, v34)
                end
                if v31 then
                    v29[v30 + 1] = v31
                end
                local v36 = #v29
                local v37 = p9.activeContract == nil
                if v37 then
                    local v38 = p9.availableContracts
                    local function v45(p39, p40) --[[ Line: 125 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                            [2] = u8
                            [3] = u12
                        --]]
                        local v41 = u6.createElement
                        local v42 = u8
                        local v43 = {
                            ["ActiveContract"] = false,
                            ["ContractInfo"] = p39,
                            ["Size"] = UDim2.fromScale(0.9936708860759493, 0.284),
                            ["LayoutOrder"] = 2 + p40
                        }
                        local v44 = u12 * 0.75
                        v43.DescriptionTextSize = math.round(v44)
                        return v41(v42, v43)
                    end
                    v37 = table.create(#v38)
                    for v46, v47 in v38 do
                        v37[v46] = v45(v47, v46 - 1, v38)
                    end
                end
                if v37 then
                    for v48, v49 in v37 do
                        v29[v36 + v48] = v49
                    end
                end
                local v50 = #v29
                for v51, v52 in v24 do
                    v29[v50 + v51] = v52
                end
                v26[v27 + 1] = u6.createElement(u4, v28, v29)
                return u6.createElement(u4, v25, v26)
            end
            local v53 = u6.createElement("Frame", {
                ["LayoutOrder"] = 4,
                ["BackgroundTransparency"] = 0.4,
                ["Size"] = UDim2.fromScale(0.9936708860759493, 0.284),
                ["BackgroundColor3"] = u3.BLACK
            })
            table.insert(v24, v53)
        end
    end)
}