local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ConstantManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-utils").EmoteUtils
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler
local u16 = v1.import(script, script.Parent, "coin-toss-result").CoinTossResult
v2.registerConstants(script, {
    ["PlayerAnimStartTime"] = 0.5
})
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "CoinTossHandlerController"
    end,
    ["__index"] = u11
})
u17.__index = u17
function u17.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p20)
    p20.Name = "CoinTossHandlerController"
end
function u17.KnitStart(p21) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u4
        [4] = u12
        [5] = u5
        [6] = u7
        [7] = u16
        [8] = u9
        [9] = u15
        [10] = u10
        [11] = u6
        [12] = u13
    --]]
    u11.KnitStart(p21)
    u14.Client:OnEvent("CoinTossEmotePlayed", function(u22) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u12
            [3] = u5
            [4] = u7
            [5] = u16
            [6] = u9
        --]]
        local u23 = u22.sourcePlayer
        local u24 = u22.sourcePlayer.Character
        if not u24 then
            return nil
        end
        task.delay(1.3, function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u23
                [3] = u12
                [4] = u5
                [5] = u7
                [6] = u16
                [7] = u24
                [8] = u22
                [9] = u9
            --]]
            if u4.Controllers.EmoteController:getPlayingEmote(u23) ~= u12.COIN_TOSS then
                return nil
            end
            u5.Controllers.CoinTossHandlerController.guiTree = u7.mount(u7.createElement(u16, {
                ["Character"] = u24,
                ["ResultImage"] = u22.result
            }), u9.LocalPlayer:WaitForChild("PlayerGui"))
        end)
    end)
    local v25 = u4.Controllers.EmoteHandlerController
    local v26 = u12.COIN_TOSS
    local u27 = u15
    local u28 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 64 ]]
            return "Anonymous"
        end,
        ["__index"] = u27
    })
    u28.__index = u28
    function u28.new(...) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        local v29 = u28
        local v30 = setmetatable({}, v29)
        return v30:constructor(...) or v30
    end
    function u28.constructor(p31, ...) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27.constructor(p31, ...)
    end
    function u28.onEnable(p32, p33, u34, _, u35) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u6
            [3] = u7
            [4] = u13
            [5] = u12
            [6] = u5
            [7] = u16
            [8] = u9
        --]]
        if not u34.PrimaryPart then
            return nil
        end
        local v36 = u10.Assets.Misc.Coin:Clone()
        v36.Parent = u34
        v36:PivotTo(u34.RightHand.CFrame)
        p32:setupInstance(v36)
        v36.CanCollide = false
        u35:GiveTask(v36)
        u35:GiveTask((u6("Motor6D", {
            ["Parent"] = v36,
            ["Part0"] = u34.RightHand,
            ["Part1"] = v36
        })))
        if p32:isPreview(p33) then
            u35:GiveTask(task.delay(1.3, function() --[[ Line: 94 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u34
                    [3] = u13
                    [4] = u12
                    [5] = u5
                    [6] = u16
                    [7] = u9
                    [8] = u35
                --]]
                local v37 = u7
                local v38 = {
                    ["Character"] = u34
                }
                local v39 = u13.getIconResult(u12.COIN_TOSS)
                v38.ResultImage = v39 == nil and "" or v39
                u5.Controllers.CoinTossHandlerController.guiTree = v37.mount(u7.createElement(u16, v38), u9.LocalPlayer:WaitForChild("PlayerGui"))
                u35:GiveTask(function() --[[ Line: 105 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u7
                    --]]
                    if u5.Controllers.CoinTossHandlerController.guiTree then
                        u7.unmount(u5.Controllers.CoinTossHandlerController.guiTree)
                    end
                end)
            end))
        end
    end
    function u28.onDisable(_, _, _, _) --[[ Line: 113 ]] end
    v25:registerHandler(v26, u28)
end
u4.CreateController(u17.new())
return nil