local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
return {
    ["TutorialTheme"] = {
        ["iron"] = v1.richTextColor(v1.hexColor(10413803)),
        ["diamond"] = v1.richTextColor(v1.hexColor(65520)),
        ["emerald"] = v1.richTextColor(v1.hexColor(4063091)),
        ["upgrade"] = v1.richTextColor(v1.hexColor(16764160)),
        ["highlightGreen"] = v1.richTextColor(v1.hexColor(12517329)),
        ["recall"] = v1.richTextColor(v1.hexColor(16755200)),
        ["item"] = v1.richTextColor(v1.hexColor(16757375)),
        ["bed"] = v1.richTextColor(v1.hexColor(12505599)),
        ["enemy"] = v1.richTextColor(v1.hexColor(16742263)),
        ["woolBlue"] = v1.richTextColor(v1.hexColor(4836850)),
        ["highlightBlue"] = v1.richTextColor(v1.hexColor(12505599))
    }
}