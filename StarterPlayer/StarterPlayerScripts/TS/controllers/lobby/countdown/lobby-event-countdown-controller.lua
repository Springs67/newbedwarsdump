local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.StringUtil
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "LobbyEventCountdownController"
    end,
    ["__index"] = u7
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
        [3] = u8
        [4] = u10
    --]]
    u7.constructor(p16)
    p16.Name = "LobbyEventCountdownController"
    p16.shouldActive = true
    p16.eventType = u9.PENGUIN_CATCHING_LOBBY_EVENT
    p16.eventMeta = u8[p16.eventType]
    p16.startTime = p16.eventMeta.startDate
    p16.endTime = p16.eventMeta.endDate
    p16.eventActive = u10.isEventRunning(p16.eventType)
    p16.eventName = p16.eventMeta.name
    p16.nextEventTime = p16.startTime
end
function u13.KnitStart(u17) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u9
        [4] = u12
        [5] = u6
        [6] = u11
        [7] = u4
    --]]
    u7.KnitStart(u17)
    if not u8[u9.PENGUIN_CATCHING_LOBBY_EVENT].active then
        return nil
    end
    if not u12.isLobbyServer() then
        return nil
    end
    if not u17.shouldActive then
        return nil
    end
    if os.time() > u17.endTime then
        return nil
    end
    local v18 = u6:GetAttribute(u17.eventType)
    if v18 ~= 0 and (v18 == v18 and v18) then
        u17.nextEventTime = v18
    end
    u11.Client:Get("NextMeteorScheduled"):Connect(function(p19) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17.nextEventTime = p19.startTime
    end)
    u6:GetAttributeChangedSignal(u17.eventType):Connect(function(_) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u17
        --]]
        local v20 = u6:GetAttribute(u17.eventType)
        u17.nextEventTime = v20 == nil and 0 or v20
    end)
    u4("event-countdown-board", function(p21) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        local u22 = p21:WaitForChild("CountdownPart", 3)
        if u22 ~= nil then
            u22 = u22:WaitForChild("SurfaceGui", 3)
            if u22 ~= nil then
                u22 = u22:WaitForChild("CountdownText", 3)
            end
        end
        local u23 = p21:WaitForChild("TitlePart", 3)
        if u23 ~= nil then
            u23 = u23:WaitForChild("SurfaceGui", 3)
            if u23 ~= nil then
                u23 = u23:WaitForChild("TitleText", 3)
            end
        end
        local u24 = p21:WaitForChild("eventNamePart", 3)
        if u24 ~= nil then
            u24 = u24:WaitForChild("SurfaceGui", 3)
            if u24 ~= nil then
                u24 = u24:WaitForChild("TitleText", 3)
            end
        end
        if u24 then
            u24.Text = u17.eventName
        end
        if not (u22 and u23) then
            return nil
        end
        u23.Text = "Next Penguin Event"
        local v25 = u23:FindFirstChild("UIGradient")
        if v25 then
            v25.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 102, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 242, 214)) })
        end
        task.spawn(function() --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u22
                [3] = u24
                [4] = u23
            --]]
            if os.time() > u17.startTime and os.time() < u17.endTime then
                u17.eventActive = true
            elseif os.time() > u17.endTime then
                u22.Active = false
                u22:Destroy()
                local v26 = u24
                if v26 ~= nil then
                    v26:Destroy()
                end
                u23.Active = false
                u23:Destroy()
                return nil
            end
            while true do
                if os.time() > u17.startTime and u17.eventActive == false then
                    u17.eventActive = true
                    u23.Text = "Next Penguin Event"
                end
                if os.time() > u17.endTime then
                    u22.Active = false
                    u22:Destroy()
                    u23.Active = false
                    u23:Destroy()
                    local v27 = u24
                    if v27 ~= nil then
                        v27:Destroy()
                        return
                    end
                    break
                end
                u22.Text = u17:getTime(u17.nextEventTime, "")
                local v28 = task.wait(1)
                if v28 == 0 or (v28 ~= v28 or not v28) then
                    break
                end
            end
        end)
    end)
end
function u13.getTime(_, p29, p30) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v31 = p29 - os.time()
    local v32 = math.max(0, v31)
    if v32 == 0 then
        return p30
    else
        return u3.formatCountdownTime(v32, {
            ["days"] = true,
            ["hours"] = true,
            ["seperator"] = " : "
        })
    end
end
function u13.onEventStart(_) --[[ Line: 154 ]] end
v5.CreateController(u13.new())
return nil