local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ElementGrid
local u5 = v2.GridElement
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["TournamentAppEmoteGrid"] = v8.new(u7)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u11
            [3] = u10
            [4] = u12
            [5] = u7
            [6] = u5
            [7] = u6
            [8] = u13
            [9] = u4
            [10] = u14
            [11] = u3
        --]]
        local v17 = p16.useState
        local _ = p16.useEffect
        local v18 = p16.useMemo
        local v19 = u9:getState().Locker.emotes
        local u20, u21 = v17(u11.NONE)
        local _ = u9:getState().Tournament.myTeamId
        local function v26(p22) --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u11
                [3] = u12
            --]]
            local v23 = u10[p22]
            if p22 == u11.NONE then
                return nil
            end
            if not v23 then
                return nil
            end
            if v23.disabled then
                return nil
            end
            if v23.animation then
                return nil
            end
            local v24 = {
                ["name"] = v23.name
            }
            local v25 = v23.image
            v24.imageId = v25 == nil and "" or v25
            v24.itemEnum = p22
            v24.lockerTab = u12.EMOTES
            return v24
        end
        local v27 = 0
        local v28 = {}
        for v29, v30 in v19 do
            local v31 = v26(v30, v29 - 1, v19)
            if v31 ~= nil then
                v27 = v27 + 1
                v28[v27] = v31
            end
        end
        local u32 = v28
        local v33 = u32
        table.sort(v33, function(p34, p35) --[[ Line: 65 ]]
            if string.lower(p34.name) == "none" then
                return true
            elseif string.lower(p35.name) == "none" then
                return false
            else
                return p34.name < p35.name
            end
        end)
        local u36 = {}
        local v55 = v18(function() --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u36
                [3] = u21
                [4] = u10
                [5] = u7
                [6] = u5
                [7] = u6
                [8] = u13
                [9] = u4
            --]]
            local v37 = u32
            local v38 = table.create(#v37)
            for v39, v40 in v37 do
                local _ = v39 - 1
                v38[v39] = {
                    ["id"] = v40.itemEnum,
                    ["imageId"] = v40.imageId,
                    ["alt"] = v40.name
                }
            end
            u36 = v38
            local v41 = u36
            local function v46(u42, p43) --[[ Line: 96 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u7
                    [3] = u5
                    [4] = u6
                    [5] = u13
                    [6] = u21
                --]]
                local v44 = u10[u42.id]
                if v44 then
                    v44 = v44.animation ~= nil
                end
                return u7.createElement(u5, {
                    ["CurrentIndex"] = 0,
                    ["Index"] = p43,
                    ["Image"] = u42.imageId,
                    ["TextElement"] = {
                        ["Text"] = u42.alt
                    },
                    ["OnClick"] = function() --[[ Name: OnClick, Line 107 ]]
                        --[[
                        Upvalues:
                            [1] = u42
                            [2] = u6
                            [3] = u13
                            [4] = u21
                        --]]
                        local v45 = u42.id
                        if v45 ~= "" and v45 then
                            u6:playSound(u13.ARMOR_EQUIP)
                            u21(u42.id)
                        end
                    end
                })
            end
            local v47 = table.create(#v41)
            for v48, v49 in v41 do
                v47[v48] = v46(v49, v48 - 1, v41)
            end
            local v50 = {
                ["ElementSize"] = UDim2.new(0.187, 0, 0, 90),
                ["ScrollingFrameProps"] = {
                    ["ScrollBarThickness"] = 4,
                    ["Size"] = UDim2.new(1, 0, 0.8, 0),
                    ["Position"] = UDim2.fromOffset(0, 0),
                    ["ScrollBarImageColor3"] = Color3.fromRGB(255, 255, 255)
                },
                ["UIPaddingProps"] = {
                    ["PaddingTop"] = UDim.new(0, 8),
                    ["PaddingRight"] = UDim.new(0, 0),
                    ["PaddingLeft"] = UDim.new(0, 32),
                    ["PaddingBottom"] = UDim.new(0, 2)
                },
                ["UIGridLayoutProps"] = {
                    ["CellSize"] = UDim2.new(0.15, 0, 0, 100)
                }
            }
            local v51 = {}
            local v52 = #v51
            for v53, v54 in v47 do
                v51[v52 + v53] = v54
            end
            return u7.createFragment({
                ["EmoteElementGrid"] = u7.createElement(u4, v50, v51)
            })
        end, {})
        local v56 = u7.createFragment
        local v57 = {}
        local v58 = u7.createElement
        local v59 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 4,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v60 = {
            v55,
            ["ConfirmButton"] = u7.createElement("TextButton", {
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.9),
                ["Size"] = UDim2.fromScale(0.3, 0.1),
                ["BackgroundColor3"] = u14.backgroundSuccess,
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0,
                ["TextColor3"] = u3.WHITE,
                ["Font"] = "Roboto",
                ["Text"] = "<b>Set Icon</b>",
                ["TextXAlignment"] = "Center",
                ["TextScaled"] = true,
                ["RichText"] = true,
                [u7.Event.Activated] = function() --[[ Line: 171 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u13
                        [3] = u15
                        [4] = u20
                    --]]
                    u6:playSound(u13.UI_CLICK)
                    u15.onSetIcon(u20)
                    u15.onClose()
                end,
                ["ZIndex"] = 4
            }, { u7.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.15, 0),
                    ["PaddingBottom"] = UDim.new(0.15, 0),
                    ["PaddingLeft"] = UDim.new(0.1, 0),
                    ["PaddingRight"] = UDim.new(0.1, 0)
                }), u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }) })
        }
        v57.Items = v58("Frame", v59, v60)
        return v56(v57)
    end)
}