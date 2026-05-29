local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v4 = v3.ConstantManager
local u5 = v3.GameQueryUtil
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u9 = v8.InQuart
local u10 = v8.OutQuad
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "partcache", "out")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").BreakBlockEventZap
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAssetFromPath
local u21 = v4.registerConstants(script, {
    ["TweenInTime"] = 0.5
})
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "FreezeBlocksController"
    end,
    ["__index"] = u15
})
u22.__index = u22
function u22.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u20
        [3] = u11
        [4] = u17
        [5] = u12
        [6] = u13
    --]]
    u15.constructor(p25)
    p25.Name = "FreezeBlocksController"
    p25.random = Random.new()
    p25.frozenBlockParts = {}
    local v26 = u20({ "blocks", "ice_frost_1" })
    local v27 = {}
    for _, v28 in Enum.NormalId:GetEnumItems() do
        local v29 = u11("Decal", {
            ["ZIndex"] = 2,
            ["Transparency"] = 1,
            ["Texture"] = v26.s,
            ["Face"] = v28
        })
        table.insert(v27, v29)
    end
    local v30 = u11
    local v31 = {
        ["Position"] = Vector3.new(0, 0, 0),
        ["CanCollide"] = false,
        ["Anchored"] = true,
        ["Transparency"] = 1
    }
    local v32 = u17
    local v33 = u17
    local v34 = u17
    v31.Size = Vector3.new(v32, v33, v34)
    v31.Children = v27
    local v35 = v30("Part", v31)
    p25.partCache = u12.new(v35, 100)
    local v36 = u11("Folder", {
        ["Name"] = "FrozenBlockCache",
        ["Parent"] = u13.Terrain
    })
    p25.partCache:SetCacheParent(v36)
end
function u22.KnitStart(u37) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u16
        [3] = u2
        [4] = u6
        [5] = u19
        [6] = u18
    --]]
    u15.KnitStart(u37)
    u16.On(function(p38, _, _, _, _) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u37
            [3] = u6
            [4] = u19
        --]]
        local v39 = u2
        local v40 = tostring(v39:getWorldPosition(p38))
        local v41 = u37.frozenBlockParts[v40]
        if v41 then
            u6:playSound(u19.BREAK_FROZEN_BLOCK, {
                ["position"] = v41.Position
            })
            u37.frozenBlockParts[v40] = nil
            u37.partCache:ReturnPart(v41)
        end
    end)
    u18.Client:OnEvent("FreezeBlocks", function(p42) --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        u37:freezeBlocks(p42.position, p42.frozenBlocks)
    end)
end
function u22.freezeBlocks(u43, p44, p45) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    for _, v46 in p45 do
        local v47 = v46.position
        local u48 = tostring(v47)
        if u43.frozenBlockParts[u48] == nil then
            local u49 = u43:makeIceBlock(v46.position)
            u43.frozenBlockParts[u48] = u49
            u43:tweenInIce(u49, (v46.position - p44).Magnitude)
            task.delay(v46.expirationTime - u13:GetServerTimeNow(), function() --[[ Line: 110 ]]
                --[[
                Upvalues:
                    [1] = u43
                    [2] = u48
                    [3] = u49
                --]]
                if u43.frozenBlockParts[u48] ~= nil then
                    u43:tweenOutIce(u49):andThen(function() --[[ Line: 114 ]]
                        --[[
                        Upvalues:
                            [1] = u43
                            [2] = u48
                            [3] = u49
                        --]]
                        u43.frozenBlockParts[u48] = nil
                        u43.partCache:ReturnPart(u49)
                    end)
                end
            end)
        end
    end
end
u22.tweenInIce = v1.async(function(p50, p51, p52) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u21
        [3] = u14
        [4] = u9
    --]]
    local v53 = u10(p52, u21.TweenInTime, 2.5, 35)
    local v54 = 0
    local u55 = {}
    for v56, v57 in p51:GetChildren() do
        local _ = v56 - 1
        if v57:IsA("Decal") == true then
            v54 = v54 + 1
            u55[v54] = v57
        end
    end
    u14(v53, u9, function(p58) --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u55
        --]]
        for _, v59 in u55 do
            v59.Transparency = p58
        end
    end, 1, 0.45 + p50.random:NextNumber(-0.1, 0.2)):Wait()
end)
u22.tweenOutIce = v1.async(function(p60, p61) --[[ Line: 147 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u9
    --]]
    local v62 = p60.random:NextNumber(1, 3)
    local v63 = 0
    local u64 = {}
    for v65, v66 in p61:GetChildren() do
        local _ = v65 - 1
        if v66:IsA("Decal") == true then
            v63 = v63 + 1
            u64[v63] = v66
        end
    end
    u14(v62, u9, function(p67) --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u64
        --]]
        for _, v68 in u64 do
            v68.Transparency = p67
        end
    end, u64[1].Transparency, 1):Wait()
end)
function u22.makeIceBlock(p69, p70) --[[ Line: 171 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v71 = p69.partCache:GetPart()
    v71.Position = p70
    u5:setQueryIgnored(v71, true)
    return v71
end
v7.CreateController(u22.new())
return nil