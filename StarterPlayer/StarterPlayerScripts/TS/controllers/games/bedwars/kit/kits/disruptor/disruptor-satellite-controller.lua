local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitServer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.RunService
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "zenith", "satellite-state-variant").SatelliteStateVariant
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid")
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "DisruptorSatelliteController"
    end,
    ["__index"] = u11
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p18)
    p18.Name = "DisruptorSatelliteController"
    p18.satellites = {}
end
function u15.KnitStart(u19) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
    --]]
    u11.KnitStart(u19)
    u13.Client:Get("UpdateZenithSatellite"):Connect(function(p20, p21) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:changeCircleOrigin(p21, p20)
    end)
    u13.Client:Get("SpawnZenithSatellite"):Connect(function(p22, p23) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:spawnSatellite(p22, p23, {
            ["circlingRadius"] = 100,
            ["circleOrigin"] = p22
        })
        if not u19.satelliteHeartbeat then
            u19:startSatelliteHeartbeat()
        end
    end)
    u13.Client:Get("RemoveZenithSatellite"):Connect(function(p24) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:destroySatellite(p24)
        if #u19.satellites == 0 then
            local v25 = u19.satelliteHeartbeat
            if v25 ~= nil then
                v25:Disconnect()
            end
            u19.satelliteHeartbeat = nil
        end
    end)
end
function u15.startSatelliteHeartbeat(u26) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v48 = u9.Heartbeat:Connect(function(p27) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        debug.profilebegin("satellite-service")
        for _, v28 in u26.satellites do
            v28.elapsedTime = v28.elapsedTime + p27
            if v28.instance then
                local v29 = v28.instance:GetPivot()
                local v30 = Vector3.new(0, 0.01, 0)
                if v28.state.type == "circling" then
                    local v31 = v28.circlingRadius
                    local v32 = v31 == nil and 300 or v31
                    local v33 = v28.circleOrigin
                    local v34 = v28.elapsedTime / 4.5
                    local v35 = math.sin(v34) * v32
                    local v36 = v28.elapsedTime / 4.5
                    local v37 = math.cos(v36) * v32
                    local v38 = v33 + Vector3.new(v35, 0, v37)
                    local v39 = v29.Position - v38
                    local v40 = v28.circlingPid
                    local v41 = v39.Magnitude
                    local v42 = v28.speedMultiplier
                    local v43 = v40:Calculate(p27, v41 * (v42 == nil and 1 or v42), 0)
                    v30 = v30 + (v38 - v29.Position).Unit * v43
                end
                local v44 = (v29 * CFrame.new(0, 0, -10)).Position + v30 - v29.Position
                local v45 = v44.Unit
                local v46 = v44.Magnitude
                v28.linearVelocity.VectorVelocity = v45 * v46
                local v47 = v28.instance.Propeller.Orientation
                v28.instance.Propeller.Orientation = v47 + Vector3.new(0, 10, 0)
            end
        end
        debug.profileend()
    end)
    u26.satelliteHeartbeat = v48
    return v48
end
function u15.spawnSatellite(p49, p50, p51, p52) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u6
        [4] = u10
        [5] = u5
        [6] = u14
        [7] = u12
    --]]
    if p50 == nil then
        p50 = Vector3.new()
    end
    local v53 = u8.Assets.Misc.Satellite:Clone()
    u2:setQueryIgnored(v53, true)
    v53.Propeller.CanCollide = false
    v53.Base.CanCollide = false
    v53.Neon.CanCollide = false
    local v54 = v53.PrimaryPart
    v54.CanCollide = false
    local v55 = u6("Attachment", {
        ["Parent"] = v54
    })
    local v56 = u6("Attachment", {
        ["Parent"] = u10.Terrain
    })
    local v57 = u6("LinearVelocity", {
        ["Parent"] = v54,
        ["MaxForce"] = v54.AssemblyMass * 100000000,
        ["Attachment0"] = v55
    })
    local v58 = u6("AlignOrientation", {
        ["Responsiveness"] = 13,
        ["Parent"] = v54,
        ["Attachment0"] = v55,
        ["Attachment1"] = v56,
        ["MaxTorque"] = v54.AssemblyMass * 100000000
    })
    v53:PivotTo(CFrame.new(p50))
    v53.Parent = u10
    local v59
    if p52 == nil then
        v59 = p52
    else
        v59 = p52.circleOrigin
    end
    if v59 == nil then
        local v60 = u5.Services.MapService:waitForMapDocument()
        local v61 = v60:getLocationConfig("respawn_view")
        if v61 ~= nil then
            v61 = v61:getWorldCFrame()
        end
        if not v61 then
            v61 = v60:getLocationConfig("center")
            if v61 ~= nil then
                v61 = v61:getWorldCFrame() + Vector3.new(0, 150, 0)
            end
        end
        v59 = ((v61 or CFrame.new()) * CFrame.new(0, 160, 0)).Position
    end
    local v62 = u14.new(20, 50, 0.8, 0, 0)
    v62:Debug("CircleAccelPID", u10)
    u14.new(20, 400, 1, 0, 0):Debug("DivingAccelPID", u10)
    v53:SetAttribute("circling", nil)
    local v63 = {
        ["elapsedTime"] = 0,
        ["instance"] = v53,
        ["alignOrientation"] = v58,
        ["rotationAttachment"] = v56,
        ["linearVelocity"] = v57,
        ["circleOrigin"] = v59,
        ["circlingPid"] = v62
    }
    local v64
    if p52 == nil then
        v64 = p52
    else
        v64 = p52.circlingRadius
    end
    v63.circlingRadius = v64
    v63.state = u12.circling({})
    if p52 ~= nil then
        p52 = p52.speedMultiplier
    end
    v63.speedMultiplier = p52
    v63.player = p51
    local v65 = p49.satellites
    table.insert(v65, v63)
    return v63
end
function u15.destroySatellite(p66, p67) --[[ Line: 202 ]]
    local v68 = nil
    for v69, v70 in p66.satellites do
        local _ = v69 - 1
        if v70.player == p67 == true then
            v68 = v70
            break
        end
    end
    if v68 then
        local v71 = p66.satellites
        local v72 = (table.find(p66.satellites, v68) or 0) - 1
        table.remove(v71, v72 + 1)
        v68.instance:Destroy()
    end
end
function u15.changeCircleOrigin(p73, p74, p75) --[[ Line: 224 ]]
    local v76 = nil
    for v77, v78 in p73.satellites do
        local _ = v77 - 1
        if v78.player == p74 == true then
            v76 = v78
            break
        end
    end
    if v76 then
        v76.circleOrigin = p75
    end
end
v4.CreateController(u15.new())
return nil