local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local u5 = v2.WatchPlayerCharacter
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "LobbyMapController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p15)
    p15.Name = "LobbyMapController"
end
function u12.KnitStart(_) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u4
        [4] = u10
        [5] = u9
        [6] = u11
        [7] = u3
    --]]
    u5(u7.LocalPlayer, function(p16, p17) --[[ Line: 33 ]]
        for v18, v19 in p16:GetDescendants() do
            local _ = v18 - 1
            if v19:IsA("BasePart") then
                v19.CastShadow = false
            end
        end
        p17:GiveTask(p16.DescendantAdded:Connect(function(p20) --[[ Line: 43 ]]
            if p20:IsA("BasePart") then
                p20.CastShadow = false
            end
        end))
    end)
    u4("DodoBirdLobby", function(u21) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u9
            [3] = u11
            [4] = u3
        --]]
        local v22 = u21:WaitForChild("AnimationController", 2)
        if v22 == nil then
            error("AnimationController was not added to dodoBirdMount in time")
        end
        local v23 = v22:WaitForChild("Animator", 2)
        if v23 == nil then
            error("Animator was not added to AnimationController in time")
        end
        local u24 = v23:LoadAnimation(u10:getAnimation(u9.DODO_BIRD_SQUAWK))
        u24.Looped = false
        local v25 = v23:LoadAnimation(u10:getAnimation(u9.DODO_BIRD_IDLE))
        v25.Priority = Enum.AnimationPriority.Idle
        v25:Play()
        local function u27() --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u3
                [3] = u21
                [4] = u24
            --]]
            local v26
            if math.random(0, 1) == 1 then
                v26 = u11.DODO_BIRD_SQUAWK_2
            else
                v26 = u11.DODO_BIRD_SQUAWK_1
            end
            u3:playSound(v26, {
                ["rollOffMaxDistance"] = 100,
                ["position"] = u21:GetPivot().Position
            })
            u24:Play()
        end
        local function u29() --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u27
                [3] = u29
            --]]
            local v28 = math.random(15, 30)
            task.delay(v28, function() --[[ Line: 74 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u27
                    [3] = u29
                --]]
                if not u21 then
                    return nil
                end
                u27()
                u29()
            end)
        end
        u29()
    end)
end
return {
    ["LobbyMapController"] = v6.CreateController(u12.new())
}