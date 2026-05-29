local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v15 = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u4
    --]]
    local _ = p9.useState
    local v10 = {
        ["Size"] = UDim2.new(1, 0, 0, 24)
    }
    local v11 = { u5.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 6)
        }), u5.createElement(u3, {
            ["Text"] = "<b>Players In Server</b>",
            ["Size"] = UDim2.fromScale(0.25, 1),
            ["BackgroundColor3"] = Color3.fromRGB(32, 33, 62),
            ["BackgroundTransparency"] = u8.subTab == 0 and 0 or 0.3,
            ["OnClick"] = function() --[[ Name: OnClick, Line 25 ]]
                --[[
                Upvalues:
                    [1] = u8
                --]]
                u8.setSubTab(0)
            end
        }) }
    local v12 = #v11
    local v13 = {
        ["Size"] = UDim2.fromScale(0.25, 1),
        ["BackgroundColor3"] = Color3.fromRGB(32, 33, 62),
        ["BackgroundTransparency"] = u8.subTab == 1 and 0 or 0.3
    }
    local v14 = u8.OutgoingInvites
    if v14 ~= nil then
        v14 = 0
        for _ in v14 do
            v14 = v14 + 1
        end
    end
    v13.Text = "<b>Outgoing Invites (" .. tostring(v14) .. ")</b>"
    function v13.OnClick() --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8.setSubTab(1)
    end
    v11[v12 + 1] = u5.createElement(u3, v13)
    return u5.createElement(u4, v10, v11)
end)
return {
    ["ClanProfileInviteTabs"] = v7.connect(function(p16, p17) --[[ Line: 54 ]]
        local v18 = {}
        for v19, v20 in p17 do
            v18[v19] = v20
        end
        local v21 = p16.Clans.myClan
        if v21 ~= nil then
            v21 = v21.invites
            if v21 ~= nil then
                v21 = v21.outgoing
            end
        end
        v18.OutgoingInvites = v21
        return v18
    end)(v15)
}