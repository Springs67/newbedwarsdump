local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u10 = v1.import(script, script.Parent, "clan-menu-invite-card").ClanMenuInviteCard
local v26 = v7.new(u6)(function(p11, p12) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u10
        [4] = u3
        [5] = u9
        [6] = u4
    --]]
    local _ = p12.useState
    local v13
    if next(p11.ClanInvites) == nil then
        v13 = u6.createElement("TextLabel", {
            ["Text"] = "<b>No incoming clan invites.\n Would you like to create one instead?</b>",
            ["TextXAlignment"] = "Center",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["LayoutOrder"] = 1,
            ["AutoLocalize"] = false,
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["TextColor3"] = u9.textPrimary
        }, { u6.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 24
            }) })
    else
        local v14 = p11.ClanInvites
        if v14 then
            local v15 = u5.entries(p11.ClanInvites)
            v14 = table.create(#v15)
            for v16, v17 in v15 do
                local _ = v16 - 1
                local _ = v17[1]
                local v18 = {
                    ["ClanInvite"] = v17[2]
                }
                v14[v16] = u6.createElement(u10, v18)
            end
        end
        local v19 = {
            ["AdditionalSpace"] = 80,
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.9)
            }
        }
        local v20 = { u6.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 1)
            }), u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v21 = #v20
        for v22, v23 in v14 do
            v20[v21 + v22] = v23
        end
        v13 = u6.createElement(u3, v19, v20)
    end
    local v24 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v25 = {
        [#v25 + 1] = v13
    }
    return u6.createFragment({
        ["ClanMenuInvitesTab"] = u6.createElement(u4, v24, v25)
    })
end)
return {
    ["ClanMenuInvites"] = v8.connect(function(p27, p28) --[[ Line: 88 ]]
        local v29 = {}
        for v30, v31 in p28 do
            v29[v30] = v31
        end
        v29.ClanInvites = p27.Clans.incomingClanInvites
        return v29
    end)(v26)
}