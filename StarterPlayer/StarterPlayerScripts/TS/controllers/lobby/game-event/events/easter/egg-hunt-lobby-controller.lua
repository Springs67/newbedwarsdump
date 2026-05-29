local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = u7.StoreProvider
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v10.RunService
local u14 = v10.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, script.Parent, "ui", "egg-hunt-board-base").EggHuntBoardBase
local u20 = v1.import(script, script.Parent, "ui", "egg-hunt-board-core").EggHuntBoardCore
local v21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "EggHuntLobbyController"
    end,
    ["__index"] = u15
})
v21.__index = v21
function v21.constructor(p22, p23, p24, p25, p26, p27) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u4
    --]]
    u15.constructor(p22)
    p22.eventType = p23
    p22.eggMeta = p24
    p22.milestoneMeta = p25
    p22.milestoneRewardMeta = p26
    p22.eggFolder = p27
    p22.Name = "EggHuntLobbyController"
    local v28 = u4.entries(p24)
    table.sort(v28, function(p29, p30) --[[ Line: 42 ]]
        local _ = p29[1]
        local v31 = p29[2]
        local _ = p30[1]
        local v32 = p30[2]
        return v31.order < v32.order
    end)
    p22.easterEggs = v28
end
function v21.KnitStart(u33) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u17
        [3] = u18
        [4] = u2
        [5] = u20
        [6] = u3
    --]]
    u15.KnitStart(u33)
    if not u17[u33.eventType].active then
        return nil
    end
    u18.Client:GetNamespace("Event"):Get("MissionClaimed"):Connect(function(p34) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        local v35 = p34.mission.metaId
        local v36 = nil
        for v37, v38 in u33.easterEggs do
            local _ = v37 - 1
            local v39 = v38[1]
            local _ = v38[2]
            if v39 == v35 == true then
                v36 = v38
                break
            end
        end
        if not v36 then
            return nil
        end
        u33:displayEgg(v35)
    end)
    u2("EventProgressBoard", function(p40) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u20
        --]]
        u33.eventProgressBoardTree = u33:mountApp(u20, function(p41) --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            local v42 = p41.Event.profileData.events[u33.eventType]
            local v43 = {
                ["milestoneMeta"] = u33.milestoneMeta,
                ["milestoneRewardsMeta"] = u33.milestoneRewardMeta
            }
            if v42 ~= nil then
                local v44 = v42.claimedEggs
                v42 = v44 ~= nil and #v44 or v44
            end
            v43.numEggsCollected = v42 == nil and 0 or v42
            return v43
        end, {
            ["parent"] = p40
        })
    end)
    u2("EasterEventEggStand", function(p45) --[[ Line: 108 ]]
        p45.Position = p45.Position + Vector3.new(0, 1, 0)
        p45.CanCollide = false
        p45.Transparency = 1
    end)
    u3.Controllers.EventController:waitForEventDataAsync(u33.eventType):andThen(function(_) --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u33
        --]]
        u2("EasterEventEggStand", function(p46) --[[ Line: 119 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            local v47 = p46.Name
            local v48 = tonumber(v47)
            local v49 = v48 == nil and -1 or v48
            if v49 == -1 then
                return nil
            end
            if #u33.easterEggs < v49 then
                return nil
            end
            local v50 = u33.easterEggs[v49 - 1 + 1][1]
            if u33:hasCollectedEgg(v50) then
                u33:displayEgg(v50, p46)
            end
        end)
    end)
end
function v21.getEggModel(p51, p52) --[[ Line: 141 ]]
    local v53 = p51.eggFolder
    if v53 ~= nil then
        v53 = v53:FindFirstChild(p52)
    end
    return v53
end
function v21.hasCollectedEgg(p54, p55) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v56 = u16:getState().Event.profileData.events[p54.eventType]
    if not v56 then
        return false
    end
    if v56.claimedEggs == nil then
        return false
    end
    local v57 = v56.claimedEggs
    local v58 = table.create(#v57)
    for v59, v60 in v57 do
        local _ = v59 - 1
        v58[v59] = v60.egg
    end
    if v58 ~= nil then
        v58 = nil
        for v61, v62 in v58 do
            local _ = v61 - 1
            if v62 == p55 == true then
                v58 = v62
                break
            end
        end
    end
    return v58 ~= nil
end
function v21.displayEgg(p63, p64, p65) --[[ Line: 184 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u11
        [3] = u9
    --]]
    local _ = u16:getState().Event.profileData.events[p63.eventType]
    if not p65 then
        p65 = nil
        for v66, v67 in u11:GetTagged("EasterEventEggStand") do
            local _ = v66 - 1
            local v68 = v67.Name
            local v69 = tonumber(v68)
            local v70 = v69 == nil and -1 or v69
            local v71
            if v70 == -1 or #p63.easterEggs < v70 then
                v71 = false
            else
                v71 = p64 == p63.easterEggs[v70 - 1 + 1][1]
            end
            if v71 == true then
                p65 = v67
                break
            end
        end
    end
    if p65 then
        local v72 = p63:getEggModel(p64)
        if v72 ~= nil then
            v72 = v72:Clone()
        end
        if not v72 then
            return nil
        end
        u9(v72, 0.13)
        for v73, v74 in v72:GetDescendants() do
            local _ = v73 - 1
            if v74:IsA("BasePart") then
                v74.Anchored = true
            end
        end
        if v72.PrimaryPart then
            v72.PrimaryPart.PivotOffset = CFrame.new(Vector3.new(0, 0, 0))
        end
        local v75 = p63:getEggShowcaseLoc(p65, v72)
        v72.Parent = p65.Parent
        v72:PivotTo(v75)
        return v72
    end
end
function v21.getEggShowcaseLoc(_, p76, p77) --[[ Line: 248 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
    --]]
    local v78 = RaycastParams.new()
    v78.IgnoreWater = true
    v78.FilterType = Enum.RaycastFilterType.Blacklist
    local v79 = 0
    local v80 = {}
    for v81, v82 in u12:GetPlayers() do
        local _ = v81 - 1
        local v83 = v82.Character
        if v83 ~= nil then
            v79 = v79 + 1
            v80[v79] = v83
        end
    end
    local v84 = { p77 }
    local v85 = #v84
    table.move(v80, 1, #v80, v85 + 1, v84)
    v78.FilterDescendantsInstances = v84
    local v86 = u14:Raycast(p76.Position, Vector3.new(-0, -20, -0), v78)
    if not v86 then
        return p76.CFrame
    end
    if not p77.PrimaryPart then
        return p76.CFrame
    end
    local v87 = v86.Position
    local v88 = p77.PrimaryPart.Size.Y * 0.5
    local v89 = v87 + Vector3.new(0, v88, 0)
    local v90 = CFrame.new(v89)
    local v91 = CFrame.Angles
    local v92 = p76.Orientation.Y
    return v90 * v91(0, math.rad(v92), 0)
end
function v21.playEffect(_, u93, u94) --[[ Line: 289 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u5
        [3] = u13
        [4] = u14
    --]]
    if u94 == nil then
        u94 = u12.LocalPlayer.Character
    end
    local u95 = u5.new()
    local u96 = u93.CFrame
    local v97 = math.random() * 3.141592653589793 * 2
    local v98 = math.cos(v97)
    local v99 = math.sin(v97)
    local u100 = Vector3.new(v98, 0, v99) * 3
    if u94 ~= nil then
        local v101 = u94.PrimaryPart
    end
    if not v101 then
        return nil
    end
    local u102 = u94:GetPrimaryPartCFrame()
    local _ = u93.CFrame - u93.Position
    local u103 = 0
    u95:GiveTask(u13.Heartbeat:Connect(function(p104) --[[ Line: 313 ]]
        --[[
        Upvalues:
            [1] = u94
            [2] = u95
            [3] = u102
            [4] = u14
            [5] = u103
            [6] = u100
            [7] = u96
            [8] = u93
        --]]
        local v105 = u94
        if v105 ~= nil then
            v105 = v105.PrimaryPart
            if v105 ~= nil then
                v105 = v105.CFrame
            end
        end
        if not v105 then
            u95:DoCleaning()
            return nil
        end
        local v106 = p104 * 80
        local v107 = (u102.Position - v105.Position).Magnitude
        local v108 = v106 / v107
        if v107 > 20 then
            v108 = (v107 - 20 + v106) / v107
        end
        u102 = u102:Lerp(v105, (math.clamp(v108, 0, 1)))
        local v109 = u14.CurrentCamera
        if v109 ~= nil then
            v109 = v109.CFrame
        end
        if not v109 then
            u95:DoCleaning()
            return nil
        end
        u103 = u103 + p104
        local v110 = 0
        local v111 = u103
        v110 = v110 + 0.14
        if v111 < v110 then
            local v112 = (u103 - (v110 - 0.14)) / 0.14
            local v113 = v105 + (u100 + Vector3.new(0, 8, 0))
            local v114 = CFrame.new(v113.Position)
            local v115 = v113.Position
            local v116 = CFrame.new(v115, v109.Position).LookVector
            local v117 = v116.X
            local v118 = v116.Z
            local v119 = Vector3.new(v117, 0, v118)
            local v120 = (v119.Magnitude == 0 and Vector3.new(1, 0, 0) or v119).Unit
            u93.CFrame = u96:Lerp(v114 * CFrame.new(Vector3.new(0, 0, 0), v120), (math.pow(v112, 0.4)))
        else
            local v121 = u103
            v110 = v110 + 0.12
            if v121 < v110 then
                local v122 = (u103 - (v110 - 0.12)) / 0.12
                local v123 = u100 + Vector3.new(0, 6, 0)
                local v124 = (u100 + Vector3.new(0, 8, 0)):Lerp(v123, (math.pow(v122, 0.25)))
                local v125 = u102.Position
                u93.CFrame = CFrame.new(v124 + v125)
            else
                local v126 = u103
                v110 = v110 + 0.08
                if v126 < v110 then
                    local v127 = u100 + Vector3.new(0, 6, 0)
                    local v128 = u102.Position
                    u93.CFrame = CFrame.new(v127 + v128)
                else
                    local v129 = u103
                    v110 = v110 + 0.06
                    if v129 >= v110 then
                        u95:DoCleaning()
                        return nil
                    end
                    local v130 = (u103 - (v110 - 0.06)) / 0.06
                    local v131 = u100 + Vector3.new(0, 3, 0)
                    local v132 = (u100 + Vector3.new(0, 6, 0)):Lerp(v131, v130)
                    local v133 = u102.Position
                    u93.CFrame = CFrame.new(v132 + v133)
                    u93.Size = u93.Size:Lerp(Vector3.new(0, 0, 0), v130)
                end
            end
        end
    end))
    return u95
end
function v21.mountApp(_, u134, u135, p136) --[[ Line: 425 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u19
        [4] = u6
        [5] = u8
        [6] = u16
    --]]
    if p136 ~= nil then
        p136 = p136.parent
    end
    if p136 == nil then
        p136 = u12.LocalPlayer:WaitForChild("PlayerGui")
    end
    local v138 = u7.connect(function(p137, _) --[[ Line: 435 ]]
        --[[
        Upvalues:
            [1] = u134
            [2] = u135
        --]]
        return {
            ["uiHook"] = u134,
            ["hookProps"] = u135(p137)
        }
    end)(u19)
    local v139 = {
        ["store"] = u16
    }
    return u6.mount(u6.createElement(u8, v139, { u6.createElement(v138) }), p136)
end
return {
    ["EggHuntLobbyController"] = v21
}