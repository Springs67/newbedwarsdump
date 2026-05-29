local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u6 = v1.import(script, script.Parent.Parent, "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase
local u7 = v1.import(script, script.Parent, "radial-wheel").RadialWheel
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u5
        [4] = u4
        [5] = u2
        [6] = u7
    --]]
    local u9 = 0
    local v10 = false
    local v11 = {}
    while true do
        if v10 then
            u9 = u9 + 1
        else
            v10 = true
        end
        if u9 >= 8 then
            local u12 = u3.mount(u3.createElement(u2, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u3.createElement("UIListLayout", {
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
                }), u3.createElement(u7, {
                    ["numSlices"] = 8,
                    ["entries"] = v11
                }) }), p8)
            return function() --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u12
                --]]
                return u3.unmount(u12)
            end
        end
        local v14 = {
            ["element"] = u3.createElement(u6, {
                ["Emote"] = u5.ACADEMY_AERY_READ
            }),
            ["title"] = u4[u5.ACADEMY_AERY_READ].name,
            ["onSelect"] = function() --[[ Name: onSelect, Line 29 ]]
                --[[
                Upvalues:
                    [1] = u9
                --]]
                local v13 = u9
                return print("Entry " .. tostring(v13))
            end
        }
        table.insert(v11, v14)
    end
end