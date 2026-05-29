local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "break", "block-breaker").BlockBreaker
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.DeviceUtil
local u6 = v4.GameCoreClientSyncEvents
local u7 = v4.preloadImages
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u12 = v1.import(script, script.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine
local u14 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-break-util")
local u17 = v16.DEFAULT_BREAK_COOLDOWN
local u18 = v16.DEFAULT_BREAK_RANGE
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "BlockBreakController"
    end,
    ["__index"] = u14
})
u26.__index = u26
function u26.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u2
        [3] = u9
        [4] = u3
        [5] = u13
        [6] = u17
        [7] = u18
    --]]
    u14.constructor(p29)
    p29.Name = "BlockBreakController"
    p29.mobileLayoutController = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController")
    p29.maid = u9.new()
    p29.blockBreaker = u3.new(u13)
    p29.cooldown = u17
    p29.range = u18
end
function u26.KnitStart(u30) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
        [3] = u21
        [4] = u12
        [5] = u23
        [6] = u11
        [7] = u6
    --]]
    u14.KnitStart(u30)
    u7({
        u21.BLOCK_DAMAGED_1,
        u21.BLOCK_DAMAGED_2,
        u21.BLOCK_DAMAGED_3,
        u21.BLOCK_DAMAGED_4
    })
    u12.SettingChanged:connect(function(p31) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u11
            [3] = u30
        --]]
        if p31.setting ~= u23.MOBILE_BLOCK_BREAK_BUTTON then
            return nil
        end
        if not u11.boolean(p31.value) then
            return nil
        end
        u30.blockBreaker.shouldDisplayMobileBtn = p31.value
        if u30:isEnabled() then
            if p31.value then
                u30.blockBreaker:displayMobileBreakButton()
                return
            end
            u30.blockBreaker:hideMobileBreakButton()
        end
    end)
    u6.MobileLayoutRegistered:connect(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        local v32 = u30.mobileLayoutController:getLayoutDimensions("BlockBreak")
        if v32.position then
            u30.blockBreaker:setBlockBreakLayout(v32.position, v32.size)
            if u30.blockBreaker.shouldDisplayMobileBtn and u30:isEnabled() then
                u30.blockBreaker:hideMobileBreakButton()
                u30.blockBreaker:displayMobileBreakButton()
            end
        end
    end)
end
function u26.isRelevantItem(_, p33) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    return u22(p33.itemType).breakBlock and true or false
end
function u26.onEnable(u34) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u17
        [3] = u18
        [4] = u20
        [5] = u10
        [6] = u25
        [7] = u24
        [8] = u19
        [9] = u15
        [10] = u8
        [11] = u5
    --]]
    u34.blockBreaker:disable()
    u34.blockBreaker:enable()
    local v35 = u34:getHandItem()
    if v35 ~= nil then
        v35 = v35.itemType
    end
    local v36
    if v35 then
        v36 = u22(v35)
    else
        v36 = nil
    end
    local v37
    if v36 == nil then
        v37 = v36
    else
        v37 = v36.breakBlockCooldown
    end
    if v37 == 0 or (v37 ~= v37 or not v37) then
        v37 = u17
    end
    u34.cooldown = v37
    if v36 ~= nil then
        v36 = v36.breakBlockRange
    end
    if v36 == 0 or (v36 ~= v36 or not v36) then
        v36 = u18
    end
    u34.range = v36
    u34.blockBreaker:setCooldown(u34.cooldown)
    local v38 = u20:getEntity(u10.LocalPlayer)
    if v38 ~= nil then
        v38 = v38:getInstance()
    end
    if v38 and u25:isActive(v38, u24.TOOL_ENCHANT_EFFICIENCY) then
        u34.blockBreaker:setCooldown(u34.cooldown * (1 - u19.EFFICIENCY_TOOL_PERCENT / 100))
    end
    u34.blockBreaker:setRange(u34.range)
    u34.blockBreaker.onBreak:Connect(function() --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u34
            [3] = u22
            [4] = u8
        --]]
        local v39 = u15.FP_USE_ITEM
        local v40 = u34:getHandItem()
        if v40 ~= nil then
            v40 = v40.itemType
        end
        if v40 then
            local v41 = u22(v40)
            local v42 = v41.breakBlockSwingAnimationOverride
            if v42 ~= 0 and (v42 == v42 and v42) then
                v39 = v41.breakBlockSwingAnimationOverride
            end
        end
        u8.Controllers.ViewmodelController:playAnimation(v39)
    end)
    if u5.isMobileControls() and (u34.blockBreaker.shouldDisplayMobileBtn and u34:isEnabled()) then
        u34.blockBreaker:displayMobileBreakButton()
    end
end
function u26.onDisable(p43) --[[ Line: 154 ]]
    p43.blockBreaker:disable()
    p43.maid:DoCleaning()
    p43.blockBreaker:hideMobileBreakButton()
end
function u26.getBlockBreaker(p44) --[[ Line: 159 ]]
    return p44.blockBreaker
end
function u26.setDefaultCooldown(p45) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u17
    --]]
    local v46 = p45:getHandItem()
    if v46 ~= nil then
        v46 = v46.itemType
    end
    local v47
    if v46 then
        v47 = u22(v46)
    else
        v47 = nil
    end
    if v47 ~= nil then
        v47 = v47.breakBlockCooldown
    end
    if v47 == 0 or (v47 ~= v47 or not v47) then
        v47 = u17
    end
    p45.cooldown = v47
    p45.blockBreaker:setCooldown(p45.cooldown)
    return p45.cooldown
end
function u26.isBlockBreakEnabled(p48) --[[ Line: 184 ]]
    return p48:isEnabled()
end
return {
    ["BlockBreakController"] = u8.CreateController(u26.new())
}