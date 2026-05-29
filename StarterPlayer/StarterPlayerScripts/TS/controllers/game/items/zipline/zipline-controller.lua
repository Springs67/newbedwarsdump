local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.GameQueryUtil
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v11.RunService
local u15 = v11.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "ZiplineController"
    end,
    ["__index"] = u17
})
u21.__index = u21
function u21.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p24)
    p24.Name = "ZiplineController"
end
function u21.KnitStart(u25) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u9
        [3] = u4
        [4] = u13
        [5] = u16
        [6] = u19
        [7] = u2
        [8] = u10
        [9] = u15
        [10] = u14
        [11] = u5
        [12] = u6
        [13] = u20
        [14] = u12
    --]]
    u18("zipline", function(u26) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u13
            [4] = u16
            [5] = u19
            [6] = u2
            [7] = u25
            [8] = u10
            [9] = u15
            [10] = u14
            [11] = u5
        --]]
        if u26:GetAttribute("ZiplineDepart") == false then
            return nil
        end
        u9.Controllers.ProximityPromptController:createProximityPrompt({
            ["HoldDuration"] = 0,
            ["ActionText"] = "Zipline",
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 10,
            ["ClickablePrompt"] = u4.isMobileControls(),
            ["Parent"] = u26
        }).Triggered:Connect(function(p27) --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
                [3] = u26
                [4] = u19
                [5] = u2
                [6] = u25
                [7] = u10
                [8] = u15
                [9] = u9
                [10] = u14
                [11] = u5
            --]]
            if p27 == u13.LocalPlayer then
                if u16.ZiplineMount:fire():isCancelled() then
                    return nil
                end
                local v28 = p27:GetAttribute("Teleporting")
                if v28 ~= 0 and (v28 == v28 and (v28 ~= "" and v28)) then
                    return nil
                end
                local v29 = p27:GetAttribute("ElektraDashing")
                if v29 ~= 0 and (v29 == v29 and (v29 ~= "" and v29)) then
                    return nil
                end
                local v30 = p27:GetAttribute("AgniRocket")
                if v30 ~= 0 and (v30 == v30 and (v30 ~= "" and v30)) then
                    return nil
                end
                local u31 = p27.Character
                local u32 = p27.Character
                if u32 ~= nil then
                    u32 = u32:FindFirstChild("Humanoid")
                end
                local v33 = u31 and (u32 and u26.ZiplineDestination.Value)
                local u34 = v33 and u19.Client:Get("MountZipline"):CallServer({
                    ["ziplineBasePosition"] = u2:getBlockPosition(u26.Position)
                })
                if u34 then
                    local u35 = CFrame.new(u26.Position, v33.Position)
                    local u36 = CFrame.new(v33.CFrame.Position, v33.Position)
                    if (u36.Position - u35.Position).Magnitude == 0 then
                        u32.Sit = false
                        return nil
                    end
                    local v37 = u25.activeAirJump
                    if v37 ~= nil then
                        v37.Destroy()
                    end
                    u25.activeAirJump = nil
                    local u38 = u10.new()
                    u13.LocalPlayer.CameraMaxZoomDistance = 20
                    u13.LocalPlayer.CameraMinZoomDistance = 20
                    u38:GiveTask(function() --[[ Line: 101 ]]
                        --[[
                        Upvalues:
                            [1] = u13
                            [2] = u15
                        --]]
                        u13.LocalPlayer.CameraMaxZoomDistance = 14
                        u13.LocalPlayer.CameraMinZoomDistance = 0
                        local v39 = u13.LocalPlayer.Character
                        if v39 ~= nil then
                            v39 = v39:FindFirstChild("Humanoid")
                        end
                        u15.CurrentCamera.CameraSubject = v39
                    end)
                    local u40 = true
                    u38:GiveTask(u32.Jumping:Connect(function() --[[ Line: 111 ]]
                        --[[
                        Upvalues:
                            [1] = u40
                            [2] = u38
                        --]]
                        u40 = false
                        u38:DoCleaning()
                    end))
                    local u41 = u9.Controllers.JumpHeightController:getJumpModifier():addModifier({
                        ["airJumps"] = 1,
                        ["deleteWhenLanded"] = true
                    })
                    u25.activeAirJump = u41
                    u38:GiveTask(function() --[[ Line: 120 ]]
                        --[[
                        Upvalues:
                            [1] = u25
                            [2] = u41
                        --]]
                        task.delay(3, function() --[[ Line: 121 ]]
                            --[[
                            Upvalues:
                                [1] = u25
                                [2] = u41
                            --]]
                            if u25.activeAirJump == u41 then
                                u41.Destroy()
                                u25.activeAirJump = nil
                            end
                        end)
                    end)
                    u38:GiveTask(function() --[[ Line: 128 ]]
                        --[[
                        Upvalues:
                            [1] = u40
                            [2] = u32
                        --]]
                        if not u40 then
                            return nil
                        end
                        u32.Sit = false
                    end)
                    u34.CFrame = u35
                    local u42 = (u31:GetPrimaryPartCFrame().Position - v33.Position).Magnitude
                    local u43 = tick()
                    u14:BindToRenderStep("zipline", Enum.RenderPriority.Character.Value, function(_) --[[ Line: 140 ]]
                        --[[
                        Upvalues:
                            [1] = u36
                            [2] = u35
                            [3] = u34
                            [4] = u38
                            [5] = u31
                            [6] = u26
                            [7] = u15
                            [8] = u5
                            [9] = u43
                            [10] = u42
                        --]]
                        u34.Velocity = (u36.Position - u35.Position).Unit * 40
                        if (u34.Position - u36.Position).Magnitude <= 1 then
                            u38:DoCleaning()
                            return nil
                        end
                        local function v45(p44) --[[ Line: 150 ]]
                            --[[
                            Upvalues:
                                [1] = u34
                                [2] = u31
                                [3] = u26
                                [4] = u15
                                [5] = u5
                            --]]
                            return not p44:IsDescendantOf(u34) and (not p44:IsDescendantOf(u31) and (not p44:IsDescendantOf(u26) and (not p44:IsDescendantOf(u15.CurrentCamera) and (not u5:isQueryIgnored(p44) and (p44.Position - u26.Position).Magnitude > 5)))) and true or false
                        end
                        for _, v46 in u34:GetTouchingParts() do
                            if v45(v46) and tick() - u43 > 1 then
                                u38:DoCleaning()
                                return nil
                            end
                        end
                        if u31.PrimaryPart then
                            for _, v47 in u31.PrimaryPart:GetTouchingParts() do
                                if v45(v47) and tick() - u43 > 1 then
                                    u38:DoCleaning()
                                    return nil
                                end
                            end
                        end
                        local v48 = (u34.Position - u36.Position).Magnitude
                        if u42 < v48 and tick() - u43 > 1.5 then
                            u38:DoCleaning()
                            return nil
                        end
                        u42 = v48
                        local v49 = u34.RotVelocity.Y
                        if math.abs(v49) > 1 then
                            u38:DoCleaning()
                            return nil
                        end
                    end)
                    u38:GiveTask(function() --[[ Line: 192 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                        --]]
                        u14:UnbindFromRenderStep("zipline")
                    end)
                    u38:GiveTask(v33.AncestryChanged:Connect(function(_, p50) --[[ Line: 206 ]]
                        --[[
                        Upvalues:
                            [1] = u38
                        --]]
                        if p50 == nil then
                            u38:DoCleaning()
                        end
                    end))
                    u34.AncestryChanged:Connect(function(_, p51) --[[ Line: 211 ]]
                        --[[
                        Upvalues:
                            [1] = u38
                        --]]
                        if p51 == nil then
                            u38:DoCleaning()
                        end
                    end)
                end
            end
        end)
    end)
    u18("zipline-attached", function(u52) --[[ Line: 222 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u6
            [3] = u20
            [4] = u10
            [5] = u12
        --]]
        local u53 = u13.LocalPlayer.Character == u52
        local v54 = u6
        local v55 = u20.ZIPLINE_LATCH
        local v56 = {}
        local v57
        if u53 then
            v57 = nil
        else
            v57 = u52:GetPrimaryPartCFrame().Position
        end
        v56.position = v57
        v54:playSound(v55, v56)
        local u58 = u10.new()
        if u52.PrimaryPart then
            local v59 = u6
            local v60 = u20.ZIPLINE_TRAVEL
            local v61 = {
                ["looped"] = true
            }
            local v62
            if u53 then
                v62 = nil
            else
                v62 = u52:GetPrimaryPartCFrame().Position
            end
            v61.position = v62
            v61.parent = u52.PrimaryPart
            local u63 = v59:playSound(v60, v61)
            if u63 then
                u58:GiveTask(function() --[[ Line: 235 ]]
                    --[[
                    Upvalues:
                        [1] = u63
                    --]]
                    u63:Stop()
                end)
            end
        end
        u58:GiveTask(u12:GetInstanceRemovedSignal("zipline-attached"):Connect(function(p64) --[[ Line: 240 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u6
                [3] = u20
                [4] = u53
                [5] = u58
            --]]
            if p64 == u52 then
                local v65 = u6
                local v66 = u20.ZIPLINE_UNLATCH
                local v67 = {}
                local v68
                if u53 then
                    v68 = nil
                else
                    v68 = u52:GetPrimaryPartCFrame().Position
                end
                v67.position = v68
                v65:playSound(v66, v67)
                u58:DoCleaning()
            end
        end))
        u58:GiveTask(u52.AncestryChanged:Connect(function(_, p69) --[[ Line: 248 ]]
            --[[
            Upvalues:
                [1] = u58
            --]]
            if p69 == nil then
                u58:DoCleaning()
            end
        end))
    end)
end
return {
    ["ZiplineController"] = v8.CreateController(u21.new())
}