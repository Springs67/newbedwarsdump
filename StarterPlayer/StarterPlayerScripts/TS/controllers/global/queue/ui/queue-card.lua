local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.CircularSpinner
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.SoundManager
local u8 = v3.StringUtil
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.TweenService
local u14 = v12.Workspace
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v19 = u11.Component:extend("QueueCard")
function v19.init(p20, _) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
    --]]
    p20.wrapperRef = u11.createRef()
    p20.alive = true
    p20.leaveButtonHoverMaid = u10.new()
    p20.matchFoundTime = -1
    p20.timeStarted = tick()
    p20.lastLeaveClick = 0
    p20:setState({
        ["timer"] = p20:getTimer(),
        ["queueType"] = u11.None
    })
end
function v19.getTimer(p21) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
    --]]
    local v22
    if p21.props.QueueState == u9.MATCH_FOUND then
        v22 = p21.matchFoundTime - p21.timeStarted
    else
        local v23 = tick() - p21.timeStarted
        v22 = math.max(v23, 0)
    end
    return u8.formatCountdownTime(v22)
end
function v19.setLastQueueType(p24) --[[ Line: 44 ]]
    if p24.props.QueueData then
        p24:setState({
            ["queueType"] = p24.props.QueueData.queueType
        })
    end
end
function v19.didMount(u25) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
        [3] = u1
        [4] = u7
        [5] = u17
    --]]
    u25.timeStarted = tick()
    u25:setLastQueueType()
    u13:Create(u25.wrapperRef:getValue(), TweenInfo.new(0.12), {
        ["Size"] = UDim2.new(0.4, 0, u6.isSmallScreen() and 0.09 or 0.065, 0)
    }):Play()
    u1.Promise.defer(function() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        while true do
            local v26 = task.wait(0.5)
            if v26 ~= 0 and (v26 == v26 and v26) then
                v26 = u25.alive
            end
            if v26 == 0 or (v26 ~= v26 or not v26) then
                return
            end
            u25:setState({
                ["timer"] = u25:getTimer()
            })
            u25:setLastQueueType()
        end
    end)
    u7:playSound(u17.QUEUE_JOIN)
end
function v19.willUpdate(p27, p28) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
        [3] = u18
        [4] = u6
        [5] = u15
        [6] = u7
        [7] = u17
        [8] = u5
    --]]
    if p28.QueueState == u9.MATCH_FOUND and p27.props.QueueState ~= u9.MATCH_FOUND then
        p27.matchFoundTime = tick()
        u13:Create(p27.wrapperRef:getValue(), TweenInfo.new(0.2), {
            ["BackgroundColor3"] = u18.backgroundSuccess,
            ["Size"] = UDim2.fromScale(0.4, u6.isSmallScreen() and 0.12 or 0.08)
        }):Play()
        if p27.props.QueueData and p27.props.QueueData.queueType == u15.HALLOWEEN_EVENT then
            u7:playSound(u17.USE_HALLOWEEN_KEY)
            return
        end
    elseif p27.props.QueueState == u9.MATCH_FOUND and p28.QueueState ~= u9.MATCH_FOUND then
        u13:Create(p27.wrapperRef:getValue(), TweenInfo.new(0.2), {
            ["BackgroundColor3"] = u5.hexColor(6580135),
            ["Size"] = UDim2.fromScale(0.4, u6.isSmallScreen() and 0.09 or 0.065)
        }):Play()
    end
end
function v19.willUnmount(p29) --[[ Line: 93 ]]
    p29.leaveButtonHoverMaid:DoCleaning()
    p29.alive = false
