local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u9 = v1.import(script, script.Parent, "cloud-noise").CloudNoise
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "CloudController"
    end,
    ["__index"] = u7
})
u10.__index = u10
function u10.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u6
    --]]
    u7.constructor(p13)
    p13.Name = "CloudController"
    p13.clouds = {}
    p13.cloudFolder = u5("Folder", {
        ["Name"] = "Clouds",
        ["Parent"] = u6
    })
end
function u10.KnitStart(u14) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u9
    --]]
    local _, u15 = u4.Controllers.MatchController:getQueueTypeAsync():await()
    if u15 == u8.SURVIVAL then
        return nil
    end
    if UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value <= Enum.SavedQualitySetting.QualityLevel2.Value then
        return nil
    end
    u4.Controllers.MapController:getCFrame("center"):andThen(function(p16) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u9
            [3] = u14
            [4] = u15
            [5] = u8
        --]]
        local v17 = p16 or u4.Controllers.MapController:getCFramesFolder():GetChildren()[1].Value
        local v18 = false
        local v19 = 0
        while true do
            if v18 then
                v19 = v19 + 1
            else
                v18 = true
            end
            if v19 >= 80 then
                return
            end
            local v20 = false
            local v21 = 0
            while true do
                if true then
                    if v20 then
                        v21 = v21 + 1
                    else
                        v20 = true
                    end
                end
                if v21 >= 80 then
                    break
                end
                if u9[v19 + 1][v21] ~= nil then
                    u14:spawnCloud(v19, u15 == u8.LB_ONEBLOCK and -560 or 840, v21, v17.Position)
                end
            end
        end
    end)
end
function u10.spawnCloud(p22, p23, p24, p25, p26) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v27 = 150 * (p23 - 40)
    local v28 = 150 * (40 - p25)
    local v29 = Vector3.new(v27, p24, v28) + p26
    local v30 = u5("Part", {
        ["Size"] = Vector3.new(150, 65, 150),
        ["CastShadow"] = false,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanTouch"] = false,
        ["CanQuery"] = false,
        ["Material"] = Enum.Material.Plastic,
        ["Color"] = Color3.fromRGB(255, 255, 255),
        ["TopSurface"] = Enum.SurfaceType.Smooth,
        ["Position"] = v29,
        ["Parent"] = p22.cloudFolder
    })
    local v31 = p22.clouds
    table.insert(v31, v30)
end
v3.CreateController(u10.new())
return nil