local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
return {
    ["OGNameTag"] = v4.new(u3)(function(u9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u6
            [3] = u7
            [4] = u8
            [5] = u2
        --]]
        local v11 = p10.useState
        local v12 = p10.useEffect
        local v13, u14 = v11(u9.EntityInstance.Name)
        local v15, u16 = v11(Color3.fromRGB(255, 255, 255))
        local u17 = u3.createRef()
        v12(function() --[[ Line: 16 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u6
                [3] = u9
                [4] = u7
                [5] = u14
                [6] = u8
            --]]
            local u18 = u17:getValue()
            local u19
            if u18 then
                u6:AddTag(u18, "EntityNameTag")
                u18.Adornee = u9.EntityInstance.Head
                u19 = u9.EntityInstance:GetAttributeChangedSignal("NametagStudsOffsetWorldSpace"):Connect(function() --[[ Line: 22 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u18
                    --]]
                    local v20 = u9.EntityInstance:GetAttribute("NametagStudsOffsetWorldSpace")
                    if v20 then
                        u18.StudsOffsetWorldSpace = v20
                    end
                end)
            else
                u19 = nil
            end
            local u21 = u7:GetPlayerFromCharacter(u9.EntityInstance)
            if u21 then
                task.spawn(function() --[[ Line: 31 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u8
                        [3] = u21
                    --]]
                    u14(u8.getGamePlayer(u21):getDisplayName())
                    u21:GetAttributeChangedSignal("DisguiseDisplayName"):Connect(function(_) --[[ Line: 34 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u21
                            [3] = u14
                        --]]
                        u14(u8.getGamePlayer(u21):getDisplayName())
                    end)
                end)
            end
            return function() --[[ Line: 40 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                u19:Disconnect()
            end
        end, {})
        v12(function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u2
                [3] = u16
            --]]
            local v22 = u9.EntityInstance:GetAttribute("Team")
            local v23 = v22 ~= "" and (v22 and u2.Controllers.TeamController:getTeamById(v22))
            if v23 then
                u16(v23.color)
            end
            u9.EntityInstance:GetAttributeChangedSignal("Team"):Connect(function() --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u2
                    [3] = u16
                --]]
                local v24 = u9.EntityInstance:GetAttribute("Team")
                local v25 = v24 ~= "" and (v24 and u2.Controllers.TeamController:getTeamById(v24))
                if v25 then
                    u16(v25.color)
                end
            end)
        end, {})
        local v26 = u3.createFragment
        local v27 = {}
        local v28 = u3.createElement
        local v29 = {
            ["Size"] = UDim2.fromScale(5, 0.65),
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 1.6, 0),
            ["AlwaysOnTop"] = true,
            ["MaxDistance"] = 150,
            ["ResetOnSpawn"] = false,
            ["AutoLocalize"] = false,
            [u3.Ref] = u17
        }
        local v30 = {}
        local v31 = u3.createElement
        local v32 = {
            ["AutomaticSize"] = "X",
            ["BackgroundTransparency"] = 0.75,
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = true,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.8, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v33 = {
            ["DisplayName"] = u3.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["AutoLocalize"] = false,
                ["TextYAlignment"] = "Center",
                ["TextXAlignment"] = "Center",
                ["LayoutOrder"] = 3,
                ["Text"] = v13,
                ["Size"] = UDim2.fromScale(0.8, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["TextColor3"] = v15,
                ["Font"] = Enum.Font.GothamMedium
            })
        }
        v30.DisplayNameContainer = v31("Frame", v32, v33)
        v27.Nametag = v28("BillboardGui", v29, v30)
        return v26(v27)
    end)
}