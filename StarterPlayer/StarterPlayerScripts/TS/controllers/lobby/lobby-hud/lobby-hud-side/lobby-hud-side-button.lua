local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.Padding
local u9 = v3.SoundManager
local u10 = v3.TooltipContainer
local u11 = v3.UILayers
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v19 = {}
local u20 = setmetatable({}, {
    ["__index"] = v19
})
u20.FULL = "full"
v19.full = "FULL"
u20.SHORT = "short"
v19.short = "SHORT"
u20.ICON = "icon"
v19.icon = "ICON"
local function v89(u21, p22) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u12
        [3] = u18
        [4] = u20
        [5] = u5
        [6] = u13
        [7] = u9
        [8] = u17
        [9] = u2
        [10] = u15
        [11] = u11
        [12] = u16
        [13] = u4
        [14] = u10
        [15] = u7
        [16] = u8
    --]]
    local _ = p22.useState
    local v23 = u21.PlayerLevel
    if v23 == nil then
        if u6.isHoarceKat() then
            v23 = 0
        else
            local v24 = u12.Controllers.PlayerLevelController:getPlayerLevel()
            v23 = v24 == nil and 0 or v24
        end
    end
    local u25
    if u21.LevelLocked == nil then
        u25 = false
    else
        u25 = v23 < u21.LevelLocked
    end
    local v26 = u21.FrameProps
    if v26 ~= nil then
        v26 = v26.BackgroundColor3
    end
    if v26 == nil then
        v26 = u18.backgroundPrimary
    end
    local v27
    if u6.isSmallScreen() then
        v27 = UDim2.fromOffset(70, 70)
    else
        v27 = UDim2.fromOffset(80, 80)
    end
    local v28 = 4
    local _ = Enum.FillDirection.Vertical
    UDim.new(0.1, 0)
    local _ = Enum.HorizontalAlignment.Center
    local v29 = UDim2.fromScale(0.9, 0.9)
    local v30 = UDim2.fromScale(1, 0.4)
    if u21.Variant == u20.ICON then
        if u6.isSmallScreen() then
            v27 = UDim2.new(1, 0, 0, 30)
        else
            v27 = UDim2.new(1, 0, 0, 40)
        end
        v29 = UDim2.fromScale(0.95, 0.95)
        v28 = 3
    elseif u21.Variant == u20.SHORT then
        if u6.isSmallScreen() then
            v27 = UDim2.new(1, 0, 0, 30)
        else
            v27 = UDim2.new(1, 0, 0, 40)
        end
        local _ = Enum.FillDirection.Horizontal
        local _ = Enum.HorizontalAlignment.Center
        UDim.new(0.075, 0)
        v29 = UDim2.fromScale(0.95, 0.75)
        v28 = 4
        v30 = UDim2.fromScale(0.9, 0.6)
        local v31 = u21.TextLabelProps
        if v31 ~= nil then
            v31 = v31.TextXAlignment
        end
        if not v31 then
            local v32 = {}
            local v33 = u21.TextLabelProps
            if type(v33) == "table" then
                for v34, v35 in v33 do
                    v32[v34] = v35
                end
            end
            v32.TextXAlignment = Enum.TextXAlignment.Center
            u21.TextLabelProps = v32
        end
    end
    local v36 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = v27,
        ["BackgroundColor3"] = u5.WHITE,
        ["Image"] = u21.BackgroundImage,
        ["ScaleType"] = Enum.ScaleType.Crop,
        ["BackgroundTransparency"] = u21.RemoveBackgroundColoring and 1 or 0
    }
    local v37 = u21.FrameProps
    if v37 then
        for v38, v39 in v37 do
            v36[v38] = v39
        end
    end
    v36[u13.Event.Activated] = function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u9
            [3] = u17
            [4] = u2
            [5] = u15
            [6] = u21
            [7] = u11
        --]]
        if u25 then
            u9:playSound(u17.UI_ERROR)
            local v40 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v41 = u15.CONFIRMATION_MODAL
            local v42 = {
                ["HideSecondaryBtn"] = true,
                ["Title"] = u21.Text .. " Unavailable"
            }
            local v43 = u21.LevelLocked
            v42.Body = "\nMust be Level <b>" .. tostring(v43) .. "</b> to access <b>" .. u21.Text .. "</b>.\n\nPlay a game to level up!"
            function v42.OnPrimaryBtnClick() --[[ Line: 115 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u11
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u11.OVERLAY)
            end
            v42.PrimaryBtnProps = {
                ["Text"] = "OK"
            }
            v40:openApp(v41, v42)
            return nil
        end
        u9:playSound(u17.UI_CLICK_2)
        u21.OnClick()
    end
    local v44
    if u25 then
        local v45 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 10,
            ["BackgroundTransparency"] = 0.3,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u5.BLACK
        }
        local v46 = u21.FrameProps
        if v46 then
            for v47, v48 in v46 do
                v45[v47] = v48
            end
        end
        v44 = u13.createFragment({
            ["LockedOverlay"] = u13.createElement("ImageLabel", v45, { u13.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }), u13.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 11,
                    ["Size"] = UDim2.fromScale(0.7, 0.7),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u16.LOCK_ART
                }, { u13.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }) })
        })
    else
        v44 = u25
    end
    local v49 = {}
    local v50 = #v49
    if v44 then
        v49[v50 + 1] = v44
    end
    local v51 = #v49
    local v52 = { u13.createElement(u4, {
            ["RichText"] = true,
            ["TextSize"] = 16,
            ["Text"] = u21.Text,
            ["Font"] = Enum.Font.SourceSansBold,
            ["Limits"] = Vector2.new(300, 60)
        }) }
    local v53 = #v52
    if u25 then
        local v54 = u13.createElement
        local v55 = u4
        local v56 = {
            ["RichText"] = true,
            ["TextSize"] = 14
        }
        local v57 = u21.LevelLocked
        v56.Text = "Requires Level <b>" .. tostring(v57) .. "</b>"
        v56.Font = Enum.Font.SourceSansBold
        v56.TextColor3 = Color3.fromRGB(255, 64, 64)
        v56.Limits = Vector2.new(300, 60)
        u25 = v54(v55, v56)
    end
    if u25 then
        v52[v53 + 1] = u25
    end
    v49[v51 + 1] = u13.createElement(u10, {}, v52)
    v49[v51 + 2] = u13.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0.1, 0)
    })
    local v58 = not u21.RemoveBackgroundColoring
    if v58 then
        v58 = u13.createElement("UIGradient", {
            ["Rotation"] = 90,
            ["Color"] = u21.BackgroundGradient or ColorSequence.new(v26, Color3.fromRGB(76, 78, 132))
        })
    end
    if v58 then
        v49[v51 + 3] = v58
    end
    local v59 = #v49
    local v60 = u21.Variant == u20.SHORT
    if v60 then
        local v61 = {
            ["BackgroundTransparency"] = 1,
            ["ClipsDescendants"] = true,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v62 = {}
        local v63 = #v62
        local v64 = {
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["ImageTransparency"] = 0.75,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Image"] = u21.Icon,
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1.5, 1.5)
        }
        local v65 = u21.IconProps
        if v65 then
            for v66, v67 in v65 do
                v64[v66] = v67
            end
        end
        v62[v63 + 1] = u13.createElement("ImageLabel", v64)
        v60 = u13.createFragment({
            ["BackgroundImage"] = u13.createElement(u7, v61, v62)
        })
    end
    if v60 then
        v49[v59 + 1] = v60
    end
    local v68 = #v49
    local v69 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v70 = {}
    local v71 = #v70
    local v72 = {}
    local v73 = u21.ButtonPadding
    if v73 ~= nil then
        v28 = v73
    end
    v72.Padding = UDim.new(0, v28)
    v70[v71 + 1] = u13.createElement(u8, v72)
    local v74 = u21.Variant ~= u20.SHORT
    if v74 then
        local v75 = {
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["Image"] = u21.Icon,
            ["Size"] = v29,
            ["Position"] = UDim2.fromScale(0.5, 0.475),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(120, 123, 188)
        }
        local v76 = u21.IconBackgroundTransparency
        v75.BackgroundTransparency = v76 == nil and 1 or v76
        v75.BorderSizePixel = 0
        local v77 = u21.IconProps
        if v77 then
            for v78, v79 in v77 do
                v75[v78] = v79
            end
        end
        v74 = u13.createElement("ImageLabel", v75, { u13.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    end
    if v74 then
        v70[v71 + 2] = v74
    end
    local v80 = #v70
    local v81 = u21.Variant ~= u20.ICON
    if v81 then
        local v82 = {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["Text"] = string.upper(u21.Text),
            ["Size"] = v30,
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["TextColor3"] = u5.WHITE,
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
            ["TextSize"] = u6.isSmallScreen() and 12 or 14
        }
        local v83 = u21.TextLabelProps
        if v83 then
            for v84, v85 in v83 do
                v82[v84] = v85
            end
        end
        v81 = u13.createElement("TextLabel", v82, { u13.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 15
            }), u13.createElement("UIStroke", {
                ["Transparency"] = 0.3,
                ["Color"] = Color3.fromRGB(28, 28, 28)
            }) })
    end
    if v81 then
        v70[v80 + 1] = v81
    end
    v49.Container = u13.createElement(u7, v69, v70)
    local v86 = u21[u13.Children]
    if v86 then
        for v87, v88 in v86 do
            if type(v87) == "number" then
                v49[v68 + v87] = v88
            else
                v49[v87] = v88
            end
        end
    end
    return u13.createFragment({
        ["LobbyHudSideButton_" .. u21.Text] = u13.createElement("ImageButton", v36, v49)
    })
end
return {
    ["LobbyHudSideButtonVariant"] = u20,
    ["LobbyHudSideButton"] = v14.new(u13)(v89)
}