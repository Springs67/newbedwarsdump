local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v2.UIUtil
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.InOutExpo
local u8 = v6.OutQuint
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.TweenService
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = nil
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "CollectorPlayer"
    end
})
u17.__index = u17
function u17.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(_) --[[ Line: 34 ]] end
function u17.create(_, u20, u21, u22, u23) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u7
        [4] = u12
        [5] = u10
        [6] = u14
        [7] = u13
        [8] = u4
        [9] = u3
        [10] = u16
        [11] = u5
    --]]
    local u24 = u9.new()
    return {
        ["play"] = function() --[[ Name: play, Line 39 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u8
                [3] = u7
                [4] = u12
                [5] = u10
                [6] = u24
                [7] = u14
                [8] = u21
                [9] = u13
                [10] = u4
                [11] = u3
                [12] = u16
                [13] = u20
                [14] = u22
                [15] = u5
            --]]
            local v25 = {}
            local v26 = u23
            if type(v26) == "table" then
                for v27, v28 in u23 do
                    v25[v27] = v28
                end
            end
            local v29 = v25.explodePower
            local u30 = v29 == nil and 100 or v29
            local u31 = v25.minExplodeSpeed
            if u31 == nil then
                local v32 = math
                local v33 = u23
                if v33 ~= nil then
                    v33 = v33.amount
                end
                if v33 == nil then
                    local v34 = u23
                    if v34 ~= nil then
                        v34 = v34.waitSecBtwnExplodes
                    end
                    v33 = 1 * (v34 == nil and 0.1 or v34)
                end
                u31 = v32.max(1, v33)
            end
            local u35 = v25.maxExplodeSpeed
            if u35 == nil then
                local v36 = math
                local v37 = u23
                if v37 ~= nil then
                    v37 = v37.amount
                end
                if v37 == nil then
                    local v38 = u23
                    if v38 ~= nil then
                        v38 = v38.waitSecBtwnExplodes
                    end
                    v37 = 1 * (v38 == nil and 0.1 or v38)
                end
                u35 = v36.max(1, v37) + 1
            end
            local v39 = v25.waitSecBtwnExplodes
            local u40 = v39 == nil and 0.1 or v39
            local v41 = v25.minSiphonSpeed
            local u42 = v41 == nil and 0.7 or v41
            local v43 = v25.maxSiphonSpeed
            local u44 = v43 == nil and 1.6 or v43
            local v45 = v25.endStaySecs
            local u46 = v45 == nil and 0.2 or v45
            local u47 = v25.explodeSizeEasingFunction
            if u47 == nil then
                u47 = u8
            end
            local u48 = v25.siphonPosEasingFunction
            if u48 == nil then
                u48 = u7
            end
            local v49 = {
                ["Name"] = "CollectEffectScreen",
                ["DisplayOrder"] = 200,
                ["ResetOnSpawn"] = false
            }
            local v50 = u23
            if v50 ~= nil then
                v50 = v50.parent
            end
            if v50 == nil then
                v50 = u12.LocalPlayer:WaitForChild("PlayerGui")
            end
            v49.Parent = v50
            local v51 = u10("ScreenGui", v49)
            u24:GiveTask(v51)
            local u52 = Random.new(os.time())
            local u53 = {}
            local function v60(u54) --[[ Line: 137 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u47
                    [3] = u21
                    [4] = u52
                    [5] = u30
                    [6] = u13
                    [7] = u35
                    [8] = u31
                    [9] = u53
                    [10] = u23
                    [11] = u4
                    [12] = u3
                    [13] = u16
                    [14] = u40
                --]]
                u14(0.5, u47, function(p55) --[[ Line: 139 ]]
                    --[[
                    Upvalues:
                        [1] = u54
                    --]]
                    u54.Size = p55
                    return u54.Size
                end, UDim2.fromOffset(0, 0), UDim2.fromOffset(u54.AbsoluteSize.X, u54.AbsoluteSize.Y))
                local v56 = u21 + Vector2.new((u52:NextNumber() < 0.5 and -1 or 1) * u52:NextNumber() * u30, (u52:NextNumber() < 0.5 and -1 or 1) * u52:NextNumber() * u30)
                local v57 = u13:Create(u54, TweenInfo.new(u52:NextNumber() * (u35 - u31) + u31, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ["Position"] = UDim2.fromOffset(v56.X, v56.Y)
                })
                local v58 = u53
                table.insert(v58, v57)
                v57:Play()
                local v59 = u23
                if v59 ~= nil then
                    v59 = v59.disableSounds
                end
                if not v59 then
                    u4:playSound(u3.randomArraySelectN(u16, 1)[1])
                end
                task.wait(u40)
            end
            local v61 = false
            local v62 = 0
            local v63 = {}
            while true do
                if v61 then
                    v62 = v62 + 1
                else
                    v61 = true
                end
                local v64 = u23
                if v64 ~= nil then
                    v64 = v64.amount
                end
                if v62 >= (v64 == nil and 1 or v64) then
                    for v65, v66 in u53 do
                        local _ = v65 - 1
                        v66:Pause()
                        v66:Destroy()
                    end
                    for v67, u68 in v63 do
                        local _ = v67 - 1
                        task.spawn(function() --[[ Line: 201 ]]
                            --[[
                            Upvalues:
                                [1] = u52
                                [2] = u44
                                [3] = u42
                                [4] = u14
                                [5] = u48
                                [6] = u68
                                [7] = u22
                                [8] = u5
                                [9] = u46
                            --]]
                            u14(u52:NextNumber() * (u44 - u42) + u42, u48, function(p69) --[[ Line: 203 ]]
                                --[[
                                Upvalues:
                                    [1] = u68
                                --]]
                                u68.Position = p69
                                return u68.Position
                            end, UDim2.fromOffset(u68.AbsolutePosition.X, u68.AbsolutePosition.Y), UDim2.fromOffset(u22.X, u22.Y)):Wait()
                            u5:setContainerTransparency(u68, 1, {
                                ["onSetTweenInfo"] = TweenInfo.new(0.2)
                            })
                            task.wait(u46)
                            u68:Destroy()
                        end)
                    end
                    task.delay(2, function() --[[ Line: 218 ]]
                        --[[
                        Upvalues:
                            [1] = u24
                        --]]
                        u24:DoCleaning()
                    end)
                    return
                end
                local v70 = u20:Clone()
                v70.Position = UDim2.fromOffset(u21.X, u21.Y)
                v70.Parent = v51
                table.insert(v63, v70)
                v60(v70)
            end
        end,
        ["cleanup"] = function() --[[ Name: cleanup, Line 222 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24:DoCleaning()
        end
    }
end
u16 = {
    v15.BUBBLE_POP1,
    v15.BUBBLE_POP2,
    v15.BUBBLE_POP3,
    v15.BUBBLE_POP4,
    v15.BUBBLE_POP5,
    v15.BUBBLE_POP6
}
return {
    ["CollectorPlayer"] = u17
}