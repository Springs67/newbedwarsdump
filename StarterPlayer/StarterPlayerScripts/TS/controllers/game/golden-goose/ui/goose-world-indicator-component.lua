local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.RunService
local u12 = v9.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golden-goose", "golden-goose-constants").GoldenGooseConstants
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["GooseWorldIndicatorComponent"] = v8.new(u7)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u13
            [3] = u6
            [4] = u11
            [5] = u5
            [6] = u10
            [7] = u7
            [8] = u3
            [9] = u14
            [10] = u4
        --]]
        local v17 = p16.useEffect
        local v18 = p16.useState
        local v19 = p16.useBinding
        local v20 = (u15.despawnTime - u12:GetServerTimeNow()) / u13.GOLDEN_GOOSE_LIFETIME_SEC
        local v21, u22 = v18((math.clamp(v20, 0, 1)))
        local v23, u24 = v19(0)
        v17(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u11
                [3] = u12
                [4] = u15
                [5] = u24
                [6] = u22
                [7] = u13
            --]]
            local u25 = u6.new()
            u25:GiveTask(u11.Heartbeat:Connect(function() --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u15
                    [3] = u24
                    [4] = u22
                    [5] = u13
                --]]
                if u12.CurrentCamera and u15.billboardAdornee then
                    local v26 = u24
                    local v27 = (300 - (u12.CurrentCamera.CFrame.Position - u15.billboardAdornee.Position).Magnitude) / 300
                    v26((math.clamp(v27, 0, 0.65)))
                end
                local v28 = u22
                local v29 = (u15.despawnTime - u12:GetServerTimeNow()) / u13.GOLDEN_GOOSE_LIFETIME_SEC
                v28((math.clamp(v29, 0, 1)))
            end))
            return function() --[[ Line: 40 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25:DoCleaning()
            end
        end, {})
        local v30 = nil
        local v31 = u15.gooseHolderTeamId
        if v31 ~= "" and v31 then
            local v32 = u5.Controllers.TeamController:getTeamById(u15.gooseHolderTeamId)
            if v32 then
                v30 = {
                    ["name"] = v32.name,
                    ["color"] = v32.color
                }
                local v33 = u5.Controllers.TeamController:getPlayerTeam(u10.LocalPlayer)
                if v33 ~= nil then
                    v33 = v33.id
                end
                v30.localTeam = v33 == v32.id
            end
        end
        local v34 = u7.createElement
        local v35 = "BillboardGui"
        local v36 = {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 3, 0),
            ["AlwaysOnTop"] = true,
            ["Size"] = UDim2.new(1, 60, 0.5, 40),
            ["SizeOffset"] = Vector2.new(0, 0.7)
        }
        local v37 = {}
        local v38 = u7.createElement
        local v39 = "Frame"
        local v41 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundTransparency"] = v23:map(function(p40) --[[ Line: 70 ]]
                return 0.3 + 0.7 * p40
            end),
            ["BackgroundColor3"] = Color3.fromRGB(6, 11, 18)
        }
        local v42 = {}
        local v43 = u7.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 2
        })
        local v44 = u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 4)
        })
        local v46 = u7.createElement("ImageLabel", {
            ["Image"] = "rbxassetid://15378845302",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 2),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["ImageTransparency"] = v23:map(function(p45) --[[ Line: 87 ]]
                return 0 + 1 * p45
            end)
        }, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v47 = u7.createElement
        local v48 = "Frame"
        local v49 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.7, 1),
            ["Position"] = UDim2.fromScale(0.95, 0.5),
            ["AnchorPoint"] = Vector2.new(1, 0.5)
        }
        local v50 = {}
        local v51 = u7.createElement("TextLabel", {
            ["Text"] = "Golden Goose",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.3),
            ["Position"] = UDim2.fromScale(0, 0.05),
            ["TextColor3"] = Color3.fromRGB(252, 228, 196),
            ["FontFace"] = Font.new("Inter", Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Left
        })
        local v52 = u7.createElement
        local v53 = "TextLabel"
        local v54 = {
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1
        }
        local v55
        if v30 then
            local v56 = u3.richTextColorWrap(v30.color, v30.name)
            local v57 = " "
            local v58 = u3.richTextColorWrap
            local v59
            if v30.localTeam then
                v59 = u14.mcGreen
            else
                v59 = u14.mcRed
            end
            v55 = v56 .. v57 .. v58(v59, v30.localTeam and "(YOU)" or "(ENEMY)")
        else
            v55 = "Available"
        end
        v54.Text = v55
        v54.Size = UDim2.fromScale(1, 0.25)
        v54.Position = UDim2.fromScale(0, 0.35)
        v54.TextColor3 = u3.hexColor(15461613)
        v54.FontFace = Font.new("Inter", Enum.FontWeight.SemiBold)
        v54.TextXAlignment = Enum.TextXAlignment.Left
        __set_list(v50, 1, {v51, v52(v53, v54), u7.createElement(u4, {
    ["Progress"] = v21,
    ["Size"] = UDim2.fromScale(1, 0.1),
    ["Position"] = UDim2.fromScale(0, 0.95),
    ["AnchorPoint"] = Vector2.new(0, 1),
    ["BarColor"] = Color3.fromRGB(237, 253, 255)
})})
        __set_list(v42, 1, {v43, v44, v46, v47(v48, v49, v50)})
        __set_list(v37, 1, {v38(v39, v41, v42)})
        return v34(v35, v36, v37)
    end)
}