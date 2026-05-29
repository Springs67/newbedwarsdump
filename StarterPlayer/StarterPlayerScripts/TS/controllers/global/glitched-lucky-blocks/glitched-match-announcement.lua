local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.SoundManager
local u5 = v2.SpriteSheetPlayer
local u6 = v2.UIUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent, "glitched-text", "glitched-text").GlitchedText
return {
    ["GlitchedMatchAnnouncement"] = v10.new(u9)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u7
            [3] = u4
            [4] = u14
            [5] = u6
            [6] = u15
            [7] = u5
            [8] = u11
            [9] = u8
            [10] = u13
            [11] = u3
            [12] = u12
        --]]
        local _ = p17.useState
        local v18 = p17.useEffect
        local u19 = u9.createRef()
        local u20 = u9.createRef()
        local v21, u22 = u9.createBinding(1)
        v18(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u16
                [3] = u20
                [4] = u4
                [5] = u14
                [6] = u9
                [7] = u6
                [8] = u15
                [9] = u22
                [10] = u19
                [11] = u5
                [12] = u11
                [13] = u8
                [14] = u13
            --]]
            local u23 = u7.new()
            local u24 = u16.tonedDownEffects and 1 or 11
            local u25 = u20:getValue()
            if u25 then
                u4:playSound(u14.ERROR_NOTIFICATION, {
                    ["volumeMultiplier"] = 0.5
                })
                local v26 = u9
                local v27 = {
                    ["Text"] = "Glitched Lucky Block!",
                    ["FrameProps"] = {
                        ["AnchorPoint"] = Vector2.new(0.5, 1),
                        ["Position"] = u6:getActionBarPosition() - UDim2.new(0, 0, 0.1, 0),
                        ["Size"] = UDim2.new(0.8, 0, 0.1, 0)
                    },
                    ["TextLabelProps"] = {
                        ["TextTransparency"] = 0,
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["ZIndex"] = 3,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                        ["Size"] = UDim2.new(1, 0, 1, 0),
                        ["Font"] = Enum.Font.SciFi,
                        ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                    }
                }
                v26.mount(u9.createElement(u15, v27), u25)
                task.wait(0.75)
                task.spawn(function() --[[ Line: 58 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u4
                        [3] = u14
                        [4] = u9
                        [5] = u6
                        [6] = u15
                        [7] = u25
                    --]]
                    local v28 = false
                    local v29 = 0
                    while true do
                        if v28 then
                            v29 = v29 + 1
                        else
                            v28 = true
                        end
                        if v29 >= u24 - 1 then
                            return
                        end
                        local v30 = u24 / 2
                        local v31 = v29 == math.round(v30) - 1
                        u4:playSound(u14.ERROR_NOTIFICATION, {
                            ["volumeMultiplier"] = 0.5
                        })
                        local v32 = u9
                        local v33 = {
                            ["Text"] = v29 == 0 and "Glitched Lucky Block" or "CRITICAL ERROR!",
                            ["FrameProps"] = {
                                ["AnchorPoint"] = Vector2.new(0.5, 1),
                                ["Position"] = u6:getActionBarPosition() - UDim2.new(0, 0, 0.1, 0),
                                ["Size"] = UDim2.new(0.8, 0, v31 and 0.1 or 0.05, 0)
                            },
                            ["TextLabelProps"] = {
                                ["TextScaled"] = true,
                                ["RichText"] = true,
                                ["BackgroundTransparency"] = 1,
                                ["ZIndex"] = 3,
                                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                                ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                                ["Size"] = UDim2.new(1, 0, 1, 0),
                                ["Font"] = Enum.Font.SciFi,
                                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                                ["TextTransparency"] = v31 and 0 or 0.3
                            }
                        }
                        v32.mount(u9.createElement(u15, v33), u25)
                        task.wait(0.05)
                    end
                end)
            end
            u4:playSound(u14.GLITCH_OVERLAY_2, {
                ["volumeMultiplier"] = 0.6
            })
            u22(0.925)
            local u34 = u4:playSound(u14.TV_STATIC, {
                ["looped"] = true,
                ["volumeMultiplier"] = u16.tonedDownEffects and 0.1 or 0.175
            })
            u23:GiveTask(function() --[[ Line: 115 ]]
                --[[
                Upvalues:
                    [1] = u34
                --]]
                local v35 = u34
                if v35 ~= nil then
                    v35:Stop()
                end
                local v36 = u34
                if v36 ~= nil then
                    v36:Destroy()
                end
            end)
            local v37 = u19:getValue()
            local u38
            if v37 then
                local v39 = u5.new
                local v40 = {
                    ["image"] = "rbxassetid://10844183471",
                    ["imageWidth"] = 807,
                    ["imageHeight"] = 1023,
                    ["rows"] = 4,
                    ["columns"] = 3,
                    ["sprites"] = 12,
                    ["imageTransparency"] = u16.tonedDownEffects and 0.75 or 0.6,
                    ["config"] = {
                        ["framesPerSecond"] = 30,
                        ["numLoops"] = u16.tonedDownEffects and 1 or 2
                    }
                }
                u38 = v39(v37, v40)
                u38:play()
                u4:playSound(u14.GLITCH_OVERLAY)
            else
                u38 = nil
            end
            local v41 = u11.CurrentCamera
            if v41 then
                local v42 = u8("DepthOfFieldEffect", {
                    ["Name"] = "GlitchDOF",
                    ["InFocusRadius"] = 15,
                    ["Parent"] = v41
                })
                local v43 = u8("BlurEffect", {
                    ["Name"] = "GlitchBlur",
                    ["Size"] = 24,
                    ["Parent"] = v41
                })
                u23:GiveTask(v42)
                u23:GiveTask(v43)
            end
            task.delay(u13.GLITCH_LB_ANNOUNCEMENT_DURATION - 0.2, function() --[[ Line: 162 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u38
                    [3] = u4
                    [4] = u14
                    [5] = u23
                --]]
                u22(0.75)
                local v44 = u38
                if v44 ~= nil then
                    v44:play()
                end
                u4:playSound(u14.GLITCH_OVERLAY)
                u23:DoCleaning()
            end)
        end, {})
        local v45 = { u9.createElement("ImageLabel", {
                ["Size"] = UDim2.fromScale(1, 1),
                [u9.Ref] = u19,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 10
            }), u9.createElement(u3, {
                ["Size"] = UDim2.fromScale(1, 0.8),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                [u9.Ref] = u20
            }, { u9.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Center",
                    ["Padding"] = UDim.new(0.03, 0)
                }) }) }
        local v46 = #v45
        local v47 = not u16.tonedDownEffects
        if v47 then
            v47 = u9.createElement(u12, {
                ["transparency"] = v21
            })
        end
        if v47 then
            v45[v46 + 1] = v47
        end
        return u9.createFragment(v45)
    end)
}