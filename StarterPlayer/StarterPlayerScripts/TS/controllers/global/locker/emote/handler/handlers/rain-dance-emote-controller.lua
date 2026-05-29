local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lobby", "ambience", "number-sequence-builder").NumberSequenceBuilder
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u10 = u1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u11 = {
    ["freqSeconds"] = 0.1,
    ["airMaxRelativeY"] = -1.5,
    ["groundMaxRelativeXz"] = 0.2,
    ["airXzSpread"] = { -1.5, 1.5 },
    ["groundYSpread"] = { -0.3, -1 }
}
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "RainDanceEmoteController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p15)
    p15.Name = "RainDanceEmoteController"
end
function u12.KnitStart(p16) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u9
        [4] = u10
        [5] = u3
        [6] = u7
        [7] = u1
        [8] = u5
        [9] = u6
        [10] = u11
    --]]
    u8.KnitStart(p16)
    local v17 = u2.Controllers.EmoteHandlerController
    local v18 = u9.RAIN_DANCE
    local u19 = u10
    local u20 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 53 ]]
            return "Anonymous"
        end,
        ["__index"] = u19
    })
    u20.__index = u20
    function u20.new(...) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        local v21 = u20
        local v22 = setmetatable({}, v21)
        return v22:constructor(...) or v22
    end
    function u20.constructor(p23, ...) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u3
            [3] = u7
        --]]
        u19.constructor(p23, ...)
        p23.baseBeam = u3("Beam", {
            ["Enabled"] = true,
            ["Texture"] = "rbxassetid://8030734851",
            ["TextureSpeed"] = 2,
            ["FaceCamera"] = true,
            ["Segments"] = 1,
            ["Width0"] = 0.1,
            ["Width1"] = 0.1,
            ["Transparency"] = u7.new():addKeypoint(0, 0.5):addKeypoint(1, 0.3):build(),
            ["Color"] = ColorSequence.new(Color3.fromRGB(59, 207, 195))
        })
    end
    function u20.onEnable(u24, _, u25, _, u26) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u5
            [3] = u6
            [4] = u3
            [5] = u11
        --]]
        local u42 = u1.Promise.delay(1):andThen(function() --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u25
                [3] = u6
                [4] = u26
                [5] = u3
                [6] = u24
                [7] = u11
            --]]
            local v27 = u5.Assets.Effects.Cloud:Clone()
            v27.Position = u25:GetPivot().Position + Vector3.new(0, 6, 0)
            v27.Parent = u6
            local v28 = v27:FindFirstChild("Cloud")
            if v28 then
                v28.Enabled = true
            end
            u26:GiveTask(v27)
            wait(1)
            local v29 = false
            local v30 = 0
            local u31 = {}
            local u32 = {}
            local u33 = {}
            while true do
                if v29 then
                    v30 = v30 + 1
                else
                    v29 = true
                end
                if v30 >= 15 then
                    u26:GiveTask(task.spawn(function() --[[ Line: 122 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u31
                            [3] = u33
                            [4] = u32
                            [5] = u24
                        --]]
                        while { wait(u11.freqSeconds) } do
                            local v34 = math.random() * (#u31 - 1)
                            local v35 = math.round(v34)
                            local v36 = u31[v35 + 1]
                            local v37 = u33[v35 + 1]
                            local v38 = u32[v35 + 1]
                            if not v36.Enabled then
                                v38.Position = u24:getRandomAirAttachmentPosition()
                                v37.Position = u24:getRandomGroundAttachmentPosition(v38.Position)
                            end
                            v36.Enabled = not v36.Enabled
                        end
                    end))
                    return
                end
                local v39 = u3("Attachment", {
                    ["Parent"] = v27,
                    ["Position"] = u24:getRandomAirAttachmentPosition()
                })
                local v40 = u3("Attachment", {
                    ["Parent"] = v27,
                    ["Position"] = u24:getRandomGroundAttachmentPosition(v39.Position)
                })
                local v41 = u24.baseBeam:Clone()
                v41.Parent = v27
                v41.Attachment0 = v39
                v41.Attachment1 = v40
                table.insert(u31, v41)
                table.insert(u32, v39)
                table.insert(u33, v40)
            end
        end)
        u26:GiveTask(function() --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            return u42:cancel()
        end)
    end
    function u20.onDisable(_, _, _, _) --[[ Line: 140 ]] end
    function u20.getRandomAirAttachmentPosition(_) --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        local v43 = math.random(u11.airXzSpread[1], u11.airXzSpread[2])
        local v44 = math.random() * u11.airMaxRelativeY
        local v45 = math.random
        local v46 = u11.airXzSpread[1]
        local v47 = u11.airXzSpread[2]
        return Vector3.new(v43, v44, v45(v46, v47))
    end
    function u20.getRandomGroundAttachmentPosition(_, p48) --[[ Line: 145 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        local v49 = math.random() * (u11.groundYSpread[2] - u11.groundYSpread[1]) + u11.groundYSpread[1]
        local v50 = math.random() * u11.groundMaxRelativeXz
        local v51 = math.random() * u11.groundMaxRelativeXz
        return p48 + Vector3.new(v50, v49, v51)
    end
    v17:registerHandler(v18, u20)
end
u2.CreateController(u12.new())
return nil