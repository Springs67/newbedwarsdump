local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "device-util").DeviceUtil
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ContextActionService
local u10 = v8.UserInputService
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14
if u4.isGamepadControls() then
    u14 = Enum.KeyCode.ButtonX
else
    u14 = Enum.KeyCode.V
end
return {
    ["TutorialDialogue"] = v7.new(u6)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u4
            [3] = u9
            [4] = u10
            [5] = u1
            [6] = u2
            [7] = u12
            [8] = u5
            [9] = u13
            [10] = u3
            [11] = u11
            [12] = u14
        --]]
        local v17 = p16.useState
        local v18 = p16.useEffect
        local u19 = u6.createRef()
        local u20 = u6.createRef()
        local u21, u22 = v17(u4.isHoarceKat() and 1 or 0)
        local v23 = u4.isSmallScreen() and 0.9 or 0.6
        local u24 = false
        local u25 = nil
        local u26 = nil
        v18(function() --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u19
                [3] = u15
                [4] = u21
                [5] = u9
                [6] = u26
                [7] = u10
            --]]
            u25(u19, u15.Dialogue[u21 + 1], 0.01, u15.TalkSound)
            u9:BindAction("advance_dialogue", function(_, p27, _) --[[ Line: 27 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                if p27 == Enum.UserInputState.Begin then
                    u26()
                end
            end, false, Enum.KeyCode.V)
            local u29 = u10.InputBegan:Connect(function(p28) --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                if p28.KeyCode == Enum.KeyCode.ButtonX then
                    u26()
                end
            end)
            return function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u29
                --]]
                u9:UnbindAction("advance_dialogue")
                u29:Disconnect()
            end
        end)
        u25 = u1.async(function(p30, p31, p32, p33) --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u4
                [3] = u2
            --]]
            u24 = true
            local v34 = p30:getValue()
            if not v34 then
                return nil
            end
            if #p31 <= 0 then
                return nil
            end
            v34.MaxVisibleGraphemes = 0
            v34.Text = p31
            local v35 = string.gsub(p31, "<[^<>]->", "")
            for _, _ in utf8.graphemes(v35) do
                if not u24 then
                    v34.MaxVisibleGraphemes = #v35
                    return nil
                end
                v34.MaxVisibleGraphemes = v34.MaxVisibleGraphemes + 1
                local v36 = nil
                local v37
                if v34.MaxVisibleGraphemes % 2 == 0 then
                    v37 = p33
                else
                    v37 = false
                end
                if v37 ~= "" and (v37 and not u4.isHoarceKat()) then
                    v36 = u2:playSound(p33, {
                        ["volumeMultiplier"] = 3,
                        ["playbackSpeedMultiplier"] = 0.85 + math.random() * 0.2
                    })
                end
                task.wait(p32)
                if v36 ~= nil then
                    v36:Destroy()
                end
            end
            u24 = false
        end)
        u26 = function() --[[ Name: advanceDialogue, Line 80 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u21
                [3] = u15
                [4] = u22
                [5] = u25
                [6] = u19
                [7] = u4
                [8] = u20
                [9] = u12
                [10] = u5
            --]]
            if u24 then
                u24 = false
                return
            elseif u21 < #u15.Dialogue - 1 then
                u22(u21 + 1)
                u25(u19, u15.Dialogue[u21 + 1], 0.01, u15.TalkSound)
            else
                if u4.isHoarceKat() then
                    return nil
                end
                local v38 = u20:getValue()
                if v38 then
                    v38.Visible = false
                end
                u12.Client:Get("TutorialDialogueClose"):SendToServer({
                    ["tutorialType"] = u15.TutorialType
                })
                u5.Controllers.TutorialController:closeDialogue()
            end
        end
        local v39 = u6.createFragment
        local v40 = {}
        local v41 = u6.createElement
        local v42 = "ScreenGui"
        local v43 = {
            ["ResetOnSpawn"] = false,
            ["DisplayOrder"] = 999
        }
        local v44 = {}
        local v45 = u6.createElement
        local v46 = "Frame"
        local v47 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.5, 0.25),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.9)
        }
        local v48 = {}
        local v49 = u6.createElement
        local v50 = "Frame"
        local v51 = {
            [u6.Ref] = u20,
            ["Size"] = UDim2.fromScale(1, 0.8),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["BorderSizePixel"] = 1,
            ["BackgroundColor3"] = u13.backgroundSecondary,
            ["BackgroundTransparency"] = 0
        }
        local v52 = {}
        local v53 = u6.createElement
        local v54 = "TextLabel"
        local v55 = {
            [u6.Ref] = u19,
            ["Size"] = UDim2.fromScale(0.9, 0.9),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Text"] = "",
            ["TextColor3"] = u3.WHITE,
            ["Font"] = Enum.Font.Roboto
        }
        local v56
        if u4.isSmallScreen() then
            v56 = Enum.FontSize.Size14
        else
            v56 = Enum.FontSize.Size24
        end
        v55.FontSize = v56
        v55.RichText = true
        v55.TextWrapped = true
        v55.BackgroundTransparency = 1
        v55.BorderSizePixel = 0
        v52.DialogueText = v53(v54, v55)
        __set_list(v52, 1, {u6.createElement("UIStroke", {
    ["Thickness"] = u4.isSmallScreen() and 3 or 5,
    ["Color"] = u13.backgroundPrimary
}), (u6.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(0.1, 0)
}))})
        local v57 = u6.createElement
        local v58 = "Frame"
        local v59 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(v23 * 0.24, v23 * 0.3),
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Position"] = UDim2.fromScale(1.02, 1.1)
        }
        local v60 = {}
        local v61 = u6.createElement
        local v62 = "ImageButton"
        local v63 = {
            ["Size"] = UDim2.fromScale(0.58, 1),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["BackgroundColor3"] = u13.backgroundPrimary,
            [u6.Event.Activated] = function() --[[ Line: 166 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26()
            end
        }
        local v64 = {}
        local v65 = u6.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 4)
        })
        local v66 = u6.createElement
        local v67 = "ImageLabel"
        local v68 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.5)
        }
        local v69
        if #u15.Dialogue - 1 <= u21 then
            v69 = u11.CHECK_SOLID
        else
            v69 = u11.TRIANGLE_ARROW_RIGHT
        end
        v68.Image = v69
        v68.SizeConstraint = Enum.SizeConstraint.RelativeYY
        v68.AnchorPoint = Vector2.new(0.5, 0.5)
        v68.Position = UDim2.fromScale(0.5, 0.5)
        v68.ScaleType = Enum.ScaleType.Fit
        __set_list(v64, 1, {v65, (v66(v67, v68))})
        local v70 = u6.createElement
        local v71 = "TextLabel"
        local v72 = {
            ["AutomaticSize"] = "X",
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(1, 1),
            ["Text"] = "(" .. (u14 == Enum.KeyCode.ButtonX and "X" or "V") .. ")",
            ["TextColor3"] = u3.WHITE,
            ["Font"] = Enum.Font.Roboto
        }
        local v73
        if u4.isSmallScreen() then
            v73 = Enum.FontSize.Size12
        else
            v73 = Enum.FontSize.Size14
        end
        v72.FontSize = v73
        v64.NextDialogueHotkey = v70(v71, v72)
        __set_list(v64, 3, {u6.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(0.2, 0)
})})
        v60.AdvanceDialogueButton = v61(v62, v63, v64)
        v60.PreviousDialogueButton = u6.createElement("ImageButton", {
            ["Size"] = UDim2.fromScale(0.4, 1),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["BackgroundColor3"] = u13.backgroundPrimary,
            ["Visible"] = u21 > 0,
            [u6.Event.Activated] = function() --[[ Line: 209 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u21
                    [3] = u22
                    [4] = u25
                    [5] = u19
                    [6] = u15
                --]]
                if u24 then
                    u24 = false
                elseif u21 > 0 then
                    u22(u21 - 1)
                    u25(u19, u15.Dialogue[u21 + 1], 0.01, u15.TalkSound)
                end
            end
        }, { u6.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                ["Image"] = u11.TRIANGLE_ARROW_LEFT,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["ScaleType"] = Enum.ScaleType.Fit
            }), u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.2, 0)
            }) })
        v52.DialogueButtons = v57(v58, v59, v60)
        v48.DialogueBox = v49(v50, v51, v52)
        v44.TutorialDialogueWrapper = v45(v46, v47, v48)
        v40.TutorialDialogue = v41(v42, v43, v44)
        return v39(v40)
    end)
}