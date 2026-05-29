local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SoundManager
local u5 = v2.StringUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.RunService
local u10 = v8.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = {
    u11.COUNTDOWN_TICK_5,
    u11.COUNTDOWN_TICK_4,
    u11.COUNTDOWN_TICK_3,
    u11.COUNTDOWN_TICK_2,
    u11.COUNTDOWN_TICK_1
}
return {
    ["CountdownComponent"] = v7.new(u6)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u5
            [3] = u9
            [4] = u4
            [5] = u12
            [6] = u11
            [7] = u6
            [8] = u3
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17, u18 = v15("00:00:00:00")
        v16(function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u10
                [3] = u5
                [4] = u9
                [5] = u4
                [6] = u12
                [7] = u11
                [8] = u18
            --]]
            local function u22() --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u10
                    [3] = u5
                --]]
                local v19 = u13.EndTime - u10:GetServerTimeNow()
                local v20 = math.max(0, v19)
                local v21 = u13.CountdownOptions or {
                    ["days"] = true,
                    ["hours"] = true,
                    ["seperator"] = " : "
                }
                return u5.formatCountdownTime(v20, v21)
            end
            local u23 = u13.EndTime - u10:GetServerTimeNow()
            local u24 = 0
            local u25 = false
            local u26 = 0
            local u27 = ""
            local u28 = 0
            local u41 = u9.Heartbeat:Connect(function(p29) --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u26
                    [3] = u28
                    [4] = u22
                    [5] = u13
                    [6] = u27
                    [7] = u23
                    [8] = u25
                    [9] = u4
                    [10] = u12
                    [11] = u11
                    [12] = u18
                --]]
                u24 = u24 + p29
                u26 = u26 + p29
                if u28 < 0.2 then
                    u28 = u28 + p29
                    return nil
                end
                u28 = 0
                local v30 = u22()
                if u13.EnableCountdownSounds and v30 ~= u27 then
                    local v31 = u23 - u24
                    local v32 = math.round(v31)
                    local v33 = u13.OnlyPlaySoundLastNSec
                    if (v33 == 0 or (v33 ~= v33 or not v33)) and true or v32 <= u13.OnlyPlaySoundLastNSec then
                        local v34 = u13.PlayCustomSoundAtTime
                        if v34 ~= nil then
                            v34 = v34.timeLeftSec
                        end
                        local v35 = v34 ~= nil
                        if v35 then
                            local v36 = u13.PlayCustomSoundAtTime
                            if v36 ~= nil then
                                v36 = v36.timeLeftSec
                            end
                            v35 = v32 <= v36
                            if v35 then
                                v35 = not u25
                            end
                        end
                        if v35 then
                            u4:playSound(u13.PlayCustomSoundAtTime.sound)
                            u25 = true
                        else
                            local v37 = u4
                            local v38
                            if v32 <= 5 then
                                local v39 = u12
                                local v40 = v32 - 1
                                v38 = v39[math.max(v40, 0) + 1]
                            else
                                v38 = u11.COUNTDOWN_TICK
                            end
                            v37:playSound(v38)
                        end
                    end
                    u27 = v30
                end
                u18(v30)
            end)
            return function() --[[ Line: 81 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                u41:Disconnect()
            end
        end, { u13.EndTime })
        local v42 = {}
        for v43, v44 in u13 do
            v42[v43] = v44
        end
        v42.EndTime = nil
        v42.PreText = nil
        v42.CountdownOptions = nil
        v42.MaxTextSize = nil
        v42.EnableCountdownSounds = nil
        v42.OnlyPlaySoundLastNSec = nil
        v42.PlayCustomSoundAtTime = nil
        v42[u6.Children] = nil
        local v45 = {
            ["AutomaticSize"] = "Y",
            ["SizeConstraint"] = "RelativeXX",
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v46 = u13.PreText
        v45.Text = ((v46 == "" or not v46) and "" or u13.PreText) .. "<b>" .. v17 .. "</b>"
        v45.TextScaled = true
        v45.RichText = true
        v45.Font = "Roboto"
        v45.TextColor3 = u3.WHITE
        v45.TextXAlignment = "Left"
        v45.TextYAlignment = "Center"
        v45.BackgroundTransparency = 1
        v45.LayoutOrder = 2
        for v47, v48 in v42 do
            v45[v47] = v48
        end
        local v49 = {}
        local v50 = #v49
        local v51 = {}
        local v52 = u13.MaxTextSize
        v51.MaxTextSize = v52 == nil and 18 or v52
        v49[v50 + 1] = u6.createElement("UITextSizeConstraint", v51)
        local v53 = u13[u6.Children]
        if v53 then
            for v54, v55 in v53 do
                if type(v54) == "number" then
                    v49[v50 + 1 + v54] = v55
                else
                    v49[v54] = v55
                end
            end
        end
        return u6.createFragment({
            ["RotationTimer"] = u6.createElement("TextLabel", v45, v49)
        })
    end)
}