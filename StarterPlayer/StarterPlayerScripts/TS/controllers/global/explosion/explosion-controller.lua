local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Debris
local u10 = v8.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-meta").getExplosionMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "ExplosionController"
    end,
    ["__index"] = u12
})
u17.__index = u17
function u17.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u10
    --]]
    u12.constructor(p20)
    p20.Name = "ExplosionController"
    p20.explosionsFolder = u7("Folder", {
        ["Name"] = "Explosions",
        ["Parent"] = u10
    })
end
function u17.KnitStart(u21) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
        [3] = u13
        [4] = u15
        [5] = u4
        [6] = u7
        [7] = u3
        [8] = u9
        [9] = u16
    --]]
    u14.Client:WaitFor("ExplosionEffect"):andThen(function(p22) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u13
            [3] = u15
            [4] = u4
            [5] = u7
            [6] = u21
            [7] = u3
            [8] = u9
            [9] = u16
        --]]
        p22:Connect(function(p23, p24, p25, p26, p27, p28, p29) --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u13
                [3] = u15
                [4] = u4
                [5] = u7
                [6] = u21
                [7] = u3
                [8] = u9
                [9] = u16
            --]]
            u11.ExplosionEffect:fire(p23, p24, p28)
            local v30 = u13(p24)
            if not p26 then
                local v31 = v30.explosionSound
                if v31 == nil then
                    v31 = u15.TNT_EXPLODE_1
                end
                if p29 ~= "" then
                    v31 = p29 or v31
                end
                u4:playSound(v31, {
                    ["rollOffMaxDistance"] = 300,
                    ["position"] = p23
                })
            end
            if not p27 then
                local v32 = u7("Part", {
                    ["Size"] = Vector3.new(1, 1, 1),
                    ["Anchored"] = true,
                    ["CanCollide"] = false,
                    ["Transparency"] = 1,
                    ["CFrame"] = CFrame.new(p23),
                    ["Parent"] = u21.explosionsFolder
                })
                u3:setQueryIgnored(v32, true)
                u9:AddItem(v32, 3)
                local v33 = Random.new()
                local v34 = u7("ParticleEmitter", {
                    ["LightInfluence"] = 0.1,
                    ["Acceleration"] = Vector3.new(0, 4, 0),
                    ["Drag"] = 3.5,
                    ["Rate"] = 0,
                    ["Color"] = ColorSequence.new(v30.explosionParticleColor or Color3.new(0.92, 0.92, 0.92), v30.explosionParticleColor or Color3.new(1, 1, 1)),
                    ["Size"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2, 1), NumberSequenceKeypoint.new(1, 0) }),
                    ["Transparency"] = NumberSequence.new(0, 1),
                    ["EmissionDirection"] = Enum.NormalId.Top,
                    ["Lifetime"] = NumberRange.new(3, 5),
                    ["Rotation"] = NumberRange.new(0, 360),
                    ["RotSpeed"] = NumberRange.new(50, 100),
                    ["Speed"] = NumberRange.new(17, 30),
                    ["SpreadAngle"] = Vector2.new(100, 100),
                    ["Parent"] = v32
                })
                local v35 = 25 * p25
                local v36 = false
                local v37 = 0
                while true do
                    if true then
                        if v36 then
                            v37 = v37 + 1
                        else
                            v36 = true
                        end
                    end
                    if v37 >= v35 then
                        break
                    end
                    local v38 = v33:NextInteger(1, 6)
                    v34.Texture = u16("Explode" .. tostring(v38)).Image
                    v34:Emit(1)
                end
            end
        end)
    end)
end
function u17.playExplodeEffect(p39, p40, p41, p42) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u15
        [4] = u7
        [5] = u3
        [6] = u9
        [7] = u16
    --]]
    local v43 = u6.new()
    if not p42.disableSound then
        v43:GiveTask(u4:playSound(u15.TNT_EXPLODE_1, {
            ["rollOffMaxDistance"] = 220,
            ["position"] = p40
        }))
    end
    local v44 = u7("Part", {
        ["Size"] = Vector3.new(1, 1, 1),
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Transparency"] = 1,
        ["CFrame"] = CFrame.new(p40),
        ["Parent"] = p39.explosionsFolder
    })
    u3:setQueryIgnored(v44, true)
    u9:AddItem(v44, 3)
    v43:GiveTask(v44)
    local v45 = Random.new()
    local v46 = NumberRange.new(17, 30)
    local v47 = NumberRange.new(v46.Min * p41, v46.Max * p41)
    local v48 = u7("ParticleEmitter", {
        ["LightInfluence"] = 0.1,
        ["Acceleration"] = Vector3.new(0, 4, 0),
        ["Drag"] = 3.5,
        ["Rate"] = 0,
        ["Color"] = ColorSequence.new(Color3.new(0.92, 0.92, 0.92), Color3.new(1, 1, 1)),
        ["Size"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2, 1), NumberSequenceKeypoint.new(1, 0) }),
        ["Transparency"] = NumberSequence.new(0, 1),
        ["EmissionDirection"] = Enum.NormalId.Top,
        ["Lifetime"] = NumberRange.new(3, 5),
        ["Rotation"] = NumberRange.new(0, 360),
        ["RotSpeed"] = NumberRange.new(50, 100),
        ["Speed"] = v47,
        ["SpreadAngle"] = Vector2.new(100, 100),
        ["Parent"] = v44
    })
    v43:GiveTask(v48)
    local v49 = false
    local v50 = 0
    while true do
        if v49 then
            v50 = v50 + 1
        else
            v49 = true
        end
        if v50 >= 25 then
            return v43
        end
        local v51 = v45:NextInteger(1, 6)
        v48.Texture = u16("Explode" .. tostring(v51)).Image
        v48:Emit(1)
    end
end
return {
    ["ExplosionController"] = v5.CreateController(u17.new())
}