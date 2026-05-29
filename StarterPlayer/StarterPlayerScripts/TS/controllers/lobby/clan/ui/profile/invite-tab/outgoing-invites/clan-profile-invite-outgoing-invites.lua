local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AutoCanvasScrollingFrame
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u8 = v1.import(script, script.Parent, "clan-profile-invite-outgoing-invite").ClanProfileInviteOutgoingInvite
local v20 = v5.new(u4)(function(p9, p10) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u8
        [4] = u7
        [5] = u2
    --]]
    local _ = p10.useState
    local v11
    if p9.OutgoingInvites and next(p9.OutgoingInvites) ~= nil then
        local v12 = u3.values(p9.OutgoingInvites)
        v11 = table.create(#v12)
        for v13, v14 in v12 do
            local _ = v13 - 1
            v11[v13] = u4.createElement(u8, {
                ["ClanInvite"] = v14,
                ["LayoutOrder"] = -v14.time
            })
        end
    else
        v11 = u4.createElement("TextLabel", {
            ["Text"] = "<b>No players in your current server to invite.</b>",
            ["TextXAlignment"] = "Center",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.8),
            ["TextColor3"] = u7.textPrimary
        }, { u4.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 24
            }) })
    end
    local v15 = {
        ["AdditionalSpace"] = 20,
        ["ScrollingFrameProps"] = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
    }
    local v16 = { u4.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 10)
        }) }
    local v17 = #v16
    if v11.elements == nil and (v11.props == nil or v11.component == nil) then
        for v18, v19 in v11 do
            v16[v17 + v18] = v19
        end
    else
        v16[v17 + 1] = v11
    end
    return u4.createElement(u2, v15, v16)
end)
return {
    ["ClanProfileInviteOutgoingInvites"] = v6.connect(function(p21, p22) --[[ Line: 73 ]]
        local v23 = {}
        for v24, v25 in p22 do
            v23[v24] = v25
        end
        local v26 = p21.Clans.myClan
        if v26 ~= nil then
            v26 = v26.invites
            if v26 ~= nil then
                v26 = v26.outgoing
            end
        end
        v23.OutgoingInvites = v26
        return v23
    end)(v20)
}