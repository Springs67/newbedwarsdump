local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").CollectionTagAdded
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "JuggernautController"
    end,
    ["__index"] = u8
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p16)
    p16.Name = "JuggernautController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u6
        [4] = u5
        [5] = u9
        [6] = u7
        [7] = u11
        [8] = u10
        [9] = u12
    --]]
    u8.KnitStart(p17)
    u2("juggernaut-crate", function(u18) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u9
            [4] = u7
            [5] = u11
            [6] = u10
            [7] = u12
        --]]
        local u19 = u6.new()
        local u20 = u5.Controllers.ProximityPromptController:createProximityPrompt({
            ["HoldDuration"] = 3,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 10,
            ["ActionText"] = "Open",
            ["ObjectText"] = "Juggernaut Crate",
            ["ClickablePrompt"] = false,
            ["Parent"] = u18
        })
        u18.AncestryChanged:Connect(function(_, p21) --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            if p21 == nil then
                u19:DoCleaning()
            end
        end)
        local u23 = u9.On(function(p22, _, _, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u20
            --]]
            if p22 == u7.LocalPlayer.Character then
                u20:InputHoldEnd()
            end
        end)
        u19:GiveTask(function() --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23()
        end)
        u20.PromptButtonHoldBegan:Connect(function(_) --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u11
                [3] = u7
                [4] = u10
                [5] = u20
            --]]
            local u24 = u6.new()
            local u25 = u11:playAnimation(u7.LocalPlayer, u10.OPEN_CRATE)
            u24:GiveTask(function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                local v26 = u25
                if v26 ~= nil then
                    v26:Stop()
                end
                local v27 = u25
                if v27 ~= nil then
                    v27:Destroy()
                end
            end)
            u20.PromptButtonHoldEnded:Connect(function() --[[ Line: 71 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24:DoCleaning()
            end)
            u20.AncestryChanged:Connect(function(_, p28) --[[ Line: 74 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                if p28 == nil then
                    u24:DoCleaning()
                end
            end)
        end)
        u20.Triggered:Connect(function(_) --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u18
            --]]
            local v29 = {
                ["blockInstance"] = u18
            }
            u12.Client:Get("OpenJuggernautCrate"):SendToServer(v29)
        end)
    end)
end
v4.CreateController(u13.new())
return nil