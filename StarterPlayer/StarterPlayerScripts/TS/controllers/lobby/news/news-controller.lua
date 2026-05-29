local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.WatchCollectionTag
local u5 = v3.preloadImages
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "news", "news-types").NewsMeta
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "NewsController"
    end,
    ["__index"] = u13
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p19)
    p19.Name = "NewsController"
    p19.coverArtsPreloaded = false
end
function u16.KnitStart(p20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.KnitStart(p20)
    p20:setupNewsNPC()
end
function u16.setupNewsNPC(u21) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u12
        [3] = u8
        [4] = u11
        [5] = u14
    --]]
    u4("NewsNPC", function(p22) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u8
            [3] = u11
            [4] = u21
            [5] = u14
        --]]
        if not p22:IsDescendantOf(u12) then
            return nil
        end
        u8.Controllers.ProximityPromptController:createProximityPrompt({
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 18,
            ["HoldDuration"] = 0,
            ["ActionText"] = "Newsman",
            ["ObjectText"] = "View News",
            ["Parent"] = p22
        }).Triggered:Connect(function(p23) --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u21
                [3] = u14
            --]]
            if p23 ~= u11.LocalPlayer then
                return nil
            end
            u21:preloadCoverArts()
            u21:openNewsUI({
                ["AppId"] = u14.NEWS
            })
        end)
    end)
end
function u16.openNewsUI(_, p24) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u14
    --]]
    local v25 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v26 = u14.NEWS
    local v27 = {}
    if type(p24) == "table" then
        for v28, v29 in p24 do
            v27[v28] = v29
        end
    end
    v25:openApp(v26, v27)
end
function u16.preloadCoverArts(p30) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u15
        [3] = u5
    --]]
    if p30.coverArtsPreloaded then
        return nil
    end
    local v31 = u9.values(u15)
    local v32 = table.create(#v31)
    for v33, v34 in v31 do
        local _ = v33 - 1
        v32[v33] = v34.coverArt
    end
    u5(v32)
    p30.coverArtsPreloaded = true
end
v7.CreateController(u16.new())
return nil