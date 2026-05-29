local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.DeviceUtil
local u5 = v2.SoundManager
local u6 = v2.WatchCollectionTag
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "AnniversaryCakeController"
    end,
    ["__index"] = u9
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
        [1] = u9
    --]]
    u9.constructor(p17)
    p17.Name = "AnniversaryCakeController"
end
function u14.KnitStart(p18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u6
        [4] = u8
        [5] = u4
        [6] = u12
        [7] = u3
        [8] = u11
        [9] = u10
        [10] = u5
        [11] = u13
    --]]
    u9.KnitStart(p18)
    if u7.Controllers.SpectateController:isSpectating() then
        return nil
    end
    u6("cake", function(u19) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
            [3] = u4
            [4] = u12
            [5] = u3
            [6] = u11
            [7] = u10
            [8] = u5
            [9] = u13
        --]]
        local u20 = u19:GetAttribute("Team")
        task.spawn(function() --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u19
                [3] = u7
                [4] = u8
                [5] = u4
                [6] = u12
                [7] = u3
                [8] = u11
                [9] = u10
                [10] = u5
                [11] = u13
            --]]
            while u20 == nil do
                task.wait(1)
                u20 = u19:GetAttribute("Team")
            end
            local v21 = u20
            local v22 = u7.Controllers.TeamController:getPlayerTeam(u8.LocalPlayer)
            if v22 ~= nil then
                v22 = v22.id
            end
            if v21 == v22 then
                local v23 = u7.Controllers.ProximityPromptController:createProximityPrompt({
                    ["ActionText"] = "Take a slice!",
                    ["ObjectText"] = "Birthday Cake",
                    ["RequiresLineOfSight"] = false,
                    ["MaxActivationDistance"] = 8,
                    ["HoldDuration"] = 2,
                    ["Parent"] = u19,
                    ["ClickablePrompt"] = u4.isMobileControls()
                })
                local u24 = nil
                v23.Triggered:Connect(function(p25) --[[ Line: 61 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u12
                        [3] = u19
                    --]]
                    local v26 = u7.Controllers.TeamController:getPlayerTeam(p25)
                    if v26 ~= nil then
                        v26 = v26.name
                    end
                    local v27 = {
                        ["block"] = u19
                    }
                    u12.Client:Get("PlayerEatCake"):SendToServer(v27)
                end)
                v23.PromptButtonHoldBegan:Connect(function(p28) --[[ Line: 71 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u24
                        [3] = u3
                        [4] = u11
                        [5] = u10
                        [6] = u5
                        [7] = u13
                    --]]
                    if p28 == u8.LocalPlayer then
                        u24 = u3:playAnimation(u8.LocalPlayer, u11:getAssetId(u10.EAT), {
                            ["looped"] = true
                        })
                        u5:playSound(u13.EAT_FOOD_1)
                    end
                end)
                v23.PromptButtonHoldEnded:Connect(function(p29) --[[ Line: 79 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u24
                    --]]
                    if p29 == u8.LocalPlayer then
                        local v30 = u24
                        if v30 ~= nil then
                            v30:Stop()
                        end
                        local v31 = u24
                        if v31 ~= nil then
                            v31:Destroy()
                        end
                    end
                end)
            end
        end)
    end)
end
u7.CreateController(u14.new())
return nil