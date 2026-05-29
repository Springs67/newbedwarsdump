local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-tax-util").TaxTheme
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "void", "void-world-util").VoidWorldUtil
local v11 = u6.Component:extend("ShopToolbar")
function v11.init(_) --[[ Line: 15 ]] end
function v11.render(p12) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u3
        [4] = u9
        [5] = u6
        [6] = u4
        [7] = u5
        [8] = u8
    --]]
    local v13 = p12.props.ObservedInventory
    if v13 ~= nil then
        v13 = v13.inventory
    end
    local u14 = 0
    local u15 = 0
    local u16 = 0
    local u17 = 0
    local u18 = 0
    if v13 ~= nil then
        local v19 = v13.items
        local function v21(p20) --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u14
                [3] = u15
                [4] = u16
                [5] = u17
                [6] = u18
            --]]
            if p20.itemType == u7.IRON then
                u14 = u14 + p20.amount
                return
            elseif p20.itemType == u7.DIAMOND then
                u15 = u15 + p20.amount
                return
            elseif p20.itemType == u7.EMERALD then
                u16 = u16 + p20.amount
                return
            elseif p20.itemType == u7.VOID_CRYSTAL then
                u17 = u17 + p20.amount
            elseif p20.itemType == u7.GOLD then
                u18 = u18 + p20.amount
            end
        end
        for v22, v23 in v19 do
            v21(v23, v22 - 1, v19)
        end
    end
    if p12.props.IsHomeBase then
        local v24 = p12.props.ObservedInventory
        if v24 ~= nil then
            v24 = v24.observedChest
            if v24 ~= nil then
                v24 = v24.items
                if v24 ~= nil then
                    v24 = nil
                    for v25, v26 in v24 do
                        local _ = v25 - 1
                        local v27
                        if v26 == "empty" then
                            v27 = false
                        else
                            v27 = v26.itemType == u7.DIAMOND
                        end
                        if v27 == true then
                            v24 = v26
                            break
                        end
                    end
                end
            end
        end
        if v24 ~= nil then
            v24 = v24.amount
        end
        u15 = u15 + (v24 == nil and 0 or v24)
    end
    local v28 = "    <font color=\"#FF55FF\">" .. tostring(u17) .. " Void Crystal</font>"
    local v29 = not u10.VOID_ENABLED and "" or v28
    local v30 = "    <font color=\"" .. u3.richTextColor(u9.mcGold) .. "\">" .. tostring(u18) .. " Gold</font>"
    local v31 = u18 < 1 and "" or v30
    local v32 = "<b>" .. tostring(u14) .. " Iron    <font color=\"#55FFFF\">" .. tostring(u15) .. " Diamond</font>    <font color=\"#55FF99\">" .. tostring(u16) .. " Emerald</font>" .. v31 .. v29 .. "</b>"
    local v33 = u6.createRef()
    local v34
    if u4.isHoarceKat() then
        v34 = false
    else
        v34 = u5.Controllers.ShopTaxController:isTaxed()
    end
    local v35 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = p12.props.Size,
        ["BackgroundColor3"] = u3.hexColor(3092550)
    }
    local v36 = { u6.createElement("TextLabel", {
            ["Text"] = "Item Shop",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["Size"] = UDim2.fromScale(0.3, 0.5),
            ["Position"] = UDim2.fromScale(0.03, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }) }
    local v37 = #v36
    if v34 then
        v34 = u6.createFragment({
            ["TaxWarningIcon"] = u6.createElement("ImageLabel", {
                [u6.Ref] = v33,
                ["Image"] = u8.WarningImage,
                ["Size"] = UDim2.fromScale(0.05, 0.8),
                ["Position"] = UDim2.fromScale(0.5, 0.45),
                ["AnchorPoint"] = Vector2.new(0.5, 0.45),
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["ImageTransparency"] = 0,
                [u6.Event.MouseEnter] = function(p38) --[[ Line: 144 ]]
                    local v39 = p38:FindFirstChild("TaxWarningMsg")
                    if v39 then
                        v39.Visible = true
                    end
                end,
                [u6.Event.MouseLeave] = function(p40) --[[ Line: 150 ]]
                    local v41 = p40:FindFirstChild("TaxWarningMsg")
                    if v41 then
                        v41.Visible = false
                    end
                end
            }, {
                ["TaxWarningMsg"] = u6.createElement("Frame", {
                    ["BackgroundTransparency"] = 0,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 2,
                    ["BackgroundColor3"] = u9.backgroundSecondary,
                    ["Size"] = UDim2.fromScale(4, 1.6),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 1.8)
                }, { u6.createElement("UIStroke", {
                        ["Thickness"] = 2,
                        ["Color"] = u3.hexColor(3092550)
                    }), u6.createElement("TextLabel", {
                        ["Text"] = "<b>Early Game Tax:</b> You were given too much iron.",
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["Font"] = "Roboto",
                        ["TextScaled"] = true,
                        ["TextWrapped"] = true,
                        ["RichText"] = true,
                        ["TextXAlignment"] = "Center",
                        ["TextYAlignment"] = "Center",
                        ["ZIndex"] = 3,
                        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                        ["Size"] = UDim2.fromScale(1, 1)
                    }) })
            })
        })
    end
    if v34 then
        v36[v37 + 1] = v34
    end
    v36[#v36 + 1] = u6.createElement("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Font"] = "Roboto",
        ["TextScaled"] = true,
        ["RichText"] = true,
        ["TextXAlignment"] = "Right",
        ["Text"] = v32,
        ["Size"] = UDim2.fromScale(0.97, 0.45),
        ["Position"] = UDim2.fromScale(0.98, 0.5),
        ["AnchorPoint"] = Vector2.new(1, 0.5),
        ["TextColor3"] = Color3.fromRGB(255, 255, 255)
    })
    return u6.createElement("Frame", v35, v36)
end
return {
    ["ShopToolbar"] = v11
}