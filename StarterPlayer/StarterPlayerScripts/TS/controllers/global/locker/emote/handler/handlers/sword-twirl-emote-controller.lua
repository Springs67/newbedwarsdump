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
        return "SwordTwirlEmoteController"
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
    p14.Name = "SwordTwirlEmoteController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u8
        [4] = u10
        [5] = u7
        [6] = u5
        [7] = u6
        [8] = u9
        [9] = u3
    --]]
    u4.KnitStart(p15)
    local v16 = u2.Controllers.EmoteHandlerController
    local v17 = u8.SWORD_TWIRL
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
            [1] = u7
            [2] = u5
            [3] = u6
            [4] = u9
            [5] = u3
        --]]
        p26:GiveTask(p23:handleRightHandItemWithEmote(p24, u25, function(p27) --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u5
                [3] = u6
                [4] = u9
            --]]
            local v28 = u7.IRON_DAGGER
            if p27 then
                local v29 = u5.getInventory(p27).hand
                if v29 and u6(v29.itemType).sword then
                    return v29.itemType
                end
                if u9.isLobbyServer() then
                    return u7.IRON_DAGGER
                end
                local v30 = u5.getInventory(p27).items
                if #v30 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
                end
                v28 = v30[1]
                for v31 = 2, #v30 do
                    local v32 = v30[v31]
                    local _ = v31 - 1
                    local v33 = u6(v32.itemType)
                    local v34 = u6(v28.itemType)
                    if v33.sword and v34.sword then
                        if v33.sword.damage > v34.sword.damage then
                            v28 = v32
                        end
                    end
                end
                if v28 ~= nil then
                    v28 = v28.itemType
                end
            end
            return v28
        end, function(p35) --[[ Line: 92 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u3
            --]]
            CFrame.new(Vector3.new(0, 1.9, 0))
            local v36 = CFrame.new(Vector3.new(0, -1.9, 0)) * CFrame.Angles(0, 3.141592653589793, 3.141592653589793)
            return u3("Motor6D", {
                ["Name"] = "dagger.001",
                ["Parent"] = u25.RightHand,
                ["C0"] = CFrame.new(Vector3.new(-0.044, -0.309, -0.004)) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966),
                ["C1"] = v36,
                ["Part0"] = u25.RightHand,
                ["Part1"] = p35,
                ["Enabled"] = true
            })
        end, {
            ["name"] = "animatedDagger"
        }))
    end
    function u19.onDisable(_, _, _, _) --[[ Line: 116 ]] end
    v16:registerHandler(v17, u19)
end
u2.CreateController(u11.new())
return nil