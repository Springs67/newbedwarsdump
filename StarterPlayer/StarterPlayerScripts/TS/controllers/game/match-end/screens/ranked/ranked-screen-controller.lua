local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").preloadImages
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController
local u10 = v1.import(script, script.Parent, "ui", "provisional-progress-bar-app").ProvisionalProgressBarApp
local u11 = v1.import(script, script.Parent, "ui", "ranked-progress-bar-app").RankedProgressBarApp
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "RankedScreenController"
    end,
    ["__index"] = u9
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p15, 3)
    p15.Name = "RankedScreenController"
end
function u12.KnitStart(u16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
    --]]
    u9.KnitStart(u16)
    u8.Client:OnEvent("MatchRankReport", function(p17) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.rankChangeDto = p17.rankChange
    end)
end
function u12.renderScreen(p18) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u2
        [4] = u10
        [5] = u11
    --]]
    if p18.rankChangeDto then
        if p18.rankChangeDto.matchesPlayed < u7.NUM_PROVISIONAL_MATCHES then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                ["appId"] = "MatchEndProvisionalProgression",
                ["app"] = u10
            }, {
                ["RankedMatchesPlayed"] = p18.rankChangeDto.matchesPlayed
            })
        else
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                ["appId"] = "MatchEndRankedProgression",
                ["app"] = u11
            }, {
                ["RankChangeData"] = p18.rankChangeDto
            })
        end
    else
        u4.Controllers.MatchEndController:skipCurrDisplay()
        return nil
    end
end
function u12.unmountScreen(_) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("MatchEndRankedProgression") then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MatchEndRankedProgression")
    end
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("MatchEndProvisionalProgression") then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MatchEndProvisionalProgression")
    end
end
function u12.preRenderRankDivisionIcons(_, p19) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u3
    --]]
    local v20 = {}
    for v21 = 1, #p19 do
        local v22 = p19[v21]
        local _ = v21 - 1
        local v23 = {}
        local v24 = #v23
        local v25 = #v20
        table.move(v20, 1, v25, v24 + 1, v23)
        v23[v24 + v25 + 1] = u6[v22].image
        v20 = v23
    end
    if p19[1] ~= p19[2] then
        local v26 = u5.SHINING_SPINNER
        table.insert(v20, v26)
    end
    u3(v20)
end
u4.CreateController(u12.new())
return nil