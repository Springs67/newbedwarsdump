local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.TweenService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = {
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(255, 115, 115),
    Color3.fromRGB(255, 188, 105),
    Color3.fromRGB(251, 255, 124),
    Color3.fromRGB(150, 255, 129),
    Color3.fromRGB(101, 201, 255),
    Color3.fromRGB(140, 120, 255),
    Color3.fromRGB(255, 139, 255)
}
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "DoubleRainbowBootsController"
    end,
    ["__index"] = u11
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
    --]]
    u11.constructor(p19)
    p19.Name = "DoubleRainbowBootsController"
    p19.maid = u6.new()
    p19.jumpCountMap = {}
end
function u16.KnitStart(u20) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u8
        [4] = u2
        [5] = u14
        [6] = u15
        [7] = u12
        [8] = u13
        [9] = u5
        [10] = u6
    --]]
    u11.KnitStart(u20)
    u10.RainbowBootsEquipped:connect(function(u21) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u20
            [3] = u2
            [4] = u14
            [5] = u15
        --]]
        task.spawn(function() --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u8
                [3] = u20
                [4] = u2
                [5] = u14
                [6] = u15
            --]]
            local u22 = u21.character == u8.LocalPlayer.Character
            local v23 = u21.character:WaitForChild("Humanoid", 1)
            if not v23 then
                return nil
            end
            u20.jumpCountMap[u21.character] = 0
            local v24 = u21.character:WaitForChild("double_rainbow_boots_right", 2)
            local v25 = u21.character:WaitForChild("double_rainbow_boots_left", 2)
            if not (v24 and v25) then
                u21.maid:DoCleaning()
                return nil
            end
            local u26 = { v24:WaitForChild("Handle"):WaitForChild("Diamond"), (v25:WaitForChild("Handle"):WaitForChild("Diamond")) }
            u21.maid:GiveTask(v23.StateChanged:Connect(function(p27, p28) --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u21
                    [3] = u26
                    [4] = u2
                    [5] = u14
                    [6] = u22
                    [7] = u15
                --]]
                if p28 == Enum.HumanoidStateType.Landed then
                    u20.jumpCountMap[u21.character] = 0
                    u20:changeBootColor(u26, u21.character, 0, u21.maid)
                elseif p27 == Enum.HumanoidStateType.Freefall and p28 == Enum.HumanoidStateType.Jumping then
                    local v29 = u2
                    local v30 = u14.DUCK_JUMP
                    local v31 = {}
                    local v32
                    if u22 then
                        v32 = nil
                    else
                        v32 = u21.character:GetPivot().Position
                    end
                    v31.position = v32
                    v29:playSound(v30, v31)
                    local v33 = u20.jumpCountMap[u21.character]
                    local v34 = (v33 == nil and 0 or v33) + 1
                    local v35 = #u15 < v34 and 0 or v34
                    u20.jumpCountMap[u21.character] = v35
                    u20:changeBootColor(u26, u21.character, v35, u21.maid)
                end
            end))
        end)
    end)
    u12.changed:connect(function(p36, p37) --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u20
            [3] = u13
            [4] = u5
            [5] = u10
            [6] = u6
        --]]
        local v38 = p37.Inventory.observedInventory.inventory.armor
        local u39 = p36.Inventory.observedInventory.inventory.armor
        if v38 == u39 then
            return nil
        end
        if not u8.LocalPlayer.Character then
            return nil
        end
        local v40 = u20.jumpModifier
        if v40 ~= nil then
            v40:Destroy()
        end
        u20.maid:DoCleaning()
        if (function(p41) --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            local v42 = nil
            for v43, v44 in u39 do
                local _ = v43 - 1
                local v45
                if v44 == "empty" then
                    v45 = false
                else
                    v45 = v44.itemType == p41
                end
                if v45 == true then
                    v42 = v44
                    break
                end
            end
            return v42 ~= nil
        end)(u13.DOUBLE_RAINBOW_BOOTS) then
            u20.jumpModifier = u5.Controllers.JumpHeightController:getJumpModifier():addModifier({
                ["jumpHeightMultiplier"] = 1.2,
                ["airJumps"] = 7
            })
            u10.RainbowBootsEquipped:fire(u6.new(), u8.LocalPlayer.Character)
        end
    end)
end
function u16.changeBootColor(_, p46, p47, p48, p49) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u15
    --]]
    for _, v50 in p46 do
        if v50.Parent == nil or p47.Parent == nil then
            p49:DoCleaning()
            return nil
        end
        u9:Create(v50, TweenInfo.new(0.5), {
            ["Color"] = u15[p48 + 1]
        }):Play()
    end
end
v4.CreateController(u16.new())
return nil