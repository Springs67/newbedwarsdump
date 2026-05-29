local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MobileTouchType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "spring-punch", "spring-punch-balance").SpringPunchBalance
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "SpringPunchHandController"
    end,
    ["__index"] = u9
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
        [1] = u9
        [2] = u5
    --]]
    u9.constructor(p16)
    p16.Name = "SpringPunchHandController"
    p16.maid = u5.new()
    p16.lastAttackTime = 0
    p16.enableTime = 0
end
function u13.KnitStart(p17) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p17)
end
function u13.onEnable(u18, _) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u3
    --]]
    u18.enableTime = u8:GetServerTimeNow()
    local v19 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v21 = {
        ["action"] = "Attack",
        ["actionId"] = "Spring Punch Attack",
        ["boundFunction"] = function(_, p20, _) --[[ Name: boundFunction, Line 44 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            if p20 == Enum.UserInputState.Begin then
                u18:attack()
            end
        end,
        ["mobile"] = {
            ["touchType"] = u3.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 51 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18:attack()
            end
        }
    }
    local v22 = v19:bindAction(v21)
    u18.maid:GiveTask(v22)
end
function u13.onDisable(p23) --[[ Line: 64 ]]
    p23.maid:DoCleaning()
end
function u13.isRelevantItem(_, p24) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return p24.itemType == u11.SPRING_PUNCH
end
function u13.attack(p25) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u7
        [4] = u4
        [5] = u12
    --]]
    if u8:GetServerTimeNow() - p25.enableTime < 0.1 then
        return nil
    end
    if u8:GetServerTimeNow() - p25.lastAttackTime < u10.COOLDOWN then
        return nil
    end
    p25.lastAttackTime = u8:GetServerTimeNow()
    local v26 = u8.CurrentCamera.CFrame.LookVector
    local v27 = u7.LocalPlayer.Character.PrimaryPart.Position
    task.spawn(function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
        --]]
        u4.Controllers.SpringPunchController:animatePunch(u7.LocalPlayer, nil)
    end)
    u12.Client:Get("SpringPunchFromClient"):SendToServer({
        ["originPosition"] = v27,
        ["direction"] = v26
    })
end
u4.CreateController(u13.new())
return nil