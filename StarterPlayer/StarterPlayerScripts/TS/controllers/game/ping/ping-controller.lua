local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out")
local v3 = v2.Reflect
local u4 = v2.Flamework
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u6 = v5.ConstraintType
local u7 = v5.DeviceUtil
local u8 = v5.GameQueryUtil
local u9 = v5.IndicatorTransparencyFunctions
local u10 = v5.IndicatorUIType
local u11 = v5.SoundManager
local u12 = v5.StringUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u18 = v17.ContextActionService
local u19 = v17.Players
local u20 = v17.TweenService
local u21 = v17.Workspace
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ping", "ping-type")
local u25 = v24.PING_SLOTS
local u26 = v24.PingType
local u27 = v24.Pings
local u28 = v24.getPingFromSlot
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-constants").PingConstants
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u33 = v1.import(script, script.Parent, "ui", "ping-gui-object").PingGuiObject
local u34 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "PingController"
    end
})
u34.__index = u34
function u34.new(...) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    local v35 = u34
    local v36 = setmetatable({}, v35)
    return v36:constructor(...) or v36
end
function u34.constructor(p37) --[[ Line: 47 ]]
    p37.lastPing = 0
    p37.touchPingEnabled = false
end
function u34.onStart(u38) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u13
        [3] = u14
        [4] = u27
        [5] = u29
        [6] = u22
        [7] = u23
        [8] = u4
        [9] = u25
        [10] = u28
        [11] = u16
        [12] = u7
        [13] = u26
    --]]
    if u32.isLobbyServer() then
        return nil
    end
    local v39 = u13.Controllers.PreloadController
    local v40 = 0
    local v41 = {}
    local v42 = {}
    for v43, v44 in u14.values(u27) do
        local _ = v43 - 1
        local v45 = v44.sound
        if v45 ~= nil then
            v40 = v40 + 1
            v41[v40] = v45
        end
    end
    v42.sounds = v41
    local v46 = u14.values(u27)
    local v47 = table.create(#v46)
    for v48, v49 in v46 do
        local _ = v48 - 1
        v47[v48] = v49.image
    end
    v42.imageIds = v47
    v39:runPreload(v42)
    u29.Client:Get("LocationPinged"):Connect(function(p50) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u23
            [3] = u38
        --]]
        local v51 = p50.location
        local v52 = p50.pingType
        local v53 = p50.creator
        if u22:getState().Game.matchState == u23.PRE then
            return nil
        end
        u38:createIndicator(v51, v52, v53)
    end)
    local v75 = {
        ["actionId"] = "ping-location",
        ["action"] = "Ping",
        ["boundFunction"] = function(_, p54, p55) --[[ Name: boundFunction, Line 99 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u25
                [3] = u28
                [4] = u16
                [5] = u13
                [6] = u7
                [7] = u14
                [8] = u26
            --]]
            if p54 == Enum.UserInputState.Begin then
                u38:setSelectedSlot(nil)
                u38.pingPosition = u38:getMousePosition()
                local u56 = 1
                local v57 = false
                local v58 = {}
                while true do
                    if true then
                        if v57 then
                            u56 = u56 + 1
                        else
                            v57 = true
                        end
                    end
                    if u56 > u25 then
                        break
                    end
                    local v59 = u28(u56)
                    v58[u56] = {
                        ["element"] = u16.createElement("ImageLabel", {
                            ["BackgroundTransparency"] = 1,
                            ["Image"] = v59.data.image,
                            ["ImageColor3"] = v59.data.color,
                            ["Size"] = UDim2.fromScale(0.9, 0.9)
                        }),
                        ["title"] = v59.data.title,
                        ["onSelect"] = function() --[[ Name: onSelect, Line 127 ]]
                            --[[
                            Upvalues:
                                [1] = u38
                                [2] = u56
                                [3] = u13
                            --]]
                            u38:setSelectedSlot(u56)
                            u13.Controllers.RadialWheelController:closeRadialWheel()
                        end
                    }
                end
                local v60 = u7.isGamepadControls()
                local v61 = u13.Controllers.RadialWheelController
                local v62 = u14.values(v58)
                local v63
                if v60 then
                    v63 = UDim2.fromScale(0.5, 0.5)
                else
                    local v64 = UDim2
                    local v65
                    if p55 == nil then
                        v65 = p55
                    else
                        v65 = p55.Position.X
                    end
                    local v66
                    if p55 == nil then
                        v66 = p55
                    else
                        v66 = p55.Position.Y
                    end
                    v63 = v64.fromOffset(v65, v66)
                end
                local v67 = v62
                local v68 = u25
                local v69 = true
                local v70
                if v60 then
                    v70 = UDim2.fromScale(0.6, 0.6)
                else
                    v70 = nil
                end
                v61:openRadialWheel(v67, v68, p55, v69, v63, v70, function() --[[ Line: 155 ]]
                    --[[
                    Upvalues:
                        [1] = u38
                        [2] = u28
                        [3] = u26
                    --]]
                    if u38.pingPosition then
                        local v71 = u38
                        local v72 = u38.pingPosition
                        local v73 = u38.selectedSlot
                        local v74
                        if v73 == 0 or (v73 ~= v73 or not v73) then
                            v74 = u26.GENERIC
                        else
                            v74 = u28(u38.selectedSlot).pingType
                        end
                        v71:ping(v72, v74)
                    end
                end)
            end
        end
    }
    u4.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v75)
