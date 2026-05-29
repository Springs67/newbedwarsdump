local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ExpireList
local u5 = v3.GameQueryUtil
local u6 = v3.RandomUtil
local u7 = v3.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.Workspace
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "defender", "defender-kit-balance")
local u20 = v19.DefenderKitBalance
local u21 = v19.DefenderSchematicColors
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "DefenderKitController"
    end,
    ["__index"] = u28
})
u29.__index = u29
function u29.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u18
        [3] = u27
        [4] = u26
        [5] = u4
    --]]
    u28.constructor(p32, u18.DEFENDER, {
        ["sounds"] = {
            u27.DEFENDER_UPGRADE_DEFENSE_01,
            u27.DEFENDER_UPGRADE_DEFENSE_02,
            u27.DEFENDER_UPGRADE_DEFENSE_03,
            u27.DEFENDER_UPGRADE_DEFENSE_04
        }
    })
    p32.Name = "DefenderKitController"
    p32.requestPlaceDefenderBlockRemote = u26.Client:Get("DefenderRequestPlaceBlock")
    p32.defenderBlockPlaced = u26.Client:Get("DefenderBlockPlaced")
    p32.currentSchematic = {}
    p32.schematicBlockMap = {}
    p32.spamClickPosition = u4.new(0.4)
end
function u29.KnitStart(u33) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u26
        [3] = u17
        [4] = u12
        [5] = u25
    --]]
    u28.KnitStart(u33)
    u26.Client:Get("UpdateDefenderSchematic"):Connect(function(p34) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u17
            [3] = u12
            [4] = u25
        --]]
        u33:handleSchematicChange((u33:fixVectorMap(p34)))
        local v35 = u17:getEntity(u12.LocalPlayer)
        if v35 ~= nil then
            v35 = v35:getItemInHand()
            if v35 ~= nil then
                v35 = v35.Name
            end
        end
        u33:setSchematicBlocksQueryable(v35 == u25.DEFENSE_SCANNER)
    end)
end
function u29.fixVectorMap(_, p36) --[[ Line: 71 ]]
    local v37 = {}
    for v38, v39 in p36 do
        local _ = v38 - 1
        v37[v39.ps] = v39.bl
    end
    return v37
end
function u29.canPlayerAffordBlockAtPosition(p40, p41) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u12
    --]]
    local v42 = p40:getBlockCostFromPosition(p41)
    if not v42 then
        return false
    end
    local v43 = v42.price
    local v44 = v42.currency
    return u23.hasEnough(u12.LocalPlayer, v44, v43)
end
function u29.getBlockCostFromPosition(p45, p46) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u12
    --]]
    local v47 = p45:getBlockForSchematicPosition(p46)
    if not v47 then
        return nil
    end
    local v48 = u22.getShopItem(v47, u12.LocalPlayer)
    if not v48 then
        return nil
    end
    local v49 = v48.price / v48.amount
    return {
        ["price"] = math.ceil(v49),
        ["currency"] = v48.currency
    }
end
function u29.getBlockCostFromBlock(_, p50) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u12
    --]]
    local v51 = u22.getShopItem(p50, u12.LocalPlayer)
    if not v51 then
        return nil
    end
    local v52 = v51.price / v51.amount
    return {
        ["price"] = math.ceil(v52),
        ["currency"] = v51.currency
    }
end
function u29.handleSchematicChange(p53, p54) --[[ Line: 122 ]]
    for v55, _ in p53.currentSchematic do
        if p54[v55] == nil then
            local v56 = p53.schematicBlockMap[v55]
            if v56 ~= nil then
                v56:Destroy()
            end
            p53.schematicBlockMap[v55] = nil
        end
    end
    for v57, v58 in p54 do
        if p53.currentSchematic[v57] == nil then
            p53:createSchematicBlockHighlight(v57, v58)
        end
    end
    p53.currentSchematic = p54
