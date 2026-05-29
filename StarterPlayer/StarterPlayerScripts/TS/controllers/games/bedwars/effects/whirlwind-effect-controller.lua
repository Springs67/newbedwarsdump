local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.RunService
local u8 = v6.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "WhirlwindEffectController"
    end,
    ["__index"] = u10
})
u13.__index = u13
function u13.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, ...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p16, ...)
    p16.Name = "WhirlwindEffectController"
    p16.whirlwindBlocksMap = {}
    p16.activeWhirlwinds = {}
end
function u13.KnitStart(u17) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
    --]]
    u10.KnitStart(u17)
    u12.Client:OnEvent("WhirlwindEffect", function(p18) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:initializeWhirlwindBlock(p18.id, p18.blockType, p18.startPosition, p18.originPart)
    end)
end
u13.initializeWhirlwindBlock = v1.async(function(p19, p20, p21, p22, p23) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v24 = u2.getOrCreate(p19.whirlwindBlocksMap, p20, {})
    local v25 = {
        ["duration"] = 0,
        ["elapsedTime"] = 0,
        ["travelling"] = true,
        ["debris"] = p19:getDebrisBlock(p21, p22),
        ["originPart"] = p23
    }
    local v26 = math.random(-5, 5)
    local v27 = math.random(-10, 20)
    local v28 = math.random
    v25.offset = Vector3.new(v26, v27, v28(-5, 5))
    v25.circleOffset = math.random(0, 100)
    table.insert(v24, v25)
    local v29 = #v24 > 60 and table.remove(v24, 1)
    if v29 then
        p19:destroyDebris(v29.debris)
    end
    local v30 = p19.activeWhirlwinds
    if table.find(v30, p20) == nil then
        p19:activateWhirlwind(p20)
    end
    return true
end)
function u13.activateWhirlwind(u31, u32) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
    --]]
    local v33 = u31.activeWhirlwinds
    table.insert(v33, u32)
    u7.Heartbeat:Connect(function(p34) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u31
            [3] = u32
        --]]
        for _, v35 in u2.getOrCreate(u31.whirlwindBlocksMap, u32, {}) do
            v35.elapsedTime = v35.elapsedTime + p34
            local v36 = v35.originPart.Position
            local v37 = (v35.elapsedTime + v35.circleOffset) * 3
            local v38 = math.sin(v37) * 10
            local v39 = (v35.elapsedTime + v35.circleOffset) * 5
            local v40 = math.cos(v39) * 5
            local v41 = (v35.elapsedTime + v35.circleOffset) * 3
            local v42 = math.cos(v41) * 10
            local v43 = Vector3.new(v38, v40, v42)
            local v44 = v35.offset
            local v45 = v36 + v43 + v44
            if v35.travelling then
                v35.debris:PivotTo(CFrame.new(v35.debris.Position:Lerp(v45, 0.1)))
                if (v35.debris.Position - v45).Magnitude < 1 then
                    v35.travelling = false
                end
            else
                v35.debris:PivotTo(CFrame.new(v45))
            end
            local v46 = CFrame.new(v35.debris.Position)
            local v47 = CFrame.Angles(v35.elapsedTime, v35.elapsedTime * 3, v35.elapsedTime)
            v35.debris.CFrame = v46 * v47
        end
    end)
end
function u13.getDebrisBlock(_, p48, p49) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u11
    --]]
    local v50 = u5("Part", {
        ["Name"] = "blockDebris",
        ["Size"] = Vector3.new(3, 3, 3),
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["CastShadow"] = false,
        ["Anchored"] = true,
        ["Position"] = p49,
        ["Parent"] = u8
    })
    local v51 = u11(p48).block
    if v51 ~= nil then
        v51 = v51.greedyMesh
        if v51 ~= nil then
            v51 = v51.textures
        end
    end
    if v51 then
        u5("Texture", {
            ["Name"] = "Top",
            ["StudsPerTileU"] = 3,
            ["StudsPerTileV"] = 3,
            ["Face"] = Enum.NormalId.Top,
            ["Texture"] = v51[1],
            ["Parent"] = v50
        })
        local v52 = u5
        local v53 = "Texture"
        local v54 = {
            ["Name"] = "Bottom",
            ["StudsPerTileU"] = 3,
            ["StudsPerTileV"] = 3,
            ["Face"] = Enum.NormalId.Bottom
        }
        local v55
        if #v51 == 1 then
            v55 = v51[1]
        else
            v55 = v51[2]
        end
        v54.Texture = v55
        v54.Parent = v50
        v52(v53, v54)
        local v56 = u5
        local v57 = "Texture"
        local v58 = {
            ["Name"] = "Left",
            ["StudsPerTileU"] = 3,
            ["StudsPerTileV"] = 3,
            ["Face"] = Enum.NormalId.Left
        }
        local v59
        if #v51 == 1 then
            v59 = v51[1]
        else
            v59 = v51[3]
        end
        v58.Texture = v59
        v58.Parent = v50
        v56(v57, v58)
        local v60 = u5
        local v61 = "Texture"
        local v62 = {
            ["Name"] = "Front",
            ["StudsPerTileU"] = 3,
            ["StudsPerTileV"] = 3,
            ["Face"] = Enum.NormalId.Front
        }
        local v63
        if #v51 == 1 then
            v63 = v51[1]
        else
            v63 = v51[4]
        end
        v62.Texture = v63
        v62.Parent = v50
        v60(v61, v62)
        local v64 = u5
        local v65 = "Texture"
        local v66 = {
            ["Name"] = "Right",
            ["StudsPerTileU"] = 3,
            ["StudsPerTileV"] = 3,
            ["Face"] = Enum.NormalId.Right
        }
        local v67
        if #v51 == 1 then
            v67 = v51[1]
        else
            v67 = v51[5]
        end
        v66.Texture = v67
        v66.Parent = v50
        v64(v65, v66)
        local v68 = u5
        local v69 = "Texture"
        local v70 = {
            ["Name"] = "Back",
            ["StudsPerTileU"] = 3,
            ["StudsPerTileV"] = 3,
            ["Face"] = Enum.NormalId.Back
        }
        local v71
        if #v51 == 1 then
            v71 = v51[1]
        else
            v71 = v51[6]
        end
        v70.Texture = v71
        v70.Parent = v50
        v68(v69, v70)
    end
    return v50
end
u13.destroyDebris = v1.async(function(_, u72) --[[ Line: 168 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
    --]]
    local u73 = u72:GetChildren()
    u72.Transparency = 1
    u9(0.1, u4, function(p74) --[[ Line: 171 ]]
        --[[
        Upvalues:
            [1] = u73
        --]]
        for _, v75 in u73 do
            if v75:IsA("Texture") then
                v75.Transparency = p74
            end
        end
    end)
    task.delay(0.5, function() --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u72
        --]]
        u72:Destroy()
    end)
end)
v3.CreateController(u13.new())
return nil