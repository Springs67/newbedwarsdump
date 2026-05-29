local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.GameQueryUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u13 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler
local u14 = v3.registerConstants(script, {
    ["PlayerAnimStartTime"] = 0.5
})
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "EasterBunnyEmoteHandlerController"
    end,
    ["__index"] = u9
})
u15.__index = u15
function u15.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p18)
    p18.Name = "EasterBunnyEmoteHandlerController"
end
function u15.KnitStart(p19) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u12
        [4] = u13
        [5] = u7
        [6] = u4
        [7] = u8
        [8] = u11
        [9] = u10
        [10] = u14
    --]]
    u9.KnitStart(p19)
    local v20 = u5.Controllers.EmoteHandlerController
    local v21 = u12.EASTER_BUNNY
    local u22 = u13
    local u23 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 44 ]]
            return "Anonymous"
        end,
        ["__index"] = u22
    })
    u23.__index = u23
    function u23.new(...) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v24 = u23
        local v25 = setmetatable({}, v24)
        return v25:constructor(...) or v25
    end
    function u23.constructor(p26, ...) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22.constructor(p26, ...)
    end
    function u23.onEnable(_, _, p27, _, p28) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u8
            [4] = u11
            [5] = u10
            [6] = u14
        --]]
        if not p27.PrimaryPart then
            return nil
        end
        local u29 = u7.Assets.Misc.EasterBunny:Clone()
        for _, v30 in u29:GetDescendants() do
            if v30:IsA("BasePart") then
                v30.CanCollide = false
                u4:setQueryIgnored(v30, true)
            end
        end
        u29.Parent = u8
        local u31 = u29:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u11:getAnimation(u10.EASTER_BUNNY_EMOTE_BUNNY))
        local u32 = p27:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u11:getAnimation(u10.EASTER_BUNNY_EMOTE_PLAYER))
        local v33 = p27.PrimaryPart.CFrame
        local v34 = p27.Humanoid.HipHeight + p27.PrimaryPart.Size.Y / 2
        u29:PivotTo(v33 - Vector3.new(0, v34, 0) + Vector3.new(0, 0.2, 0))
        u31:Play()
        u32:Play()
        u32.TimePosition = u14.PlayerAnimStartTime
        p28:GiveTask(function() --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u31
                [3] = u32
            --]]
            u29:Destroy()
            u31:Stop()
            u31:Destroy()
            u32:Stop()
            u32:Destroy()
        end)
    end
    function u23.onDisable(_, _, _, _) --[[ Line: 89 ]] end
    v20:registerHandler(v21, u23)
end
u5.CreateController(u15.new())
return nil