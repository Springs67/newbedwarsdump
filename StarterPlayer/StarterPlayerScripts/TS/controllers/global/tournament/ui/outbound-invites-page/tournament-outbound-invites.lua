local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u5 = v1.import(script, script.Parent, "tournament-outbound-invite").TournamentOutgoingInvite
return {
    ["TournamentOutgoingInvites"] = v3.new(u2)(function(p6, _) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
            [3] = u4
        --]]
        local v7 = {}
        local v8 = p6.LayoutOrder
        v7.LayoutOrder = v8 == nil and 2 or v8
        v7.Size = UDim2.fromScale(1, 0.95)
        v7.BackgroundTransparency = 1
        local v9
        if #p6.OutboundInvites == 0 then
            v9 = u2.createElement("TextLabel", {
                ["Text"] = "<b>No outbound invites.</b>",
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
                ["TextColor3"] = u4.textPrimary
            }, { u2.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 24
                }) })
        else
            local v10 = p6.OutboundInvites
            v9 = table.create(#v10)
            for v11, v12 in v10 do
                local v13 = {
                    ["InvitedPlayer"] = v12,
                    ["LayoutOrder"] = v11 - 1
                }
                v9[v11] = u2.createElement(u5, v13)
            end
        end
        local v14 = { u2.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v15 = #v14
        if v9.elements == nil and (v9.props == nil or v9.component == nil) then
            for v16, v17 in v9 do
                v14[v15 + v16] = v17
            end
        else
            v14[v15 + 1] = v9
        end
        return u2.createElement("Frame", v7, v14)
    end)
}