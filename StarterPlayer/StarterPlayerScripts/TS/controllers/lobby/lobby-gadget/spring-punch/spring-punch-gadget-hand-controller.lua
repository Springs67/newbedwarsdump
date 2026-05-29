local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MobileTouchType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "SpringPunchGadgetHandController"
    end,
    ["__index"] = u9
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
    --]]
    u9.constructor(p15)
    p15.Name = "SpringPunchGadgetHandController"
    p15.maid = u5.new()
    p15.lastAttackTime = 0
    p15.enableTime = 0
end
function u12.KnitStart(p16) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p16)
end
function u12.onEnable(u17, _) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u3
    --]]
    u17.enableTime = u8:GetServerTimeNow()
    local v18 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v20 = {
        ["action"] = "Attack",
        ["actionId"] = "Spring Punch Attack",
        ["boundFunction"] = function(_, p19, _) --[[ Name: boundFunction, Line 43 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            if p19 == Enum.UserInputState.Begin then
                u17:attack()
            end
        end,
        ["mobile"] = {
            ["touchType"] = u3.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 50 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                u17:attack()
            end
        }
    }
    local v21 = v18:bindAction(v20)
    u17.maid:GiveTask(v21)
end
function u12.onDisable(p22) --[[ Line: 57 ]]
    p22.maid:DoCleaning()
end
function u12.isRelevantItem(_, p23) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return p23.itemType == u10.LOBBY_SPRING_PUNCH
end
function u12.attack(p24) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u4
        [4] = u11
    --]]
    if u8:GetServerTimeNow() - p24.enableTime < 0.1 then
        return nil
    end
    if u8:GetServerTimeNow() - p24.lastAttackTime < 0.25 then
        return nil
    end
    p24.lastAttackTime = u8:GetServerTimeNow()
    local v25 = u8.CurrentCamera.CFrame.LookVector
    local v26 = u7.LocalPlayer.Character.PrimaryPart.Position
    task.spawn(function() --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
        --]]
        u4.Controllers.SpringPunchGadgetController:animatePunch(u7.LocalPlayer, nil)
    end)
    u11.Client:Get("LobbySpringPunchFromClient"):SendToServer({
        ["originPosition"] = v26,
        ["direction"] = v25
    })
end
u4.CreateController(u12.new())
return nil