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
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u16 = v1.import(script, script.Parent, "ui", "jellyfish-item-timer").JellyfishItemTimerApp
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "JellyfishKitController"
    end,
    ["__index"] = u15
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u12
    --]]
    u15.constructor(p20, u12.JELLYFISH)
    p20.Name = "JellyfishKitController"
    p20.isPreloaded = false
end
function u17.onKitLocalActivated(p21, p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
        [3] = u14
        [4] = u9
        [5] = u7
        [6] = u11
        [7] = u6
        [8] = u16
    --]]
    if not p21.isPreloaded then
        u5.Controllers.PreloadController:runPreload({
            ["imageIds"] = { u13.ELECTRIFY_JELLYFISH_ICON },
            ["sounds"] = {
                u14.JELLYFISH_DEPLOY_1,
                u14.JELLYFISH_DEPLOY_2,
                u14.JELLYFISH_DEPLOY_3,
                u14.JELLYFISH_PULSE_1,
                u14.JELLYFISH_PULSE_2,
                u14.JELLYFISH_PULSE_3,
                u14.JELLYFISH_PULSE_4,
                u14.JELLYFISH_PULSE_5,
                u14.JELLYFISH_ZAP_1,
                u14.JELLYFISH_ZAP_2
            },
            ["animations"] = {
                u9.JELLYFISH_ATTACK,
                u9.JELLYFISH_IDLE,
                u9.JELLYFISH_SPAWN,
                u9.JELLYFISH_MOUNT_IDLE
            }
        })
        local v23 = u7.LocalPlayer.Character
        if v23 then
            local v24 = u5.Controllers.KitController:getKitSkin(v23)
            if v24 == u11.JELLYFISH_HOLIDAY then
                u5.Controllers.PreloadController:runPreload({
                    ["sounds"] = {
                        u14.HOLIDAY_JELLYFISH_DEPLOY_1,
                        u14.HOLIDAY_JELLYFISH_DEPLOY_2,
                        u14.HOLIDAY_JELLYFISH_DEPLOY_3,
                        u14.HOLIDAY_JELLYFISH_PULSE_1,
                        u14.HOLIDAY_JELLYFISH_PULSE_2,
                        u14.HOLIDAY_JELLYFISH_PULSE_3,
                        u14.HOLIDAY_JELLYFISH_PULSE_4,
                        u14.HOLIDAY_JELLYFISH_PULSE_5,
                        u14.HOLIDAY_JELLYFISH_ZAP_1,
                        u14.HOLIDAY_JELLYFISH_ZAP_2
                    }
                })
            elseif v24 == u11.JELLYFISH_DESSERT then
                u5.Controllers.PreloadController:runPreload({
                    ["sounds"] = {
                        u14.DESSERT_JELLYFISH_DEPLOY_1,
                        u14.DESSERT_JELLYFISH_DEPLOY_2,
                        u14.DESSERT_JELLYFISH_DEPLOY_3,
                        u14.DESSERT_JELLYFISH_PULSE_1,
                        u14.DESSERT_JELLYFISH_PULSE_2,
                        u14.DESSERT_JELLYFISH_PULSE_3,
                        u14.DESSERT_JELLYFISH_PULSE_4,
                        u14.DESSERT_JELLYFISH_PULSE_5,
                        u14.DESSERT_JELLYFISH_ZAP_1,
                        u14.DESSERT_JELLYFISH_ZAP_2
                    }
                })
            end
        end
        p21.isPreloaded = true
    end
    local u25 = u5.Controllers.StatusInfoListController:waitForSetupAddElement(u6.createElement(u16))
    p22:GiveTask(function() --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u25
        --]]
        u6.unmount(u25)
    end)
end
function u17.onAbilityUsed(_, _, p26) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u4
        [4] = u14
        [5] = u3
        [6] = u10
        [7] = u9
    --]]
    if p26.ability ~= u8.ELECTRIFY_JELLYFISH then
        return nil
    end
    local v27 = p26.userCharacter == u7.LocalPlayer.Character
    local v28 = u4
    local v29 = u14.JELLYFISH_PULSE_1
    local v30 = {}
    local v31
    if v27 then
        v31 = nil
    else
        v31 = p26.userCharacter:GetPivot().Position
    end
    v30.position = v31
    v28:playSound(v29, v30)
    u3:playAnimation(p26.userCharacter, u10:getAssetId(u9.USE_GRAVESTONE), {
        ["looped"] = false
    })
end
function u17.onKitLocalDeactivated(_) --[[ Line: 77 ]] end
function u17.onKitReplicationActivated(_, _) --[[ Line: 79 ]] end
function u17.onKitReplicationDeactivated(_) --[[ Line: 81 ]] end
function u17.onInnateAbilityEnabled(_, _, _) --[[ Line: 83 ]] end
u5.CreateController(u17.new())
return nil