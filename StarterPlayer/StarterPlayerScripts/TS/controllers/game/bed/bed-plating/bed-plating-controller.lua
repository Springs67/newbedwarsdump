local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u6 = v5.RandomUtil
local u7 = v5.SoundManager
local u8 = v5.StringUtil
local u9 = v5.WatchPlayer
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u11 = v10.KnitClient
local u12 = v10.KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.CollectionService
local u16 = v14.Players
local u17 = v14.ReplicatedStorage
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u32 = v1.import(script, script.Parent.Parent.Parent, "game-knit-controller").GameKnitController
local u33 = { u30.BED_PLATING_HIT_1, u30.BED_PLATING_HIT_2, u30.BED_PLATING_HIT_3 }
local u34 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 46 ]]
        return "BedPlatingController"
    end,
    ["__index"] = u32
})
u34.__index = u34
function u34.new(...) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    local v35 = u34
    local v36 = setmetatable({}, v35)
    return v36:constructor(...) or v36
end
function u34.constructor(p37) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u21
    --]]
    u32.constructor(p37, {
        u21.BEDWARS,
        u21.LB_ONEBLOCK,
        u21.COMBINED_KIT,
        u21.CUSTOM_KIT,
        u21.MINE_WARS,
        u21.OVERPOWERED
    })
    p37.Name = "BedPlatingController"
    p37.bedPlatingMaid = {}
    p37.bedPlatingModelMap = {}