end
function v19.render(u30) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u9
        [3] = u11
        [4] = u5
        [5] = u2
        [6] = u4
        [7] = u7
        [8] = u17
        [9] = u14
        [10] = u13
    --]]
    local v31 = u16.QUEUE_SATELLITE
    local v32 = u30.props.QueueState == u9.MATCH_FOUND and "Teleporting to match" or "Searching for match"
    local v33 = {
        [u11.Ref] = u30.wrapperRef,
        ["Size"] = UDim2.fromScale(0.4, 0),
        ["Position"] = UDim2.fromScale(0.5, 0.01),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["BackgroundColor3"] = u5.hexColor(6580135),
        ["BorderSizePixel"] = 0
    }
    local v34 = {
        u11.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        }),
        u11.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 7.372093023255814,
            ["DominantAxis"] = "Height"
        }),
        u11.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center"
        }),
        u11.createElement("Frame", {
            ["SizeConstraint"] = "RelativeYY",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.3, 0)
        }),
        u11.createElement("ImageLabel", {
            ["SizeConstraint"] = "RelativeYY",
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.7, 0.7),
            ["Image"] = v31
        })
    }
    local v35 = #v34
    local v36 = {
        ["SizeConstraint"] = "RelativeYY",
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(4.172093023255814, 0.8)
    }
    local v37 = { u11.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.06, 0),
            ["PaddingTop"] = UDim.new(0.08, 0),
            ["PaddingBottom"] = UDim.new(0.08, 0)
        }), u11.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Center"
        }), u11.createElement("TextLabel", {
            ["Font"] = "Roboto",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextXAlignment"] = "Left",
            ["Text"] = v32,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Size"] = UDim2.fromScale(1, 0.6)
        }) }
    local v38 = #v37
    local v39
    if u30.state.queueType == nil then
        v39 = false
    else
        v39 = u11.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextXAlignment"] = "Left",
            ["Text"] = u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(u30.state.queueType).title,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
            ["Size"] = UDim2.fromScale(1, 0.4)
        })
    end
    if v39 then
        v37[v38 + 1] = v39
    end
    v34[v35 + 1] = u11.createElement("Frame", v36, v37)
    v34[v35 + 2] = u11.createElement("Frame", {
        ["SizeConstraint"] = "RelativeYY",
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1.4, 0.8)
    }, { u11.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Center"
        }), u11.createElement("UIPadding", {
            ["PaddingRight"] = UDim.new(0.1, 0)
        }), u11.createElement("TextLabel", {
            ["Font"] = "Roboto",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextXAlignment"] = "Left",
            ["Text"] = u30.state.timer,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Size"] = UDim2.fromScale(1, 0.6)
        }, { u11.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0.2, 0)
            }) }) })
    local v40
    if u30.props.QueueState == u9.LEAVING_QUEUE or u30.props.QueueState == u9.NONE then
        v40 = u11.createElement(u4, {
            ["SizeConstraint"] = "RelativeYY",
            ["Size"] = UDim2.fromScale(0.5, 0.5)
        })
    else
        v40 = false
    end
    if v40 then
        v34[v35 + 3] = v40
    end
    local v41 = #v34
    local v42
    if u30.props.QueueState == u9.JOINING_QUEUE or u30.props.QueueState == u9.IN_QUEUE then
        v42 = u11.createElement("ImageButton", {
            ["Size"] = UDim2.fromScale(0.5, 0.5),
            ["SizeConstraint"] = "RelativeYY",
            ["Image"] = u16.QUEUE_CLOSE,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            [u11.Event.MouseButton1Click] = function() --[[ Line: 227 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u17
                    [3] = u14
                    [4] = u30
                --]]
                u7:playSound(u17.UI_CLICK)
                if u14:GetServerTimeNow() - u30.lastLeaveClick > 10 then
                    u30.props.OnLeaveQueue()
                    u30.lastLeaveClick = u14:GetServerTimeNow()
                end
            end,
            [u11.Event.MouseEnter] = function(p43) --[[ Line: 234 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u13
                --]]
                u30.leaveButtonHoverMaid:DoCleaning()
                local u44 = u13:Create(p43, TweenInfo.new(0.12), {
                    ["ImageTransparency"] = 0.4
                })
                u44:Play()
                u30.leaveButtonHoverMaid:GiveTask(function() --[[ Line: 240 ]]
                    --[[
                    Upvalues:
                        [1] = u44
                    --]]
                    u44:Cancel()
                end)
            end,
            [u11.Event.MouseLeave] = function(p45) --[[ Line: 244 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u13
                --]]
                u30.leaveButtonHoverMaid:DoCleaning()
                local u46 = u13:Create(p45, TweenInfo.new(0.12), {
                    ["ImageTransparency"] = 0
                })
                u46:Play()
                u30.leaveButtonHoverMaid:GiveTask(function() --[[ Line: 250 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u46
                    --]]
                    u30.leaveButtonHoverMaid:GiveTask(function() --[[ Line: 251 ]]
                        --[[
                        Upvalues:
                            [1] = u46
                        --]]
                        u46:Cancel()
                    end)
                end)
            end
        })
    else
        v42 = false
    end
    if v42 then
        v34[v41 + 1] = v42
    end
    v34[#v34 + 1] = u11.createElement("Frame", {
        ["SizeConstraint"] = "RelativeYY",
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.3, 0)
    })
    return u11.createElement("Frame", v33, v34)
end
return {
    ["QueueCard"] = v19
}