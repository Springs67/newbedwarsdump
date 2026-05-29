local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.OfflinePlayerUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u11 = v1.import(script, script.Parent, "clan-profile-invite-entry").ClanProfileInviteEntry
return {
    ["ClanProfileInvitePlayersInServer"] = v8.new(u7)(function(_, p12) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u6
            [3] = u9
            [4] = u7
            [5] = u11
            [6] = u3
            [7] = u5
            [8] = u10
        --]]
        local _ = p12.useState
        local v13
        if u4.isHoarceKat() then
            v13 = {
                u6.Dummy.SnickTrix,
                u6.Dummy.spleenhook,
                u6.Dummy.grilme99,
                u6.Dummy.grilme99,
                u6.Dummy.grilme99,
                u6.Dummy.grilme99,
                u6.Dummy.grilme99,
                u6.Dummy.grilme99,
                u6.Dummy.grilme99,
                u6.Dummy.grilme99,
                u6.Dummy.grilme99,
                u6.Dummy.grilme99,
                u6.Dummy.grilme99,
                u6.Dummy.grilme99,
                u6.Dummy.grilme99
            }
            table.sort(v13, function(p14, p15) --[[ Line: 18 ]]
                return p14.displayName < p15.displayName
            end)
        else
            local v16 = 0
            local v17 = {}
            for v18, v19 in u9:GetPlayers() do
                local _ = v18 - 1
                if v19 ~= u9.LocalPlayer == true then
                    v16 = v16 + 1
                    v17[v16] = v19
                end
            end
            v13 = table.create(#v17)
            for v20, v21 in v17 do
                local _ = v20 - 1
                v13[v20] = u6.getOfflinePlayer(v21)
            end
            table.sort(v13, function(p22, p23) --[[ Line: 47 ]]
                return p22.displayName < p23.displayName
            end)
        end
        local v24
        if #v13 == 0 then
            v24 = u7.createElement("TextLabel", {
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
                ["TextColor3"] = u10.textPrimary
            }, { u7.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 24
                }) })
        else
            local v25 = {
                ["Size"] = UDim2.new(1, 0, 1, 0)
            }
            local v26 = {}
            local v27 = #v26
            local v28 = table.create(#v13)
            for v29, v30 in v13 do
                local _ = v29 - 1
                v28[v29] = u7.createElement(u11, {
                    ["Player"] = v30
                })
            end
            local v31 = {
                ["AdditionalSpace"] = 80,
                ["ScrollingFrameProps"] = {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(1, 0, 1, -6)
                }
            }
            local v32 = { u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 10)
                }) }
            local v33 = #v32
            for v34, v35 in v28 do
                v32[v33 + v34] = v35
            end
            v26[v27 + 1] = u7.createElement(u3, v31, v32)
            v24 = u7.createElement(u5, v25, v26)
        end
        local v36 = {
            [#v36 + 1] = v24
        }
        return u7.createFragment(v36)
    end)
}