end
function u34.KnitStart(p38) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    u32.KnitStart(p38)
end
function u34.onGameInit(u39) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u12
        [3] = u22
        [4] = u33
        [5] = u30
        [6] = u23
        [7] = u4
        [8] = u25
        [9] = u3
        [10] = u7
        [11] = u6
        [12] = u13
        [13] = u19
        [14] = u9
        [15] = u16
        [16] = u11
        [17] = u26
        [18] = u15
        [19] = u28
        [20] = u29
        [21] = u17
        [22] = u31
        [23] = u2
        [24] = u27
        [25] = u8
        [26] = u24
    --]]
    u32.onGameInit(u39)
    task.spawn(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u22
            [3] = u33
            [4] = u30
            [5] = u23
        --]]
        local v40, v41 = u12.Controllers.MatchController:getQueueTypeAsync():await()
        if v40 then
            local v42 = u22(v41).disabledFeatures
            if v42 ~= nil then
                v42 = v42.disableBedPlating
            end
            if v42 then
                return nil
            end
            local v43 = u12.Controllers.PreloadController
            local v44 = {}
            local v45 = {}
            local v46 = #v45
            local v47 = #u33
            table.move(u33, 1, v47, v46 + 1, v45)
            local v48 = v46 + v47
            v45[v48 + 1] = u30.BED_PLATING_BREAK_PLAYER
            v45[v48 + 2] = u30.BED_PLATING_BREAK_NATURAL
            v44.sounds = v45
            v43:runPreload(v44)
            u23.setupBedPlating()
        end
    end)
    u4.DamageBlockEffect:connect(function(p49) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u3
            [3] = u39
            [4] = u7
            [5] = u6
            [6] = u33
        --]]
        if p49.blockType == u25.BED then
            local v50 = u3:getWorldPosition(p49.blockPosition)
            if u39.bedPlatingModelMap[v50] == nil then
                local v51 = u3:getStore():getBlockAt(p49.blockPosition)
                if not v51 then
                    return nil
                end
                if v51.Name ~= u25.BED then
                    return nil
                end
                local v52 = v51.Position
                if u39.bedPlatingModelMap[v52] ~= nil then
                    local v53 = u33
                    p49.sound = u7:createSound(u6.fromList(unpack(v53)))
                end
            else
                local v54 = u33
                p49.sound = u7:createSound(u6.fromList(unpack(v54)))
            end
        else
            return nil
        end
    end)
    local function u58(p55) --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u39
            [3] = u19
            [4] = u23
        --]]
        local v56 = u13.new()
        u39.bedPlatingMaid[p55.Position] = v56
        local v57 = p55:GetAttribute("id")
        u19:dispatch({
            ["type"] = "BedwarsSetBedStatus",
            ["teamId"] = string.split(v57, "_")[1],
            ["bedStatus"] = u23.BedStatus.BED_PLATING_ACTIVE
        })
    end
    u9(function(p59, _) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u11
            [3] = u26
            [4] = u15
            [5] = u58
        --]]
        if u16.LocalPlayer.UserId ~= p59.UserId then
            return nil
        end
        if u11.Controllers.MatchController:getMatchState() ~= u26.RUNNING then
            return nil
        end
        local v60 = u11.Controllers.MatchController:getQueueMeta()
        if v60 ~= nil then
            v60 = v60.disabledFeatures
            if v60 ~= nil then
                v60 = v60.disableBedPlating
            end
        end
        if v60 then
            return nil
        end
        for v61, v62 in u15:GetTagged("bed") do
            local _ = v61 - 1
            u58(v62)
        end
    end)
    u28.Client:Get("AddBedPlating"):Connect(function(p63) --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u58
        --]]
        u58(p63)
    end)
    u28.Client:Get("RemoveBedPlating"):Connect(function(p64) --[[ Line: 177 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u7
            [3] = u30
            [4] = u19
            [5] = u23
        --]]
        local v65 = p64.bed.Position
        local v66 = u39.bedPlatingMaid[v65]
        if v66 ~= nil then
            v66:DoCleaning()
        end
        if not p64.playerBroken then
            u7:playSound(u30.BED_PLATING_BREAK_NATURAL, {
                ["position"] = v65
            })
        end
        local v67 = p64.bed:GetAttribute("id")
        u19:dispatch({
            ["type"] = "BedwarsSetBedStatus",
            ["teamId"] = string.split(v67, "_")[1],
            ["bedStatus"] = u23.BedStatus.BED_ALIVE
        })
    end)
    u29.BedPlatingDestroyed:connect(function(p68) --[[ Line: 197 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u30
            [3] = u39
            [4] = u17
            [5] = u31
            [6] = u11
            [7] = u2
            [8] = u27
            [9] = u12
            [10] = u8
            [11] = u24
            [12] = u25
        --]]
        local v69 = p68.bed.Position
        u7:playSound(u30.BED_PLATING_BREAK_PLAYER, {
            ["position"] = v69
        })
        local v70 = u39.bedPlatingModelMap[v69]
        if v70 then
            u39:fullyBreakBedPlating(v70)
        end
        local v71 = u17.Assets.Effects.PulseEffect:Clone()
        v71.CFrame = CFrame.new(v69)
        v71.Anchored = true
        v71.Parent = p68.bed
        u31:playEffects({ v71 }, nil, {
            ["destroyAfterSec"] = 0.25
        })
        local v72 = p68.bed:GetAttribute("id")
        local v73 = string.split(v72, "_")[1]
        local v74 = u11.Controllers.TeamController:getTeamById(v73)
        if v74 ~= nil then
            v74 = v74.name
        end
        local v75 = v74 == nil and "" or v74
        local v76 = u2.resolveDependency("client/controllers/game/kill-feed/kill-feed-controller@KillFeedController")
        local v77 = {}
        local v78 = {
            ["name"] = u27.getGamePlayer(p68.destroyer):getDisplayName(),
            ["userId"] = p68.destroyer.UserId
        }
        local v79 = u12.Controllers.TeamController:getPlayerTeam(p68.destroyer)
        if v79 ~= nil then
            v79 = v79.id
        end
        v78.teamId = v79
        v77.killer = v78
        v77.victim = {
            ["name"] = u8.capitalizeFirstLetter(v75) .. " Bed Plating",
            ["teamId"] = v73,
            ["icon"] = u24.BED_PLATING_ACTIVE_ICON
        }
        v77.killIcons = { u24.STAT_UPGRADE_DESTRUCTION }
        v77.killPayout = {
            [u25.DIAMOND] = {
                ["amount"] = p68.diamondRewardAmount
            }
        }
        v76:addToKillFeed(v77)
    end)
