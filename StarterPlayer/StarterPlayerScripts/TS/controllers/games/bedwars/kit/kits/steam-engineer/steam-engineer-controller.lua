local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u14 = v1.import(script, script.Parent, "ui", "steam-engineer-ui").SteamEngineerDisplay
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "SteamEngineerController"
    end,
    ["__index"] = u13
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u11
        [3] = u9
    --]]
    u13.constructor(p18, u11.STEAM_ENGINEER, {
        ["animations"] = { u9.STEAM_ENGINEER_OVERCLOCK }
    })
    p18.Name = "SteamEngineerController"
    p18.settingUpGatherBotTextTree = false
end
function u15.KnitStart(p19) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.KnitStart(p19)
end
function u15.onKitLocalActivated(u20, p21) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u6
        [4] = u14
    --]]
    if not (u20.gatherBotAmountTree or u20.settingUpGatherBotTextTree) then
        u20.settingUpGatherBotTextTree = true
        local v22 = u7.LocalPlayer:GetAttribute("GatherBotBasicOwned")
        local v23 = u7.LocalPlayer:GetAttribute("GatherBotProOwned")
        local v24 = u5.Controllers.StatusInfoListController
        local v25 = {
            ["gatherBotBasicAmount"] = v22 == nil and 0 or v22,
            ["gatherBotProAmount"] = v23 == nil and 0 or v23
        }
        u20.gatherBotAmountTree = v24:waitForSetupAddElement(u6.createElement(u14, v25))
        p21:GiveTask(function() --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u6
            --]]
            if u20.gatherBotAmountTree then
                u6.unmount(u20.gatherBotAmountTree)
            end
        end)
        p21:GiveTask(u7.LocalPlayer:GetAttributeChangedSignal("GatherBotBasicOwned"):Connect(function(_) --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20:updateTree()
        end))
        p21:GiveTask(u7.LocalPlayer:GetAttributeChangedSignal("GatherBotProOwned"):Connect(function(_) --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20:updateTree()
        end))
    end
end
function u15.onAbilityUsed(_, p26, p27) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u3
        [4] = u10
        [5] = u9
        [6] = u4
        [7] = u12
    --]]
    if p27.ability == u8.STEAM_ENGINEER_OVERCLOCK and p26 == u7.LocalPlayer.Character then
        u3:playAnimation(u7.LocalPlayer, u10:getAssetId(u9.STEAM_ENGINEER_OVERCLOCK))
        task.delay(0.2, function() --[[ Line: 74 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u12
                [3] = u7
            --]]
            local v28 = u4
            local v29 = u12.STEAM_ENGINEER_OVERCLOCK_ACTIVATE
            local v30 = {}
            local v31 = u7.LocalPlayer.Character
            if v31 ~= nil then
                v31 = v31:GetPivot().Position
            end
            v30.position = v31
            v28:playSound(v29, v30)
        end)
    end
end
function u15.onKitLocalDeactivated(_) --[[ Line: 88 ]] end
function u15.onKitReplicationActivated(_, _) --[[ Line: 90 ]] end
function u15.onKitReplicationDeactivated(_) --[[ Line: 92 ]] end
function u15.onInnateAbilityEnabled(_, _, _) --[[ Line: 94 ]] end
function u15.updateTree(p32) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u14
    --]]
    if p32.gatherBotAmountTree then
        local v33 = u7.LocalPlayer:GetAttribute("GatherBotBasicOwned")
        local v34 = u7.LocalPlayer:GetAttribute("GatherBotProOwned")
        local v35 = u6
        local v36 = p32.gatherBotAmountTree
        local v37 = {
            ["gatherBotBasicAmount"] = v33 == nil and 0 or v33,
            ["gatherBotProAmount"] = v34 == nil and 0 or v34
        }
        v35.update(v36, u6.createElement(u14, v37))
    end
end
u5.CreateController(u15.new())
return nil