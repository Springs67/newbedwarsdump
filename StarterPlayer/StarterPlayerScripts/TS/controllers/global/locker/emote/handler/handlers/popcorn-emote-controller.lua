local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Debris
local u8 = v6.ReplicatedStorage
local u9 = v6.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u16 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "PopcornEmoteController"
    end,
    ["__index"] = u10
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p20)
    p20.Name = "PopcornEmoteController"
end
function u17.KnitStart(p21) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u12
        [4] = u16
        [5] = u8
        [6] = u3
        [7] = u15
        [8] = u11
        [9] = u7
        [10] = u9
        [11] = u14
        [12] = u13
        [13] = u4
    --]]
    u10.KnitStart(p21)
    local v22 = u5.Controllers.EmoteHandlerController
    local v23 = u12.POPCORN
    local u24 = u16
    local u25 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 44 ]]
            return "Anonymous"
        end,
        ["__index"] = u24
    })
    u25.__index = u25
    function u25.new(...) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        local v26 = u25
        local v27 = setmetatable({}, v26)
        return v27:constructor(...) or v27
    end
    function u25.constructor(p28, ...) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24.constructor(p28, ...)
    end
    function u25.onEnable(u29, u30, u31, _, u32) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u3
            [3] = u15
            [4] = u11
            [5] = u7
            [6] = u9
            [7] = u14
            [8] = u13
            [9] = u4
        --]]
        local u33 = u8.Assets.Misc.PopcornEmote.PopcornBucket:Clone()
        u33.Parent = u31
        for v34, v35 in u33:GetDescendants() do
            local _ = v34 - 1
            if v35:IsA("BasePart") then
                u3:setQueryIgnored(v35, true)
            end
        end
        u15:weldCharacterAccessories(u31)
        local u36 = u8.Assets.Misc.PopcornEmote.Kernals
        u32:GiveTask((u29:watchEmoteAnimation(u30, u31, u11.EATING_POPCORN, function(p37) --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u36
                [3] = u7
                [4] = u33
                [5] = u9
                [6] = u3
                [7] = u14
                [8] = u29
                [9] = u13
                [10] = u30
                [11] = u31
                [12] = u4
            --]]
            local v38 = u32
            local v39
            if p37 == nil then
                v39 = p37
            else
                v39 = p37:GetMarkerReachedSignal("Eat"):Connect(function() --[[ Line: 76 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                        [2] = u7
                        [3] = u33
                        [4] = u9
                        [5] = u3
                        [6] = u14
                        [7] = u29
                        [8] = u13
                        [9] = u30
                        [10] = u31
                    --]]
                    local v40 = u36:GetChildren()
                    local function v44(p41) --[[ Line: 79 ]]
                        --[[
                        Upvalues:
                            [1] = u7
                            [2] = u33
                            [3] = u9
                            [4] = u3
                            [5] = u14
                        --]]
                        if not p41:IsA("BasePart") then
                            return nil
                        end
                        local v42 = p41:Clone()
                        u7:AddItem(v42, 1.5)
                        v42:PivotTo(u33.Handle:GetPivot())
                        v42.Parent = u9
                        v42.Anchored = false
                        u3:setQueryIgnored(v42, true)
                        local v43 = u14.randomUnitVector(Vector3.new(0, 1, 0), 0.3490658503988659)
                        v42:ApplyImpulse(v43 * (v42.AssemblyMass * 35))
                        v42:ApplyAngularImpulse(v43 * (v42.AssemblyMass * 10))
                    end
                    for v45, v46 in v40 do
                        v44(v46, v45 - 1, v40)
                    end
                    u29:playSound(u13.POPCORN_EAT, u30, {
                        ["rollOffMaxDistance"] = 55,
                        ["position"] = u31:GetPivot().Position
                    })
                end)
            end
            v38:GiveTask(v39)
            local v47 = u32
            if p37 ~= nil then
                p37 = p37:GetMarkerReachedSignal("Grab"):Connect(function() --[[ Line: 110 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u13
                        [3] = u29
                        [4] = u30
                        [5] = u31
                    --]]
                    local v48 = u4
                    local v49 = u13.POPCORN_GRAB
                    local v50 = {
                        ["rollOffMaxDistance"] = 55
                    }
                    local v51
                    if u29:isPreview(u30) then
                        v51 = nil
                    else
                        v51 = u31:GetPivot().Position
                    end
                    v50.position = v51
                    v48:playSound(v49, v50)
                end)
            end
            v47:GiveTask(p37)
        end)))
        u32:GiveTask(function() --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            u33:Destroy()
        end)
    end
    function u25.onDisable(_, _, _, _) --[[ Line: 124 ]] end
    v22:registerHandler(v23, u25)
end
u5.CreateController(u17.new())
return nil