local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u6 = v1.import(script, script.Parent, "confirmation-modal-base").ConfirmationModalApp
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u5
        [4] = u2
        [5] = u4
    --]]
    local v8 = u3
    local v9 = u6
    local v10 = {
        ["Title"] = "Rent Kit?",
        ["Body"] = "You don\'t have any kit rental passes for TRIXIE. You can receive rental passes by opening crates",
        ["PreviouslySelected"] = nil,
        ["PrimaryBtnProps"] = {
            ["Text"] = "USE RENTAL PASS",
            ["BackgroundColor3"] = u5.backgroundSuccess
        },
        ["PrimaryBtnChildren"] = { u2.createElement("UIListLayout", {
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["Padding"] = UDim.new(0.05, 0)
            }), u2.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["SizeConstraint"] = "RelativeYY",
                ["Image"] = u4.KIT_RENTAL_PASS_ALL,
                ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = UDim2.fromScale(1, 0.7),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.34, 0.5)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }) },
        ["SecondaryBtnProps"] = {
            ["Text"] = "CANCEL"
        },
        ["OnPrimaryBtnClick"] = function() --[[ Name: OnPrimaryBtnClick, Line 39 ]] end,
        ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 40 ]] end
    }
    local v11 = {}
    local v12 = {
        ["buttonProps"] = {
            ["Text"] = "RENT",
            ["LayoutOrder"] = -3
        },
        ["onClick"] = function() --[[ Name: onClick, Line 46 ]]
            return true
        end,
        ["childElements"] = { u2.createElement("UIListLayout", {
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["Padding"] = UDim.new(0.05, 0)
            }), u2.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["SizeConstraint"] = "RelativeYY",
                ["Image"] = u4.BED_COIN_ICON,
                ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = UDim2.fromScale(1, 0.7),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.34, 0.5)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }) }
    }
    __set_list(v11, 1, {v12})
    v10.AdditionalButtons = v11
    local u13 = v8("ConfirmationModal", v9, v10, {}, {
        ["Parent"] = p7
    })
    return function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u13
        --]]
        return u2.unmount(u13)
    end
end