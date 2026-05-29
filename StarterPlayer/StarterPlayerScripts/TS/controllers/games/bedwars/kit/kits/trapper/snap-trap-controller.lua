local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CollectionTagAdded
local u4 = v2.SoundManager
local u5 = v2.WatchCharacter
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ContentProvider
local u10 = v8.Players
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "trapper", "snap-trap-state").SnapTrapState
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "SnapTrapController"
    end,
    ["__index"] = u12
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p22)
    p22.Name = "SnapTrapController"
    p22.preloaded = false
end
function u19.KnitStart(u23) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u3
        [3] = u10
        [4] = u4
        [5] = u18
        [6] = u14
        [7] = u13
        [8] = u11
        [9] = u7
        [10] = u15
        [11] = u17
        [12] = u9
        [13] = u5
        [14] = u6
        [15] = u16
    --]]
    u12.KnitStart(u23)
    u3("snap_trap", function(u24) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
            [3] = u18
            [4] = u14
            [5] = u13
            [6] = u11
            [7] = u7
            [8] = u15
            [9] = u17
            [10] = u23
            [11] = u9
        --]]
        local v25 = u24:GetAttribute("PlacedByUserId")
        local u26 = v25 == u10.LocalPlayer.UserId
        u10:GetPlayerByUserId(v25)
        local v27 = u24:GetAttribute("SnapTrapTeamId")
        if v27 == "" or not v27 then
            u24:GetAttributeChangedSignal("SnapTrapTeamId"):Wait()
        end
        local v28 = u24:GetAttribute("SnapTrapTeamId")
        local v29 = u10.LocalPlayer.Team
        if v29 ~= nil then
            v29 = v29.Name
        end
        local v30 = v28 ~= v29
        task.spawn(function() --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u18
                [3] = u26
                [4] = u24
            --]]
            local v31 = u4
            local v32 = u18.SNAP_TRAP_SETUP
            local v33 = {}
            local v34
            if u26 then
                v34 = nil
            else
                v34 = u24.Position
            end
            v33.position = v34
            v31:playSound(v32, v33)
        end)
        task.spawn(function() --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u14
                [3] = u13
            --]]
            local u35 = u24:WaitForChild("Model"):WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(u14:getAnimation(u13.SNAP_TRAP_SETUP))
            u35.Priority = Enum.AnimationPriority.Idle
            task.wait(0.1)
            u35:Play()
            u35:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u24
                --]]
                u35:AdjustSpeed(0)
                u24:GetAttributeChangedSignal("SnapTrapState"):Connect(function() --[[ Line: 68 ]] end)
            end)
        end)
        if v30 then
            task.spawn(function() --[[ Line: 72 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u11
                    [3] = u7
                --]]
                task.wait(0.5)
                if not u24.Parent then
                    return nil
                end
                local u36 = nil
                u36 = u11(0.8, u7, function(p37) --[[ Line: 78 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u36
                    --]]
                    if not u24.Parent then
                        u36:Cancel()
                        return nil
                    end
                    for _, v38 in u24.Model:GetDescendants() do
                        if v38:IsA("BasePart") then
                            v38.Transparency = p37
                        end
                    end
                end)
            end)
            u24.Touched:Connect(function(p39) --[[ Line: 90 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u15
                    [3] = u10
                    [4] = u17
                --]]
                if u24:GetAttribute("SnapTrapState") == u15.ACTIVE and (u10.LocalPlayer.Character and p39.Parent == u10.LocalPlayer.Character) then
                    for _, v40 in u24.Model:GetDescendants() do
                        if v40:IsA("BasePart") then
                            v40.Transparency = 0
                        end
                    end
                    local v41 = {
                        ["snapTrap"] = u24
                    }
                    u17.Client:Get("StepOnSnapTrap"):SendToServer(v41)
                end
            end)
        end
        task.spawn(function() --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u14
                [3] = u13
                [4] = u9
            --]]
            if not u23.preloaded then
                u23.preloaded = true
                u9:PreloadAsync({ (u14:getAnimation(u13.SNAP_TRAP_CLOSE)) })
            end
        end)
    end)
    u17.Client:OnEvent("SnapTrapSnared", function(p42) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
            [3] = u18
            [4] = u14
            [5] = u13
        --]]
        local v43 = p42.entityInstance == u10.LocalPlayer.Character
        local v44 = u4
        local v45 = u18.SNAP_TRAP_CLOSE
        local v46 = {}
        local v47
        if v43 then
            v47 = nil
        else
            v47 = p42.snapTrap.Position
        end
        v46.position = v47
        v44:playSound(v45, v46)
        local u48 = p42.snapTrap:WaitForChild("Model"):WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(u14:getAnimation(u13.SNAP_TRAP_CLOSE))
        u48.Priority = Enum.AnimationPriority.Action
        u48:AdjustSpeed(1.5)
        u48:Play()
        u48:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 123 ]]
            --[[
            Upvalues:
                [1] = u48
            --]]
            u48:AdjustSpeed(0)
        end)
    end)
    u17.Client:OnEvent("SnapTrapMarkConsumed", function(p49) --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
            [3] = u18
        --]]
        local v50 = p49.entity == u10.LocalPlayer.Character and true or p49.consumer == u10.LocalPlayer.Character
        local v51 = u4
        local v52 = u18.SNAP_TRAP_CONSUME_MARK
        local v53 = {}
        local v54
        if v50 then
            v54 = nil
        else
            v54 = p49.entity.PrimaryPart
            if v54 ~= nil then
                v54 = v54.Position
            end
        end
        v53.position = v54
        v51:playSound(v52, v53)
    end)
    u5(function(_, u55) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u16
        --]]
        u55:GetAttributeChangedSignal("SnapTrapMarked"):Connect(function() --[[ Line: 147 ]]
            --[[
            Upvalues:
                [1] = u55
                [2] = u6
                [3] = u16
            --]]
            if u55:GetAttribute("SnapTrapMarked") then
                local u56 = u6.Controllers.StunController:showStatusBubble(u55, u16.TRAPPER_MARKED)
                u56:GiveTask(u55:GetAttributeChangedSignal("SnapTrapMarked"):Connect(function() --[[ Line: 151 ]]
                    --[[
                    Upvalues:
                        [1] = u56
                    --]]
                    u56:DoCleaning()
                end))
            end
        end)
    end)
end
u6.CreateController(u19.new())
return nil