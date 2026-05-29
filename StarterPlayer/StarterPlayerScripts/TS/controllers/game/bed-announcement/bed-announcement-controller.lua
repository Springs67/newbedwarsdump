local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ReplicatedStorage
local u11 = v9.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "BedAnnouncementController"
    end,
    ["__index"] = u13
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
        [1] = u13
    --]]
    u13.constructor(p18)
    p18.Name = "BedAnnouncementController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
        [3] = u5
        [4] = u14
        [5] = u8
        [6] = u10
        [7] = u2
        [8] = u11
        [9] = u4
    --]]
    u13.KnitStart(p19)
    u12.AnnouncementBegan:connect(function(p20) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u14
            [3] = u8
            [4] = u10
            [5] = u2
            [6] = u11
            [7] = u4
        --]]
        local v21 = p20.announcement.metadata
        local v22 = p20.announcement.metadata
        if v22 ~= nil then
            v22 = v22.bedPosition
        end
        if v22 ~= nil then
            u5:playSound(u14.BED_BREAK)
            u8.Controllers.ScreenParticlesController:emitParticlesOnScreen({
                ["cleanupAfter"] = 1,
                ["particleEmitter"] = { u10.Assets.Effects.BedBreakParticles }
            })
            local u23 = u10.Assets.Effects.BedBreakWorld:Clone()
            u23.CFrame = CFrame.new(u2:getWorldPosition(v21.bedPosition))
            u23.Parent = u11
            u4:setQueryIgnored(u23, true)
            u23.CanCollide = false
            for _, v24 in u23:GetDescendants() do
                if v24:IsA("ParticleEmitter") then
                    local v25 = v24:GetAttribute("EmitCount")
                    if v25 ~= 0 and (v25 == v25 and v25) then
                        v24:Emit(v25)
                    end
                end
            end
            task.delay(5, function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23:Destroy()
            end)
        end
    end)
end
v7.CreateController(u15.new())
return nil