local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.WIZARD_INTRO = "wizard_intro"
v1.wizard_intro = "WIZARD_INTRO"
v2.THE_COVEN = "the_coven"
v1.the_coven = "THE_COVEN"
v2.LNY_DRAGON_KIT = "lny_dragon_kit"
v1.lny_dragon_kit = "LNY_DRAGON_KIT"
v2.NEWSPAPER_ISSUE_1 = "newspaper_issue_1"
v1.newspaper_issue_1 = "NEWSPAPER_ISSUE_1"
v2.NEWSPAPER_ISSUE_2 = "newspaper_issue_2"
v1.newspaper_issue_2 = "NEWSPAPER_ISSUE_2"
local v3 = v2.NEWSPAPER_ISSUE_2
local v4 = {
    [v2.WIZARD_INTRO] = {
        ["title"] = "Zeno The Wizard",
        ["coverArt"] = "rbxassetid://13353775097",
        ["pageAssetIds"] = { "rbxassetid://13353775097", "rbxassetid://13353774651", "rbxassetid://13353774341" }
    },
    [v2.THE_COVEN] = {
        ["title"] = "The Coven",
        ["coverArt"] = "rbxassetid://15186278320",
        ["pageAssetIds"] = { "rbxassetid://15186278320", "rbxassetid://15186279129" }
    },
    [v2.LNY_DRAGON_KIT] = {
        ["title"] = "Night Market Dragon",
        ["coverArt"] = "rbxassetid://16215539219",
        ["pageAssetIds"] = { "rbxassetid://16215539219", "rbxassetid://16215538752", "rbxassetid://16215538267" }
    },
    [v2.NEWSPAPER_ISSUE_1] = {
        ["title"] = "BedWars Times - Issue 1",
        ["coverArt"] = "rbxassetid://132406583687693",
        ["disabled"] = true,
        ["pageAssetIds"] = { "rbxassetid://132406583687693", "rbxassetid://105459967132290" }
    },
    [v2.NEWSPAPER_ISSUE_2] = {
        ["title"] = "BedWars Times - Issue 3",
        ["coverArt"] = "rbxassetid://140600934886061",
        ["pageAssetIds"] = { "rbxassetid://140600934886061", "rbxassetid://94574751833392" }
    }
}
return {
    ["News"] = v2,
    ["SELECTED_NEWS"] = v3,
    ["NewsMeta"] = v4
}