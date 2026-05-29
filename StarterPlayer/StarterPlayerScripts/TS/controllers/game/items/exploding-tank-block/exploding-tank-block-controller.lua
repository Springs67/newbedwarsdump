local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.ReplicatedStorage
local u13 = v11.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "ExplodingTankBlockController"
    end,
    ["__index"] = u15
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p21)
    p21.Name = "ExplodingTankBlockController"
    p21.explodingTanks = {}
end
function u18.KnitStart(u22) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
        [3] = u17
        [4] = u16
        [5] = u2
        [6] = u10
        [7] = u5
        [8] = u13
        [9] = u14
        [10] = u9
        [11] = u4
        [12] = u12
    --]]
    u15.KnitStart(u22)
    u8.Controllers.PreloadController:runPreload({
        ["sounds"] = {
            u17.EXPLODING_TANK_BLOCK_ON_FIRE,
            u17.EXPLODING_TANK_BLOCK_EXPLODE_1,
            u17.EXPLODING_TANK_BLOCK_EXPLODE_2,
            u17.EXPLODING_TANK_BLOCK_EXPLODE_3
        }
    })
    u16.Client:Get("ExplodingTankBlock_TimerStarted"):Connect(function(p23, p24, _, p25) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
            [3] = u5
            [4] = u17
            [5] = u22
            [6] = u13
            [7] = u14
            [8] = u9
            [9] = u4
            [10] = u12
        --]]
        local u26 = u2:getStore():getBlockAt(p24)
        if not u26 then
            return nil
        end
        local u27 = u26:GetAttribute("BlockUUID")
        if u27 == "" or (not u27 or u27 == "") then
            return nil
        end
        if u27 ~= p23 then
            return nil
        end
        local u28 = u26.Position
        local u29 = u10.new()
        local u30
        if u26 == nil then
            u30 = u26
        else
            u30 = u26:FindFirstChild("FireParent")
            if u30 ~= nil then
                u30 = u30:FindFirstChild("Fire")
            end
        end
        if u30 then
            u30.Enabled = true
        end
        u29:GiveTask(function() --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            if u30 then
                u30.Enabled = false
            end
        end)
        u29:GiveTask((u5:playSound(u17.EXPLODING_TANK_BLOCK_ON_FIRE, {
            ["position"] = u26.Position,
            ["parent"] = u26
        })))
        u22.explodingTanks[u27] = {
            ["isCancelled"] = false,
            ["maid"] = u29
        }
        local u31 = p25 - u13:GetServerTimeNow()
        local u32 = u26.Size
        local u33 = u32 * 1.25
        u14(u31, u9, function(p34) --[[ Line: 93 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u32
                [3] = u33
            --]]
            u26.Size = u32:Lerp(u33, p34)
        end, 0, 1):Play()
        task.spawn(function() --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u29
                [3] = u22
                [4] = u27
                [5] = u4
                [6] = u17
                [7] = u5
                [8] = u26
                [9] = u12
                [10] = u28
                [11] = u13
            --]]
            if u31 > 0 then
                task.wait(u31)
            end
            u29:DoCleaning()
            local v35 = u22.explodingTanks[u27]
            if v35 ~= nil then
                v35 = v35.isCancelled
            end
            if v35 then
                return nil
            end
            local v36 = u4.fromList
            local v37 = { u17.EXPLODING_TANK_BLOCK_EXPLODE_1, u17.EXPLODING_TANK_BLOCK_EXPLODE_2, u17.EXPLODING_TANK_BLOCK_EXPLODE_3 }
            u5:playSound(v36(unpack(v37)), {
                ["position"] = u26.Position
            })
            local u38 = u12.Assets.Effects.ExplodingTankBlockExplosion:Clone()
            u38.Position = u28
            u38.Parent = u13
            u38.Explosion:Emit(30)
            task.delay(5, function() --[[ Line: 120 ]]
                --[[
                Upvalues:
                    [1] = u38
                --]]
                return u38:Destroy()
            end)
        end)
    end)
    u16.Client:Get("ExplodingTankBlock_TimerCancelled"):Connect(function(p39, p40) --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u22
        --]]
        if not u2:getStore():getBlockAt(p40) then
            return nil
        end
        local v41 = u22.explodingTanks[p39]
        if v41 then
            v41.isCancelled = true
            v41.maid:DoCleaning()
        end
    end)
end
v7.CreateController(u18.new())
return nil