local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "device-util").DeviceUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u10 = nil
local function v64(p11, p12) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u5
        [4] = u4
        [5] = u2
        [6] = u7
        [7] = u9
        [8] = u10
    --]]
    local v13 = p12.useState
    local v14 = p12.useEffect
    local v15, u16 = v13(p11.CurrentTasks)
    v14(function() --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u16
        --]]
        if u3.isHoarceKat() then
            return nil
        end
        local u18 = u8.Client:WaitFor("TutorialTasksUpdate"):expect():Connect(function(p17) --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            u16(p17.tutorialData.currentTasks)
        end)
        return function() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18:Disconnect()
        end
    end, {})
    local u19 = u5.createRef()
    local v20, u21 = v13(p11.ScreenSizeY / 2.1550802139037435)
    v14(function() --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u19
            [3] = u21
        --]]
        local u22 = u4.new()
        local u23 = u19:getValue()
        if u23 then
            u22:GiveTask(u23:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u23
                --]]
                u21(u23.AbsoluteSize.Y)
            end))
        end
        return function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22:DoCleaning()
        end
    end, {})
    local u24 = v20 / 28
    local u25 = v20 * 0.1
    local v26 = {}
    local v27 = #v26
    local v28 = {
        [u5.Ref] = u19,
        ["Size"] = UDim2.fromScale(0.3, 0.5),
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.fromScale(0.98, 0.02),
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1
    }
    local v29 = {}
    local v30 = #v29
    local v31 = {
        ["BackgroundTransparency"] = 0.4,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.new(0.9, 0, 0, u25 * #v15 + u25 * 0.5),
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.fromScale(1, 0),
        ["BackgroundColor3"] = u2.BLACK
    }
    local v32 = {}
    local v33 = #v32
    local function v54(p34, p35) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u25
            [3] = u7
            [4] = u9
            [5] = u24
            [6] = u10
            [7] = u2
        --]]
        local v36 = u5.createElement
        local v37 = "Frame"
        local v38 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.95, u25),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0)
        }
        local v39 = {}
        local v40 = u5.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 10,
            ["Size"] = UDim2.new(0.1, 0, 0, u25 * 0.7),
            ["Image"] = u7.CHECK_CIRCLE_SOLID,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.03333333333333333, 0, 0, u25 * 0.5 + u25 * p35),
            ["ImageColor3"] = u9.backgroundSuccess,
            ["ImageTransparency"] = p34.completed and 0 or 1
        }, { u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v41 = u5.createElement
        local v42 = "ImageLabel"
        local v43 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 9,
            ["Size"] = UDim2.new(0.1, 0, 0, u25 * 0.7),
            ["Image"] = u7.CIRCLE_SOLID,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.03333333333333333, 0, 0, u25 * 0.5 + u25 * p35)
        }
        local v44
        if p34.completed then
            v44 = u9.backgroundTertiary
        else
            v44 = u9.backgroundPrimary
        end
        v43.ImageColor3 = v44
        local v45 = v41(v42, v43, { u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v46 = u5.createElement("TextLabel", {
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Text"] = "<b>" .. p34.meta.description .. "</b>",
            ["Size"] = UDim2.new(0.8, 0, 0, u25),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.new(0.1, 0, 0, u25 * 0.52 + u25 * p35),
            ["TextSize"] = u24 * 0.9,
            ["TextScaled"] = u10(p34.meta.description),
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = u2.WHITE
        })
        local v47 = u5.createElement
        local v48 = "TextLabel"
        local v49 = {
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0
        }
        local v50 = p34.currentProgress
        local v51 = tostring(v50)
        local v52 = p34.meta.totalProgress
        v49.Text = "<b>" .. v51 .. "/" .. tostring(v52) .. "</b>"
        v49.Size = UDim2.new(0.1, 0, 0, u25)
        v49.AnchorPoint = Vector2.new(1, 0.5)
        v49.Position = UDim2.new(1, 0, 0, u25 * 0.52 + u25 * p35)
        v49.TextSize = u24
        v49.TextYAlignment = Enum.TextYAlignment.Center
        v49.TextXAlignment = Enum.TextXAlignment.Right
        local v53
        if p34.completed then
            v53 = u9.backgroundSuccess
        else
            v53 = u2.WHITE
        end
        v49.TextColor3 = v53
        __set_list(v39, 1, {v40, v45, v46, v47(v48, v49)})
        return v36(v37, v38, v39)
    end
    local v55 = table.create(#v15)
    local v56 = {
        ["ResetOnSpawn"] = false
    }
    for v57, v58 in v15 do
        v55[v57] = v54(v58, v57 - 1, v15)
    end
    local v59 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.new(0.95, 0, 0, u25 * #v15),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.new(0.5, 0, 0, u25 * 0.5 / 2)
    }
    local v60 = {}
    local v61 = #v60
    for v62, v63 in v55 do
        v60[v61 + v62] = v63
    end
    v32[v33 + 1] = u5.createElement("Frame", v59, v60)
    v32[v33 + 2] = u5.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0, 6)
    })
    v29[v30 + 1] = u5.createElement("Frame", v31, v32)
    v26[v27 + 1] = u5.createElement("Frame", v28, v29)
    return u5.createFragment({
        ["TaskTrackerGUI"] = u5.createElement("ScreenGui", v56, v26)
    })
end
u10 = function(p65) --[[ Name: shouldScaleText, Line 170 ]]
    return #string.gsub(p65, "<[^<>]->", "") > 27
end
return {
    ["TutorialTaskTracker"] = v6.new(u5)(v64)
}