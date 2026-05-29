local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, script.Parent, "creative-queue-card").CreativeQueueCard
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "CreativeQueueDisplayController"
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
    u9.constructor(p15)
    p15.Name = "CreativeQueueDisplayController"
    p15.liveServerTrees = {}
    p15.liveServerDisplays = {}
end
function u12.KnitStart(u16) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u7
        [4] = u11
        [5] = u4
        [6] = u6
        [7] = u3
        [8] = u8
    --]]
    u9.KnitStart(u16)
    u10.Client:GetNamespace("LiveCreativeServers"):Get("LiveServerDisplayUpdate"):Connect(function(p17) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u7
            [3] = u11
        --]]
        u16.liveServerDisplays = p17
        local v18 = false
        local v19 = 0
        while true do
            if v18 then
                v19 = v19 + 1
            else
                v18 = true
            end
            if v19 >= #u16.liveServerTrees then
                return
            end
            u7.update(u16.liveServerTrees[v19 + 1].tree, u7.createElement(u11, {
                ["Adornee"] = u16.liveServerTrees[v19 + 1].part,
                ["DisplayDto"] = u16.liveServerDisplays[v19 + 1]
            }))
        end
    end)
    u4("CustomMatchesNpc", function(p20) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u8
            [4] = u7
            [5] = u11
            [6] = u16
        --]]
        local v21 = p20.PrimaryPart.CFrame
        local v22 = false
        local v23 = 0
        while true do
            if v22 then
                v23 = v23 + 1
            else
                v22 = true
            end
            if v23 >= 3 then
                return
            end
            local v24 = v23 * 4 + -4
            local v25 = math.random() * 0.5
            local v26 = v23 == 1 and -1 or 0
            local v27 = Vector3.new(0, -5, -3) + Vector3.new(v24, v25, v26)
            local v28 = u6("Part", {
                ["Size"] = Vector3.new(4, 4, 0.2),
                ["Anchored"] = true,
                ["CanCollide"] = false,
                ["Transparency"] = 1,
                ["CFrame"] = CFrame.new(v21 * v27) * (v21 - v21.Position),
                ["Material"] = Enum.Material.Rock,
                ["Color"] = u3.WHITE,
                ["Parent"] = u8
            })
            local v29 = u7.mount(u7.createElement(u11, {
                ["Adornee"] = v28,
                ["DisplayDto"] = u16.liveServerDisplays[v23 + 1]
            }), v28)
            local v30 = u16.liveServerTrees
            table.insert(v30, {
                ["tree"] = v29,
                ["part"] = v28
            })
        end
    end)
end
v5.CreateController(u12.new())
return nil