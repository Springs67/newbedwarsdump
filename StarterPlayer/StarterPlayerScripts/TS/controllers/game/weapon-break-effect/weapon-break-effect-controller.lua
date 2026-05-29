local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-melees").BedwarsMelees
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, script.Parent, "weapon-break-effect").WeaponBreakEffect
local v12 = v9.DIAMOND_SWORD
local v13 = -1
for v14, v15 in u7 do
    local _ = v14 - 1
    if v15 == v12 == true then
        v13 = v14 - 1
        break
    end
end
local u16 = v13 == -1 and 6 or v13
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "WeaponBreakEffectController"
    end,
    ["__index"] = u6
})
u17.__index = u17
function u17.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p20)
    p20.Name = "WeaponBreakEffectController"
end
function u17.KnitStart(u21) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u7
        [4] = u16
        [5] = u10
        [6] = u4
        [7] = u8
        [8] = u3
        [9] = u11
    --]]
    u6.KnitStart(u21)
    u5.ItemAdded:connect(function(p22) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u16
            [3] = u21
        --]]
        local v23 = -1
        for v24, v25 in u7 do
            local _ = v24 - 1
            if v25 == p22.item.Name == true then
                v23 = v24 - 1
                break
            end
        end
        if v23 ~= -1 then
            if v23 < u16 then
                u21.currentWeapon = nil
                return
            end
            u21.currentWeapon = p22.item.Name
        end
    end)
    u10.Client:Get("EntityDeathEvent"):Connect(function(p26) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u21
            [3] = u8
            [4] = u3
            [5] = u11
        --]]
        if p26.entityInstance ~= u4.LocalPlayer.Character then
            return nil
        end
        if not u21.currentWeapon then
            return nil
        end
        local v27 = u8(u21.currentWeapon).image
        if v27 == "" or not v27 then
            return nil
        end
        local u28 = u3.mount(u3.createElement(u11, {
            ["WeaponImage"] = v27
        }), u4.LocalPlayer:WaitForChild("PlayerGui"))
        task.delay(5, function() --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u28
            --]]
            u3.unmount(u28)
        end)
    end)
end
v2.CreateController(u17.new())
return nil