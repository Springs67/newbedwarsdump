local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.WatchCollectionTag
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "InfectedCrateController"
    end,
    ["__index"] = u7
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p13)
    p13.Name = "InfectedCrateController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u4
        [4] = u9
        [5] = u6
        [6] = u5
        [7] = u2
    --]]
    u7.KnitStart(p14)
    u8.Client:Get("CrateOpened"):Connect(function(p15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u9
            [3] = u6
        --]]
        u4:playSound(u9.WOOD_BREAK, {
            ["rollOffMinDistance"] = 30,
            ["rollOffMaxDistance"] = 120,
            ["position"] = p15.cratePosition,
            ["playbackSpeedMultiplier"] = 0.95 + math.random() * 0.1
        })
        local v16 = false
        local v17 = 0
        while true do
            if v16 then
                v17 = v17 + 1
            else
                v16 = true
            end
            if v17 >= 4 then
                return
            end
            u6.Controllers.BlockDebrisController:createDebris(p15.cratePosition, Color3.fromRGB(115, 66, 23), Vector3.new(0, 0, 0))
        end
    end)
    u5("infected-crate", function(p18) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        p18:WaitForChild("crateEntityRoot", 1)
        local v19 = u2:getStore():getBlockAt(u2:getBlockPosition(p18.PrimaryPart.Position))
        if not v19 then
            return nil
        end
        local v20 = p18:GetAttribute("Emerald")
        if (v20 == 0 or (v20 ~= v20 or (v20 == "" or not v20))) and v19 ~= nil then
            local v21 = v19:WaitForChild("EmeraldLarge", 3)
            if v21 ~= nil then
                v21:Destroy()
            end
        end
        local v22 = p18:GetAttribute("Diamond")
        if (v22 == 0 or (v22 ~= v22 or (v22 == "" or not v22))) and v19 ~= nil then
            local v23 = v19:WaitForChild("DiamondLarge", 3)
            if v23 ~= nil then
                v23:Destroy()
            end
        end
    end)
end
u6.CreateController(u10.new())
return nil