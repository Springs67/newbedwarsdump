local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta
local u5 = v1.import(script, script.Parent, "lobby-title").LobbyTitle
return {
    ["PlayerLobbyTitle"] = v3.new(u2)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u5
        --]]
        local v8 = p7.useState
        local v9 = p7.useEffect
        local v10, u11 = v8(nil)
        local v12, u13 = v8(nil)
        v9(function() --[[ Line: 12 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u11
                [3] = u4
                [4] = u13
            --]]
            local v14 = u6.Player:GetAttribute("TitleType")
            if v14 then
                u11(v14)
                if u4[v14].statsTracking then
                    local v15 = u6.Player:GetAttribute("TitleSuffix")
                    if v15 ~= "" and v15 then
                        u13(v15)
                    end
                end
            end
            local u18 = u6.Player:GetAttributeChangedSignal("TitleType"):Connect(function() --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u11
                    [3] = u4
                    [4] = u13
                --]]
                local v16 = u6.Player:GetAttribute("TitleType")
                u11(v16)
                if v16 then
                    if u4[v16].statsTracking then
                        local v17 = u6.Player:GetAttribute("TitleSuffix")
                        if v17 ~= "" and v17 then
                            u13(v17)
                            return
                        end
                    else
                        u13(nil)
                    end
                end
            end)
            return function() --[[ Line: 39 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18:Disconnect()
            end
        end, {})
        if v10 then
            return u2.createElement(u5, {
                ["TitleType"] = v10,
                ["TextLabelProps"] = u6.TextLabelProps,
                ["suffix"] = v12
            })
        else
            return u2.createFragment()
        end
    end)
}