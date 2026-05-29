local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-meta")
local u10 = v9.ClanUpgradeMeta
local u11 = v9.ClanUpgradeTypeMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanProfileUpgradeCard"] = v7.new(u6)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u5
            [4] = u6
            [5] = u13
            [6] = u4
            [7] = u12
            [8] = u8
            [9] = u3
        --]]
        local _ = p15.useState
        local v16 = u11[u14.UpgradeType]
        local v17
        if u14.UpgradeTier then
            v17 = u10[u14.UpgradeTier]
        else
            v17 = u10[v16.firstUpgrade]
        end
        local u18 = u5.new()
        local u19 = u14.SelectedUpgrade == u14.UpgradeTier
        local v20 = u6.createFragment
        local v21 = {}
        local v22 = u6.createElement
        local v23 = "ImageButton"
        local v24 = {
            ["Size"] = UDim2.new(1, 0, 0, 40),
            ["BackgroundColor3"] = u13.backgroundPrimary,
            ["BorderSizePixel"] = 1
        }
        local v25
        if u19 then
            v25 = u13.textPrimary
        else
            v25 = u13.backgroundPrimary
        end
        v24.BorderColor3 = v25
        v24.BorderMode = "Inset"
        v24.LayoutOrder = 1
        v24.AutoButtonColor = false
        v24[u6.Event.Activated] = function(p26) --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u4
                [3] = u12
                [4] = u18
                [5] = u8
            --]]
            u14.OnClick(u14.UpgradeTier)
            u4:playSound(u12.UI_CLICK)
            u18:DoCleaning()
            local u27 = u8:Create(p26, TweenInfo.new(0.12), {
                ["BackgroundTransparency"] = 0
            })
            u27:Play()
            u18:GiveTask(function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27:Cancel()
            end)
        end
        v24[u6.Event.MouseEnter] = function(p28) --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u18
                [3] = u8
            --]]
            if u19 then
                return nil
            end
            u18:DoCleaning()
            local u29 = u8:Create(p28, TweenInfo.new(0.12), {
                ["BackgroundTransparency"] = 0.3
            })
            u29:Play()
            u18:GiveTask(function() --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                u29:Cancel()
            end)
        end
        v24[u6.Event.MouseLeave] = function(p30) --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u18
                [3] = u8
            --]]
            if u19 then
                return nil
            end
            u18:DoCleaning()
            local u31 = u8:Create(p30, TweenInfo.new(0.12), {
                ["BackgroundTransparency"] = 0
            })
            u31:Play()
            u18:GiveTask(function() --[[ Line: 64 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                u31:Cancel()
            end)
        end
        local v32 = {}
        local v33 = u6.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center"
        })
        local v34 = u6.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 6),
            ["PaddingBottom"] = UDim.new(0, 6),
            ["PaddingLeft"] = UDim.new(0, 10),
            ["PaddingRight"] = UDim.new(0, 10)
        })
        local v35 = u6.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 1),
            ["Text"] = "<b>" .. v16.name .. "</b>",
            ["TextColor3"] = u3.WHITE
        }, { u6.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 20
            }) })
        local v36 = u6.createElement
        local v37 = {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Right",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.2, 1)
        }
        local v38 = v17.level
        v37.Text = "<b>Lv. " .. tostring(v38) .. "</b>"
        v37.TextColor3 = u13.mcYellow
        __set_list(v32, 1, {v33, v34, v35, v36("TextLabel", v37, { u6.createElement("UITextSizeConstraint", {
        ["MaxTextSize"] = 20
    }) })})
        v21.UpgradeCard = v22(v23, v24, v32)
        return v20(v21)
    end)
}