local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.WatchCollectionTag
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "SurvivalCrateController"
    end,
    ["__index"] = u7
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
    --]]
    u7.constructor(p15, { u8.SURVIVAL })
    p15.Name = "SurvivalCrateController"
end
function u12.onGameInit(_) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
        [3] = u11
        [4] = u6
        [5] = u5
        [6] = u2
        [7] = u9
    --]]
    u10.Client:Get("CrateOpened"):Connect(function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u11
            [3] = u6
        --]]
        u4:playSound(u11.WOOD_BREAK, {
            ["rollOffMinDistance"] = 30,
            ["rollOffMaxDistance"] = 120,
            ["position"] = p16.cratePosition,
            ["playbackSpeedMultiplier"] = 0.95 + math.random() * 0.1
        })
        local v17 = false
        local v18 = 0
        while true do
            if v17 then
                v18 = v18 + 1
            else
                v17 = true
            end
            if v18 >= 4 then
                return
            end
            u6.Controllers.BlockDebrisController:createDebris(p16.cratePosition, Color3.fromRGB(115, 66, 23), Vector3.new(0, 0, 0))
        end
    end)
    u5("survival-crate", function(p19) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
        --]]
        p19:WaitForChild("crateEntityRoot", 1)
        local v20 = u2:getStore():getBlockAt(u2:getBlockPosition(p19.PrimaryPart.Position))
        if not v20 or v20.Name ~= u9.SURVIVAL_CRATE then
            return nil
        end
        local v21 = p19:GetAttribute("Emerald")
        if (v21 == 0 or (v21 ~= v21 or (v21 == "" or not v21))) and v20 ~= nil then
            local v22 = v20:WaitForChild("EmeraldLarge", 3)
            if v22 ~= nil then
                v22:Destroy()
            end
        end
        local v23 = p19:GetAttribute("Diamond")
        if (v23 == 0 or (v23 ~= v23 or (v23 == "" or not v23))) and v20 ~= nil then
            local v24 = v20:WaitForChild("DiamondLarge", 3)
            if v24 ~= nil then
                v24:Destroy()
            end
        end
    end)
end
u6.CreateController(u12.new())
return nil