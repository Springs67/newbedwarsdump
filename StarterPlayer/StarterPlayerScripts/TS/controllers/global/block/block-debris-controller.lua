local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u3 = v2.BlockEngine
local u4 = v2.GreedyBlockHandler
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u6 = v5.ColorUtil
local u7 = v5.GameQueryUtil
local u8 = v5.SoundManager
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u11 = v10.Linear
local u12 = v10.OutQuad
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.ReplicatedStorage
local u17 = v15.Workspace
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tableutil").Shuffle
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u20 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type-id").getItemTypeFromId
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "BlockDebrisController"
    end,
    ["__index"] = u20
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.constructor(p30)
    p30.Name = "BlockDebrisController"
end
function u27.KnitStart(u31) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u24
        [3] = u23
    --]]
    u20.KnitStart(u31)
    u24.Client:Get("BlockDebris"):Connect(function(p32, p33, p34, p35, p36, p37) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        local v38 = p37 == nil and 1 or p37
        local v39 = u31
        local v40 = table.create(#p32)
        for v41, v42 in p32 do
            local _ = v41 - 1
            v40[v41] = {
                ["blockPosition"] = v42.blockPosition,
                ["blockType"] = v42.blockType,
                ["blockData"] = v42.blockData
            }
        end
        v39:processDebrisRequest(v40, p33, p34, p35, p36, v38)
    end)
    u24.Client:Get("BlockDecayDebris"):Connect(function(u43) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u23
        --]]
        local v49, v50 = pcall(function() --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u43
                [3] = u23
            --]]
            local v44 = u31
            local v45 = u43
            local v46 = table.create(#v45)
            for v47, v48 in v45 do
                local _ = v47 - 1
                v46[v47] = {
                    ["blockPosition"] = v48.p,
                    ["blockType"] = u23(v48.b),
                    ["blockData"] = v48.d
                }
            end
            v44:processDebrisRequest(v46, Vector3.new(0, -1, 0), nil, nil, true)
        end)
        if not v49 then
            warn(v50)
        end
    end)
end
function u27.processDebrisRequest(u51, p52, u53, u54, u55, u56, p57) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u3
        [3] = u1
        [4] = u4
        [5] = u17
        [6] = u19
        [7] = u12
    --]]
    local v58 = u18(p52)
    local v59 = 0
    local u60 = 0
    for _, u61 in v58 do
        local u62 = p57 == nil and true or v59 / #v58 < p57
        local v63 = u3:getHandlerRegistry():getHandler(u61.blockType)
        if u1.instanceof(v63, u4) then
            local u64 = v63:createNewInstance(u61.blockData)
            u64.Anchored = true
            u64.CanCollide = false
            u64.CanQuery = false
            local u65 = CFrame.new(u3:getWorldPosition(u61.blockPosition))
            u64.CFrame = u65
            u64.Parent = u17
            u19(0.06, u12, function(p66) --[[ Line: 109 ]]
                --[[
                Upvalues:
                    [1] = u65
                    [2] = u53
                    [3] = u64
                --]]
                local v67 = u65 * CFrame.Angles((math.random() - 0.5) * 0.13962634015954636, (math.random() - 0.5) * 0.5235987755982988, 0)
                if u53 and u53.Magnitude ~= 0 then
                    v67 = v67 + u53.Unit * 0.8
                end
                u64.CFrame = u65:Lerp(v67, p66)
            end)
            task.delay(0.06, function() --[[ Line: 120 ]]
                --[[
                Upvalues:
                    [1] = u62
                    [2] = u56
                    [3] = u51
                    [4] = u64
                    [5] = u61
                    [6] = u53
                    [7] = u60
                    [8] = u54
                    [9] = u55
                --]]
                if u62 then
                    if u56 then
                        u51:convertBlockToDebris(u64, u61.blockType, u61.blockPosition, u53 or Vector3.new(0, 0, 0), u60, u54, u55, nil, u56)
                    else
                        local v68 = false
                        local v69 = 0
                        while true do
                            if true then
                                if v68 then
                                    v69 = v69 + 1
                                else
                                    v68 = true
                                end
                            end
                            if v69 >= 0.8 + math.random() * 1 then
                                break
                            end
                            local v70 = u60
                            u60 = u60 + 1
                            if v70 > 30 then
                                break
                            end
                            u51:convertBlockToDebris(u64, u61.blockType, u61.blockPosition, u53 or Vector3.new(0, 0, 0), u60, u54, u55)
                        end
                    end
                end
                u64:Destroy()
            end)
        end
        v59 = v59 + 1
    end
