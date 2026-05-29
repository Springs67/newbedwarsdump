local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u18 = { v16.CAN_OF_BEANS_FART_1, v16.CAN_OF_BEANS_FART_2, v16.CAN_OF_BEANS_FART_3 }
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "CanOfBeansController"
    end,
    ["__index"] = u12
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p22)
    p22.Name = "CanOfBeansController"
end
function u19.KnitStart(u23) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u5
        [3] = u14
        [4] = u18
        [5] = u11
        [6] = u9
        [7] = u10
        [8] = u15
    --]]
    u12.KnitStart(u23)
    local v24 = {
        ["sounds"] = u18
    }
    u5.Controllers.PreloadController:preloadForItemType(u14.CONDIMENT_GUN, v24)
    u11.ItemConsumed:connect(function(p25) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u9
            [3] = u23
            [4] = u10
            [5] = u15
        --]]
        if p25.itemType ~= u14.CAN_OF_BEANS then
            return nil
        end
        local v26 = u9:GetPlayerFromCharacter(p25.entity:getInstance())
        if not v26 then
            return nil
        end
        u23:playFartEffect(v26)
        local v27 = u9.LocalPlayer.Character
        if v27 ~= nil then
            v27 = v27.PrimaryPart
        end
        if not v27 then
            return nil
        end
        local v28 = u10.CurrentCamera
        if v28 ~= nil then
            v28 = v28.CFrame.LookVector.Unit
        end
        if not v28 then
            return nil
        end
        local v29
        if v27 == nil then
            v29 = v27
        else
            v29 = v27.AssemblyMass
        end
        if v29 == 0 or (v29 ~= v29 or not v29) then
            return nil
        end
        if not u15.Client:Get("CanOfBeansLaunch"):CallServer({
            ["lookVector"] = v28
        }) then
            return nil
        end
        local v30 = v28.X
        local v31 = v28.Z
        v27:ApplyImpulse(Vector3.new(v30, 0.5, v31) * (v29 * 125))
    end)
end
function u19.playFartEffect(_, p32) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u7
        [4] = u13
        [5] = u17
        [6] = u3
        [7] = u18
        [8] = u4
    --]]
    local u33 = u6.new()
    local v34 = {
        ["Size"] = Vector3.new(4, 4, 4),
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Shape"] = Enum.PartType.Ball
    }
    local v35 = p32.Character
    if v35 ~= nil then
        v35 = v35.PrimaryPart
        if v35 ~= nil then
            v35 = v35.Position
        end
    end
    v34.Position = v35
    v34.Parent = u10
    local v36 = u7("Part", v34)
    u33:GiveTask(v36)
    local v37 = u7("ParticleEmitter", {
        ["Enabled"] = false,
        ["Color"] = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
        ["Texture"] = u13.SMOKE,
        ["Size"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 3, 0.5), NumberSequenceKeypoint.new(1, 5, 1) }),
        ["Lifetime"] = NumberRange.new(5, 10),
        ["SpreadAngle"] = Vector2.new(180, 180),
        ["Speed"] = NumberRange.new(1, 2),
        ["Parent"] = v36
    })
    local v38 = u7("Attachment", {
        ["Position"] = Vector3.new(0, -1, 0),
        ["Orientation"] = Vector3.new(90, 0, 0),
        ["Parent"] = v36
    })
    local v39 = u7("ParticleEmitter", {
        ["Enabled"] = false,
        ["Color"] = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
        ["Texture"] = u13.SMOKE,
        ["Size"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2, 0.5), NumberSequenceKeypoint.new(1, 4, 1) }),
        ["Lifetime"] = NumberRange.new(3, 6),
        ["SpreadAngle"] = Vector2.new(10, 180),
        ["Speed"] = NumberRange.new(3, 7),
        ["Parent"] = v38
    })
    local v40 = u17.isLobbyServer() and 20 or 100
    v37:Emit(v40)
    v39:Emit(v40)
    local v41 = u18
    local v42 = u3.fromList(unpack(v41))
    local v43 = u4
    local v44 = {}
    local v45 = p32.Character
    if v45 ~= nil then
        v45 = v45.PrimaryPart
        if v45 ~= nil then
            v45 = v45.Position
        end
    end
    v44.position = v45
    local v46 = p32.Character
    if v46 ~= nil then
        v46 = v46.PrimaryPart
    end
    v44.parent = v46
    local v47 = v43:playSound(v42, v44)
    if v47 then
        u33:GiveTask(v47)
    end
    local v48 = u17.isLobbyServer() and 4 or 10
    task.delay(v48, function() --[[ Line: 170 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:DoCleaning()
    end)
end
u5.CreateController(u19.new())
return nil