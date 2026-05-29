local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u7 = v1.import(script, script.Parent, "custom-matches-app").CustomMatchesApp
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u6
        [4] = u4
        [5] = u7
        [6] = u3
    --]]
    local v9 = u5
    local v10 = {
        ["type"] = "CustomMatchSetMapSaves",
        ["mapSaves"] = {
            {
                ["name"] = "Aqua 2v2",
                ["description"] = "nothing",
                ["code"] = "1234ABCD5678",
                ["published"] = false,
                ["copylock"] = true,
                ["creator"] = u2.Dummy.oiogy.userId,
                ["queueType"] = u6.BEDWARS_TO4,
                ["dateCreated"] = os.time(),
                ["lastUpdated"] = os.time()
            },
            {
                ["name"] = "Maze Map",
                ["description"] = "nothing",
                ["code"] = "56781234ABCD",
                ["published"] = false,
                ["copylock"] = true,
                ["creator"] = u2.Dummy.oiogy.userId,
                ["queueType"] = u6.BEDWARS_20v20,
                ["dateCreated"] = os.time(),
                ["lastUpdated"] = os.time()
            }
        }
    }
    v9:dispatch(v10)
    local u13 = u4("CustomMatchesApp", u7, {
        ["OnJoinMatch"] = print,
        ["OnCreateMatch"] = function(p11, p12) --[[ Name: OnCreateMatch, Line 36 ]]
            print(p11, p12)
            task.wait(2)
        end,
        ["OnClose"] = function() --[[ Name: OnClose, Line 40 ]]
            return print("Close")
        end
    }, {}, {
        ["Parent"] = p8
    })
    return function() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u13
        --]]
        u3.unmount(u13)
    end
end