end
function u27.createDebris(p71, p72, p73, p74, p75) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u17
        [3] = u14
    --]]
    local v76 = u13.new()
    local v77 = {
        ["Name"] = "DebrisPart"
    }
    local v78
    if p75 == nil then
        v78 = p75
    else
        v78 = p75.material
    end
    if v78 == nil then
        v78 = Enum.Material.SmoothPlastic
    end
    v77.Material = v78
    v77.CanQuery = false
    v77.CanTouch = false
    v77.Color = p73
    local v79
    if p75 == nil then
        v79 = p75
    else
        v79 = p75.transparency
    end
    v77.Transparency = v79 == nil and 0 or v79
    local v80
    if p75 == nil then
        v80 = p75
    else
        v80 = p75.size
    end
    if v80 == nil then
        local v81 = 0.9 + math.random() * 0.5
        local v82 = 0.9 + math.random() * 0.5
        v80 = Vector3.new(0.6, v81, v82)
    end
    v77.Size = v80
    v77.Anchored = false
    v77.CanCollide = true
    v77.Parent = u17
    local v83 = u14("WedgePart", v77)
    v76:GiveTask(v83)
    local v84
    if p75 == nil then
        v84 = p75
    else
        v84 = p75.debrisId
    end
    local v85
    if p75 == nil then
        v85 = p75
    else
        v85 = p75.burnDebris
    end
    if p75 ~= nil then
        p75 = p75.burnColors
    end
    p71:setupAndThrowDebris(v83, p72, p74, v84, v85, p75)
    return v76
