local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.ReplicatedStorage
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "BeehiveController"
    end,
    ["__index"] = u12
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p17)
    p17.Name = "BeehiveController"
    p17.beehiveData = {}
end
function u14.KnitStart(u18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
        [3] = u8
        [4] = u3
        [5] = u13
        [6] = u10
    --]]
    u12.KnitStart(u18)
    u4("beehive", function(u19) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u18
            [3] = u3
            [4] = u13
        --]]
        local v20 = u8.new()
        u18.beehiveData[u19] = {
            ["bees"] = {},
            ["maid"] = v20
        }
        v20:GiveTask(function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
            --]]
            local v21 = u18.beehiveData[u19]
            if v21 ~= nil then
                v21 = v21.bees
            end
            if v21 then
                for _, v22 in v21 do
                    v22:Destroy()
                end
            end
        end)
        v20:GiveTask(u19:GetAttributeChangedSignal("Level"):Connect(function() --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u13
                [3] = u19
                [4] = u18
            --]]
            u3:playSound(u13.DEPOSIT_BEE, {
                ["position"] = u19.Position,
                ["parent"] = u19
            })
            u19.LevelUpParticles:Emit(10)
            u18:reconcileBeesAroundHive(u19, u19:GetAttribute("Level"))
        end))
    end)
    u10:GetInstanceRemovedSignal("beehive"):Connect(function(p23) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        local v24 = u18.beehiveData[p23]
        if v24 ~= nil then
            v24.maid:DoCleaning()
        end
        u18.beehiveData[p23] = nil
    end)
end
function u14.reconcileBeesAroundHive(p25, p26, p27) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
    --]]
    local v28 = p25.beehiveData[p26]
    if v28 == nil then
        error("beehive is not key of this.beehiveData. somebody did something dumb if you see this")
    end
    local v29 = p27 / 2
    local v30 = math.floor(v29)
    local v31 = v30 - #v28.bees
    if v30 > 7 then
        return nil
    end
    if v31 > 0 then
        local v32 = false
        local v33 = 0
        while true do
            if true then
                if v32 then
                    v33 = v33 + 1
                else
                    v32 = true
                end
            end
            if v33 >= v31 then
                break
            end
            local v34 = u7.Controllers.BeeController:createLocalBee({
                ["id"] = -1,
                ["maxDistanceFromOrigin"] = 2,
                ["includeProximityPrompt"] = false,
                ["origin"] = p26.Position,
                ["beeModel"] = u11.Assets.Effects.TamedBee:Clone()
            })
            local v35 = v28.bees
            table.insert(v35, v34)
        end
    elseif v31 <= 0 then
        local v36 = false
        local v37 = 0
        while true do
            if true then
                if v36 then
                    v37 = v37 + 1
                else
                    v36 = true
                end
            end
            if v37 >= math.abs(v31) then
                break
            end
            local v38 = v28.bees
            local v39 = #v38
            local v40 = v38[v39]
            v38[v39] = nil
            if v40 ~= nil then
                v40:Destroy()
            end
        end
    end
end
v6.CreateController(u14.new())
return nil