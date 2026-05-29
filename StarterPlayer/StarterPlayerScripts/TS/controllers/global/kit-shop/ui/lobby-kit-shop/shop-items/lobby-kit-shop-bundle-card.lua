local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.ImageId
local u8 = v2.SoundManager
local u9 = v2.TooltipContainer
local u10 = v2.UIUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.TweenService
local u16 = v14.UserInputService
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").EmoteAssets
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v24 = u13.Component:extend("KitShopBundleCard")
function v24.init(p25) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
    --]]
    p25.hoverMaid = u12.new()
    p25.ref = u13.createRef()
    p25.maid = u12.new()
end
function v24.didMount(u26) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
        [3] = u23
        [4] = u10
    --]]
    local v27 = u16.GamepadEnabled and (not u16.MouseEnabled and u26.ref:getValue())
    if v27 then
        u26.maid:GiveTask(v27.SelectionGained:Connect(function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u23
                [3] = u26
            --]]
            u8:playSound(u23.UI_CLICK)
            u26.props.OnClick()
        end))
        if u26.props.Selected then
            u10:selectGui(v27)
        end
    end
end
function v24.willUnmount(p28) --[[ Line: 47 ]]
    p28.maid:DoCleaning()
end
function v24.render(u29) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u20
        [3] = u5
        [4] = u11
        [5] = u13
        [6] = u4
        [7] = u8
        [8] = u23
        [9] = u15
        [10] = u6
        [11] = u7
        [12] = u22
        [13] = u19
        [14] = u9
        [15] = u3
        [16] = u21
        [17] = u17
    --]]
    local v30 = u18[u29.props.Bundle]
    local v31 = 0
    local v32 = {}
    local u33 = {}
    local u34 = {}
    local v35 = false
    for v36, v37 in v30.rewards do
        local _ = v36 - 1
        local v38
        if v37.kit then
            v38 = v37.kit
        else
            v38 = nil
        end
        if v38 ~= nil then
            v31 = v31 + 1
            v32[v31] = v38
        end
    end
    local function v45(p39) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u33
            [3] = u29
            [4] = u5
            [5] = u11
            [6] = u34
        --]]
        if p39 == u20.NONE then
            local v40 = u33
            table.insert(v40, p39)
            return
        else
            local v41 = u29.props.store.Bedwars.ownedKits
            if table.find(v41, p39) == nil then
                if u5.isHoarceKat() or not u11.Controllers.UnlockController.allKitsUnlocked then
                    local v42 = u34
                    table.insert(v42, p39)
                else
                    local v43 = u33
                    table.insert(v43, p39)
                end
            else
                local v44 = u33
                table.insert(v44, p39)
                return
            end
        end
    end
    for v46, v47 in v32 do
        v45(v47, v46 - 1, v32)
    end
    local v48 = u33 == v32 and true or v35
    local v49 = v30.limitedTimeEndTime ~= nil
    local v50 = v30.battlepass
    if v50 == nil then
        v50 = false
    end
    local v55 = {
        [u13.Ref] = u29.ref,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = u4.BLACK,
        ["BackgroundTransparency"] = u29.props.Selected and 0.25 or 0.5,
        ["BorderSizePixel"] = 0,
        ["BorderMode"] = "Outline",
        ["BorderColor3"] = u4.hexColor(16771973),
        ["LayoutOrder"] = u29.props.LayoutOrder,
        ["AutoButtonColor"] = false,
        ["Selectable"] = true,
        [u13.Event.MouseButton1Click] = function() --[[ Line: 117 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u23
                [3] = u29
            --]]
            u8:playSound(u23.UI_CLICK)
            u29.props.OnClick()
        end,
        [u13.Event.MouseEnter] = function(p51) --[[ Line: 121 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u15
            --]]
            u29.hoverMaid:DoCleaning()
            if not u29.props.Selected then
                local u52 = u15:Create(p51, TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = 0.25
                })
                u29.hoverMaid:GiveTask(function() --[[ Line: 127 ]]
                    --[[
                    Upvalues:
                        [1] = u52
                    --]]
                    u52:Cancel()
                end)
                u52:Play()
            end
        end,
        [u13.Event.MouseLeave] = function(p53) --[[ Line: 133 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u15
            --]]
            u29.hoverMaid:DoCleaning()
            if not u29.props.Selected then
                local u54 = u15:Create(p53, TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = u29.props.Selected and 0.25 or 0.5
                })
                u29.hoverMaid:GiveTask(function() --[[ Line: 139 ]]
                    --[[
                    Upvalues:
                        [1] = u54
                    --]]
                    u54:Cancel()
                end)
                u54:Play()
            end
        end
    }
    local v56 = { u13.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.02, 0)
        }), u13.createElement("UIStroke", {
            ["Color"] = u4.darken(u4.WHITE, u29.props.Selected and 1 or 0.5),
            ["Thickness"] = u29.props.Selected and 2 or 1
        }) }
    local v57 = #v56
    local v58 = {
        ["Size"] = UDim2.fromScale(0.92, 0.92),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v59 = {}
    local v60 = #v59
    local v61 = {}
    local v62 = v30.kitShopBundle
    if v62 ~= nil then
        v62 = v62.image
    end
    v61.Image = v62
    v61.ScaleType = "Crop"
    v61.Size = UDim2.fromScale(1, 1)
    v61.AnchorPoint = Vector2.new(0.5, 0.5)
    v61.Position = UDim2.fromScale(0.5, 0.5)
    v61.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v61.BorderSizePixel = 0
    v61.BackgroundTransparency = 1
    v59[v60 + 1] = u13.createElement("ImageLabel", v61)
    v56[v57 + 1] = u13.createElement(u6, v58, v59)
    if v49 then
        v49 = u13.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.22),
            ["Image"] = u7.BANNER_HORIZONTAL,
            ["Position"] = UDim2.fromScale(0.5, -0.01),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["ImageColor3"] = Color3.fromRGB(252, 122, 122)
        }, { u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.8421052631578947
            }), u13.createElement("TextLabel", {
                ["Text"] = "LIMITED",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["Size"] = UDim2.fromScale(0.75, 0.45),
                ["Position"] = UDim2.fromScale(0.5, 0.13),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }) })
    end
    if v49 then
        v56[v57 + 2] = v49
    end
    local v63 = #v56
    local v64 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.16),
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.fromScale(0.97, 0.03)
    }
    local v65 = { u13.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Right",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.05, 0)
        }) }
    local v66 = #v65
    local v67 = {
        ["SizeConstraint"] = "RelativeYY",
        ["Size"] = UDim2.fromScale(1, 1),
        ["Image"] = u19[u22.LUCKY_GIFT],
        ["ScaleType"] = "Fit",
        ["BackgroundTransparency"] = 1
    }
    v65[v66 + 1] = u13.createElement("ImageLabel", v67, { u13.createElement(u9, {}, { u13.createElement(u3, {
                ["Text"] = "Kit Bundle",
                ["TextSize"] = 16,
                ["Font"] = Enum.Font.SourceSansBold,
                ["Limits"] = Vector2.new(300, 60)
            }) }) })
    local v68
    if v48 or v50 then
        local v69 = v30.battlepass
        if v69 ~= nil then
            v69 = v69.season
        end
        if v69 then
            local v70 = {
                ["SizeConstraint"] = "RelativeYY",
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v71 = v30.battlepass
            if v71 ~= nil then
                v71 = v71.season
            end
            v70.Image = u17(v71).icon
            v70.ScaleType = "Fit"
            v70.BackgroundTransparency = 1
            local v72 = {}
            local v73 = #v72
            local v74 = {}
            local v75 = #v74
            local v76 = {}
            local v77 = u18[u29.props.Bundle].battlepass
            if v77 ~= nil then
                v77 = string.gsub(v77.season, "season", "")
            end
            v76.Text = "BP Season " .. tostring(v77)
            v76.Font = Enum.Font.SourceSansBold
            v76.TextSize = 16
            v76.Limits = Vector2.new(300, 60)
            v74[v75 + 1] = u13.createElement(u3, v76)
            v72[v73 + 1] = u13.createElement(u9, {}, v74)
            v68 = u13.createElement("ImageLabel", v70, v72)
        else
            v68 = u13.createFragment()
        end
    else
        v68 = u13.createElement("ImageLabel", {
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = u21.BED_COIN_ICON
        }, { u13.createElement(u9, {}, { u13.createElement(u3, {
                    ["Text"] = "Unlockable",
                    ["TextSize"] = 16,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) }) })
    end
    v65[v66 + 2] = v68
    v56.KitCategoryIcons = u13.createElement("Frame", v64, v65)
    if v30 then
        local v78 = {
            ["BackgroundTransparency"] = 0.55,
            ["Size"] = UDim2.fromScale(1, 0.16),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["BackgroundColor3"] = u4.BLACK
        }
        local v79 = { u13.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.03, 0)
            }) }
        local v80 = #v79
        local v81 = {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.8)
        }
        local v82 = v30.kitShopBundle
        if v82 ~= nil then
            v82 = v82.name
        end
        v81.Text = tostring(v82)
        v81.TextScaled = true
        v81.TextColor3 = u4.WHITE
        v81.TextXAlignment = "Center"
        v81.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v81.BackgroundTransparency = 1
        v79[v80 + 1] = u13.createElement("TextLabel", v81)
        v30 = u13.createFragment({
            ["KitNameTag"] = u13.createElement("Frame", v78, v79)
        })
    end
    v56[v63 + 1] = v30
    return u13.createElement("ImageButton", v55, v56)
end
return {
    ["KitShopBundleCard"] = v24
}