end
function u29.onKitReplicationActivated(u59, p60) --[[ Line: 157 ]]
    p60:GiveTask(u59.defenderBlockPlaced:Connect(function(p61, p62, p63) --[[ Line: 158 ]]
        --[[
        Upvalues:
            [1] = u59
        --]]
        u59:onDefenderBlockPlaced(p61, p63, p62, false)
    end))
end
function u29.onKitLocalActivated(_, _) --[[ Line: 162 ]] end
function u29.onKitLocalDeactivated(_) --[[ Line: 164 ]] end
function u29.onKitReplicationDeactivated(_) --[[ Line: 166 ]] end
function u29.onInnateAbilityEnabled(_, _, _) --[[ Line: 168 ]] end
function u29.onAbilityUsed(_, _, _) --[[ Line: 170 ]] end
function u29.setSchematicBlocksQueryable(p64, p65) --[[ Line: 172 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    for _, v66 in p64.schematicBlockMap do
        v66.CanQuery = p65
        u5:setQueryIgnored(v66, not p65)
    end
end
function u29.onDefenderBlockPlaced(p67, p68, p69, p70, _) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    p67:createBlockCreationEffect(p68, p69, u2:getWorldPosition(p70))
end
function u29.isValidSchematicPosition(p71, p72) --[[ Line: 185 ]]
    if p71.currentSchematic then
        return p71.currentSchematic[p72] ~= nil
    else
        return false
    end
end
function u29.getBlockForSchematicPosition(p73, p74) --[[ Line: 194 ]]
    return p73.currentSchematic[p74]
end
function u29.requestPlaceDefenderBlock(p75, p76) --[[ Line: 200 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v77 = u12.LocalPlayer.Character
    if v77 ~= nil then
        v77 = v77:GetPivot().Position
    end
    if not v77 then
        return false
    end
    if not p75:isValidSchematicPosition(p76) then
        return false
    end
    if p75.spamClickPosition:has(p76) then
        return false
    end
    p75.spamClickPosition:add(p76)
    local v78 = p75.requestPlaceDefenderBlockRemote:CallServer({
        ["blockPos"] = p76
    })
    if v78 ~= nil then
        p75:onDefenderBlockPlaced(u12.LocalPlayer, v78, p76, true)
    end
    return v78 ~= nil
end
function u29.createBlockCreationEffect(u79, p80, u81, u82) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u14
        [4] = u6
        [5] = u27
        [6] = u7
        [7] = u16
        [8] = u20
        [9] = u15
        [10] = u9
    --]]
    local u83 = u8.Controllers.KitSkinController:getPlayerKitSkinMeta(p80)
    local v84
    if u83 == nil then
        v84 = u83
    else
        v84 = u83.marcel
        if v84 ~= nil then
            v84 = v84.blockCreationEffect
        end
    end
    if v84 == nil then
        v84 = u13.Assets.Effects.BlockCreationEffect
    end
    local u85 = v84:Clone()
    u85.Parent = u14
    u85:PivotTo(CFrame.new(u82 + Vector3.new(0, 3.1, 0)))
    task.spawn(function() --[[ Line: 243 ]]
        --[[
        Upvalues:
            [1] = u83
            [2] = u6
            [3] = u27
            [4] = u7
            [5] = u82
        --]]
        local v86 = u83
        if v86 ~= nil then
            v86 = v86.marcel
            if v86 ~= nil then
                v86 = v86.createBlockSound
            end
        end
        local v87
        if v86 then
            local v88 = u6
            local v89 = u83
            if v89 ~= nil then
                v89 = v89.marcel
                if v89 ~= nil then
                    v89 = v89.createBlockSound
                end
            end
            v87 = v88.fromList(unpack(v89))
        else
            v87 = u6.fromList(u27.DEFENDER_UPGRADE_DEFENSE_01, u27.DEFENDER_UPGRADE_DEFENSE_02, u27.DEFENDER_UPGRADE_DEFENSE_03, u27.DEFENDER_UPGRADE_DEFENSE_04)
        end
        u7:playSound(v87, {
            ["playbackSpeedMultiplier"] = 0.8,
            ["position"] = u82
        })
    end)
    if u83 ~= nil then
        u83 = u83.marcel
        if u83 ~= nil then
            u83 = u83.blockCreationFloorEffect
        end
    end
    if u83 == nil then
        u83 = u13.Assets.Effects.BlockCreationFloorEffect
    end
    local u90 = u83:Clone()
    u90.Parent = u14
    u90:PivotTo(CFrame.new(u82 - Vector3.new(0, 1.5, 0)))
    local v91 = false
    local v92 = 1
    local v93 = {}
    while true do
        if v91 then
            v92 = v92 + 1
        else
            v91 = true
        end
        if v92 > 9 then
            local v94 = u6.shuffleArray(v93)
            local u95 = u16.AbilityCooldownModifierCheck:fire(u20.BlockCreationTime).cooldown
            for v96, u97 in v94 do
                local u98 = v96 - 1
                task.delay(u98 * 0.1, function() --[[ Line: 311 ]]
                    --[[
                    Upvalues:
                        [1] = u97
                        [2] = u79
                        [3] = u81
                        [4] = u98
                        [5] = u15
                        [6] = u95
                        [7] = u9
                    --]]
                    local v99 = false
                    local v100 = 1
                    while true do
                        if v99 then
                            v100 = v100 + 1
                        else
                            v99 = true
                        end
                        if v100 > 3 then
                            return
                        end
                        local u101 = u97:FindFirstChild(v100)
                        if u101 then
                            local u102 = u79:applyBlockTexturesToPart(u101, u81, v100, u98 % 3)
                            task.delay((3 - v100) * 0.4, function() --[[ Line: 329 ]]
                                --[[
                                Upvalues:
                                    [1] = u101
                                    [2] = u15
                                    [3] = u95
                                    [4] = u9
                                    [5] = u102
                                --]]
                                local u103 = u101:GetPivot()
                                local u104 = u101.Size
                                local u105 = u101:GetPivot() - Vector3.new(0, 3, 0)
                                task.spawn(function() --[[ Line: 335 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u101
                                        [2] = u103
                                        [3] = u15
                                        [4] = u95
                                        [5] = u9
                                        [6] = u105
                                        [7] = u104
                                    --]]
                                    u101:PivotTo(u103)
                                    u15(0.35 * u95, u9, function(p106) --[[ Line: 337 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u101
                                            [2] = u103
                                            [3] = u105
                                            [4] = u104
                                        --]]
                                        u101:PivotTo(u103:Lerp(u105, p106))
                                        u101.Size = (u104 * 0.85):Lerp(u104, p106)
                                    end, 0, 1):Play()
                                end)
                                task.spawn(function() --[[ Line: 342 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u101
                                        [2] = u15
                                        [3] = u95
                                        [4] = u9
                                    --]]
                                    u101.Transparency = 1
                                    u15(0.15 * u95, u9, function(p107) --[[ Line: 344 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u101
                                        --]]
                                        u101.Transparency = p107
                                    end, 1, 0):Play()
                                end)
                                task.delay(0.75, function() --[[ Line: 348 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u15
                                        [2] = u95
                                        [3] = u9
                                        [4] = u102
                                    --]]
                                    u15(0.25 * u95, u9, function(p108) --[[ Line: 349 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u102
                                        --]]
                                        for v109, v110 in u102 do
                                            local _ = v109 - 1
                                            v110.Transparency = p108
                                            local _ = v110.Transparency
                                        end
                                    end, 1, 0):Play()
                                end)
                                task.delay(2, function() --[[ Line: 359 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u15
                                        [2] = u95
                                        [3] = u9
                                        [4] = u101
                                        [5] = u102
                                    --]]
                                    u15(0.5 * u95, u9, function(p111) --[[ Line: 360 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u101
                                            [2] = u102
                                        --]]
                                        u101.Transparency = p111
                                        for v112, v113 in u102 do
                                            local _ = v112 - 1
                                            v113.Transparency = p111
                                            local _ = v113.Transparency
                                        end
                                    end, 0, 1):Play()
                                end)
                            end)
                        end
                    end
                end)
            end
            task.delay(1.5 * u95, function() --[[ Line: 379 ]]
                --[[
                Upvalues:
                    [1] = u85
                --]]
                u85:Destroy()
            end)
            task.delay(u95, function() --[[ Line: 382 ]]
                --[[
                Upvalues:
                    [1] = u90
                    [2] = u15
                    [3] = u9
                    [4] = u95
                --]]
                local v114 = u90:GetDescendants()
                local function v117(u115) --[[ Line: 384 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u9
                    --]]
                    if u115:IsA("ParticleEmitter") then
                        u115.Enabled = false
                    elseif u115:IsA("ImageLabel") then
                        u15(1, u9, function(p116) --[[ Line: 388 ]]
                            --[[
                            Upvalues:
                                [1] = u115
                            --]]
                            u115.ImageTransparency = p116
                        end, 0, 1):Play()
                    end
                end
                for v118, v119 in v114 do
                    v117(v119, v118 - 1, v114)
                end
                task.wait(u95)
                u90:Destroy()
            end)
            return
        end
        local v120 = u85:FindFirstChild(v92)
        if v120 then
            table.insert(v93, v120)
        end
    end
end
function u29.applyBlockTexturesToPart(_, p121, p122, p123, p124) --[[ Line: 400 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u10
    --]]
    local v125 = u24(p122).block
    if v125 ~= nil then
        v125 = v125.greedyMesh
        if v125 ~= nil then
            v125 = v125.textures
        end
    end
    if not v125 then
        return {}
    end
    local v126 = {}
    local v127 = u10("Texture", {
        ["Name"] = "Top",
        ["StudsPerTileU"] = 3,
        ["StudsPerTileV"] = 3,
        ["Transparency"] = 1,
        ["Face"] = Enum.NormalId.Top,
        ["Texture"] = v125[1],
        ["OffsetStudsV"] = p124,
        ["OffsetStudsU"] = p123,
        ["Parent"] = p121
    })
    table.insert(v126, v127)
    local v128 = u10
    local v129 = "Texture"
    local v130 = {
        ["Name"] = "Bottom",
        ["StudsPerTileU"] = 3,
        ["StudsPerTileV"] = 3,
        ["Transparency"] = 1,
        ["Face"] = Enum.NormalId.Bottom
    }
    local v131
    if #v125 == 1 then
        v131 = v125[1]
    else
        v131 = v125[2]
    end
    v130.Texture = v131
    v130.OffsetStudsV = p124
    v130.OffsetStudsU = p123
    v130.Parent = p121
    local v132 = v128(v129, v130)
    table.insert(v126, v132)
    local v133 = u10
    local v134 = "Texture"
    local v135 = {
        ["Name"] = "Left",
        ["StudsPerTileU"] = 3,
        ["StudsPerTileV"] = 3,
        ["Transparency"] = 1,
        ["Face"] = Enum.NormalId.Left
    }
    local v136
    if #v125 == 1 then
        v136 = v125[1]
    else
        v136 = v125[3]
    end
    v135.Texture = v136
    v135.OffsetStudsV = p124
    v135.OffsetStudsU = p123
    v135.Parent = p121
    local v137 = v133(v134, v135)
    table.insert(v126, v137)
    local v138 = u10
    local v139 = "Texture"
    local v140 = {
        ["Name"] = "Front",
        ["StudsPerTileU"] = 3,
        ["StudsPerTileV"] = 3,
        ["Transparency"] = 1,
        ["Face"] = Enum.NormalId.Front
    }
    local v141
    if #v125 == 1 then
        v141 = v125[1]
    else
        v141 = v125[4]
    end
    v140.Texture = v141
    v140.OffsetStudsV = p124
    v140.OffsetStudsU = p123
    v140.Parent = p121
    local v142 = v138(v139, v140)
    table.insert(v126, v142)
    local v143 = u10
    local v144 = "Texture"
    local v145 = {
        ["Name"] = "Right",
        ["StudsPerTileU"] = 3,
        ["StudsPerTileV"] = 3,
        ["Transparency"] = 1,
        ["Face"] = Enum.NormalId.Right
    }
    local v146
    if #v125 == 1 then
        v146 = v125[1]
    else
        v146 = v125[5]
    end
    v145.Texture = v146
    v145.OffsetStudsV = p124
    v145.OffsetStudsU = p123
    v145.Parent = p121
    local v147 = v143(v144, v145)
    table.insert(v126, v147)
    local v148 = u10
    local v149 = "Texture"
    local v150 = {
        ["Name"] = "Back",
        ["StudsPerTileU"] = 3,
        ["StudsPerTileV"] = 3,
        ["Transparency"] = 1,
        ["Face"] = Enum.NormalId.Back
    }
    local v151
    if #v125 == 1 then
        v151 = v125[1]
    else
        v151 = v125[6]
    end
    v150.Texture = v151
    v150.OffsetStudsV = p124
    v150.OffsetStudsU = p123
    v150.Parent = p121
    local v152 = v148(v149, v150)
    table.insert(v126, v152)
    return v126
end
function u29.changeSchematicBlockColor(p153, p154, p155) --[[ Line: 493 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local u156 = p153.schematicBlockMap[p154]
    if not u156 then
        return nil
    end
    u156.Grid.Color = p155
    task.delay(1, function() --[[ Line: 501 ]]
        --[[
        Upvalues:
            [1] = u156
            [2] = u21
        --]]
        u156.Grid.Color = u21.normal
    end)
end
function u29.createSchematicBlockHighlight(p157, p158, p159) --[[ Line: 505 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u13
        [4] = u14
        [5] = u2
        [6] = u24
        [7] = u5
    --]]
    local v160 = u8.Controllers.KitSkinController:getPlayerKitSkinMeta(u12.LocalPlayer)
    local v161 = p157.schematicBlockMap[p158]
    if v161 ~= nil then
        v161:Destroy()
    end
    if v160 ~= nil then
        v160 = v160.marcel
        if v160 ~= nil then
            v160 = v160.defenderSchematicBlock
        end
    end
    if v160 == nil then
        v160 = u13.Assets.Effects.DefenderSchematicBlock
    end
    local v162 = v160:Clone()
    v162.Parent = u14
    local v163 = u2:getWorldPosition(p158)
    v162:PivotTo(CFrame.new(v163))
    local v164 = u24(p159).image
    local v165 = v164 == nil and "" or v164
    v162.Billboard.BlockIcon.Image = v165
    v162:SetAttribute("Block", true)
    u5:setQueryIgnored(v162, false)
    p157.schematicBlockMap[p158] = v162
end
function u29.createHighlight(_, p166, p167) --[[ Line: 541 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v168 = {}
    local v169
    if p167 == nil then
        v169 = p167
    else
        v169 = p167.name
    end
    v168.Name = v169 == nil and "Highlight" or v169
    v168.Parent = p166
    if p167 ~= nil then
        p167 = p167.color
    end
    if p167 == nil then
        p167 = Color3.fromRGB(10, 179, 217)
    end
    v168.OutlineColor = p167
    v168.FillTransparency = 1
    v168.OutlineTransparency = 0
    v168.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    return u10("Highlight", v168)
end
u8.CreateController(u29.new())
return nil