end
function u34.ping(p76, p77, p78) --[[ Line: 167 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u30
        [3] = u19
        [4] = u29
    --]]
    if u21:GetServerTimeNow() - p76.lastPing < u30.PING_COOLDOWN then
        return nil
    end
    p76.lastPing = u21:GetServerTimeNow()
    local v79 = p77 + Vector3.new(0, 2, 0)
    p76:createIndicator(v79, p78, u19.LocalPlayer)
    u29.Client:Get("Ping"):SendToServer({
        ["location"] = v79,
        ["pingType"] = p78
    })
end
function u34.notificationPing(p80, p81, p82) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    p80:createIndicator(p81 + Vector3.new(0, 2, 0), p82, u19.LocalPlayer, {
        ["hidePlayerIcon"] = true
    })
end
function u34.enableTouchPing(u83) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u28
        [3] = u26
    --]]
    u83.touchPingEnabled = true
    u18:BindAction("touch-ping", function(_, _, _) --[[ Line: 192 ]]
        --[[
        Upvalues:
            [1] = u83
            [2] = u28
            [3] = u26
        --]]
        u83.pingPosition = u83:getMousePosition()
        if u83.pingPosition then
            local v84 = u83
            local v85 = u83.pingPosition
            local v86 = u83.selectedSlot
            local v87
            if v86 == 0 or (v86 ~= v86 or not v86) then
                v87 = u26.GENERIC
            else
                v87 = u28(u83.selectedSlot).pingType
            end
            v84:ping(v85, v87)
        end
        u83:disableTouchPing()
    end, false, Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch)
