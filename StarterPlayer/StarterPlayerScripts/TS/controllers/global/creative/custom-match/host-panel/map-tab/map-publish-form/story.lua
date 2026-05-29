local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-tags").MapBrowserTags
local u9 = v1.import(script, script.Parent, "map-publish-form").MapPublishForm
return function(p10) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
        [4] = u3
        [5] = u9
        [6] = u7
        [7] = u8
        [8] = u6
    --]]
    local v11 = {
        ["Game"] = u5
    }
    local v12 = u4.Store.new(u4.combineReducers(v11), {})
    local v13 = u2.mount
    local v14 = u2.createElement
    local v15 = u3
    local v16 = {}
    local v17 = u2.createElement
    local v18 = u9
    local v19 = {
        ["AppId"] = "MapSettingsModal",
        ["MapSaveDisplayInfo"] = {
            ["code"] = "1234ACBD5678",
            ["name"] = "hello",
            ["description"] = "The best map in the world!",
            ["creator"] = 214,
            ["published"] = true,
            ["copylock"] = true,
            ["image"] = u7.DODO_BIRD_RENDER,
            ["tags"] = { u8.BEDWARS },
            ["queueType"] = u6.BEDWARS_20v20,
            ["dateCreated"] = os.time(),
            ["lastUpdated"] = os.time()
        }
    }
    __set_list(v16, 1, {v17(v18, v19)})
    local u20 = v13(v14(v15, {
        ["store"] = v12
    }, v16), p10)
    return function() --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u20
        --]]
        return u2.unmount(u20)
    end
end