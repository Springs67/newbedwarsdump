local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta")
local u7 = v6.LobbyTitleDefaults
local u8 = v6.TitleMeta
return {
    ["LobbyTitle"] = v3.new(u2)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
            [3] = u4
            [4] = u7
            [5] = u5
        --]]
        local v11 = p10.useState
        local v12 = p10.useEffect
        local u13, _ = v11(u2.createRef())
        local u14 = u8[p9.TitleType]
        v12(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u14
                [3] = u4
                [4] = u7
            --]]
            local u15 = true
            local u16 = u13:getValue()
            if not u16 then
                return nil
            end
            local u17 = u14.effects
            if u17 ~= nil then
                u17 = u17.rgb
            end
            local u18 = nil
            if u17 then
                local u19 = 1
                task.spawn(function() --[[ Line: 29 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u16
                        [3] = u18
                        [4] = u4
                        [5] = u17
                        [6] = u19
                    --]]
                    while u15 and u16.Parent ~= nil do
                        u18 = u4:Create(u16, TweenInfo.new(1), {
                            ["TextColor3"] = u17[u19 + 1]
                        })
                        u18:Play()
                        u18.Completed:Wait()
                        u19 = u19 + 1
                        if u19 >= #u17 then
                            u19 = 0
                        end
                    end
                end)
            else
                u16.TextColor3 = u14.color or u7.color
            end
            return function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u18
                --]]
                u15 = false
                local v20 = u18
                if v20 ~= nil then
                    v20:Cancel()
                end
            end
        end, { p9.TitleType })
        if not u14 then
            return u2.createFragment()
        end
        local v21 = u14.text
        local v22 = p9.suffix
        if v22 ~= "" and v22 then
            v21 = v21 .. p9.suffix
        end
        local v23 = u5.includes(v21, "<font") or u5.includes(v21, "<b>") or (u5.includes(v21, "<i>") or u5.includes(v21, "<u>") or (u5.includes(v21, "<s>") or u5.includes(v21, "<stroke")))
        local v24 = {
            ["Text"] = v21,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u14.backgroundColor or u7.backgroundColor
        }
        local v25 = u14.backgroundTransparency
        if v25 == nil then
            v25 = u7.backgroundTransparency
        end
        v24.BackgroundTransparency = v25
        v24.TextColor3 = u14.color or u7.color
        v24.TextScaled = true
        v24.FontFace = Font.new(Font.fromEnum(u14.font or u7.font).Family, u14.fontWeight or Enum.FontWeight.Regular)
        local v26 = u14.stroke
        if v26 ~= nil then
            v26 = v26.color
        end
        v24.TextStrokeColor3 = v26
        local v27 = u14.stroke
        if v27 ~= nil then
            v27 = v27.transparency
        end
        v24.TextStrokeTransparency = v27 == nil and 1 or v27
        v24.RichText = v23
        v24.BorderSizePixel = 0
        v24.AutoLocalize = true
        v24[u2.Ref] = u13
        local v28 = p9.TextLabelProps
        if v28 then
            for v29, v30 in v28 do
                v24[v29] = v30
            end
        end
        local v31 = {}
        local v32 = #v31
        local v33 = u14.stroke
        if v33 then
            v33 = u2.createElement("UIStroke", {
                ["Color"] = u14.stroke.color,
                ["Thickness"] = u14.stroke.thickness,
                ["Transparency"] = u14.stroke.transparency
            })
        end
        if v33 then
            v31[v32 + 1] = v33
        end
        return u2.createFragment({
            ["LobbyTitle"] = u2.createElement("TextLabel", v24, v31)
        })
    end)
}