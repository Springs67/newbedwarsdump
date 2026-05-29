local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u9 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "CongaLineEmoteController"
    end,
    ["__index"] = u7
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p13)
    p13.Name = "CongaLineEmoteController"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u8
        [4] = u9
        [5] = u6
        [6] = u3
        [7] = u5
    --]]
    u7.KnitStart(p14)
    local v15 = u2.Controllers.EmoteHandlerController
    local v16 = u8.CONGA_LINE
    local u17 = u9
    local u18 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
            return "Anonymous"
        end,
        ["__index"] = u17
    })
    u18.__index = u18
    function u18.new(...) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        local v19 = u18
        local v20 = setmetatable({}, v19)
        return v20:constructor(...) or v20
    end
    function u18.constructor(p21, ...) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17.constructor(p21, ...)
    end
    function u18.onEnable(_, p22, p23, _, p24) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u5
            [4] = u2
        --]]
        if p23.PrimaryPart then
            local v25 = u6.Assets.Effects.CongaConfetti:Clone()
            v25.Parent = p23.PrimaryPart
            v25.Position = p23.PrimaryPart.Position
            u3("WeldConstraint", {
                ["Part0"] = v25,
                ["Part1"] = p23.PrimaryPart,
                ["Parent"] = p23
            })
            p24:GiveTask(v25)
        end
        if p22 ~= u5.LocalPlayer.UserId then
            return nil
        end
        p24:GiveTask(u2.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["constantSpeedMultiplier"] = 0.3,
            ["blockSprint"] = true
        }))
    end
    function u18.onDisable(_, _, _, _) --[[ Line: 70 ]] end
    v15:registerHandler(v16, u18)
end
u2.CreateController(u10.new())
return nil