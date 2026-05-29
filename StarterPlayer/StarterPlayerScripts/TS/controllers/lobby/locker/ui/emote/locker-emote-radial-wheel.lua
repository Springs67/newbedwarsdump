local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "radial-wheel", "radial-wheel").RadialWheel
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerPreviewUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab
local u12 = v1.import(script, script.Parent.Parent, "preview", "locker-preview-buttons").LockerPreviewButtons
return {
    ["LockerEmoteRadialWheel"] = v5.new(u4)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
            [3] = u8
            [4] = u4
            [5] = u6
            [6] = u9
            [7] = u2
            [8] = u7
            [9] = u3
            [10] = u12
        --]]
        local v15 = p14.useState
        local _ = p14.useEffect
        local u16, u17 = v15(0)
        local u18
        if u13.Element then
            u18 = u10.canPreviewLockerElement(u13.Element, u11.EMOTES)
        else
            u18 = false
        end
        local u19 = {}
        local v20 = u13.SelectedEmotes
        local function v25(p21, u22) --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u4
                [3] = u6
                [4] = u17
                [5] = u13
                [6] = u19
            --]]
            local v23 = u8[p21]
            if not v23 then
                return nil
            end
            local v24 = {
                ["element"] = u4.createElement(u6, {
                    ["Emote"] = p21
                }),
                ["title"] = v23.name,
                ["onSelect"] = function() --[[ Name: onSelect, Line 32 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                        [2] = u22
                        [3] = u13
                    --]]
                    u17(u22 - 1)
                    u13.SetSelectedSlot(u22)
                end
            }
            u19[u22] = v24
        end
        for v26, v27 in v20 do
            v25(v27, v26, v20)
        end
        local u28 = 1
        local v29 = false
        while true do
            if v29 then
                u28 = u28 + 1
            else
                v29 = true
            end
            if u28 > 8 then
                local function v36() --[[ Line: 73 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u2
                        [3] = u18
                        [4] = u13
                        [5] = u7
                        [6] = u3
                        [7] = u19
                        [8] = u16
                    --]]
                    local v30 = u4.createElement
                    local v31 = u2
                    local v32 = {}
                    local v33
                    if u18 then
                        v33 = UDim2.fromScale(1, 0.5)
                    else
                        v33 = UDim2.fromScale(1, 1)
                    end
                    v32.Size = v33
                    local v34 = u13.AnchorPoint
                    if not v34 then
                        if u18 then
                            v34 = Vector2.new(1, 0)
                        else
                            v34 = Vector2.new(0.5, 0.5)
                        end
                    end
                    v32.AnchorPoint = v34
                    local v35 = u13.Position
                    if not v35 then
                        if u18 then
                            v35 = UDim2.fromScale(1, 0)
                        else
                            v35 = UDim2.fromScale(0.5, 0.5)
                        end
                    end
                    v32.Position = v35
                    return v30(v31, v32, { u4.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }), u4.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0, 6)
                        }), u4.createElement(u7, {
                            ["numSlices"] = 8,
                            ["angleOffset"] = 270,
                            ["limitHoverDistance"] = true,
                            ["enableClickToSelect"] = true,
                            ["entries"] = u3.values(u19),
                            ["highlightSlice"] = u16,
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["Size"] = UDim2.fromScale(0.9, 0.9)
                        }) })
                end
                local v37 = {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = u13.Size,
                    ["LayoutOrder"] = u13.LayoutOrder
                }
                local v38 = { u4.createElement(v36) }
                local v39 = #v38
                if u18 then
                    u18 = u4.createElement(u12, {
                        ["CanReplay"] = true,
                        ["Tab"] = u11.EMOTES,
                        ["Element"] = u13.Element
                    })
                end
                if u18 then
                    v38[v39 + 1] = u18
                end
                return u4.createFragment({
                    ["LockerShowcase"] = u4.createElement("Frame", v37, v38)
                })
            end
            if u19[u28] == nil then
                u19[u28] = {
                    ["element"] = u4.createElement(u6, {
                        ["Emote"] = u9.NONE
                    }),
                    ["title"] = "Slot " .. tostring(u28),
                    ["onSelect"] = function() --[[ Name: onSelect, Line 63 ]]
                        --[[
                        Upvalues:
                            [1] = u17
                            [2] = u28
                            [3] = u13
                        --]]
                        u17(u28 - 1)
                        u13.SetSelectedSlot(u28)
                    end
                }
            end
        end
    end)
}