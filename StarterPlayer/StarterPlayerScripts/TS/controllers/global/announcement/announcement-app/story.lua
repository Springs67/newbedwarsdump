local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnnouncementVariant
local u4 = v2.TextAnnouncementBordered
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u4
    --]]
    local v7 = u3.text
    local v8 = {
        ["message"] = "Test Announcement",
        ["duration"] = 5,
        ["variant"] = "textWithBG"
    }
    local v9 = {
        ["props"] = {
            ["Size"] = UDim2.fromScale(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.6)
        },
        ["tween"] = {
            ["disabled"] = true
        }
    }
    v8.textlabel = v9
    v8.position = UDim2.fromScale(0.5, 0.2)
    local v10 = {
        ["Announcement"] = v7(v8)
    }
    local u11 = u5.mount(u5.createElement(u4, v10), p6)
    return function() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u11
        --]]
        return u5.unmount(u11)
    end
end