end
function u27.setupAndThrowDebris(_, u86, p87, p88, p89, p90, u91, p92) --[[ Line: 214 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u21
        [3] = u16
        [4] = u6
        [5] = u26
        [6] = u8
        [7] = u25
        [8] = u19
        [9] = u11
    --]]
    u86.CollisionGroup = "Players"
    u7:setQueryIgnored(u86, true)
    local v93 = math.random() * 3.141592653589793 * 2
    local v94 = math.random() * 10 + 5
    local v95 = p88.Unit
    local v96 = 5 + math.random() * 5
    local v97 = v94 * math.cos(v93)
    local v98 = 5 + 5 * math.random()
    local v99 = v94 * math.sin(v93)
    local v100 = Vector3.new(v97, v98, v99)
    local v101 = u86.Mass
    u86:ApplyImpulse(v95 * v96 + v100 * v101)
    local v102 = math.random() - 0.5
    local v103 = math.random() - 0.5
    local v104 = math.random() - 0.5
    u86.Position = p87 + Vector3.new(v102, v103, v104) * (u21 * 0.8)
    u86.CFrame = CFrame.new(u86.Position) * CFrame.Angles(math.random() * 3.141592653589793 * 2, math.random() * 3.141592653589793 * 2, math.random() * 3.141592653589793 * 2)
    local v105 = u86.Name
    if v105 == "" or not v105 then
        for v106, v107 in u86:GetDescendants() do
            local _ = v106 - 1
            if v107:IsA("Texture") then
                v107.StudsPerTileU = 1.4
                v107.StudsPerTileV = 1.4
            end
        end
    end
    if math.random() < 0.8 and p90 then
        local v108 = u16.Assets.Effects.Burn:GetChildren()
        local v109 = table.create(#v108)
        for v110, v111 in v108 do
            local _ = v110 - 1
            v109[v110] = v111:Clone()
        end
        for _, v112 in v109 do
            v112.Parent = u86
        end
        local v113 = u86:GetDescendants()
        local function v123(p114) --[[ Line: 261 ]]
            --[[
            Upvalues:
                [1] = u91
                [2] = u6
            --]]
            if p114:IsA("ParticleEmitter") then
                p114.Rate = p114.Rate * 0.5 * math.random()
                p114.VelocityInheritance = 0.5
                p114.Acceleration = Vector3.new(0, 20, 0)
                p114.Speed = NumberRange.new(0, 0)
                local v115
                if u91 then
                    v115 = u91[1]
                else
                    v115 = u6.hexColor(15903638)
                end
                local v116
                if u91 then
                    v116 = u91[2]
                else
                    v116 = u6.hexColor(14631746)
                end
                if math.random() < 0.5 then
                    local v117 = p114.Color.Keypoints
                    local v118 = table.create(#v117)
                    for v119, v120 in v117 do
                        local v121 = v119 - 1
                        local v122 = v120.Value
                        if v121 == 0 then
                            v122 = v115
                        end
                        if v121 == 1 then
                            v122 = v116
                        end
                        v118[v119] = ColorSequenceKeypoint.new(v120.Time, v122)
                    end
                    p114.Color = ColorSequence.new(v118)
                end
            end
        end
        for v124, v125 in v113 do
            v123(v125, v124 - 1, v113)
        end
        u26:scaleEffect({ u86 }, 0.3)
        if p89 == nil or p89 < 5 then
            u8:playSound(u25.BURN_LOOP, {
                ["volumeMultiplier"] = 0.5,
                ["rollOffMinDistance"] = 9,
                ["rollOffMaxDistance"] = 25,
                ["looped"] = true,
                ["parent"] = u86
            })
        end
    end
    task.delay(math.random() * 5, function() --[[ Line: 306 ]]
        --[[
        Upvalues:
            [1] = u86
        --]]
        if not u86.Parent then
            return nil
        end
        for v126, v127 in u86:GetDescendants() do
            local _ = v126 - 1
            if v127:IsA("ParticleEmitter") then
                v127.Enabled = false
            end
        end
    end)
    local v128 = task
    local v129 = p92 == nil and 6 or p92
    v128.delay(v129 + math.random() * 3, function() --[[ Line: 326 ]]
        --[[
        Upvalues:
            [1] = u86
            [2] = u19
            [3] = u11
        --]]
        if not u86.Parent then
            return nil
        end
        local u130 = u86.Size
        u19(0.22, u11, function(p131) --[[ Line: 331 ]]
            --[[
            Upvalues:
                [1] = u86
                [2] = u130
            --]]
            if not u86.Parent then
                return nil
            end
            u86.Transparency = p131
            u86.Size = u130 * (1 - p131)
        end)
        task.delay(0.5, function() --[[ Line: 339 ]]
            --[[
            Upvalues:
                [1] = u86
            --]]
            u86:Destroy()
        end)
    end)
end
function u27.convertBlockToDebris(p132, p133, p134, p135, p136, p137, p138, p139, p140, p141, p142, p143, p144) --[[ Line: 344 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u17
        [4] = u22
        [5] = u3
    --]]
    local v145 = u13.new()
    local v146
    if p141 then
        v146 = u14("Part", {
            ["Name"] = "blockDebris",
            ["Size"] = Vector3.new(3, 3, 3),
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["CanTouch"] = false,
            ["Anchored"] = false,
            ["Position"] = p135,
            ["Parent"] = u17
        })
    else
        local v147 = {
            ["Material"] = p142 or p133.Material,
            ["Color"] = p143 or p133.Color
        }
        local v148
        if p144 == nil then
            v148 = p144
        else
            v148 = p144.X
        end
        local v149 = v148 == nil and 0.6 or v148
        local v150
        if p144 == nil then
            v150 = p144
        else
            v150 = p144.Y
        end
        local v151 = (v150 == nil and 0.9 or v150) + math.random() * 0.5
        if p144 ~= nil then
            p144 = p144.Z
        end
        local v152 = (p144 == nil and 0.9 or p144) + math.random() * 0.5
        v147.Size = Vector3.new(v149, v151, v152)
        v147.Anchored = false
        v147.CanCollide = true
        v147.Parent = u17
        v146 = u14("WedgePart", v147)
    end
    v145:GiveTask(v146)
    local v153 = u22(p134).block
    if v153 ~= nil then
        v153 = v153.greedyMesh
        if v153 ~= nil then
            v153 = v153.textures
        end
    end
    if v153 then
        u14("Texture", {
            ["Name"] = "Top",
            ["StudsPerTileU"] = 3,
            ["StudsPerTileV"] = 3,
            ["Face"] = Enum.NormalId.Top,
            ["Texture"] = v153[1],
            ["Parent"] = v146
        })
        local v154 = u14
        local v155 = "Texture"
        local v156 = {
            ["Name"] = "Bottom",
            ["StudsPerTileU"] = 3,
            ["StudsPerTileV"] = 3,
            ["Face"] = Enum.NormalId.Bottom
        }
        local v157
        if #v153 == 1 then
            v157 = v153[1]
        else
            v157 = v153[2]
        end
        v156.Texture = v157
        v156.Parent = v146
        v154(v155, v156)
        local v158 = u14
        local v159 = "Texture"
        local v160 = {
            ["Name"] = "Left",
            ["StudsPerTileU"] = 3,
            ["StudsPerTileV"] = 3,
            ["Face"] = Enum.NormalId.Left
        }
        local v161
        if #v153 == 1 then
            v161 = v153[1]
        else
            v161 = v153[3]
        end
        v160.Texture = v161
        v160.Parent = v146
        v158(v159, v160)
        local v162 = u14
        local v163 = "Texture"
        local v164 = {
            ["Name"] = "Front",
            ["StudsPerTileU"] = 3,
            ["StudsPerTileV"] = 3,
            ["Face"] = Enum.NormalId.Front
        }
        local v165
        if #v153 == 1 then
            v165 = v153[1]
        else
            v165 = v153[4]
        end
        v164.Texture = v165
        v164.Parent = v146
        v162(v163, v164)
        local v166 = u14
        local v167 = "Texture"
        local v168 = {
            ["Name"] = "Right",
            ["StudsPerTileU"] = 3,
            ["StudsPerTileV"] = 3,
            ["Face"] = Enum.NormalId.Right
        }
        local v169
        if #v153 == 1 then
            v169 = v153[1]
        else
            v169 = v153[5]
        end
        v168.Texture = v169
        v168.Parent = v146
        v166(v167, v168)
        local v170 = u14
        local v171 = "Texture"
        local v172 = {
            ["Name"] = "Back",
            ["StudsPerTileU"] = 3,
            ["StudsPerTileV"] = 3,
            ["Face"] = Enum.NormalId.Back
        }
        local v173
        if #v153 == 1 then
            v173 = v153[1]
        else
            v173 = v153[6]
        end
        v172.Texture = v173
        v172.Parent = v146
        v170(v171, v172)
    end
    for v174, v175 in p133:GetChildren() do
        local _ = v174 - 1
        v175:Clone().Parent = v146
    end
    p132:setupAndThrowDebris(v146, u3:getWorldPosition(p135), p136, p137, p138, p139, p140)
    return v145
end
v9.CreateController(u27.new())
return nil