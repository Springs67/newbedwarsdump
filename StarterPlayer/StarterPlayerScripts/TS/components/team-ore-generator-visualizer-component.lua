local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "components", "out")
local u7 = v6.BaseComponent
local v8 = v6.Component
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart
local v13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.CollectionService
local u15 = v13.Workspace
local u16 = u1.import(script, script.Parent.Parent, "client-sync-events").ClientSyncEvents
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "common", "instance-cache").InstanceCache
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "common", "sanitizers", "item-drop-cache-sanitizer").ItemDropCacheSanitizer
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "TeamOreGeneratorVisualizerComponent"
    end,
    ["__index"] = u7
})
u24.__index = u24
function u24.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u15
        [4] = u17
        [5] = u18
        [6] = u10
    --]]
    u7.constructor(p27)
    p27.droppingItems = {}
    p27.lastDropsClearTime = 0
    p27.nextClearTime = 0
    local v28 = u11("Folder", {
        ["Name"] = "team-gen-drop-cache-" .. p27.attributes.teamId,
        ["Parent"] = u15
    })
    p27.dropItemCache = u17.new(v28, u18.new(), 100, 30)
    p27.clearMaid = u10.new()
    p27.lastDrops = {}
    p27.dropIntervals = {}
end
function u24.getTag(_) --[[ Line: 56 ]]
    return "TeamOreGeneratorVisualizer"
end
function u24.onStart(u29) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u22
        [3] = u1
        [4] = u9
        [5] = u5
        [6] = u21
        [7] = u16
    --]]
    u14:GetInstanceRemovedSignal("team-ore-gen-drop:" .. u29.attributes.teamId):Connect(function(_) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        if u29.lastDropsClearTime <= time() + 0.7 then
            u29.clearMaid:DoCleaning()
            local v30 = 0
            local v31 = {}
            for v32, v33 in u29.droppingItems do
                local _ = v32 - 1
                if v33.dropTime >= 0.4 == true then
                    v30 = v30 + 1
                    v31[v30] = v33
                end
            end
            for v34, v35 in v31 do
                local _ = v34 - 1
                u29.dropItemCache:cacheOrDestroyInstance(v35.drop, v35.drop.Name)
            end
            local v36 = 0
            local v37 = {}
            for v38, v39 in u29.droppingItems do
                local _ = v38 - 1
                if table.find(v31, v39) == nil == true then
                    v36 = v36 + 1
                    v37[v36] = v39
                end
            end
            u29.droppingItems = v37
            u29.lastDropsClearTime = time()
        end
    end)
    u14:GetInstanceAddedSignal("team-ore-gen-drop:" .. u29.attributes.teamId):Connect(function(u40) --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        local u41 = u40.Name
        local v42 = u29.lastDrops[u41]
        if v42 == nil then
            u29.lastDrops[u41] = {
                ["time"] = 0,
                ["confirmationTime"] = time()
            }
        else
            v42.confirmationTime = time()
        end
        u29.clearMaid:GiveTask(u40:GetAttributeChangedSignal("Amount"):Connect(function() --[[ Line: 117 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u29
                [3] = u41
            --]]
            local v43 = u40:GetAttribute("Amount")
            local v44 = (v43 == nil and 0 or v43) > 1 and u29.lastDrops[u41]
            if v44 then
                v44.confirmationTime = time()
            end
        end))
    end)
    u22.Client:Get("TeamGenDropSpeedsUpdate"):Connect(function(p45) --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        if p45.id == u29.attributes.id then
            for v46, v47 in p45.dropSpeeds do
                u29.dropIntervals[v46] = v47
            end
        end
    end)
    u22.Client:Get("GetTeamGenDropSpeeds"):CallServerAsync(u29.attributes.id, u29.attributes.teamId):andThen(function(p48) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        for v49, v50 in p48 do
            u29.dropIntervals[v49] = v50
        end
    end)
    local function u58() --[[ Line: 159 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u29
            [3] = u22
            [4] = u9
        --]]
        u1.Promise.retryWithDelay(function() --[[ Line: 160 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u29
                [3] = u22
            --]]
            return u1.Promise.new(function(p51, p52) --[[ Line: 161 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u22
                --]]
                if next(u29.dropIntervals) ~= nil then
                    return p51()
                end
                local v53, v54 = u22.Client:Get("GetTeamGenDropSpeeds"):CallServerAsync(u29.attributes.id, u29.attributes.teamId):timeout(5):await()
                if not v53 then
                    return p52("Failed to get team gen drop intervals")
                end
                if next(v54) == nil then
                    return p52("Received empty result when getting team gen drop intervals")
                end
                for v55, v56 in v54 do
                    u29.dropIntervals[v55] = v56
                end
                return p51()
            end)
        end, 6, 10):catch(function(p57) --[[ Line: 184 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u29
            --]]
            return u9.Warn("Failed to set team gen " .. u29.attributes.id .. " with drop intervals with reason: " .. tostring(p57))
        end)
    end
    if u5.Controllers.MatchController:getMatchState() == u21.PRE then
        u16.MatchStateChange:connect(function(p59) --[[ Line: 189 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u58
            --]]
            if p59.matchState == u21.RUNNING then
                u58()
            end
        end)
    else
        u58()
    end
