local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "chat", "chat-tag-type").ChatTagType
return {
    ["ChatTagMeta"] = {
        [v1.CLAN] = {
            ["displayOrder"] = 0
        },
        [v1.RANK] = {
            ["displayOrder"] = 1
        }
    }
}