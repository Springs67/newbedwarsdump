local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "BrbSignController"
    end,
    ["__index"] = u6
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u4
    --]]
    u6.constructor(p14)
    p14.Name = "BrbSignController"
    p14.playerMaid = {}
    p14.request = u10.Client:Get("AfkSignRequest")
    p14.partialInvisibility = {
        ["transparency"] = 0.9
    }
    p14.fullInvisibility = {
        ["transparency"] = 1
    }
    p14.localMaid = u4.new()
    p14.isActive = false
end
function u11.KnitStart(p15) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p15)
end
function u11.isRelevantItem(_, p16) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return p16.itemType == u9.BRB_SIGN
end
function u11.onEnable(p17, _, _) --[[ Line: 46 ]]
    p17:hookLocalPlayer()
    p17:active()
end
function u11.onDisable(p18) --[[ Line: 51 ]]
    p18:deactive()
    p18.localMaid:DoCleaning()
end
function u11.active(p19) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u8
        [4] = u7
    --]]
    local u20 = u2:playAnimation(u5.LocalPlayer, u8:getAssetId(u7.HOLDING_SIGN), {
        ["looped"] = true
    })
    p19.localMaid:GiveTask(function() --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        local v21 = u20
        if v21 ~= nil then
            v21:Stop()
        end
        local v22 = u20
        if v22 ~= nil then
            v22:Destroy()
        end
    end)
end
function u11.deactive(p23) --[[ Line: 74 ]]
    p23.localMaid:DoCleaning()
end
function u11.hookLocalPlayer(u24) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local u25 = u5.LocalPlayer.Character
    if u25 ~= nil then
        u25 = u25.PrimaryPart
        if u25 ~= nil then
            u25 = u25.Position
        end
    end
    local u26 = 0
    if not u25 then
        return nil
    end
    u24.localMaid:GiveTask(task.spawn(function() --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u24
            [3] = u25
            [4] = u26
        --]]
        while true do
            while true do
                local v27 = task.wait(1)
                if v27 == 0 or (v27 ~= v27 or not v27) then
                    return
                end
                local v28 = u5.LocalPlayer.Character
                if v28 ~= nil then
                    v28 = v28.PrimaryPart
                    if v28 ~= nil then
                        v28 = v28.Position
                    end
                end
                if not u24.isActive and u25 then
                    break
                end
                if not u25 then
                    goto l16
                end
                u26 = 0
                local v29 = u5.LocalPlayer.Character
                if v29 ~= nil then
                    v29 = v29.PrimaryPart
                    if v29 ~= nil then
                        v29 = v29.Position
                    end
                end
                if v29 then
                    if (v29 - u25).Magnitude > 1 then
                        u24:deactive()
                    end
                    goto l16
                end
                u24:deactive()
            end
            if v28 then
                if (v28 - u25).Magnitude < 1 then
                    u26 = u26 + 1
                end
                if u26 > 1 then
                    u24:active()
                    u26 = 0
                end
                ::l16::
                if v28 then
                    u25 = v28
                end
            end
        end
    end))
end
v3.CreateController(u11.new())
return nil