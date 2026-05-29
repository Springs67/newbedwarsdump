local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ExpireList
local u4 = v2.ExpireMap
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = {
    v16.SKULL_DROP_SKULL_DEPOSIT_01,
    v16.SKULL_DROP_SKULL_DEPOSIT_02,
    v16.SKULL_DROP_SKULL_DEPOSIT_03,
    v16.SKULL_DROP_SKULL_DEPOSIT_04
}
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "HunterGameGoalController"
    end,
    ["__index"] = u13
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
        [1] = u13
        [2] = u14
        [3] = u15
        [4] = u3
        [5] = u4
    --]]
    u13.constructor(p21, { u14.SKULL_DROP })
    p21.Name = "HunterGameGoalController"
    p21.attemptHunterGoalDeposit = u15.Client:Get("AttemptHunterGoalDeposit")
    p21.recentDepositAttemptingPlayers = u3.new(1.5)
    p21.depositSoundCooldownDuration = 3
    p21.recentSuccessfulDeposit = u4.new(p21.depositSoundCooldownDuration)
end
function u18.onGameInit(u22) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u7
        [3] = u5
        [4] = u17
    --]]
    u15.Client:Get("HunterGoalUpdateEvent"):Connect(function(p23) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u22
        --]]
        local v24 = p23.goalPosition
        local v25 = p23.activeDuration
        local u26 = u7.new()
        if v24 == nil then
            return nil
        end
        local v27 = u22:initGoalIndicator(v24)
        if v27 == nil then
            return nil
        end
        u26:GiveTask(v27)
        task.delay(v25, function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            u26:DoCleaning()
        end)
    end)
    u15.Client:Get("SuccessfulHunterGoalDeposit"):Connect(function(p28) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u5
            [3] = u17
        --]]
        local v29 = p28.player.UserId
        local v30 = 0
        local v31 = 1
        local v32 = 0.75
        local v33
        if u22.recentSuccessfulDeposit:has(v29) then
            local v34 = u22.recentSuccessfulDeposit:get(v29)
            v33 = (v34 == nil and 0 or v34) + 1
            if v33 > 2 and v33 <= 5 then
                v30 = 1
            elseif v33 > 5 and v33 <= 8 then
                v30 = 2
            elseif v33 > 8 and v33 <= 11 then
                v30 = 3
            elseif v33 > 11 then
                v31 = 1.2
                v30 = 3
                v32 = 0.9
            end
        else
            v33 = 0
        end
        u22.recentSuccessfulDeposit:set(v29, v33)
        u5:playSound(u17[v30 + 1], {
            ["rollOffMaxDistance"] = 300,
            ["rollOffMinDistance"] = 35,
            ["position"] = p28.depositPosition,
            ["volumeMultiplier"] = v32,
            ["playbackSpeedMultiplier"] = v31
        })
    end)
end
function u18.KnitStart(p35) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.KnitStart(p35)
end
function u18.initGoalIndicator(u36, p37) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u12
    --]]
    local v38 = u11.Assets.Misc.GoalIndicator:Clone()
    if v38 == nil then
        return nil
    end
    local v39 = v38:WaitForChild("SkullIndicator", 1)
    local v40 = v38:WaitForChild("GoalCylinder", 1)
    if v40 ~= nil then
        v40.Touched:Connect(function(p41) --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u36
            --]]
            local v42 = u10.LocalPlayer
            if u36.recentDepositAttemptingPlayers:has(v42) then
                return false
            end
            local v43 = v42.Character
            if v42.Character and p41.Parent == v43 then
                u36.attemptHunterGoalDeposit:SendToServer({
                    ["player"] = v42
                })
                u36.recentDepositAttemptingPlayers:add(v42)
            end
        end)
    end
    if v39 ~= nil then
        u36:highlightModel(v39, true)
    end
    v38.Parent = u12
    v38:PivotTo(CFrame.new(p37))
    return v38
end
function u18.highlightModel(_, p44, p45) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v46 = u8("Highlight", {
        ["FillTransparency"] = 0.3,
        ["OutlineTransparency"] = 0.2,
        ["Parent"] = nil,
        ["FillColor"] = Color3.fromRGB(0, 237, 255),
        ["OutlineColor"] = Color3.fromRGB(0, 237, 255)
    })
    if p45 then
        v46.Parent = p44
        v46.Enabled = true
    else
        v46.Enabled = false
        v46:Destroy()
    end
end
v6.CreateController(u18.new())
return nil