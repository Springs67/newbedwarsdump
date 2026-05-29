local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u11 = v1.import(script, script.Parent, "ui", "skull-count-ui").SkullCountDisplay
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "SkullDropWeeklyEventController"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p15)
    p15.Name = "SkullDropWeeklyEventController"
    p15.settingUpTree = false
    p15.skullCount = 0
end
function u12.KnitStart(u16) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u8
        [4] = u10
        [5] = u2
    --]]
    u6.KnitStart(u16)
    local u17 = os.clock()
    local u18 = 0
    local u19 = {
        u9.SKULL_DROP_SKULL_DEPOSIT_01,
        u9.SKULL_DROP_SKULL_DEPOSIT_02,
        u9.SKULL_DROP_SKULL_DEPOSIT_03,
        u9.SKULL_DROP_SKULL_DEPOSIT_04
    }
    u8.Client:Get("SkullCollectEffect"):Connect(function(_) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u10
            [3] = u16
            [4] = u18
            [5] = u2
            [6] = u19
        --]]
        local v20 = os.clock() - u17
        if u10.isGameServer() then
            local v21 = u16
            v21.skullCount = v21.skullCount + 1
            if u16.skullCountTree then
                u16:updateStacksUI()
            else
                u16:mountStacksUI()
            end
        end
        if v20 < 2 then
            u18 = u18 + 1
        else
            u18 = 0
        end
        u17 = os.clock()
        local v22 = u2
        local v23 = u18
        local v24 = u19[math.min(3, v23) + 1]
        local v25 = {
            ["volumeMultiplier"] = 2
        }
        local v26 = u18 / 10
        v25.playbackSpeedMultiplier = math.clamp(v26, 0, 1) * 0.15 + 0.95
        v22:playSound(v24, v25)
    end)
end
function u12.updateStacksUI(p27) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u4
        [4] = u11
    --]]
    if p27.skullCountTree then
        local v28 = p27.skullCount
        local v29 = u7.GRIM_REAPER_KIT_SHOULDER_BUDDY_UGC_RENDER
        local _ = u5.LocalPlayer.Character
        local v30 = u4
        local v31 = p27.skullCountTree
        local v32 = {
            ["count"] = v28 == nil and 0 or v28,
            ["icon"] = v29
        }
        v30.update(v31, u4.createElement(u11, v32))
    end
end
function u12.mountStacksUI(p33) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u4
        [4] = u11
    --]]
    if p33.settingUpTree then
        return nil
    end
    p33.settingUpTree = true
    local v34 = u7.GRIM_REAPER_KIT_SHOULDER_BUDDY_UGC_RENDER
    local v35 = p33.skullCount
    local v36 = u3.Controllers.StatusInfoListController
    local v37 = {
        ["count"] = v35 == nil and 0 or v35,
        ["icon"] = v34
    }
    p33.skullCountTree = v36:waitForSetupAddElement(u4.createElement(u11, v37))
end
u3.CreateController(u12.new())
return nil