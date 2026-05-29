local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u10 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "BarbarianRagebladeMasterEmoteController"
    end,
    ["__index"] = u4
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
        [1] = u4
    --]]
    u4.constructor(p14)
    p14.Name = "BarbarianRagebladeMasterEmoteController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u8
        [4] = u10
        [5] = u5
        [6] = u6
        [7] = u9
        [8] = u7
        [9] = u3
    --]]
    u4.KnitStart(p15)
    local v16 = u2.Controllers.EmoteHandlerController
    local v17 = u8.BARBARIAN_RAGEBLADE_MASTER
    local u18 = u10
    local u19 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
            return "Anonymous"
        end,
        ["__index"] = u18
    })
    u19.__index = u19
    function u19.new(...) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        local v20 = u19
        local v21 = setmetatable({}, v20)
        return v21:constructor(...) or v21
    end
    function u19.constructor(p22, ...) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18.constructor(p22, ...)
    end
    function u19.onEnable(p23, p24, u25, _, p26) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
            [3] = u9
            [4] = u7
            [5] = u3
        --]]
        p26:GiveTask(p23:handleRightHandItemWithEmote(p24, u25, function(p27) --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u6
                [3] = u9
                [4] = u7
            --]]
            if not p27 then
                return u7.RAGEBLADE
            end
            local v28 = u5.getInventory(p27).hand
            if v28 and u6(v28.itemType).sword then
                return v28.itemType
            end
            if u9.isLobbyServer() then
                return u7.RAGEBLADE
            end
            local v29 = u5.getInventory(p27).items
            local v30 = {
                ["itemType"] = u7.RAGEBLADE
            }
            for v31 = 1, #v29 do
                local v32 = v29[v31]
                local _ = v31 - 1
                local v33 = u6(v32.itemType)
                local v34 = u6(v30.itemType)
                if v33.sword and v34.sword then
                    if v33.sword.damage > v34.sword.damage then
                        v30 = v32
                    end
                end
            end
            if v30 ~= nil then
                v30 = v30.itemType
            end
            return v30
        end, function(p35, p36) --[[ Line: 94 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u25
                [3] = u3
            --]]
            local v37 = CFrame.new(Vector3.new(0, 1.9, 0))
            if p36 ~= u7.RAGEBLADE then
                v37 = CFrame.new(Vector3.new(0, -1.9, 0)) * CFrame.Angles(0, 3.141592653589793, 3.141592653589793)
            end
            return u3("Motor6D", {
                ["Name"] = "rageblade",
                ["Parent"] = u25.RightHand,
                ["C0"] = CFrame.new(Vector3.new(-0.044, -0.309, -0.004)) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966),
                ["C1"] = v37,
                ["Part0"] = u25.RightHand,
                ["Part1"] = p35,
                ["Enabled"] = true
            })
        end, {
            ["name"] = "rageblade"
        }))
    end
    function u19.onDisable(_, _, _, _) --[[ Line: 120 ]] end
    v16:registerHandler(v17, u19)
end
u2.CreateController(u11.new())
return nil