end
function u34.fullyBreakBedPlating(p80, p81) --[[ Line: 253 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v82 = 0
    local v83 = {}
    for v84, v85 in p81:GetChildren() do
        local _ = v84 - 1
        local v86 = u18.includes(v85.Name, "Plate")
        if v86 then
            v86 = v85:IsA("MeshPart")
        end
        if v86 == true then
            v82 = v82 + 1
            v83[v82] = v85
        end
    end
    for v87, v88 in v83 do
        local _ = v87 - 1
        p80:createBedPlatingDebris(v88)
        v88:Destroy()
    end
    local v89 = p81:FindFirstChild("Border")
    if v89 ~= nil then
        v89:Destroy()
    end
end
function u34.createBedPlatingDebris(_, p90) --[[ Line: 282 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u20
        [3] = u12
    --]]
    local v91 = u16.LocalPlayer.Character
    if v91 ~= nil then
        v91 = v91:GetPivot().Position
    end
    if not v91 then
        return nil
    end
    if (v91 - p90.Position).Magnitude > u20 * 15 then
        return nil
    end
    local v92 = false
    local v93 = 0
    while true do
        if v92 then
            v93 = v93 + 1
        else
            v92 = true
        end
        if v93 >= 3 then
            local v94 = u12.Controllers.BlockDebrisController
            local v95 = p90.Position
            local v96 = Color3.fromRGB(87, 149, 176)
            local v97 = {
                ["material"] = Enum.Material.Neon
            }
            local v98 = 0.2 + math.random() * 0.25
            local v99 = 0.2 + math.random() * 0.25
            v97.size = Vector3.new(0.25, v98, v99)
            v94:createDebris(v95, v96, Vector3.new(0, 0, 0), v97)
            return
        end
        local v100 = u12.Controllers.BlockDebrisController
        local v101 = p90.Position
        local v102 = Color3.fromRGB(120, 178, 212)
        local v103 = {
            ["material"] = Enum.Material.SmoothPlastic
        }
        local v104 = 0.6 + math.random() * 0.3
        local v105 = 0.6 + math.random() * 0.3
        v103.size = Vector3.new(0.35, v104, v105)
        v100:createDebris(v101, v102, Vector3.new(0, 0, 0), v103)
    end
end
function u34.breakBedPlate(p106, p107, p108) --[[ Line: 321 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u23
        [3] = u6
    --]]
    local v109 = 0
    local v110 = {}
    for v111, v112 in p107:GetChildren() do
        local _ = v111 - 1
        local v113 = u18.includes(v112.Name, "PlateR")
        if v113 then
            v113 = v112:IsA("MeshPart")
        end
        if v113 == true then
            v109 = v109 + 1
            v110[v109] = v112
        end
    end
    local v114 = 0
    local v115 = {}
    for v116, v117 in p107:GetChildren() do
        local _ = v116 - 1
        local v118 = u18.includes(v117.Name, "PlateL")
        if v118 then
            v118 = v117:IsA("MeshPart")
        end
        if v118 == true then
            v114 = v114 + 1
            v115[v114] = v117
        end
    end
    if #v110 == 0 or #v115 == 0 then
        return nil
    end
    local v119 = p108 / u23.HEALTH_PER_PLATE_STAGE
    local v120 = math.floor(v119) + 1
    local v121 = #v110 - v120
    local v122 = #v115 - v120
    if v121 ~= 0 and (v121 == v121 and v121) then
        local v123 = false
        local v124 = 0
        while true do
            if true then
                if v123 then
                    v124 = v124 + 1
                else
                    v123 = true
                end
            end
            if v124 >= v121 then
                break
            end
            local v125 = u6.fromList(unpack(v110))
            p106:createBedPlatingDebris(v125)
            v125:Destroy()
        end
    end
    if v122 ~= 0 and (v122 == v122 and v122) then
        local v126 = false
        local v127 = 0
        while true do
            if true then
                if v126 then
                    v127 = v127 + 1
                else
                    v126 = true
                end
            end
            if v127 >= v122 then
                break
            end
            local v128 = u6.fromList(unpack(v115))
            p106:createBedPlatingDebris(v128)
            v128:Destroy()
        end
    end
end
function u34.addBedPlatingModel(u129, u130, p131) --[[ Line: 397 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local u132 = u17.Assets.Misc.BedPlating:Clone()
    local v133 = u130:FindFirstChild("Bed")
    if not v133 then
        return nil
    end
    local v134 = { v133.CFrame:ToOrientation() }
    local v135 = v133.Position
    u132:PivotTo(CFrame.new(v135 - Vector3.new(0, 0.415, 0)) * CFrame.Angles(v134[1], v134[2], v134[3]))
    u132.Parent = u130
    p131:GiveTask(function() --[[ Line: 411 ]]
        --[[
        Upvalues:
            [1] = u129
            [2] = u130
            [3] = u132
        --]]
        u129.bedPlatingModelMap[u130.Position] = nil
        task.delay(3, function() --[[ Line: 415 ]]
            --[[
            Upvalues:
                [1] = u132
            --]]
            u132:Destroy()
        end)
    end)
    u129.bedPlatingModelMap[u130.Position] = u132
end
u11.CreateController(u34.new())
return nil