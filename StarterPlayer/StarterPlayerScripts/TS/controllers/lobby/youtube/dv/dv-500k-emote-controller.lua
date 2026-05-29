local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "Dv500kEmoteController"
    end,
    ["__index"] = u15
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p23)
    p23.Name = "Dv500kEmoteController"
end
function u20.KnitStart(p24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u4
        [3] = u3
        [4] = u19
        [5] = u7
        [6] = u11
        [7] = u14
        [8] = u8
        [9] = u9
        [10] = u6
        [11] = u16
        [12] = u12
        [13] = u17
        [14] = u13
        [15] = u18
    --]]
    u15.KnitStart(p24)
    u4("DvTrophy", function(u25) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u19
            [3] = u7
            [4] = u11
            [5] = u14
            [6] = u8
            [7] = u9
            [8] = u6
            [9] = u16
            [10] = u12
            [11] = u17
            [12] = u13
            [13] = u18
        --]]
        u3:playSound(u19.EMERALD_GENERATOR_AURA, {
            ["volumeMultiplier"] = 1.4,
            ["parent"] = u25
        })
        local u26 = u7.Controllers.ProximityPromptController:createProximityPrompt({
            ["ObjectText"] = "DV Trophy",
            ["ActionText"] = "Activate",
            ["HoldDuration"] = 1,
            ["RequiresLineOfSight"] = false,
            ["Parent"] = u25
        })
        u26.Triggered:Connect(function(p27) --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u26
                [3] = u25
                [4] = u14
                [5] = u8
                [6] = u9
                [7] = u6
                [8] = u16
                [9] = u12
                [10] = u17
                [11] = u13
                [12] = u3
                [13] = u19
                [14] = u18
            --]]
            if p27 ~= u11.LocalPlayer then
                return nil
            end
            u26.Enabled = false
            local u28 = u25:FindFirstChildWhichIsA("BillboardGui")
            local u29 = 0
            u14(1, u8, function(p30) --[[ Line: 60 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u29
                --]]
                local v31 = u28
                if v31 ~= nil then
                    for v32, v33 in v31:GetChildren() do
                        local _ = v32 - 1
                        if v33:IsA("TextLabel") then
                            v33.TextTransparency = u29 * p30 + (1 - p30) * (1 - u29)
                        end
                    end
                end
            end)
            task.spawn(function() --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u25
                    [3] = u6
                    [4] = u16
                    [5] = u12
                    [6] = u17
                    [7] = u13
                    [8] = u3
                    [9] = u19
                --]]
                local v34 = u9.new()
                local u35 = true
                task.spawn(function() --[[ Line: 79 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                        [2] = u25
                        [3] = u6
                        [4] = u16
                    --]]
                    while true do
                        local v36 = task.wait(0.125)
                        if v36 ~= 0 and (v36 == v36 and v36) then
                            v36 = u35
                        end
                        if v36 == 0 or (v36 ~= v36 or not v36) then
                            return
                        end
                        local v37 = math.random() * 3.141592653589793 * 2
                        local v38 = 30 + math.random() * 60
                        local v39 = math.cos(v37) * v38
                        local v40 = 20 + math.random() * 25
                        local v41 = math.sin(v37) * v38
                        local v42 = Vector3.new(v39, v40, v41)
                        local v43 = u25.Position + u25.CFrame.LookVector * 100
                        u6.Controllers.FireworkController:playFireworkEffect(v43 + v42, u16.DV)
                    end
                end)
                local v44 = false
                local v45 = 0
                ::l18::
                if v44 then
                    v45 = v45 + 1
                else
                    v44 = true
                end
                if v45 >= 7 then
                    task.wait(1.5)
                    u35 = false
                    return
                end
                local v46 = false
                local v47 = 0
                while true do
                    if true then
                        if v46 then
                            v47 = v47 + 1
                        else
                            v46 = true
                        end
                    end
                    if v47 >= 4 then
                        break
                    end
                    local v48 = u12:FindFirstChild("Items")
                    if v48 ~= nil then
                        v48 = v48:FindFirstChild(u17.EMERALD)
                        if v48 ~= nil then
                            v48 = v48:Clone()
                        end
                    end
                    local v49 = v48 and v48:FindFirstChild("Handle")
                    if v49 then
                        v48.Parent = u13
                        v49.CFrame = u25.CFrame * CFrame.Angles(0, math.random() * 3.141592653589793 * 2, 0) + Vector3.new(0, 6, 0)
                        local v50 = math.random() * 3.141592653589793 * 2
                        local v51 = math.cos(v50) * 30
                        local v52 = 40 + math.random() * 5
                        local v53 = math.sin(v50) * 30
                        v49.Velocity = Vector3.new(v51, v52, v53)
                        u3:playSound(u19.NEW_EMERALD_PICKUP, {
                            ["volumeMultiplier"] = 0.25,
                            ["position"] = u25.Position,
                            ["playbackSpeedMultiplier"] = v47 / 6 * 0.04 + 0.98
                        })
                        v34:GiveTask(v48)
                    end
                    task.wait(0.125)
                end
                task.wait(0.5)
                v34:DoCleaning()
                goto l18
            end)
            task.wait(10.5)
            local u54 = 1
            u14(1, u8, function(p55) --[[ Line: 60 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u54
                --]]
                local v56 = u28
                if v56 ~= nil then
                    for v57, v58 in v56:GetChildren() do
                        local _ = v57 - 1
                        if v58:IsA("TextLabel") then
                            v58.TextTransparency = u54 * p55 + (1 - p55) * (1 - u54)
                        end
                    end
                end
            end)
            u18.Client:Get("ClaimDv500k"):SendToServer()
            task.delay(3, function() --[[ Line: 160 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26.Enabled = true
            end)
        end)
    end)
end
u6.CreateController(u20.new())
return nil