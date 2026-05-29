local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Lighting
local u10 = v7.Players
local u11 = v7.TweenService
local u12 = v7.Workspace
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "midnight", "midnight-constants").MidnightConstants
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u22 = {
    ["correctionBrightness"] = 0,
    ["correctionContrast"] = 0.05,
    ["atmosphereDensity"] = 0.2,
    ["atmosphereHaze"] = 10,
    ["brightness"] = 1,
    ["farIntensity"] = 0.25,
    ["correctionTintColor"] = Color3.fromRGB(118, 132, 209),
    ["atmosphereColor"] = Color3.fromRGB(45, 56, 46),
    ["atmosphereDecay"] = Color3.fromRGB(30, 32, 35),
    ["outdoorAmbient"] = Color3.fromRGB(115, 111, 167),
    ["ambient"] = Color3.fromRGB(170, 170, 170)
}
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
        return "MidnightController"
    end,
    ["__index"] = u21
})
u23.__index = u23
function u23.new(...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u17
        [3] = u5
    --]]
    u21.constructor(p26, u17.MIDNIGHT)
    p26.Name = "MidnightController"
    p26.activeMidnightMaid = u5.new()
end
function u23.onKitLocalActivated(u27, u28) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u10
    --]]
    u19.Client:OnEvent("EntityDeathEvent", function(p29) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u27
        --]]
        if p29.entityInstance ~= u10.LocalPlayer.Character then
            return nil
        end
        u27.activeMidnightMaid:DoCleaning()
    end):andThen(function(p30) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28:GiveTask(p30)
    end)
end
function u23.onKitLocalDeactivated(_) --[[ Line: 65 ]] end
function u23.onKitReplicationActivated(_, _) --[[ Line: 67 ]] end
function u23.onKitReplicationDeactivated(_) --[[ Line: 69 ]] end
function u23.onInnateAbilityEnabled(_, _, _) --[[ Line: 71 ]] end
function u23.onAbilityUsed(u31, p32, p33) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u16
        [3] = u1
        [4] = u15
        [5] = u10
        [6] = u12
        [7] = u22
        [8] = u2
        [9] = u20
        [10] = u3
        [11] = u18
        [12] = u11
        [13] = u6
        [14] = u9
        [15] = u8
        [16] = u13
        [17] = u4
    --]]
    if p33.ability ~= u14.MIDNIGHT then
        return nil
    end
    local v34 = u16:getEntity(p32)
    if not u1.instanceof(v34, u15) then
        return nil
    end
    local v35 = p33.extra
    if v34:getPlayer() ~= u10.LocalPlayer then
        return nil
    end
    u31.activeMidnightMaid:DoCleaning()
    task.delay(v35.expirationTime - u12:GetServerTimeNow(), function() --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        u31.activeMidnightMaid:DoCleaning()
    end)
    local v36 = v35.team == u10.LocalPlayer:GetAttribute("Team")
    local u37 = u22
    local v38 = u2
    local v39 = u20.MIDNIGHT_ACTIVATE
    local v40 = {}
    local v41
    if v36 then
        v41 = nil
    else
        v41 = v34:getInstance().PrimaryPart
        if v41 ~= nil then
            v41 = v41.Position
        end
    end
    v40.position = v41
    v38:playSound(v39, v40)
    if v36 then
        local u42 = u2:playModifiableSound(u20.RAVEN_SPACE_AMBIENT)
        local u43 = u42.Volume
        u42.Looped = true
        u42.Volume = 0
        local v44 = u3.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["moveSpeedMultiplier"] = u18.MIDNIGHT_SPEED_BOOST
        })
        u31.activeMidnightMaid:GiveTask(v44)
        u31.activeMidnightMaid:GiveTask(function() --[[ Line: 117 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u42
            --]]
            u11:Create(u42, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
                ["Volume"] = 0
            }):Play()
            task.delay(1, function() --[[ Line: 121 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                u42:Destroy()
            end)
        end)
        local v45 = u6("Folder", {
            ["Name"] = "Disabled",
            ["Parent"] = u9
        })
        local u46 = u9:FindFirstChildWhichIsA("Atmosphere")
        local u47 = u9:FindFirstChildWhichIsA("SunRaysEffect")
        if u47 then
            u47.Parent = v45
            u31.activeMidnightMaid:GiveTask(function() --[[ Line: 133 ]]
                --[[
                Upvalues:
                    [1] = u47
                    [2] = u9
                --]]
                u47.Parent = u9
            end)
        end
        local u48 = u46:Clone()
        local u49 = u6("ColorCorrectionEffect", {
            ["Parent"] = u9
        })
        local u50 = u6("DepthOfFieldEffect", {
            ["Name"] = "MidnightDepthOfField",
            ["FocusDistance"] = 19.76,
            ["InFocusRadius"] = 28.2,
            ["FarIntensity"] = 0,
            ["NearIntensity"] = 0,
            ["Parent"] = u9
        })
        local u51 = u9.OutdoorAmbient
        local u52 = u9.Ambient
        local u53 = u9.Brightness
        u9.OutdoorAmbient = u37.outdoorAmbient
        u9.Ambient = u37.ambient
        u9.Brightness = u37.brightness
        u31.activeMidnightMaid:GiveTask(u49)
        u31.activeMidnightMaid:GiveTask(u50)
        u31.activeMidnightMaid:GiveTask(function() --[[ Line: 157 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u51
                [3] = u52
                [4] = u53
                [5] = u48
                [6] = u46
            --]]
            u9.OutdoorAmbient = u51
            u9.Ambient = u52
            u9.Brightness = u53
            u48.Parent = u9
            u46:Destroy()
        end)
        local u54 = {}
        for _, v55 in u8:GetTagged("DisableDuringMidnight") do
            if v55:IsA("PointLight") and v55.Enabled == true then
                v55.Enabled = false
                table.insert(u54, v55)
            end
        end
        u31.activeMidnightMaid:GiveTask(function() --[[ Line: 171 ]]
            --[[
            Upvalues:
                [1] = u54
            --]]
            for _, v56 in u54 do
                v56.Enabled = true
            end
        end)
        u13(1, u4, function(p57) --[[ Line: 176 ]]
            --[[
            Upvalues:
                [1] = u49
                [2] = u37
                [3] = u50
                [4] = u46
                [5] = u48
                [6] = u42
                [7] = u43
            --]]
            u49.Brightness = -0.05 * p57
            u49.Contrast = 0.05 * p57
            u49.TintColor = Color3.fromRGB(255, 255, 255):Lerp(u37.correctionTintColor, p57)
            u50.FarIntensity = u37.farIntensity * p57
            u46.Density = u37.atmosphereDensity * p57 + u48.Density * (1 - p57)
            u46.Color = u48.Color:Lerp(u37.atmosphereColor, p57)
            u46.Decay = u48.Decay:Lerp(u37.atmosphereDecay, p57)
            u46.Haze = u37.atmosphereHaze * p57 + u48.Haze * (1 - p57)
            u42.Volume = p57 * u43
        end, 0, 1)
    end
end
u3.CreateController(u23.new())
return nil