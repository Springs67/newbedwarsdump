local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "BoostPotionController"
    end,
    ["__index"] = u5
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10, ...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p10, ...)
    p10.Name = "BoostPotionController"
end
function u7.KnitStart(u11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u4
        [4] = u3
        [5] = u6
    --]]
    u5.KnitStart(u11)
    u2(function(u12, u13) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u11
            [3] = u3
        --]]
        u13:GetAttributeChangedSignal("JumpBoost"):Connect(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u4
                [3] = u12
                [4] = u11
                [5] = u3
            --]]
            if u13:GetAttribute("JumpBoost") == nil then
                if u4.LocalPlayer == u12 and u11.jumpMaid then
                    u11.jumpMaid:Destroy()
                    u11.jumpMaid = nil
                end
            elseif u4.LocalPlayer == u12 then
                u11.jumpMaid = u3.Controllers.JumpHeightController:getJumpModifier():addModifier({
                    ["jumpHeightMultiplier"] = u13:GetAttribute("JumpBoost")
                })
                return
            end
        end)
        u13:GetAttributeChangedSignal("SpeedBoost"):Connect(function() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u4
                [3] = u12
                [4] = u11
                [5] = u3
            --]]
            if u13:GetAttribute("SpeedBoost") == nil then
                if u4.LocalPlayer == u12 and u11.speedMaid then
                    u11.speedMaid:Destroy()
                    u11.speedMaid = nil
                end
            elseif u4.LocalPlayer == u12 then
                u11.speedMaid = u3.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["blockSprint"] = true,
                    ["moveSpeedMultiplier"] = u13:GetAttribute("SpeedBoost")
                })
                return
            end
        end)
    end)
    u6.Client:Get("SetPotionBoostMovementMultiplier"):Connect(function(p14) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u3
        --]]
        if p14.speedMultiplier == nil then
            if u11.speedMaid then
                u11.speedMaid:Destroy()
                u11.speedMaid = nil
            end
        else
            u11.speedMaid = u3.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["blockSprint"] = true,
                ["moveSpeedMultiplier"] = p14.speedMultiplier
            })
        end
        if p14.jumpMultiplier == nil then
            if u11.jumpMaid then
                u11.jumpMaid:Destroy()
                u11.jumpMaid = nil
            end
        else
            u11.jumpMaid = u3.Controllers.JumpHeightController:getJumpModifier():addModifier({
                ["jumpHeightMultiplier"] = p14.jumpMultiplier
            })
        end
    end)
end
u3.CreateController(u7.new())
return nil