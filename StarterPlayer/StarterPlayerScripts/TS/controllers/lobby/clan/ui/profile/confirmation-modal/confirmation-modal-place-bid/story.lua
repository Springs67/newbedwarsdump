local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").StringUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent, "confirmation-modal-base").ConfirmationModalApp
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u5
        [4] = u3
    --]]
    local u7 = u4("ConfirmationModalPlaceBid", u5, {
        ["Title"] = "Place Bid",
        ["PreviouslySelected"] = nil,
        ["Body"] = "Are you sure you want to place a bid for <font color=\"" .. "#55FFFF" .. "\">" .. u2.formatNumberWithCommas(20001) .. " Clan War Crystals</font> for <font color=\"#55FFFF\">Baby Penguin</font>\n<font color=\"#AAAAAA\">[Warning] Placing this bid will deduct your bid currency immediately. You\'ll be refunded if you lose, or refunded the difference if your max bid exceeds the winning bid amount.</font>",
        ["TextBodyProps"] = {
            ["RichText"] = true,
            ["TextWrapped"] = true,
            ["TextScaled"] = false,
            ["TextSize"] = 18
        },
        ["SecondaryBtnProps"] = {
            ["Text"] = "CANCEL"
        },
        ["PrimaryBtnProps"] = {
            ["Text"] = "PLACE BID"
        },
        ["OnPrimaryBtnClick"] = function() --[[ Name: OnPrimaryBtnClick, Line 30 ]] end,
        ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 31 ]] end
    }, {}, {
        ["Parent"] = p6
    })
    return function() --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
        --]]
        return u3.unmount(u7)
    end
end