local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.WatchCollectionTag
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "partcache", "out")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v10.RunService
local u14 = v10.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "character", "character-util").CharacterUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "PlayerBlockCollisionController"
    end,
    ["__index"] = u15
})
u19.__index = u19
function u19.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u7
    --]]
    u15.constructor(p22)
    p22.Name = "PlayerBlockCollisionController"
    p22.renderedBlockers = {}
    p22.maid = u7.new()
    p22.blockerFolder = nil
    p22.blockerPartCache = nil
    p22.lastPlayerBlockPosition = nil
    p22.forceUpdateBlockers = false
end
function u19.KnitStart(u23) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
        [3] = u14
        [4] = u16
        [5] = u11
        [6] = u4
        [7] = u9
        [8] = u13
        [9] = u5
    --]]
    u15.KnitStart(u23)
    u23.blockerFolder = u8("Folder", {
        ["Name"] = "Blockers",
        ["Parent"] = u14
    })
    u23.maid:GiveTask(function() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v24 = u23.blockerFolder
        if v24 ~= nil then
            v24:Destroy()
        end
    end)
    local v25 = u8
    local v26 = {
        ["Name"] = "BlockerPart",
        ["Transparency"] = 1,
        ["CanTouch"] = false,
        ["CanCollide"] = true,
        ["CanQuery"] = false
    }
    local v27 = u16
    local v28 = u16
    local v29 = u16
    v26.Size = Vector3.new(v27, v28, v29)
    local v30 = v25("Part", v26)
    u11:AddTag(v30, "block:no-collision")
    u11:AddTag(v30, "DontBlockSwordRaycast")
    u11:AddTag(v30, "ProjectilesIgnore")
    v30:SetAttribute("BlockEngine_Select_IgnorePlaceMode", true)
    u4:setQueryIgnored(v30, true)
    u23.blockerPartCache = u9.new(v30, 16)
    u23.blockerPartCache:SetCacheParent(u23.blockerFolder)
    u23.maid:GiveTask(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v31 = u23.blockerPartCache
        if v31 ~= nil then
            v31:Dispose()
        end
    end)
    u23.maid:GiveTask(u13.Stepped:Connect(function() --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:updateBlockers()
    end))
    u23.maid:GiveTask(u5("block", function(_) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23.forceUpdateBlockers = true
    end))
    u23.maid:GiveTask(u11:GetInstanceRemovedSignal("block"):Connect(function(_) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23.forceUpdateBlockers = true
    end))
end
function u19.updateBlockers(u32) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u2
        [3] = u17
    --]]
    local v33 = u12.LocalPlayer.Character
    local v34
    if v33 == nil then
        v34 = v33
    else
        v34 = v33.PrimaryPart
    end
    if not v34 then
        return nil
    end
    local v35 = u2:getBlockPosition(v33.PrimaryPart.Position)
    if u32.lastPlayerBlockPosition == v35 and not u32.forceUpdateBlockers then
        return nil
    end
    u32.lastPlayerBlockPosition = v35
    u32.forceUpdateBlockers = false
    local v36 = {}
    local v37 = {}
    local v38 = u17.getCharacterScale(v33) * 2
    local v39 = math.round(v38)
    if v39 ~= nil and v39 > 1 then
        local v40 = v39 / 2
        local v41 = math.round(v40) - 1
        local v42 = false
        local v43 = -1
        while true do
            if true then
                if v42 then
                    v43 = v43 + 1
                else
                    v42 = true
                end
            end
            if v43 > 1 then
                break
            end
            local v44 = -1 - v41
            local v45 = false
            while true do
                if true then
                    if v45 then
                        v44 = v44 + 1
                    else
                        v45 = true
                    end
                end
                if v44 > v41 + 1 then
                    break
                end
                local v46 = false
                local v47 = -1
                while true do
                    if true then
                        if v46 then
                            v47 = v47 + 1
                        else
                            v46 = true
                        end
                    end
                    if v47 > 1 then
                        break
                    end
                    local v48 = v35 + Vector3.new(v43, v44, v47)
                    if u32:getValidBlockAt(v48) == nil then
                        local v49 = false
                        local v50 = 1
                        while true do
                            if true then
                                if v49 then
                                    v50 = v50 + 1
                                else
                                    v49 = true
                                end
                            end
                            if v50 >= v39 then
                                break
                            end
                            local v51 = v48 - Vector3.new(0, 1, 0)
                            local v52 = v48 + Vector3.new(0, v50, 0)
                            local v53 = u32:getValidBlockAt(v51)
                            local v54 = u32:getValidBlockAt(v52)
                            if v53 ~= nil and v54 ~= nil then
                                local v55 = false
                                local v56 = 0
                                while true do
                                    if true then
                                        if v55 then
                                            v56 = v56 + 1
                                        else
                                            v55 = true
                                        end
                                    end
                                    if v56 >= v50 then
                                        break
                                    end
                                    local v57 = v48 + Vector3.new(0, v56, 0)
                                    if v37[u32:getVectorString(v57)] == nil then
                                        local v58 = u32:getValidBlockAt(v57)
                                        local v59 = u32:getVectorString(v57)
                                        if v58 == nil then
                                            v36[v59] = true
                                        end
                                        v37[v59] = true
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    local v60 = {}
    for v61, v62 in u32.renderedBlockers do
        if v36[v61] == nil then
            local v63 = u32.blockerPartCache
            if v63 ~= nil then
                v63:ReturnPart(v62)
            end
            table.insert(v60, v61)
        end
    end
    for v64, v65 in v60 do
        local _ = v64 - 1
        local v66 = u32.renderedBlockers
        local _ = v66[v65] == nil
        v66[v65] = nil
    end
    local function v75(p67) --[[ Line: 235 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        if u32.renderedBlockers[p67] == nil then
            local v68 = string.split(p67, ",")
            local v69 = table.create(#v68)
            for v70, v71 in v68 do
                local _ = v70 - 1
                v69[v70] = tonumber(v71)
            end
            local v72 = v69[1]
            local v73 = v69[2]
            local v74 = v69[3]
            u32:createBlockerPart(Vector3.new(v72, v73, v74), p67)
        end
    end
    for v76 in v36 do
        v75(v76, v76, v36)
    end
end
function u19.createBlockerPart(p77, p78, p79) --[[ Line: 261 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if not p77.blockerPartCache then
        return nil
    end
    local v80 = p77.blockerPartCache:GetPart()
    v80.Position = u2:getWorldPosition(p78)
    p77.renderedBlockers[p79] = v80
end
function u19.getVectorString(_, p81) --[[ Line: 271 ]]
    local v82 = p81.X
    local v83 = tostring(v82)
    local v84 = p81.Y
    local v85 = tostring(v84)
    local v86 = p81.Z
    return v83 .. "," .. v85 .. "," .. tostring(v86)
end
function u19.getValidBlockAt(_, p87) --[[ Line: 274 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u18
    --]]
    local v88 = u2:getStore():getBlockAt(p87)
    if v88 then
        local v89 = u18(v88.Name).block
        if v89 ~= nil then
            v89 = v89.canReplace
        end
        if v89 then
            return nil
        else
            return v88
        end
    else
        return nil
    end
end
v6.CreateController(u19.new())
return nil