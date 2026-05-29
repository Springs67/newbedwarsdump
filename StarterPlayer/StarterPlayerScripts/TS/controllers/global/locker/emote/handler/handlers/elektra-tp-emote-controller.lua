local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u13 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "ElektraTpEmoteController"
    end,
    ["__index"] = u7
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p17)
    p17.Name = "ElektraTpEmoteController"
end
function u14.KnitStart(p18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u10
        [4] = u13
        [5] = u8
        [6] = u9
        [7] = u5
        [8] = u6
        [9] = u12
        [10] = u2
        [11] = u11
    --]]
    u7.KnitStart(p18)
    local v19 = u3.Controllers.EmoteHandlerController
    local v20 = u10.ELEKTRA_TP
    local u21 = u13
    local u22 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 41 ]]
            return "Anonymous"
        end,
        ["__index"] = u21
    })
    u22.__index = u22
    function u22.new(...) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        local v23 = u22
        local v24 = setmetatable({}, v23)
        return v24:constructor(...) or v24
    end
    function u22.constructor(p25, ...) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21.constructor(p25, ...)
    end
    function u22.onEnable(u26, u27, u28, _, u29) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u9
            [3] = u5
            [4] = u6
            [5] = u12
            [6] = u2
            [7] = u11
        --]]
        u29:GiveTask(u26:watchEmoteAnimation(u27, u28, u8.ELEKTRA_TP, function(p30) --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u28
                [3] = u9
                [4] = u5
                [5] = u6
                [6] = u12
                [7] = u2
                [8] = u11
                [9] = u26
                [10] = u27
            --]]
            local v31 = u29
            if p30 ~= nil then
                p30 = p30:GetMarkerReachedSignal("tp"):Connect(function(p32) --[[ Line: 59 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                        [2] = u9
                        [3] = u5
                        [4] = u6
                        [5] = u12
                        [6] = u2
                        [7] = u11
                        [8] = u26
                        [9] = u27
                    --]]
                    if u28.PrimaryPart then
                        local u33 = u9:getEntity(u28)
                        if u33 then
                            if p32 == "start" then
                                task.spawn(function() --[[ Line: 69 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u5
                                        [2] = u6
                                        [3] = u33
                                        [4] = u12
                                    --]]
                                    local v34 = u5.Assets.Effects.ElectricDashStart:Clone()
                                    v34.Parent = u6
                                    v34.CFrame = u33:getInstance():GetPivot()
                                    local v35 = u12
                                    local v36 = {}
                                    local v37 = #v36
                                    local v38 = v34:GetDescendants()
                                    table.move(v38, 1, #v38, v37 + 1, v36)
                                    v35:playEffects(v36, u33:getInstance(), {
                                        ["destroyAfterSec"] = 2
                                    })
                                    task.wait(2)
                                    v34:Destroy()
                                end)
                            else
                                task.spawn(function() --[[ Line: 86 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u5
                                        [2] = u6
                                        [3] = u33
                                        [4] = u12
                                    --]]
                                    local v39 = u5.Assets.Effects.ElectricDashBurst:Clone()
                                    v39.Parent = u6
                                    v39.CFrame = u33:getInstance():GetPivot()
                                    local v40 = u12
                                    local v41 = {}
                                    local v42 = #v41
                                    local v43 = v39:GetDescendants()
                                    table.move(v43, 1, #v43, v42 + 1, v41)
                                    v40:playEffects(v41, u33:getInstance(), {
                                        ["destroyAfterSec"] = 2
                                    })
                                    task.wait(2)
                                    v39:Destroy()
                                end)
                                local v44 = u2
                                local v45 = u11.ELECTRIC_DASH
                                local v46 = {
                                    ["playbackSpeedMultiplier"] = 1.27
                                }
                                local v47
                                if u26:isPreview(u27) then
                                    v47 = nil
                                else
                                    v47 = u28.PrimaryPart.Position
                                end
                                v46.position = v47
                                v44:playSound(v45, v46)
                            end
                        else
                            return nil
                        end
                    else
                        return nil
                    end
                end)
            end
            v31:GiveTask(p30)
        end))
    end
    function u22.onDisable(_, _, _, _) --[[ Line: 111 ]] end
    v19:registerHandler(v20, u22)
end
u3.CreateController(u14.new())
return nil