local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.SpriteSheetPlayer
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "player-viewport").PlayerViewport
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
return {
    ["EmoteShowcase"] = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u12
            [3] = u3
            [4] = u6
            [5] = u4
            [6] = u5
            [7] = u11
            [8] = u9
            [9] = u10
        --]]
        local v15 = p14.useEffect
        local u16, _ = p14.useState(u7.createRef())
        local u17 = u12[u13.Emote]
        if not u17 then
            return u7.createFragment()
        end
        v15(function() --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u17
                [3] = u13
                [4] = u6
                [5] = u16
                [6] = u4
                [7] = u5
            --]]
            if u3.isHoarceKat() or not u17 then
                return nil
            end
            if u13.PlaySound then
                local _ = u17.soundsOnBegin
            end
            local u18 = u6.new()
            local v19 = u17.spritesheet and u16:getValue()
            if v19 then
                local u20 = u4.new(v19, u17.spritesheet)
                u20:play()
                u18:GiveTask(function() --[[ Line: 34 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                    --]]
                    u20:stop()
                    u20:disconnect()
                end)
            end
            return function() --[[ Line: 40 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u18
                --]]
                u5.Controllers.EmoteController:stopEmoteShowcase()
                u18:DoCleaning()
            end
        end, { u13.Emote })
        local v21 = u17.image
        if v21 == "" or not v21 then
            v21 = u17.animatedImage or u17.spritesheet
        end
        local v22
        if v21 == "" or not v21 then
            if u17.animation then
                local v23 = {
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Animation"] = u11:getAssetId(u17.animation.type),
                    ["Size"] = u13.Size,
                    ["LayoutOrder"] = u13.LayoutOrder,
                    ["PreviewItemTypes"] = u17.animation.previewItems
                }
                local v24 = u17.animation.previewReplicatedStorageAssets
                local v25
                if v24 == nil then
                    v25 = v24
                else
                    local function v33(p26) --[[ Line: 84 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                        --]]
                        local v27 = string.split(p26, "/")
                        local v28 = u9.Assets
                        local v29 = v28
                        for v30, v31 in v27 do
                            local _ = v30 - 1
                            if v29 ~= nil then
                                local v32 = v29:FindFirstChild(v31)
                            end
                            if v32 then
                                v28 = v32
                                v29 = v28
                            end
                        end
                        return v29
                    end
                    local v34 = 0
                    v25 = {}
                    for v35, v36 in v24 do
                        local v37 = v33(v36, v35 - 1, v24)
                        if v37 ~= nil then
                            v34 = v34 + 1
                            v25[v34] = v37
                        end
                    end
                end
                v23.PreviewAccessories = v25
                v23.ZIndex = u13.ZIndex
                local v38 = u13.Transparency
                v23.ImageTransparency = v38 == nil and 0 or v38
                v22 = u7.createFragment({
                    ["RewardShowcase"] = u7.createElement(u10, v23)
                })
            else
                v22 = u7.createFragment()
            end
        else
            local v39 = u7.createFragment
            local v40 = {
                ["RewardShowcase"] = u7.createElement("ImageLabel", {
                    ["Image"] = u17.image,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = u13.Size or UDim2.fromScale(1, 1),
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = u13.Transparency,
                    ["LayoutOrder"] = u13.LayoutOrder,
                    ["ZIndex"] = u13.ZIndex,
                    [u7.Ref] = u16
                }, { u7.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center
                    }) })
            }
            v22 = v39(v40)
        end
        local v41 = {
            [#v41 + 1] = v22
        }
        return u7.createFragment(v41)
    end)
}