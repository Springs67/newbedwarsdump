local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.SpriteSheetPlayer
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitServer
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteDisplayType
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-utils").EmoteUtils
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u14 = {
    [u10.IMAGE_DEFAULT] = function(p13) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9:Create(p13, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            ["ImageTransparency"] = 0,
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1)
        }):Play()
        return u9:Create(p13, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
            ["ImageTransparency"] = 1,
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["Size"] = UDim2.fromScale(0, 0)
        })
    end
}
return {
    ["EmoteImage"] = v8.new(u7)(function(u15, p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u7
            [3] = u6
            [4] = u14
            [5] = u10
            [6] = u4
            [7] = u1
            [8] = u11
            [9] = u5
            [10] = u3
        --]]
        local v17 = p16.useEffect
        local u18 = u12[u15.Emote]
        local u19 = u7.createRef()
        v17(function() --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u6
                [3] = u18
                [4] = u14
                [5] = u10
                [6] = u4
                [7] = u1
                [8] = u11
                [9] = u15
                [10] = u5
            --]]
            local u20 = u19:getValue()
            if not u20 then
                return nil
            end
            local u21 = u6.new()
            local u22
            if u18.emoteDisplayType == nil then
                u22 = u14[u10.IMAGE_DEFAULT](u20)
            else
                u22 = u14[u18.emoteDisplayType](u20)
            end
            if u18.animatedImage then
                local u23 = true
                local u24 = 0
                u21:GiveTask(function() --[[ Line: 51 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    u23 = false
                    return u23
                end)
                task.spawn(function() --[[ Line: 55 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                        [2] = u20
                        [3] = u18
                        [4] = u24
                    --]]
                    while true do
                        local v25 = u23
                        if v25 then
                            v25 = task.wait(0.2)
                        end
                        if v25 == 0 or (v25 ~= v25 or not v25) then
                            return
                        end
                        u20.Image = u18.animatedImage[u24 + 1]
                        u24 = (u24 + 1) % #u18.animatedImage
                    end
                end)
            elseif u18.spritesheet then
                local u26 = u4.new(u20, u18.spritesheet)
                u26:play()
                u21:GiveTask(function() --[[ Line: 68 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    u26:stop()
                    u26:disconnect()
                end)
            end
            u1.Promise.delay(u11.emoteDuration - u22.TweenInfo.Time):andThen(function() --[[ Line: 74 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u5
                    [3] = u21
                    [4] = u22
                --]]
                if u15.Player then
                    u5.Services.EmoteService:playEndEmoteSounds(u15.Emote, u15.Player)
                    u21:GiveTask(u22.Completed:Connect(function() --[[ Line: 77 ]]
                        --[[
                        Upvalues:
                            [1] = u15
                            [2] = u5
                        --]]
                        if u15.Player then
                            u5.Services.EmoteService:cleanUpEmote(u15.Player)
                        end
                    end))
                    u22:Play()
                end
            end)
            return function() --[[ Line: 86 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u15
                    [3] = u5
                --]]
                u21:DoCleaning()
                if u15.Player then
                    u5.Services.EmoteService:cleanUpEmote(u15.Player)
                end
            end
        end, {})
        local v27 = u7.createFragment
        local v28 = {}
        local v29 = u7.createElement
        local v30 = "BillboardGui"
        local v31 = {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 2.6, 0),
            ["MaxDistance"] = 100,
            ["ResetOnSpawn"] = true,
            ["AutoLocalize"] = false
        }
        local v32
        if u3.isHoarceKat() then
            v32 = UDim2.fromScale(60, 10)
        else
            v32 = UDim2.fromScale(6, 2.5)
        end
        v31.Size = v32
        v28.EmoteImage = v29(v30, v31, { u7.createElement("ImageLabel", {
                [u7.Ref] = u19,
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["Size"] = UDim2.fromScale(0, 0),
                ["Image"] = u18.image,
                ["BackgroundTransparency"] = 1,
                ["ImageTransparency"] = 1,
                ["ScaleType"] = "Fit"
            }) })
        return v27(v28)
    end)
}