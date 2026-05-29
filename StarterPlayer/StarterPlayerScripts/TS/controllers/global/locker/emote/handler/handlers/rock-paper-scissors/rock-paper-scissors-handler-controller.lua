local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ConstantManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-utils").EmoteUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler
local u13 = v1.import(script, script.Parent, "rps-result").RPSResult
v2.registerConstants(script, {
    ["PlayerAnimStartTime"] = 0.5
})
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "RockPaperScissorsHandlerController"
    end,
    ["__index"] = u8
})
u14.__index = u14
function u14.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p17)
    p17.Name = "RockPaperScissorsHandlerController"
end
function u14.KnitStart(p18) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
        [3] = u4
        [4] = u9
        [5] = u5
        [6] = u6
        [7] = u13
        [8] = u7
        [9] = u12
        [10] = u10
    --]]
    u8.KnitStart(p18)
    u11.Client:OnEvent("RPSEmotePlayed", function(u19) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u9
            [3] = u5
            [4] = u6
            [5] = u13
            [6] = u7
        --]]
        local u20 = u19.sourcePlayer
        local u21 = u19.sourcePlayer.Character
        if not u21 then
            return nil
        end
        task.delay(2.35, function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u20
                [3] = u9
                [4] = u5
                [5] = u6
                [6] = u13
                [7] = u21
                [8] = u19
                [9] = u7
            --]]
            if u4.Controllers.EmoteController:getPlayingEmote(u20) ~= u9.ROCK_PAPER_SCISSORS then
                return nil
            end
            u5.Controllers.RockPaperScissorsHandlerController.rpsTree = u6.mount(u6.createElement(u13, {
                ["Character"] = u21,
                ["ResultImage"] = u19.result
            }), u7.LocalPlayer:WaitForChild("PlayerGui"))
        end)
    end)
    local v22 = u4.Controllers.EmoteHandlerController
    local v23 = u9.ROCK_PAPER_SCISSORS
    local u24 = u12
    local u25 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 61 ]]
            return "Anonymous"
        end,
        ["__index"] = u24
    })
    u25.__index = u25
    function u25.new(...) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        local v26 = u25
        local v27 = setmetatable({}, v26)
        return v27:constructor(...) or v27
    end
    function u25.constructor(p28, ...) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24.constructor(p28, ...)
    end
    function u25.onEnable(p29, p30, u31, _, p32) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u10
            [3] = u9
            [4] = u5
            [5] = u13
            [6] = u7
        --]]
        if not u31.PrimaryPart then
            return nil
        end
        if p29:isPreview(p30) then
            p32:GiveTask(task.delay(2.35, function() --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u31
                    [3] = u10
                    [4] = u9
                    [5] = u5
                    [6] = u13
                    [7] = u7
                --]]
                local v33 = u6
                local v34 = {
                    ["Character"] = u31
                }
                local v35 = u10.getIconResult(u9.ROCK_PAPER_SCISSORS)
                v34.ResultImage = v35 == nil and "" or v35
                u5.Controllers.RockPaperScissorsHandlerController.rpsTree = v33.mount(u6.createElement(u13, v34), u7.LocalPlayer:WaitForChild("PlayerGui"))
            end))
        end
    end
    function u25.onDisable(_, _, _, _) --[[ Line: 93 ]] end
    v22:registerHandler(v23, u25)
end
u4.CreateController(u14.new())
return nil