local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ButtonComponent
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.SoundManager
local u9 = v3.UIUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.GuiService
local u14 = v12.UserInputService
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ConfirmationModal"] = v11.new(u10)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u8
            [3] = u16
            [4] = u14
            [5] = u9
            [6] = u13
            [7] = u6
            [8] = u17
            [9] = u5
            [10] = u7
            [11] = u2
            [12] = u15
            [13] = u4
        --]]
        local v20 = p19.useState
        local v21 = p19.useEffect
        local v22, u23 = v20(false)
        local u24 = u10.createRef()
        local u25 = u10.createRef()
        local u26 = "ConfirmationModalGroup_" .. u18.Title
        v21(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u16
                [3] = u14
                [4] = u9
                [5] = u25
                [6] = u13
                [7] = u26
                [8] = u24
                [9] = u18
            --]]
            u8:playSound(u16.UI_OPEN_2)
            if u14.GamepadEnabled then
                u9:selectGui(u25:getValue())
                u13:AddSelectionParent(u26, u24:getValue())
            end
            return function() --[[ Line: 33 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u16
                    [3] = u13
                    [4] = u26
                    [5] = u18
                    [6] = u9
                --]]
                u8:playSound(u16.UI_CLOSE_2)
                u13:RemoveSelectionGroup(u26)
                if u18.PreviouslySelected then
                    u9:selectGui(u18.PreviouslySelected)
                end
            end
        end, {})
        local v27 = {
            ["Size"] = UDim2.new(u6.isSmallScreen() and 0.5 or 0.3, 0, 0, 300),
            ["AutomaticSize"] = "Y",
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = u17.backgroundPrimary,
            ["BorderSizePixel"] = 0,
            ["Selectable"] = false,
            ["AutoButtonColor"] = false,
            ["Active"] = true,
            ["Modal"] = true,
            [u10.Ref] = u24
        }
        local v28 = { u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.03, 0)
            }), u10.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.08, 0),
                ["PaddingBottom"] = UDim.new(0.08, 0),
                ["PaddingLeft"] = UDim.new(u6.isSmallScreen() and 0.08 or 0.05, 0),
                ["PaddingRight"] = UDim.new(u6.isSmallScreen() and 0.08 or 0.05, 0)
            }) }
        local v29 = #v28
        local v30 = u18.Body ~= nil
        if v30 then
            local v31 = {
                ["AutomaticSize"] = "Y",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = "Center",
                ["TextTransparency"] = 0.3,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 36),
                ["Text"] = u18.Body,
                ["TextColor3"] = u5.WHITE
            }
            local v32 = u18.TextBodyProps
            if v32 then
                for v33, v34 in v32 do
                    v31[v33] = v34
                end
            end
            v30 = u10.createElement("TextLabel", v31, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) })
        end
        local v35 = {
            ["AutomaticSize"] = "Y",
            ["Size"] = UDim2.new(1, 0, 0, 50)
        }
        local v36 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.1, 0)
            }), u10.createElement("TextLabel", {
                ["AutomaticSize"] = "XY",
                ["SizeConstraint"] = "RelativeXY",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 24),
                ["Text"] = "<b>" .. u18.Title .. "</b>",
                ["TextColor3"] = u5.WHITE
            }, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 24
                }) }) }
        local v37 = #v36
        if v30 then
            v36[v37 + 1] = v30
        end
        v28[v29 + 1] = u10.createElement(u7, v35, v36)
        local v38 = not u18.HideSecondaryBtn
        if v38 then
            local v40 = {
                ["TextSize"] = 18,
                ["Size"] = UDim2.new(0.3, 0, 0, 40),
                ["Text"] = "Cancel",
                ["BackgroundColor3"] = u17.backgroundPrimary,
                ["OnClick"] = function() --[[ Name: OnClick, Line 133 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u16
                        [3] = u18
                        [4] = u2
                        [5] = u15
                    --]]
                    u8:playSound(u16.UI_CLICK)
                    local v39 = u18.OnSecondaryBtnClick
                    if v39 ~= nil then
                        v39()
                    end
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u15.CONFIRMATION_MODAL)
                end,
                ["Selectable"] = true,
                ["LayoutOrder"] = 1,
                [u10.Ref] = u25
            }
            local v41 = u18.SecondaryBtnProps
            if v41 then
                for v42, v43 in v41 do
                    v40[v42] = v43
                end
            end
            v38 = u10.createFragment({
                ["SecondaryButton"] = u10.createElement(u4, v40)
            })
        end
        local v44 = {
            ["LayoutOrder"] = 4,
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Size"] = UDim2.new(1, 0, 0, 40)
        }
        local v45 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v46 = #v45
        if v38 then
            v45[v46 + 1] = v38
        end
        local v47 = #v45
        local v48 = {
            ["TextSize"] = 18,
            ["Text"] = "Accept",
            ["Selectable"] = true,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0.3, 0, 0, 40),
            ["BackgroundColor3"] = u17.backgroundSuccess,
            ["OnClick"] = function() --[[ Name: OnClick, Line 180 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u16
                    [3] = u18
                    [4] = u23
                    [5] = u2
                    [6] = u15
                --]]
                u8:playSound(u16.UI_CLICK)
                u18.OnPrimaryBtnClick(u23)
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u15.CONFIRMATION_MODAL)
            end,
            ["Loading"] = v22
        }
        local v49 = u18.PrimaryBtnProps
        if v49 then
            for v50, v51 in v49 do
                v48[v50] = v51
            end
        end
        v45.PrimaryButton = u10.createElement(u4, v48)
        local v52 = u18.AdditionalButtons
        local v53
        if v52 == nil then
            v53 = v52
        else
            local function v63(u54, p55) --[[ Line: 198 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u8
                    [3] = u16
                    [4] = u2
                    [5] = u15
                    [6] = u10
                    [7] = u4
                --]]
                local v56 = {
                    ["TextSize"] = 18,
                    ["Text"] = "",
                    ["Selectable"] = true,
                    ["Size"] = UDim2.new(0.3, 0, 0, 40),
                    ["BackgroundColor3"] = u17.backgroundPrimary,
                    ["OnClick"] = function() --[[ Name: OnClick, Line 204 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u16
                            [3] = u54
                            [4] = u2
                            [5] = u15
                        --]]
                        u8:playSound(u16.UI_CLICK)
                        if u54.onClick() then
                            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u15.CONFIRMATION_MODAL)
                        end
                    end,
                    ["LayoutOrder"] = p55 + 3
                }
                for v57, v58 in u54.buttonProps do
                    v56[v57] = v58
                end
                local v59 = {}
                local v60 = #v59
                for v61, v62 in u54.childElements do
                    v59[v60 + v61] = v62
                end
                return u10.createElement(u4, v56, v59)
            end
            v53 = table.create(#v52)
            for v64, v65 in v52 do
                v53[v64] = v63(v65, v64 - 1, v52)
            end
        end
        if v53 then
            for v66, v67 in v53 do
                v45[v47 + v66] = v67
            end
        end
        v28.ActionButtons = u10.createElement(u7, v44, v45)
        return u10.createElement("ImageButton", v27, v28)
    end)
}