end
function u24.onTick(u60) --[[ Line: 198 ]]
    local u61 = time()
    local v62 = u60.lastDrops
    local function v69(p63, p64) --[[ Line: 202 ]]
        --[[
        Upvalues:
            [1] = u60
            [2] = u61
        --]]
        local v65 = u60.dropIntervals[p64]
        if v65 ~= 0 and (v65 == v65 and v65) then
            if v65 <= u61 - p63.time then
                v65 = u61 - p63.confirmationTime < 2
            else
                v65 = false
            end
        end
        if v65 ~= 0 and (v65 == v65 and v65) then
            local v66 = u60:dropItem(p64)
            local v67 = u60.droppingItems
            local v68 = {
                ["drop"] = v66,
                ["dropTime"] = time()
            }
            table.insert(v67, v68)
            p63.time = u61
        end
    end
    for v70, v71 in v62 do
        v69(v71, v70, v62)
    end
    if u60.nextClearTime < u61 then
        local v72 = {}
        local v73 = 0
        local v74 = {}
        for v75, v76 in u60.droppingItems do
            local _ = v75 - 1
            local v77 = (v76.drop.CFrame.Position - u60.attributes.position).Magnitude >= 4
            local v78
            if v77 then
                local v79 = v72[v76.drop.Name] ~= nil
                v78 = not v79
            else
                v78 = v77
            end
            if v78 then
                v72[v76.drop.Name] = true
                v77 = false
            end
            if v77 == true then
                v73 = v73 + 1
                v74[v73] = v76
            end
        end
        local v80 = table.create(#v74)
        for v81, v82 in v74 do
            local _ = v81 - 1
            v80[v81] = v82.drop
        end
        local v83 = 0
        local v84 = {}
        for v85, v86 in u60.droppingItems do
            local _ = v85 - 1
            local v87 = v86.drop
            if table.find(v80, v87) == nil == true then
                v83 = v83 + 1
                v84[v83] = v86
            end
        end
        u60.droppingItems = v84
        for v88, v89 in v80 do
            local _ = v88 - 1
            u60.dropItemCache:cacheOrDestroyInstance(v89, v89.Name)
        end
        u60.nextClearTime = u61 + 2
    end
    local v90 = u60.droppingItems
    local function v100(p91) --[[ Line: 293 ]]
        --[[
        Upvalues:
            [1] = u60
        --]]
        local v92 = time() - p91.dropTime
        local v93 = math.clamp(v92, 0, 1)
        if v93 == 1 then
            return nil
        end
        local v94 = u60.attributes.position.Y - 7
        local v95 = 8 - math.pow(21, v93)
        local v96 = v94 + math.clamp(v95, 0, 7)
        local v97 = p91.drop.CFrame.Position.Y - v96
        local v98 = p91.drop.CFrame
        local v99 = Vector3.new(0, v97, 0)
        p91.drop.CFrame = v98 - v99
    end
    for v101, v102 in v90 do
        v100(v102, v101 - 1, v90)
    end
end
function u24.dropItem(p103, p104) --[[ Line: 315 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u20
        [3] = u4
        [4] = u12
        [5] = u23
        [6] = u11
        [7] = u15
    --]]
    local v105 = false
    local v106 = p103.dropItemCache:getInstance(p104)
    if v106 then
        v106.Size = Vector3.new(1, 1, 1)
        v106.Anchored = true
        v106.CanCollide = false
        v106.CanTouch = false
        v106.CFrame = CFrame.new(p103.attributes.position)
        v106.Transparency = 1
        (v106:FindFirstChild("Handle") or v106:FindFirstChild("HandleParent")).CFrame = v106.CFrame + Vector3.new(0, 1.5, 0)
    else
        local v107 = u19(p104).armor and true or v105
        local v108 = u20.createItemInstance(p104)
        local v109 = v108:FindFirstChild("Handle"):Clone()
        local v110 = false
        for v111, v112 in v109:GetDescendants() do
            local _ = v111 - 1
            v110 = v112:IsA("Bone") and true or v110
            if v112:IsA("BasePart") then
                v112.CanCollide = false
                v112.CanTouch = false
                v112.Massless = true
                u4:setQueryIgnored(v112, false)
            end
        end
        v109.CanCollide = false
        v109.CanTouch = false
        v109.Massless = true
        u4:setQueryIgnored(v109, false)
        local v113 = Instance.new("Model")
        v109:Clone().Parent = v113
        local v114 = v113:GetExtentsSize()
        if (v114.X > 2.5 or (v114.Y > 2.5 or v114.Z > 3.5)) and not v107 then
            u12(v109, 0.5)
            for _, v115 in v109:GetDescendants() do
                if v115:IsA("BasePart") then
                    u23:weldPartsWithJoint(v109, v115, "Weld")
                end
            end
        end
        v113:Destroy()
        v106 = u11("Part", {
            ["Size"] = Vector3.new(1, 1, 1),
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["CanTouch"] = false,
            ["Transparency"] = 1,
            ["Name"] = v108.Name,
            ["CFrame"] = CFrame.new(p103.attributes.position)
        })
        local v116 = p103.attributes.position
        v109.CFrame = CFrame.new(v116 + Vector3.new(0, 1.5, 0))
        local v117
        if v110 then
            v117 = u11("Model", {
                ["Name"] = "HandleParent",
                ["Parent"] = v106
            })
        else
            v117 = v106
        end
        v109.Parent = v117
        u11("Weld", {
            ["Part0"] = v109,
            ["Part1"] = v106,
            ["Parent"] = v109
        })
    end
    assert(v106)
    v106.CollisionGroup = "ItemDrops"
    v106.Parent = u15
    return v106
end
v2.defineMetadata(u24, "identifier", "client/components/team-ore-generator-visualizer-component@TeamOreGeneratorVisualizerComponent")
v2.defineMetadata(u24, "flamework:implements", { "$:flamework@OnStart", "$:flamework@OnTick" })
local v118 = v2.decorate
local v119 = u24
local v120 = {}
local v121 = {
    ["tag"] = "TeamOreGeneratorVisualizer",
    ["refreshAttributes"] = true,
    ["defaults"] = {},
    ["attributes"] = {
        ["id"] = v3.string,
        ["teamId"] = v3.string,
        ["position"] = v3.Vector3
    }
}
__set_list(v120, 1, {v121})
v118(v119, "$c:init@Component", v8, v120)
return {
    ["TeamOreGeneratorVisualizerComponent"] = u24
}