local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ImageId
local u4 = v2.SoundManager
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute
local u10 = v9.new("timeUntilExplosion", v6.optional(v6.number))
local u11 = v9.new("growDuration", v6.optional(v6.number))
local u12 = v9.new("flashColor", v6.optional(v6.Color3))
local u13 = v9.new("flashInterval", v6.optional(v6.number))
local u14 = v9.new("hissSound", v6.optional(v6.string))
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "TntComponent"
    end
})
u15.__index = u15
function u15.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(u18, u19) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u11
        [4] = u12
        [5] = u13
        [6] = u14
        [7] = u7
        [8] = u4
        [9] = u5
        [10] = u3
        [11] = u1
    --]]
    local v20 = {
        u10,
        u11,
        u12,
        u13,
        u14
    }
    u18.config = u8.new(u19, v20)
    local v21 = {}
    local v22 = u18.config.Values.timeUntilExplosion
    v21.timeUntilExplosion = v22 == nil and 3 or v22
    local v23 = u18.config.Values.growDuration
    v21.growDuration = v23 == nil and 3 or v23
    v21.flashColor = u18.config.Values.flashColor or Color3.fromRGB(255, 255, 255)
    local v24 = u18.config.Values.flashInterval
    v21.flashInterval = v24 == nil and 0.25 or v24
    local v25 = u18.config.Values.hissSound
    if v25 == nil then
        v25 = u7.TNT_HISS_1
    end
    v21.hissSound = v25
    u18.config.Values = v21
    local v26 = u18.config.Values.hissSound
    if v26 ~= "" and v26 then
        u4:playSound(u18.config.Values.hissSound, {
            ["rollOffMaxDistance"] = 220,
            ["position"] = u19.Position
        })
    end
    for _, v27 in Enum.NormalId:GetEnumItems() do
        u19:WaitForChild(v27.Name)
    end
    for _, v28 in u19:GetChildren() do
        if v28:IsA("BasePart") then
            u5("Texture", {
                ["Parent"] = v28,
                ["Face"] = Enum.NormalId.Bottom,
                ["Texture"] = u3.PIXEL,
                ["Color3"] = u18.config.Values.flashColor
            })
        end
    end
    local u29 = {}
    local function v31(p30) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        if p30:IsA("Texture") then
            u29[p30.Face] = p30.Texture
        end
    end
    for v32, v33 in u19:GetChildren() do
        local _ = v32 - 1
        if v33:IsA("Texture") then
            u29[v33.Face] = v33.Texture
        end
    end
    u19.ChildAdded:Connect(v31)
    u1.Promise.defer(function() --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u19
        --]]
        local v34 = false
        while true do
            local v35 = task.wait(u18.config.Values.flashInterval)
            if v35 ~= 0 and (v35 == v35 and v35) then
                v35 = u19.Parent ~= nil
            end
            if v35 == 0 or (v35 ~= v35 or not v35) then
                return
            end
            local v36 = not v34
            v34 = v36
            for v37, v38 in u19:GetDescendants() do
                local _ = v37 - 1
                if v38:IsA("Texture") then
                    if v34 then
                        v38.Transparency = 0
                    else
                        v38.Transparency = 1
                    end
                end
            end
        end
    end)
end
function u15.Destroy(_) --[[ Line: 144 ]] end
u15.Tag = "tnt"
return u15