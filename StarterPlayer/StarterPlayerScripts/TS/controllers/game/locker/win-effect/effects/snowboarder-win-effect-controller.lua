local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v5.ReplicatedStorage
local u9 = v5.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "skybox", "skybox-util").SkyboxId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, script.Parent.Parent, "win-effect").WinEffect
local _ = {
    Color3.fromRGB(20, 232, 30),
    Color3.fromRGB(0, 234, 141),
    Color3.fromRGB(1, 126, 213),
    Color3.fromRGB(181, 61, 255),
    Color3.fromRGB(141, 0, 196)
}
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "AuroraWinEffectController"
    end,
    ["__index"] = u14
})
u15.__index = u15
function u15.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
    --]]
    u14.constructor(p18, u11.SNOWBOARDER)
    p18.Name = "AuroraWinEffectController"
    p18.active = true
end
function u15.KnitStart(p19) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p19)
end
function u15.onWin(p20, p21) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    if p21 == u7.LocalPlayer then
        p20:applyEnvironment()
    end
    local v22 = nil
    for v23, v24 in u6:GetTagged("SnowboardClone") do
        local _ = v23 - 1
        if v24.Name == p21.Name == true then
            v22 = v24
            break
        end
    end
    if v22 then
        p20:applyCharacterEffects(v22)
    end
end
function u15.applyEnvironment(p25) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u12
        [3] = u2
        [4] = u13
    --]]
    u3.Controllers.SkyboxController:setSkybox(u12.NorthernLights)
    u3.Controllers.SnowWeatherParticleController:enable(1)
    u3.Controllers.BackgroundMusicController:stopMusic()
    u3.Controllers.GameMusicController:disableAutoplayer()
    u2:playSound(u13.CHRISTMAS_MUSIC, {
        ["looped"] = true
    })
    p25:spawnAurora()
end
function u15.applyCharacterEffects(_, p26) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.Assets.Effects.AuroraBlast.aurora:Clone().Parent = p26
end
function u15.spawnAurora(u27) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u9
        [4] = u10
        [5] = u4
    --]]
    local u28 = Random.new()
    local v29 = u8.Assets.Effects.AuroraBorealis:Clone()
    local v30 = u3.Controllers.MapController:getCFrame("center"):expect()
    if not v30 then
        return nil
    end
    local v31 = v30.Position
    local v32 = u28:NextNumber(-75, 75)
    local v33 = u28:NextNumber(30, 125)
    local v34 = Vector3.new(v32, v33, u28:NextNumber(-75, 75))
    v29:PivotTo(CFrame.new(v31 + v34) * CFrame.Angles(0, u28:NextNumber(-180, 180), 0))
    v29.Parent = u9
    local v35 = v29:GetDescendants()
    local function v41(u36) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
            [3] = u28
            [4] = u27
        --]]
        if not u36:IsA("Beam") then
            return nil
        end
        task.spawn(function() --[[ Line: 114 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u10
                [3] = u4
                [4] = u36
                [5] = u28
            --]]
            while u27.active do
                local v38 = u10(5, u4, function(p37) --[[ Line: 101 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                    --]]
                    u36.CurveSize0 = p37
                end, u36.CurveSize0, u28:NextNumber(400, 600))
                v38:Play()
                v38:Wait()
                task.wait(3)
            end
        end)
        task.spawn(function() --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u10
                [3] = u4
                [4] = u36
                [5] = u28
            --]]
            while u27.active do
                local v40 = u10(5, u4, function(p39) --[[ Line: 108 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                    --]]
                    u36.CurveSize1 = p39
                end, u36.CurveSize1, u28:NextNumber(150, 350))
                v40:Play()
                v40:Wait()
                task.wait(3)
            end
        end)
    end
    for v42, v43 in v35 do
        v41(v43, v42 - 1, v35)
    end
    return v29
end
u3.CreateController(u15.new())
return nil