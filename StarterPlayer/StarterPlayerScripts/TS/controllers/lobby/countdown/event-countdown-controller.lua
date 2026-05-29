local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.StringUtil
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "EventCountdownController"
    end,
    ["__index"] = u7
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p11)
    p11.Name = "EventCountdownController"
    p11.shouldActive = false
    p11.countdownTag = "event-countdown"
    p11.startTime = 1760133600
    p11.endTime = 1760392800
    p11.eventActive = false
    p11.eventName = "Double Armor Trim Exp"
end
function u8.KnitStart(u12) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u6
    --]]
    u7.KnitStart(u12)
    if not u12.shouldActive then
        return nil
    end
    u4("event-countdown-board", function(p13) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local u14 = p13:WaitForChild("CountdownPart", 3)
        if u14 ~= nil then
            u14 = u14:WaitForChild("SurfaceGui", 3)
            if u14 ~= nil then
                u14 = u14:WaitForChild("CountdownText", 3)
            end
        end
        local u15 = p13:WaitForChild("TitlePart", 3)
        if u15 ~= nil then
            u15 = u15:WaitForChild("SurfaceGui", 3)
            if u15 ~= nil then
                u15 = u15:WaitForChild("TitleText", 3)
            end
        end
        local u16 = p13:WaitForChild("eventNamePart", 3)
        if u16 ~= nil then
            u16 = u16:WaitForChild("SurfaceGui", 3)
            if u16 ~= nil then
                u16 = u16:WaitForChild("TitleText", 3)
            end
        end
        if u16 then
            u16.Text = u12.eventName
        end
        if not (u14 and u15) then
            return nil
        end
        task.spawn(function() --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u15
                [3] = u14
                [4] = u16
            --]]
            if os.time() > u12.startTime and os.time() < u12.endTime then
                u12.eventActive = true
                u15.Text = "Event End In"
            elseif os.time() > u12.endTime then
                u14.Active = false
                u14:Destroy()
                local v17 = u16
                if v17 ~= nil then
                    v17:Destroy()
                end
                u15.Active = false
                u15:Destroy()
                return nil
            end
            while true do
                if os.time() > u12.startTime and u12.eventActive == false then
                    u12.eventActive = true
                    u15.Text = "Event End In"
                end
                if os.time() > u12.endTime then
                    u14.Active = false
                    u14:Destroy()
                    u15.Active = false
                    u15:Destroy()
                    local v18 = u16
                    if v18 ~= nil then
                        v18:Destroy()
                        return
                    end
                    break
                end
                local v19
                if u12.eventActive then
                    v19 = u12.endTime
                else
                    v19 = u12.startTime
                end
                u14.Text = u12:getTime(v19, "")
                local v20 = task.wait(1)
                if v20 == 0 or (v20 ~= v20 or not v20) then
                    break
                end
            end
        end)
    end)
    u4(u12.countdownTag, function(u21) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
        --]]
        task.spawn(function() --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u12
                [3] = u21
            --]]
            local v22 = u6:GetTagged("event-countdown-title")
            if os.time() > u12.startTime and os.time() < u12.endTime then
                u12.eventActive = true
                for v23, v24 in v22 do
                    local _ = v23 - 1
                    v24.Text = "Event End In"
                end
            elseif os.time() > u12.endTime then
                u21.Active = false
                u21:Destroy()
                for v25, v26 in v22 do
                    local _ = v25 - 1
                    v26.Active = false
                    v26:Destroy()
                end
                return nil
            end
            while true do
                if os.time() > u12.startTime and u12.eventActive == false then
                    u12.eventActive = true
                    for v27, v28 in v22 do
                        local _ = v27 - 1
                        v28.Text = "Event End In"
                    end
                end
                if os.time() > u12.endTime then
                    u21.Active = false
                    u21:Destroy()
                    for v29, v30 in v22 do
                        local _ = v29 - 1
                        v30.Active = false
                        v30:Destroy()
                    end
                    return
                end
                local v31
                if u12.eventActive then
                    v31 = u12.endTime
                else
                    v31 = u12.startTime
                end
                u21.Text = u12:getTime(v31, "")
                local v32 = task.wait(1)
                if v32 == 0 or (v32 ~= v32 or not v32) then
                    return
                end
            end
        end)
    end)
end
function u8.getTime(_, p33, p34) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v35 = p33 - os.time()
    local v36 = math.max(0, v35)
    if v36 == 0 then
        return p34
    else
        return u3.formatCountdownTime(v36, {
            ["days"] = true,
            ["hours"] = true,
            ["seperator"] = " : "
        })
    end
end
function u8.onEventStart(_) --[[ Line: 173 ]] end
v5.CreateController(u8.new())
return nil