end
function u34.disableTouchPing(p88) --[[ Line: 203 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    p88.touchPingEnabled = false
    u18:UnbindAction("touch-ping")
end
function u34.setSelectedSlot(p89, p90) --[[ Line: 207 ]]
    p89.selectedSlot = p90
end
function u34.createIndicator(_, p91, p92, p93, p94) --[[ Line: 210 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u27
        [3] = u31
        [4] = u19
        [5] = u12
        [6] = u9
        [7] = u30
        [8] = u4
        [9] = u10
        [10] = u33
        [11] = u20
        [12] = u6
    --]]
    local v95 = u11
    local v96 = u27[p92].sound
    if v96 == nil then
        v96 = u31.PING
    end
    local v97 = {
        ["rollOffMaxDistance"] = 1500,
        ["rollOffMinDistance"] = 1400
    }
    local v98
    if p93 == u19.LocalPlayer then
        v98 = nil
    else
        v98 = p91
    end
    v97.position = v98
    v95:playSound(v96, v97)
    local function v105(p99, _, _, p100, p101) --[[ Line: 222 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u12
        --]]
        local v102 = p100:FindFirstChild("Container")
        if v102 ~= nil then
            v102 = v102:FindFirstChild("PingCreatorAvatar")
        end
        if v102 and p101 then
            local v103 = u19
            if p101 ~= nil then
                p101 = p101.UserId
            end
            v102.Image = v103:GetUserThumbnailAsync(p101, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352)
        end
        local v104 = p100:FindFirstChild("Container")
        if v104 ~= nil then
            v104 = v104:FindFirstChild("DistanceTracker")
        end
        if v104 then
            v104.Text = "<b>" .. u12.roundNumber(p99 / 3, 0) .. "m</b>"
        end
    end
    local v106 = u9
    local v107
    if p94 == nil then
        v107 = p94
    else
        v107 = p94.indicatorLifetime
    end
    if v107 == nil then
        v107 = u30.PING_LIFETIME
    end
    local u108 = v106:fadeOverTime(v107 - 1, 1)
    local v109 = u27[p92]
    local v110 = p93 or u19.LocalPlayer
    local v111 = u4.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController")
    local v112 = {
        ["uiType"] = u10.Custom
    }
    local v113 = {
        ["color3"] = Color3.new(255, 255, 255)
    }
    local v114 = v109.image
    local v115 = v109.color
    local v116 = {}
    local v117
    if p94 == nil then
        v117 = p94
    else
        v117 = p94.hidePlayerIcon
    end
    v116.disablePlayerAvatar = v117
    v113.template = u33(v114, v115, v116)
    function v113.transparency(p118, p119, _) --[[ Line: 277 ]]
        --[[
        Upvalues:
            [1] = u108
        --]]
        local v120 = u108(p119)
        for v121, v122 in p118:GetDescendants() do
            local _ = v121 - 1
            if v122:IsA("TextLabel") then
                v122.TextTransparency = v120
            end
            if v122:IsA("UIStroke") then
                v122.Transparency = v120
            end
            if v122:IsA("ImageLabel") then
                v122.ImageTransparency = v120
            end
        end
        return v120
    end
    v113.distanceRelativeToPlayer = true
    v113.scaleWithAlpha = false
    v113.scaleOnFade = false
    v113.easeOutOnAppoach = false
    function v113.onEnterAnimation(p123) --[[ Line: 300 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        local u124 = p123:FindFirstChild("PingIcon")
        if u124 ~= nil then
            u124 = u124:Clone()
        end
        if not u124 then
            return nil
        end
        u124.Parent = p123
        local u125 = u20:Create(u124, TweenInfo.new(0.15), {
            ["ImageTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1.5, 1.5)
        })
        u125:Play()
        u125.Completed:Connect(function() --[[ Line: 315 ]]
            --[[
            Upvalues:
                [1] = u125
                [2] = u124
            --]]
            u125:Destroy()
            u124:Destroy()
        end)
    end
    v112.uiConfig = v113
    local v126
    if p94 == nil then
        v126 = p94
    else
        v126 = p94.hidePlayerIcon
    end
    if v126 then
        v110 = nil
    end
    v112.creator = v110
    v112.attachTo = p91
    v112.constraintType = u6.Constrained
    v112.onUpdateProperties = v105
    local u127 = v111:addIndicator(v112)
    local v128 = task
    if p94 ~= nil then
        p94 = p94.indicatorLifetime
    end
    if p94 == nil then
        p94 = u30.PING_LIFETIME
    end
    v128.delay(p94 + 2, function() --[[ Line: 340 ]]
        --[[
        Upvalues:
            [1] = u127
        --]]
        u127:destroy()
    end)
    return u127
end
function u34.getMousePosition(_) --[[ Line: 345 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u8
    --]]
    local v129 = u19.LocalPlayer:GetMouse().UnitRay
    local v130 = u19.LocalPlayer.Character
    if not v130 then
        return nil
    end
    local v131 = RaycastParams.new()
    v131.FilterDescendantsInstances = { v130 }
    v131.FilterType = Enum.RaycastFilterType.Blacklist
    local v133 = u8:raycast(v129.Origin, v129.Direction.Unit * 1000, v131, {
        ["ignorePart"] = function(p132) --[[ Name: ignorePart, Line 355 ]]
            return p132:IsA("BasePart") and not p132.CanCollide and true or false
        end
    })
    if v133 ~= nil then
        v133 = v133.Position
    end
    return v133
end
v3.defineMetadata(u34, "identifier", "client/controllers/game/ping/ping-controller@PingController")
v3.defineMetadata(u34, "flamework:implements", { "$:flamework@OnStart" })
v3.decorate(u34, "$:flamework@Controller", v15, {
    {}
})
return {
    ["PingController"] = u34
}