local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.Button
local u6 = v3.ColorUtil
local u7 = v3.DeviceUtil
local u8 = v3.SoundManager
local u9 = v3.StringUtil
local u10 = v3.TooltipContainer
local u11 = v3.UILayers
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta")
local u18 = v17.ConsumableTypeMeta
local u19 = v17.getConsumableMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v41 = v14.new(u13)(function(u24, p25) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
        [3] = u12
        [4] = u5
        [5] = u19
        [6] = u6
        [7] = u23
        [8] = u9
        [9] = u20
        [10] = u2
        [11] = u16
        [12] = u8
        [13] = u22
        [14] = u11
        [15] = u21
        [16] = u10
        [17] = u4
        [18] = u18
    --]]
    local _ = p25.useState
    local u26 = u13.createRef()
    local u27
    if u7.isHoarceKat() then
        u27 = nil
    else
        u27 = u12.Controllers.KitRentalController:getEligibleRentalPass(u24.SelectedKit)
    end
    local v28 = u13.createFragment
    local v40 = {
        ["RentKitButton"] = u13.createElement(u5, {
            ["Size"] = u24.Size,
            ["BackgroundTransparency"] = 1,
            ["Selectable"] = true,
            [u13.Ref] = u26,
            ["OnClick"] = function() --[[ Name: OnClick, Line 38 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u19
                    [3] = u6
                    [4] = u23
                    [5] = u9
                    [6] = u20
                    [7] = u24
                    [8] = u2
                    [9] = u16
                    [10] = u26
                    [11] = u8
                    [12] = u22
                    [13] = u11
                --]]
                local function v34() --[[ Line: 39 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                        [2] = u19
                        [3] = u6
                        [4] = u23
                        [5] = u9
                        [6] = u20
                        [7] = u24
                    --]]
                    if not u27 then
                        return "You don\'t have any kit rental passes for " .. u20(u24.SelectedKit).name .. ". You can receive rental passes by opening crates"
                    end
                    local v29 = u19(u27.consumable)
                    local v30 = u6.richTextColor(u23.mcAqua)
                    local v31 = v29.displayName
                    local v32 = u6.richTextColor(u23.mcAqua)
                    local v33 = v29.activeDuration
                    return "Are you sure you want to use <font color=\"" .. v30 .. "\" transparency=\"0\"><b>1 " .. v31 .. "</b></font> to rent this kit for <font color=\"" .. v32 .. "\" transparency=\"0\"><b>" .. ((v33 == 0 or (v33 ~= v33 or not v33)) and "7 days" or u9.fromNow(os.time() + 1 + v29.activeDuration, {
                        ["hideIfZero"] = true,
                        ["long"] = true
                    })) .. "</b></font>?"
                end
                local v35 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                local v36 = u16.CONFIRMATION_MODAL
                local v37 = {
                    ["Title"] = "Rent Kit?",
                    ["Body"] = v34()
                }
                local v38 = {
                    ["Text"] = "RENT"
                }
                local v39
                if u27 then
                    v39 = u23.backgroundSuccess
                else
                    v39 = u23.backgroundError
                end
                v38.BackgroundColor3 = v39
                v37.PrimaryBtnProps = v38
                v37.SecondaryBtnProps = {
                    ["Text"] = "CANCEL"
                }
                v37.PreviouslySelected = u26:getValue()
                function v37.OnPrimaryBtnClick() --[[ Line: 64 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u8
                        [3] = u22
                    --]]
                    if u24.RentKit() then
                        u8:playSound(u22.BEDWARS_PURCHASE_ITEM)
                    end
                end
                function v37.OnSecondaryBtnClick() --[[ Line: 70 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u11
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u11.OVERLAY)
                end
                v35:openApp(v36, v37)
            end,
            ["LayoutOrder"] = u24.LayoutOrder
        }, {
            u13.createElement("UIStroke", {
                ["Color"] = Color3.fromRGB(45, 147, 240),
                ["Thickness"] = u7.isSmallScreen() and 1 or 2,
                ["Transparency"] = u27 and 0 or 0.75
            }),
            u13.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1000, 0)
            }),
            u13.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["Image"] = u21.KIT_RENTAL_PASS_ALL,
                ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = UDim2.fromScale(0.75, 0.75),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["ImageTransparency"] = u27 and 0 or 0.75
            }),
            u13.createElement(u10, {}, { u13.createElement(u4, {
                    ["Text"] = "Rent Kit",
                    ["TextSize"] = 16,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }), u13.createElement(u4, {
                    ["TextSize"] = 14,
                    ["Text"] = not u27 and "NO PASS FOUND" or u18[u27.consumable].displayName,
                    ["Font"] = Enum.Font.SourceSansSemibold,
                    ["Limits"] = Vector2.new(300, 500),
                    ["TextColor3"] = Color3.fromRGB(130, 41, 255)
                }), u13.createElement(u4, {
                    ["TextSize"] = 14,
                    ["Text"] = u20(u24.SelectedKit).name,
                    ["Font"] = Enum.Font.SourceSans,
                    ["Limits"] = Vector2.new(300, 500)
                }) })
        })
    }
    return v28(v40)
end)
return {
    ["KitShopRentKitButton"] = v15.connect(function(_, p42) --[[ Line: 122 ]]
        local v43 = {}
        for v44, v45 in p42 do
            v43[v44] = v45
        end
        return v43
    end)(v41)
}