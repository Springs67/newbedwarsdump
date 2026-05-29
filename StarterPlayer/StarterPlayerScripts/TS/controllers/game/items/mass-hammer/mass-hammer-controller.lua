local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ActionButton
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ContextActionService
local u11 = v9.Players
local u12 = v9.RunService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local _ = v14.MASS_HAMMER
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "MassHammerController"
    end,
    ["__index"] = u13
})
u17.__index = u17
function u17.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
    --]]
    u13.constructor(p20)
    p20.Name = "MassHammerController"
    p20.maid = u7.new()
    p20.cooldownHasEnded = true
    p20.hasWeapon = false
end
function u17.KnitStart(u21) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
        [3] = u7
        [4] = u2
        [5] = u8
        [6] = u3
        [7] = u10
        [8] = u16
        [9] = u11
    --]]
    u13.KnitStart(u21)
    u12.Heartbeat:Connect(function() --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u7
            [3] = u2
            [4] = u8
            [5] = u3
            [6] = u10
        --]]
        if u21.cooldownHasEnded == true and u21.hasWeapon == true then
            if u21.useAbilityMaid ~= nil then
                return nil
            end
            u21.useAbilityMaid = u7.new()
            local v22 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u8.createElement(u3, {
                ["actionName"] = "use-mass_hammer",
                ["text"] = "Mass Hammer",
                ["interactionKey"] = Enum.KeyCode.F,
                ["onActivated"] = function() --[[ Name: onActivated, Line 53 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                    --]]
                    u21:activateAbility()
                end
            }))
            u21.useAbilityMaid:GiveTask(v22)
            u21.useAbilityMaid:GiveTask(function() --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                u10:UnbindAction("use-mass_hammer")
            end)
        elseif u21.useAbilityMaid then
            u21.useAbilityMaid:DoCleaning()
            u21.useAbilityMaid = nil
        end
    end)
    u16.Client:OnEvent("MassHammerSpeedMod", function(p23) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u21
        --]]
        if not u11.LocalPlayer.Character then
            return nil
        end
        u21:speedScale(u11.LocalPlayer.Character, p23.speed)
    end)
    u16.Client:OnEvent("EndMassHammerCooldown", function() --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21.cooldownHasEnded = true
    end)
    u16.Client:OnEvent("MassHammerCleanUp", function() --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21:cleanUpDuty()
        u21.cooldownHasEnded = false
    end)
end
function u17.activateAbility(p24) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    p24.cooldownHasEnded = false
    u16.Client:Get("UseMassHammer"):SendToServer()
end
function u17.isRelevantItem(_, p25) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return p25.itemType == u15.MASS_HAMMER
end
function u17.onEnable(p26, _, _) --[[ Line: 90 ]]
    p26.hasWeapon = true
end
function u17.onDisable(p27) --[[ Line: 93 ]]
    p27.hasWeapon = false
    p27.maid:DoCleaning()
    p27:cleanUpDuty()
end
function u17.speedScale(p28, p29, p30) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v31 = p29:WaitForChild("Humanoid")
    p28.maid:DoCleaning()
    if v31 then
        p28.maid:GiveTask(u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["moveSpeedMultiplier"] = p30
        }))
    end
end
function u17.cleanUpDuty(p32) --[[ Line: 108 ]]
    if p32.useAbilityMaid then
        p32.useAbilityMaid:DoCleaning()
        p32.useAbilityMaid = nil
    end
end
v5.CreateController(u17.new())
return nil