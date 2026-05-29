local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "BananarangLobbyGadgetController"
    end,
    ["__index"] = u6
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p14)
    p14.Name = "BananarangLobbyGadgetController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u5
        [4] = u4
        [5] = u2
        [6] = u9
        [7] = u8
        [8] = u7
    --]]
    u6.KnitStart(p15)
    if not u10.isLobbyServer() then
        return nil
    end
    u5.ProjectileLaunched:connect(function(p16) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u9
            [4] = u8
            [5] = u7
        --]]
        if p16:isCancelled() then
            return nil
        end
        if not p16.shooter then
            return nil
        end
        if p16.projectileType ~= "bananarang" then
            return nil
        end
        local v17 = u4:GetPlayerFromCharacter(p16.shooter)
        local v18
        if v17 == nil then
            v18 = v17
        else
            v18 = v17.Character
        end
        if not v18 then
            return nil
        end
        local v19 = u2:createSound(u9.BANANARANG_FLYING_LOOP)
        if v19 then
            v19.Parent = p16.projectile:FindFirstChildWhichIsA("BasePart")
            v19.Looped = true
            v19.Volume = 2
            v19:Play()
        end
        if v17 == u4.LocalPlayer then
            local v20 = u2
            local v21 = u9.BANANARANG_THROW
            local v22 = {}
            local v23 = v17.Character.PrimaryPart
            if v23 ~= nil then
                v23 = v23.Position
            end
            v22.position = v23
            v22.volumeMultiplier = 0.5
            v20:playSound(v21, v22)
            u8:playAnimation(u4.LocalPlayer, u7.BOOMERANG_THROW)
        end
    end)
end
v3.CreateController(u11.new())
return nil