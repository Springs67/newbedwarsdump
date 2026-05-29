local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnnouncementVariant
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Lighting
local u11 = v9.Players
local u12 = v9.RunService
local u13 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "screen-space")
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown-announcement").CircleCountdownAnnouncement
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, script.Parent, "battle-royale-zone-minimap-gui").BattleRoyaleZoneMinimapGUI
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "BattleRoyaleZoneController"
    end,
    ["__index"] = u13
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u16
    --]]
    u13.constructor(p23, { u16.BATTLE_ROYALE })
    p23.Name = "BattleRoyaleZoneController"
    p23.worldSize = Vector3.new(0, 0, 0)
    p23.centerWorldPosition = Vector3.new(0, 0, 0)
    p23.nextZonePosition = Vector3.new(0, 0, 0)
    p23.nextZoneSize = Vector3.new(0, 0, 0)
    p23.cameraEffectsActive = false
    p23.instancesAlreadyHighlighted = {}
    p23.alreadyInitializedHighlightSystem = false
end
function u20.KnitStart(u24) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u17
    --]]
    u13.KnitStart(u24)
    u17.Client:Get("BattleRoyaleSetupZoneFromServer"):Connect(function(p25) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24.zone = p25.zone
        u24.worldSize = p25.worldSize
        u24.centerWorldPosition = p25.centerWorldPosition
        u24:processZoneCameraEffects()
        task.spawn(function() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24:mountMinimapGui()
        end)
    end)
    u17.Client:Get("BattleRoyaleNextZoneFromServer"):Connect(function(p26) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24.nextZonePosition = p26.nextZonePosition
        u24.nextZoneSize = p26.nextZoneSize
    end)
end
function u20.onGameInit(u27) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u15
        [4] = u11
        [5] = u6
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/announcement/announcement-controller@AnnouncementController"):setDefaultUI(u4.countdown.type, u15)
    u11.LocalPlayer:GetAttributeChangedSignal("Team"):Connect(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u6
        --]]
        if u27.alreadyInitializedHighlightSystem then
            return nil
        end
        u27.alreadyInitializedHighlightSystem = true
        u6.Controllers.TeammateHighlightController:setupTeamHighlightSystem()
    end)
end
function u20.mountMinimapGui(p28) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u8
        [3] = u19
        [4] = u11
    --]]
    local v29 = u14.ViewSizeX()
    local v30 = u14.ViewSizeY
    local v31 = math.min(v29, v30()) * 0.2
    u8.mount(u8.createElement(u19, {
        ["WorldSize"] = p28.worldSize,
        ["CenterWorldPosition"] = p28.centerWorldPosition,
        ["MinimapWidth"] = v31,
        ["Zone"] = p28.zone
    }), u11.LocalPlayer:WaitForChild("PlayerGui"), "BRZoneTree")
end
function u20.processZoneCameraEffects(u32) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u10
        [4] = u11
        [5] = u5
        [6] = u18
    --]]
    u12.Heartbeat:Connect(function() --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u7
            [3] = u10
            [4] = u11
            [5] = u5
            [6] = u18
        --]]
        local v33 = game.Workspace.CurrentCamera
        if v33 ~= nil then
            v33 = v33.CFrame.Position
        end
        if not v33 then
            return nil
        end
        if u32:isPositionInSafeZone(v33) and u32.cameraEffectsActive then
            u32.cameraEffectsActive = false
            if u32.colorCorrectionEffect then
                u32.colorCorrectionEffect:Destroy()
            end
            return nil
        end
        if not (u32:isPositionInSafeZone(v33) or u32.cameraEffectsActive) then
            u32.cameraEffectsActive = true
            u32.colorCorrectionEffect = u7("ColorCorrectionEffect", {
                ["Name"] = "BattleRoyaleStormColorCorrectionEffect",
                ["Enabled"] = true,
                ["TintColor"] = Color3.fromRGB(186, 64, 71),
                ["Parent"] = u10
            })
            return nil
        end
        local v34 = u11.LocalPlayer.Character
        if v34 ~= nil then
            v34 = v34.PrimaryPart
            if v34 ~= nil then
                v34 = v34.Position
            end
        end
        if v34 then
            local v35 = u32.zone.Size / 2
            local v36 = u32.zone.Position.X - v35.X
            local v37 = u32.zone.Position.X + v35.X
            local v38 = u32.zone.Position.Z - v35.Z
            local v39 = u32.zone.Position.Z + v35.Z
            local v40 = v34.X - v36
            local v41 = math.abs(v40)
            local v42 = v34.X - v37
            local v43 = math.abs(v42)
            local v44 = math.min(v41, v43)
            local v45 = v34.Z - v38
            local v46 = math.abs(v45)
            local v47 = v34.Z - v39
            local v48 = math.abs(v47)
            local v49 = math.min(v46, v48)
            local v50 = math.min((1 / 0), v44)
            local v51 = math.min(v50, v49)
            if u32.stormEdgeSound == nil then
                u32.stormEdgeSound = u5:playModifiableSound(u18.STORM_EDGE, {
                    ["looped"] = true
                })
            end
            local v52 = 1 - v51 / 400
            local v53 = math.clamp(v52, 0, 1) * 1
            u32.stormEdgeSound.Volume = v53
            if u32:isPositionInSafeZone(v34) then
                if u32.inStormSound ~= nil then
                    u32.inStormSound:Pause()
                    return
                end
            else
                if u32.inStormSound == nil then
                    u32.inStormSound = u5:playModifiableSound(u18.STORM_INSIDE, {
                        ["looped"] = true,
                        ["volumeMultiplier"] = 1.5
                    })
                    return
                end
                u32.inStormSound:Play()
            end
        end
    end)
end
function u20.isPositionInSafeZone(p54, p55) --[[ Line: 164 ]]
    local v56 = p54.zone.Size / 2
    local v57 = p54.zone.Position.X - v56.X
    local v58 = p54.zone.Position.X + v56.X
    local v59 = p54.zone.Position.Y - v56.Y
    local v60 = p54.zone.Position.Y + v56.Y
    local v61 = p54.zone.Position.Z - v56.Z
    local v62 = p54.zone.Position.Z + v56.Z
    local v63
    if v57 <= p55.X and (p55.X <= v58 and (v59 <= p55.Y and (p55.Y <= v60 and v61 <= p55.Z))) then
        v63 = p55.Z <= v62
    else
        v63 = false
    end
    return v63
end
u6.CreateController(u20.new())
return nil