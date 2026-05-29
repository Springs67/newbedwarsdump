local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.TweenService
local u7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u10 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "NightmareBetaSeasonEmoteController"
    end,
    ["__index"] = u8
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
        [1] = u8
    --]]
    u8.constructor(p14)
    p14.Name = "NightmareBetaSeasonEmoteController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u9
        [4] = u10
        [5] = u5
        [6] = u7
        [7] = u2
        [8] = u6
    --]]
    u8.KnitStart(p15)
    local v16 = u3.Controllers.EmoteHandlerController
    local v17 = u9.NIGHTMARE_1
    local u18 = u10
    local u19 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
            return "Anonymous"
        end,
        ["__index"] = u18
    })
    u19.__index = u19
    function u19.new(...) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        local v20 = u19
        local v21 = setmetatable({}, v20)
        return v21:constructor(...) or v21
    end
    function u19.constructor(p22, ...) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18.constructor(p22, ...)
    end
    function u19.onEnable(_, _, p23, _, p24) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u2
            [4] = u6
        --]]
        local u25 = u5.Assets.Effects.NightmareEmote:Clone()
        u25.Parent = u7
        u25:PivotTo(p23.LowerTorso.CFrame + Vector3.new(0, -2, 0))
        for v26, v27 in u25:GetDescendants() do
            local _ = v26 - 1
            if v27:IsA("BasePart") then
                u2:setQueryIgnored(v27, true)
                v27.CanCollide = false
                v27.Anchored = true
            end
        end
        local v28 = u25:FindFirstChild("Outer")
        if v28 then
            u6:Create(v28, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                ["Orientation"] = v28.Orientation + Vector3.new(0, 360, 0)
            }):Play()
        end
        local v29 = u25:FindFirstChild("Middle")
        if v29 then
            u6:Create(v29, TweenInfo.new(12.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                ["Orientation"] = v29.Orientation + Vector3.new(0, -360, 0)
            }):Play()
        end
        p24:GiveTask(function() --[[ Line: 93 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            u25:Destroy()
        end)
    end
    function u19.onDisable(_, _, _, _) --[[ Line: 97 ]] end
    v16:registerHandler(v17, u19)
end
u3.CreateController(u11.new())
return nil