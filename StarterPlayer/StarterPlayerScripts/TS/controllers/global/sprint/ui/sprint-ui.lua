local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v3.GameCoreClientSyncEvents
local u8 = v3.getLegacyMobileLayoutDimensions
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.TweenService
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v16 = u11.Component:extend("SprintUI")
function v16.init(p17, _) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u5
        [4] = u13
    --]]
    p17.maid = u10.new()
    p17.arrowRef = u11.createRef()
    p17.positionMaid = u10.new()
    local v18 = u5.isHoarceKat()
    local v19
    if u13.LocalPlayer then
        v19 = v18 and true or u13.LocalPlayer:GetAttribute("Sprinting") == true
    else
        v19 = false
    end
    local v20 = v18 and true or u13.LocalPlayer:GetAttribute("SprintHighlighted") == true
    local v21 = p17:getUpdatedStateFromMobileLayout()
    local v22 = {
        ["sprinting"] = v19
    }
    for v23, v24 in v21 do
        v22[v23] = v24
    end
    v22.size = v21.size or u11.None
    v22.sprintHighlight = v20
    p17:setState(v22)
end
function v16.didMount(u25) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
        [3] = u9
        [4] = u11
        [5] = u7
    --]]
    if u5.isHoarceKat() then
        return nil
    end
    if u13.LocalPlayer then
        u25.maid:GiveTask(u13.LocalPlayer:GetAttributeChangedSignal("Sprinting"):Connect(function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u13
            --]]
            u25:setState({
                ["sprinting"] = u13.LocalPlayer:GetAttribute("Sprinting") == true
            })
        end))
        u25.maid:GiveTask(u13.LocalPlayer:GetAttributeChangedSignal("SprintHighlighted"):Connect(function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u13
            --]]
            u25:setState({
                ["sprintHighlight"] = u13.LocalPlayer:GetAttribute("SprintHighlighted") == true
            })
        end))
    end
    u9.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():andThen(function() --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u11
        --]]
        local v26 = u25:getUpdatedStateFromMobileLayout()
        local v27 = u25
        local v28 = {}
        for v29, v30 in v26 do
            v28[v29] = v30
        end
        v28.size = v26.size or u11.None
        v27:setState(v28)
    end)
    local v36 = u7.MobileLayoutRegistered:connect(function() --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u11
        --]]
        local v31 = u25:getUpdatedStateFromMobileLayout()
        local v32 = u25
        local v33 = {}
        for v34, v35 in v31 do
            v33[v34] = v35
        end
        v33.size = v31.size or u11.None
        v32:setState(v33)
    end)
    u25.maid:GiveTask(v36)
    u25.maid:GiveTask(u9.Controllers.SprintController.blockSprintStatusSignal:Connect(function(p37) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25:setState({
            ["isSprintBlocked"] = p37
        })
    end))
end
function v16.willUnmount(p38) --[[ Line: 85 ]]
    p38.maid:DoCleaning()
    p38.positionMaid:DoCleaning()
end
function v16.didUpdate(p39, _, p40) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u14
    --]]
    if p40.sprintHighlight ~= p39.state.sprintHighlight then
        p39.positionMaid:DoCleaning()
        p39.positionMaid = u10.new()
        if p39.state.sprintHighlight then
            local u41 = u14:Create(p39.arrowRef:getValue(), TweenInfo.new(0.5), {
                ["Position"] = UDim2.fromScale(0.5, -0.8)
            })
            local u42 = u14:Create(p39.arrowRef:getValue(), TweenInfo.new(0.5), {
                ["Position"] = UDim2.fromScale(0.5, -0.45)
            })
            u41:Play()
            p39.positionMaid:GiveTask(u41.Completed:Connect(function() --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                u42:Play()
            end))
            p39.positionMaid:GiveTask(u42.Completed:Connect(function() --[[ Line: 107 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                u41:Play()
            end))
        end
    end
end
function v16.render(u43) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u15
        [3] = u14
        [4] = u4
        [5] = u6
    --]]
    local v44 = {
        ["Size"] = u43.state.size,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = u43.state.position
    }
    local v45 = {}
    local v46 = u11.createElement
    local v47 = "ImageLabel"
    local v48 = {
        [u11.Ref] = u43.arrowRef,
        ["Size"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, -0.7),
        ["Image"] = "rbxassetid://16809397532",
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
        ["ZIndex"] = 2,
        ["ImageColor3"] = Color3.fromRGB(255, 255, 255)
    }
    local v49 = u43.state.sprintHighlight
    if v49 then
        v49 = not u43.state.sprinting
    end
    v48.Visible = v49
    v45.HighlightedSlotArrow = v46(v47, v48)
    local v50 = #v45
    local v51 = {}
    local v52
    if u43.state.sprinting then
        v52 = u15.SPRINT_ON_MOBILE
    else
        v52 = u15.SPRINT_OFF_MOBILE
    end
    v51.Image = v52
    v51.Active = not u43.state.isSprintBlocked
    v51.Size = UDim2.fromScale(1, 1)
    v51.AnchorPoint = Vector2.new(0.5, 0.5)
    v51.Position = UDim2.fromScale(0.5, 0.5)
    v51.BackgroundTransparency = 1
    v51.BorderSizePixel = 0
    v51.ImageTransparency = u43.state.isSprintBlocked and 0.7 or 0
    v51[u11.Event.MouseButton1Click] = function() --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        local v53 = u43.props.OnClick
        if v53 ~= nil then
            v53()
        end
    end
    v51[u11.Event.TouchTap] = function(p54) --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14:Create(p54, TweenInfo.new(0.06), {
            ["ImageTransparency"] = 0.5
        }):Play()
        task.wait(0.06)
        u14:Create(p54, TweenInfo.new(0.06), {
            ["ImageTransparency"] = 0
        }):Play()
    end
    local v55 = { u11.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1,
            ["DominantAxis"] = "Height"
        }), u11.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0)
        }) }
    local v56 = #v55
    local v57 = u43.state.sprintHighlight and not u43.state.sprinting
    if v57 then
        v57 = u11.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = u4.WHITE
        })
    end
    if v57 then
        v55[v56 + 1] = v57
    end
    v45[v50 + 1] = u11.createElement("ImageButton", v51, v55)
    return u11.createElement(u6, v44, v45)
end
function v16.getUpdatedStateFromMobileLayout(_) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u2
    --]]
    local v58 = {}
    local v59
    if u5.isHoarceKat() then
        v59 = u8().Sprint.position
    else
        v59 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("Sprint") or UDim2.fromOffset(0, 0)
    end
    v58.position = v59
    local v60
    if u5.isHoarceKat() then
        v60 = u8().Sprint.size
    else
        v60 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("Sprint")
    end
    v58.size = v60
    return v58
end
return {
    ["SprintUI"] = v16
}