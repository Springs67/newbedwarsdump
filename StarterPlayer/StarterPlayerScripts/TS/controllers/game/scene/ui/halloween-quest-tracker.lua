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
local function v71(p11, p12) --[[ Line: 18 ]]
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
    local u15, u16 = v13(p11.CurrentTasks)
    v14(function() --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u15
            [4] = u16
        --]]
        if u3.isHoarceKat() then
            return nil
        end
        local u20 = u8.Client:GetNamespace("Halloween2024Remotes"):Get("CrystalBroken"):Connect(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u16
            --]]
            local v17 = u15
            for v18, v19 in v17 do
                local _ = v18 - 1
                v19.currentProgress = v19.currentProgress + 1
                if v19.currentProgress >= v19.totalProgress then
                    v19.completed = true
                end
            end
            u16(v17)
        end)
        local u25 = u8.Client:GetNamespace("Halloween2024Remotes"):Get("CrystalTurnedIn"):Connect(function(p21) --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u16
            --]]
            local v22 = u15
            for v23, v24 in v22 do
                local _ = v23 - 1
                v24.currentProgress = v24.currentProgress + p21.amount
                if v24.currentProgress >= v24.totalProgress then
                    v24.completed = true
                end
            end
            u16(v22)
        end)
        return function() --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u25
            --]]
            u20:Disconnect()
            u25:Disconnect()
        end
    end, {})
    local u26 = u5.createRef()
    local v27, u28 = v13(p11.ScreenSizeY / 2.1550802139037435)
    v14(function() --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u26
            [3] = u28
        --]]
        local u29 = u4.new()
        local u30 = u26:getValue()
        if u30 then
            u29:GiveTask(u30:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 65 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u30
                --]]
                u28(u30.AbsoluteSize.Y)
            end))
        end
        return function() --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            u29:DoCleaning()
        end
    end, {})
    local u31 = v27 / 28
    local u32 = v27 * 0.1
    local v33 = {}
    local v34 = #v33
    local v35 = {
        [u5.Ref] = u26,
        ["Size"] = UDim2.fromScale(0.3, 0.5),
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.fromScale(0.98, 0.02),
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1
    }
    local v36 = {}
    local v37 = #v36
    local v38 = {
        ["BackgroundTransparency"] = 0.4,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.new(0.9, 0, 0, u32 * #u15 + u32 * 0.5),
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.fromScale(1, 0),
        ["BackgroundColor3"] = u2.BLACK
    }
    local v39 = {}
    local v40 = #v39
    local function v61(p41, p42) --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u32
            [3] = u7
            [4] = u9
            [5] = u31
            [6] = u10
            [7] = u2
        --]]
        local v43 = u5.createElement
        local v44 = "Frame"
        local v45 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.95, u32),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0)
        }
        local v46 = {}
        local v47 = u5.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 10,
            ["Size"] = UDim2.new(0.1, 0, 0, u32 * 0.7),
            ["Image"] = u7.CHECK_CIRCLE_SOLID,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.03333333333333333, 0, 0, u32 * 0.5 + u32 * p42),
            ["ImageColor3"] = u9.backgroundSuccess,
            ["ImageTransparency"] = p41.completed and 0 or 1
        }, { u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v48 = u5.createElement
        local v49 = "ImageLabel"
        local v50 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 9,
            ["Size"] = UDim2.new(0.1, 0, 0, u32 * 0.7),
            ["Image"] = u7.CIRCLE_SOLID,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.new(0.03333333333333333, 0, 0, u32 * 0.5 + u32 * p42)
        }
        local v51
        if p41.completed then
            v51 = u9.backgroundTertiary
        else
            v51 = u9.backgroundPrimary
        end
        v50.ImageColor3 = v51
        local v52 = v48(v49, v50, { u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v53 = u5.createElement("TextLabel", {
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Text"] = "<b>" .. p41.description .. "</b>",
            ["Size"] = UDim2.new(0.75, 0, 0, u32),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.new(0.1, 0, 0, u32 * 0.52 + u32 * p42),
            ["TextSize"] = u31 * 0.9,
            ["TextScaled"] = u10(p41.description),
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = u2.WHITE
        })
        local v54 = u5.createElement
        local v55 = "TextLabel"
        local v56 = {
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0
        }
        local v57 = p41.currentProgress
        local v58 = tostring(v57)
        local v59 = p41.totalProgress
        v56.Text = "<b>" .. v58 .. "/" .. tostring(v59) .. "</b>"
        v56.Size = UDim2.new(0.1, 0, 0, u32)
        v56.AnchorPoint = Vector2.new(1, 0.5)
        v56.Position = UDim2.new(1, 0, 0, u32 * 0.52 + u32 * p42)
        v56.TextSize = u31
        v56.TextYAlignment = Enum.TextYAlignment.Center
        v56.TextXAlignment = Enum.TextXAlignment.Right
        local v60
        if p41.completed then
            v60 = u9.backgroundSuccess
        else
            v60 = u2.WHITE
        end
        v56.TextColor3 = v60
        __set_list(v46, 1, {v47, v52, v53, v54(v55, v56)})
        return v43(v44, v45, v46)
    end
    local v62 = table.create(#u15)
    local v63 = {
        ["ResetOnSpawn"] = false
    }
    for v64, v65 in u15 do
        v62[v64] = v61(v65, v64 - 1, u15)
    end
    local v66 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.new(0.95, 0, 0, u32 * #u15),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.new(0.5, 0, 0, u32 * 0.5 / 2)
    }
    local v67 = {}
    local v68 = #v67
    for v69, v70 in v62 do
        v67[v68 + v69] = v70
    end
    v39[v40 + 1] = u5.createElement("Frame", v66, v67)
    v39[v40 + 2] = u5.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0, 6)
    })
    v36[v37 + 1] = u5.createElement("Frame", v38, v39)
    v33[v34 + 1] = u5.createElement("Frame", v35, v36)
    return u5.createFragment({
        ["TaskTrackerGUI"] = u5.createElement("ScreenGui", v63, v33)
    })
end
u10 = function(p72) --[[ Name: shouldScaleText, Line 194 ]]
    return #string.gsub(p72, "<[^<>]->", "") > 27
end
return {
    ["HalloweenQuestTracker"] = v6.new(u5)(v71)
}