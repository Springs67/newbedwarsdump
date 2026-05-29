local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.StatusModifier
local u4 = v2.WatchCharacter
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.StarterPlayer
local u10 = v7.UserInputService
local u11 = v7.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "JumpHeightController"
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
function u14.constructor(u17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u3
        [3] = u9
    --]]
    u12.constructor(u17)
    u17.Name = "JumpHeightController"
    u17.jumpSpeedMultiplier = 1
    u17.allowedAirJumps = 0
    u17.jumpModifier = u3.new(function(p18) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u9
        --]]
        local v19 = 0
        local v20 = 0
        local v21 = 0
        local v22 = false
        for _, v23 in p18 do
            if v23.jumpHeightMultiplier ~= nil then
                if v23.jumpHeightMultiplier <= 0 then
                    v22 = true
                elseif v23.jumpHeightMultiplier < 1 then
                    v19 = v19 + 1 / v23.jumpHeightMultiplier
                elseif v23.jumpHeightMultiplier > 1 then
                    v21 = v21 + v23.jumpHeightMultiplier
                end
            end
            if v23.airJumps ~= nil then
                v20 = v20 + v23.airJumps
            end
        end
        local v24 = v19 == 0 and 1 or v19
        u17.jumpSpeedMultiplier = v22 and 0 or (v21 == 0 and 1 or v21) / v24
        u17.allowedAirJumps = v20
        u17:setJumpHeight(u9.CharacterJumpHeight)
    end)
end
function u14.KnitStart(u25) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
        [3] = u8
        [4] = u6
        [5] = u10
        [6] = u11
        [7] = u13
    --]]
    u12.KnitStart(u25)
    u4(function(p26, p27, p28) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u25
            [4] = u10
            [5] = u11
            [6] = u13
        --]]
        if p26 ~= u8.LocalPlayer then
            return nil
        end
        local u29 = p27:WaitForChild("Humanoid", 1)
        if u29 == nil then
            u6.Warn("Could not find humanoid")
            return nil
        end
        u25.jumpModifier:clear()
        local u30 = false
        local u31 = false
        local u32 = 0
        local u33 = -1
        p28:GiveTask(u29.StateChanged:Connect(function(_, p34) --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u32
                [3] = u25
            --]]
            if p34 == Enum.HumanoidStateType.Landed then
                u31 = false
                u32 = 0
                for v35 in u25.jumpModifier:getModifiers() do
                    if v35.deleteWhenLanded then
                        u25.jumpModifier:removeModifier(v35)
                    end
                end
            elseif p34 == Enum.HumanoidStateType.Freefall then
                u31 = true
            end
        end))
        p28:GiveTask(u10.JumpRequest:Connect(function() --[[ Line: 98 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u25
                [3] = u31
                [4] = u32
                [5] = u33
                [6] = u11
                [7] = u13
                [8] = u29
            --]]
            if u30 then
                return nil
            end
            if u25.allowedAirJumps < 1 then
                return nil
            end
            u30 = true
            if u31 and (u32 < u25.allowedAirJumps and u33 < u11:GetServerTimeNow()) then
                u33 = u11:GetServerTimeNow() + 0.25
                u13.Client:Get("NotifyAirJump"):SendToServer()
                u32 = u32 + 1
                u29:ChangeState(Enum.HumanoidStateType.Jumping)
            end
            task.wait(0.25)
            u30 = false
        end))
    end)
end
function u14.setJumpHeight(p36, p37) --[[ Line: 118 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v38 = u8.LocalPlayer.Character and u8.LocalPlayer.Character:WaitForChild("Humanoid")
    if v38 then
        v38.JumpHeight = p37 * p36.jumpSpeedMultiplier
    end
end
function u14.getJumpModifier(p39) --[[ Line: 126 ]]
    return p39.jumpModifier
end
v5.CreateController(u14.new())
return nil