local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "SpeedPieController"
    end,
    ["__index"] = u5
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p12)
    p12.Name = "SpeedPieController"
end
function u9.KnitStart(u13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u4
        [4] = u6
        [5] = u8
        [6] = u7
        [7] = u3
    --]]
    u5.KnitStart(u13)
    u2(function(u14, u15) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u13
            [3] = u6
            [4] = u8
            [5] = u7
            [6] = u3
        --]]
        local function u16() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u14
                [3] = u4
                [4] = u13
                [5] = u6
                [6] = u8
                [7] = u7
                [8] = u3
            --]]
            if u15:GetAttribute("SpeedPieBuff") == true then
                if u14 == u4.LocalPlayer then
                    u13.pieSprintModifier = {
                        ["blockSprint"] = false,
                        ["moveSpeedMultiplier"] = u6:getState().Game.queueType == u8.SURVIVAL and 1.15 or u7.BakerKit.SPEED_PIE_MULTIPLIER
                    }
                    u3.Controllers.SprintController:getMovementStatusModifier():addModifier(u13.pieSprintModifier)
                    return
                end
            else
                u13:disableSpeedBuff(u15)
                if u14 == u4.LocalPlayer and u13.pieSprintModifier then
                    u3.Controllers.SprintController:getMovementStatusModifier():removeModifier(u13.pieSprintModifier)
                    u13.pieSprintModifier = nil
                end
            end
        end
        u15:GetAttributeChangedSignal("SpeedPieBuff"):Connect(function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            u16()
        end)
        u16()
    end)
end
function u9.disableSpeedBuff(_, p17) --[[ Line: 56 ]]
    local v18 = p17:FindFirstChild("LeftFoot")
    if v18 ~= nil then
        local v19 = v18:FindFirstChild("SpeedPieBuffEmitter")
        if v19 ~= nil then
            v19:Destroy()
        end
    end
    local v20 = p17:FindFirstChild("RightFoot")
    if v20 ~= nil then
        local v21 = v20:FindFirstChild("SpeedPieBuffEmitter")
        if v21 ~= nil then
            v21:Destroy()
        end
    end
end
u3.CreateController(u9.new())
return nil