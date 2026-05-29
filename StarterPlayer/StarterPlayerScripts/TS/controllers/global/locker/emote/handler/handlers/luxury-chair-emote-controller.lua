local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitClient
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.ReplicatedStorage
local u8 = v5.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u14 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "LuxuryChairEmoteController"
    end,
    ["__index"] = u9
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
        [1] = u9
    --]]
    u9.constructor(p18)
    p18.Name = "LuxuryChairEmoteController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
        [3] = u12
        [4] = u14
        [5] = u7
        [6] = u8
        [7] = u4
        [8] = u13
        [9] = u6
        [10] = u10
        [11] = u11
    --]]
    u9.KnitStart(p19)
    local v20 = u3.Controllers.EmoteHandlerController
    local v21 = u12.LUXURY_CHAIR
    local u22 = u14
    local u23 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
            return "Anonymous"
        end,
        ["__index"] = u22
    })
    u23.__index = u23
    function u23.new(...) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v24 = u23
        local v25 = setmetatable({}, v24)
        return v25:constructor(...) or v25
    end
    function u23.constructor(p26, ...) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22.constructor(p26, ...)
    end
    function u23.onEnable(_, u27, p28, _, p29) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
            [3] = u4
            [4] = u13
            [5] = u6
            [6] = u10
            [7] = u11
        --]]
        local u30 = u7.Assets.Misc.LuxuryChair:Clone()
        u30:PivotTo(p28.LowerTorso.CFrame)
        u30.Parent = u8
        for v31, v32 in u30:GetDescendants() do
            local _ = v31 - 1
            if v32:IsA("BasePart") then
                v32.Anchored = true
            end
        end
        u4.Controllers.ViewmodelController:setHeldItem(nil)
        local u33 = u7.Assets.Misc.TeaMug:Clone()
        u33.Parent = p28
        local u34 = u7.Assets.Misc.MageSpellbook:Clone()
        u34.Parent = p28
        u13:weldCharacterAccessories(p28)
        p29:GiveTask(function() --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u33
                [3] = u34
                [4] = u6
                [5] = u27
                [6] = u10
                [7] = u11
                [8] = u4
            --]]
            u30:Destroy()
            u33:Destroy()
            u34:Destroy()
            local v35 = u6:GetPlayerByUserId(u27)
            if v35 == u6.LocalPlayer then
                local v36 = u10.getInventory(v35).hand
                if v36 ~= nil then
                    v36 = v36.itemType
                end
                if not v36 then
                    return nil
                end
                local v37 = u11.createItemInstance(v36)
                u4.Controllers.ViewmodelController:setHeldItem(v37)
            end
        end)
    end
    function u23.onDisable(_, _, _, _) --[[ Line: 96 ]] end
    v20:registerHandler(v21, u23)
end
u3.CreateController(u15.new())
return nil