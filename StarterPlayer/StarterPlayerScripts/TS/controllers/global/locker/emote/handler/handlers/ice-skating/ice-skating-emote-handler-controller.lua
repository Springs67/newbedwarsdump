local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = v4.RunService
local u8 = v4.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u17 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "IceSkatingEmoteHandlerController"
    end,
    ["__index"] = u9
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
        [1] = u9
    --]]
    u9.constructor(p21)
    p21.Name = "IceSkatingEmoteHandlerController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
        [3] = u13
        [4] = u17
        [5] = u8
        [6] = u12
        [7] = u5
        [8] = u11
        [9] = u10
        [10] = u14
        [11] = u2
        [12] = u7
        [13] = u6
        [14] = u15
        [15] = u16
    --]]
    u9.KnitStart(p22)
    local v23 = u3.Controllers.EmoteHandlerController
    local v24 = u13.ICE_SKATING
    local u25 = u17
    local u26 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 45 ]]
            return "Anonymous"
        end,
        ["__index"] = u25
    })
    u26.__index = u26
    function u26.new(...) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        local v27 = u26
        local v28 = setmetatable({}, v27)
        return v28:constructor(...) or v28
    end
    function u26.constructor(p29, ...) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25.constructor(p29, ...)
    end
    function u26.onEnable(u30, u31, u32, _, p33) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u3
            [3] = u12
            [4] = u5
            [5] = u11
            [6] = u10
            [7] = u14
            [8] = u2
            [9] = u7
            [10] = u6
            [11] = u15
            [12] = u16
        --]]
        if not u32.PrimaryPart then
            return nil
        end
        local u34 = u32.Archivable
        u32.Archivable = true
        p33:GiveTask(function() --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u34
            --]]
            u32.Archivable = u34
        end)
        local u35 = u32:Clone()
        u35.Parent = u8
        p33:GiveTask(u35)
        if not u35.PrimaryPart then
            return nil
        end
        for v36, v37 in u35:GetDescendants() do
            local _ = v36 - 1
            if v37:IsA("BasePart") then
                v37.CanCollide = false
                v37.CanQuery = false
                v37.CanTouch = false
            end
        end
        local u38 = {
            ["transparency"] = 1
        }
        u3.Controllers.CharacterTransparencyController:getTransparencyModifier(u32):addModifier(u38)
        local u39 = u5:GetPlayerByUserId(u31)
        if u39 then
            local v40 = u12:getEntity(u39)
            if v40 then
                v40:hideNametag()
            elseif v40 ~= nil then
                v40:showNametag()
            end
            p33:GiveTask(function() --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u39
                    [2] = u12
                --]]
                local v41 = u12:getEntity(u39)
                if v41 ~= nil then
                    v41:showNametag()
                end
            end)
        end
        p33:GiveTask(function() --[[ Line: 108 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u32
                [3] = u38
            --]]
            u3.Controllers.CharacterTransparencyController:getTransparencyModifier(u32):removeModifier(u38)
        end)
        u35.PrimaryPart.Anchored = true
        local v42 = u32:GetPivot().Position
        u35:PivotTo(CFrame.new(v42 + Vector3.new(0, 0.5, 0)))
        local u43 = u35:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u11:getAnimation(u10.SKATING_MEDIUIM))
        u43:Play()
        p33:GiveTask(u30:playSound(u14.ICE_SKATING_FOOTSTEP_LOOP, u31, {
            ["volumeMultiplier"] = 0.1,
            ["position"] = u32:GetPivot().Position
        }))
        p33:GiveTask(u43:GetMarkerReachedSignal("step"):Connect(function() --[[ Line: 124 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u2
                [3] = u14
                [4] = u31
                [5] = u35
            --]]
            u30:playSound(u2.fromList(u14.ICE_SKATING_FOOTSTEP_1, u14.ICE_SKATING_FOOTSTEP_2, u14.ICE_SKATING_FOOTSTEP_3, u14.ICE_SKATING_FOOTSTEP_4, u14.ICE_SKATING_FOOTSTEP_5, u14.ICE_SKATING_FOOTSTEP_6), u31, {
                ["volumeMultiplier"] = 0.2,
                ["position"] = u35:GetPivot().Position
            })
        end))
        p33:GiveTask(function() --[[ Line: 130 ]]
            --[[
            Upvalues:
                [1] = u43
            --]]
            u43:Stop()
            u43:Destroy()
        end)
        local u44 = u35:GetPivot()
        local u45 = 0
        p33:GiveTask((u7.Heartbeat:Connect(function(p46) --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u45
                [3] = u44
            --]]
            if not u35.PrimaryPart then
                return nil
            end
            u45 = u45 + p46
            local v47 = u45 * 3
            local v48 = math.sin(v47)
            local v49 = u45 * 3
            local v50 = math.cos(v49)
            local v51 = u44 + Vector3.new(v48, 0, v50) * 5
            local v52 = CFrame.Angles
            local v53 = u45 * 2.0943951023931953 * 82.5 - 90
            u35:PivotTo(v51 * v52(0, math.rad(v53), 0))
        end)))
        for v54, v55 in u6.Assets.Misc.IceSkates:GetChildren() do
            local _ = v54 - 1
            if v55:IsA("Accessory") then
                local v56 = v55:Clone()
                u15:addAccessory(u35, v56)
                p33:GiveTask(v56)
            end
        end
        u16:weldCharacterAccessories(u35)
    end
    function u26.onDisable(_, _, _, _) --[[ Line: 161 ]] end
    v23:registerHandler(v24, u26)
end
u3.CreateController(u18.new())
return nil