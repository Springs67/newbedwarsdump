local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BreakBlockDamageType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.RandomUtil
local u6 = v4.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "BlockDamageSoundController"
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
    --]]
    u9.constructor(p16)
    p16.Name = "BlockDamageSoundController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
        [3] = u11
        [4] = u8
        [5] = u10
        [6] = u12
        [7] = u2
        [8] = u6
        [9] = u5
    --]]
    u9.KnitStart(p17)
    u3.DamageBlockEffect:connect(function(p18) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u8
            [3] = u10
            [4] = u12
            [5] = u2
            [6] = u6
            [7] = u5
        --]]
        local v19 = u11.getInventory(u8.LocalPlayer).hand
        if v19 ~= nil then
            v19 = v19.itemSkin
        end
        if v19 == "" or not v19 then
            return nil
        end
        local v20 = u10(v19)
        if not v20.blockHitSoundOverride then
            return nil
        end
        local v21 = u12(p18.blockType)
        if v21 ~= nil then
            v21 = v21.block
            if v21 ~= nil then
                v21 = v21.breakType
            end
        end
        if not v21 then
            return nil
        end
        if v21 == u2.STONE then
            local v22 = v20.blockHitSoundOverride[v21]
            if v22 then
                p18.sound = u6:createSound(u5.fromList(unpack(v22)))
                return
            end
        elseif v21 == u2.WOOD then
            local v23 = v20.blockHitSoundOverride[v21]
            if v23 then
                p18.sound = u6:createSound(u5.fromList(unpack(v23)))
                return
            end
        else
            local v24 = v21 == u2.WOOL and v20.blockHitSoundOverride[v21]
            if v24 then
                p18.sound = u6:createSound(u5.fromList(unpack(v24)))
                return
            end
        end
    end)
end
v7.CreateController(u13.new())
return nil