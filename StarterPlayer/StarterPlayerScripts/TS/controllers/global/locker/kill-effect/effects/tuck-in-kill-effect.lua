local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.SoundManager
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u8 = v7.InOutQuad
local u9 = v7.Linear
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.ReplicatedStorage
local u13 = v11.Workspace
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u17 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "TuckInKillEffect"
    end,
    ["__index"] = u17
})
u18.__index = u18
function u18.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21, p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p21, p22)
    u17.setPlayDefaultKillEffect(p21, false)
end
function u18.onKill(p23, p24, p25, p26) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u13
        [3] = u17
        [4] = u12
        [5] = u16
        [6] = u4
        [7] = u6
        [8] = u3
        [9] = u5
        [10] = u15
        [11] = u1
        [12] = u14
        [13] = u8
        [14] = u9
    --]]
    local u27 = u10.new()
    p25.Archivable = true
    local u28 = p25:Clone()
    u28.HumanoidRootPart.Anchored = true
    u28.Parent = u13
    u27:GiveTask(u28)
    local v29 = u28:FindFirstChild("_DamageHighlight_")
    if v29 then
        v29:Destroy()
    end
    u17.hideCharacter(p23, p25)
    local u30 = u12.Assets.Misc.TuckInBed:Clone()
    local u31 = p26.Position + Vector3.new(0, -3, -6)
    u30:PivotTo(CFrame.new(u31))
    local v32
    if u16.isGameServer() and not u4.isHoarceKat() then
        v32 = u6.Controllers.TeamController:getPlayerTeam(p24)
        if v32 ~= nil then
            v32 = v32.color
        end
    else
        v32 = Color3.fromRGB(255, 255, 255)
    end
    if v32 then
        u30.Pivot.Blanket.Color = u3.brighten(v32, 0.2)
        u30.Pivot.Mattress.Color = v32
    end
    u30.Parent = u13
    u27:GiveTask(u30)
    local u33 = u5:playModifiableSound(u15.TUCK_IN_KILL_EFFECT_MUSIC, {
        ["position"] = u30:GetPivot().Position,
        ["parent"] = u30:FindFirstChildOfClass("BasePart")
    })
    u33:Pause()
    u27:GiveTask(function() --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:Stop()
        u33:Destroy()
    end)
    local u52 = u1.Promise.new(function() --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u31
            [3] = u14
            [4] = u8
            [5] = u27
            [6] = u33
            [7] = u30
            [8] = u9
        --]]
        local u34 = u28:GetPivot()
        local v35 = u31 + Vector3.new(0, 6.5, 0)
        local u36 = CFrame.new(v35) * CFrame.Angles(0, 3.141592653589793, 0)
        local u38 = u14(1, u8, function(p37) --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u36
                [3] = u28
            --]]
            u28:PivotTo((u34:Lerp(u36, p37)))
        end, 0, 1)
        u27:GiveTask(function() --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u38
            --]]
            u38:Cancel()
        end)
        u38:Play():Wait()
        u33:Play()
        local v39 = u31 + Vector3.new(0, 2.6, -0.2)
        local u40 = CFrame.new(v39) * CFrame.Angles(-158.65042900628455, 3.141592653589793, 0)
        local u42 = u14(1, u8, function(p41) --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u40
                [3] = u28
            --]]
            u28:PivotTo((u36:Lerp(u40, p41)))
        end, 0, 1)
        u27:GiveTask(function() --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            u42:Cancel()
        end)
        u42:Play():Wait()
        local u43 = u30.Pivot.Blanket
        local u44 = u43.Size
        local u45 = u43.Position
        local u46 = u30:GetPivot().Position + Vector3.new(0, 2.727, 1.387)
        local u50 = u14(1, u8, function(p47) --[[ Line: 132 ]]
            --[[
            Upvalues:
                [1] = u44
                [2] = u45
                [3] = u46
                [4] = u43
            --]]
            local v48 = u44:Lerp(Vector3.new(5.577, 1.522, 5.491), p47)
            local v49 = u45:Lerp(u46, p47)
            u43.Size = v48
            u43.Position = v49
        end, 0, 1)
        u27:GiveTask(function() --[[ Line: 138 ]]
            --[[
            Upvalues:
                [1] = u50
            --]]
            u50:Cancel()
        end)
        u50:Play():Wait()
        if u33 then
            task.spawn(function() --[[ Line: 145 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u9
                    [3] = u33
                --]]
                u14(3, u9, function(p51) --[[ Line: 146 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                    --]]
                    if not u33 then
                        return nil
                    end
                    u33.Volume = 1 - p51
                end, 0, 1):Play():Wait()
                u33:Stop()
                u33:Destroy()
            end)
        end
        task.wait(3)
        u27:DoCleaning()
    end)
    u27:GiveTask(function() --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        return u52:cancel()
    end)
    return u27
end
return u18