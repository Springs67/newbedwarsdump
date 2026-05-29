local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CollectionTagAdded
local u4 = v2.Empty
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, script.Parent, "ui", "cauldron-app").CauldronWrapper
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "CauldronController"
    end,
    ["__index"] = u15
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24, ...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p24, ...)
    p24.Name = "CauldronController"
    p24.cauldronToMaid = {}
end
function u21.KnitStart(u25) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u3
        [3] = u9
        [4] = u10
        [5] = u4
        [6] = u14
        [7] = u17
        [8] = u13
        [9] = u8
        [10] = u5
        [11] = u19
        [12] = u18
        [13] = u12
    --]]
    u15.KnitStart(u25)
    u3("cauldron", function(u26) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u25
            [3] = u10
            [4] = u4
            [5] = u14
            [6] = u17
            [7] = u13
            [8] = u8
            [9] = u5
            [10] = u19
            [11] = u18
        --]]
        local v27 = u26:WaitForChild("Root")
        local v28 = u9.new()
        u25.cauldronToMaid[u26] = v28
        local u29 = u10.mount(u10.createElement("BillboardGui", {
            ["LightInfluence"] = 0,
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 5, 0),
            ["Adornee"] = v27,
            ["Size"] = UDim2.fromScale(2.5, 2.5)
        }, { u10.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }, { u10.createElement(u14, {
                    ["ItemType"] = u17.DIAMOND
                }) }) }), u13.LocalPlayer:WaitForChild("PlayerGui"))
        v28:GiveTask(function() --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u29
            --]]
            u10.unmount(u29)
        end)
        local u30 = u8.Controllers.ProximityPromptController:createProximityPrompt({
            ["Enabled"] = true,
            ["ActionText"] = "Repair (8 diamonds)",
            ["ObjectText"] = "Cauldron",
            ["HoldDuration"] = 0.3,
            ["RequiresLineOfSight"] = false,
            ["Parent"] = u26
        })
        u30.Triggered:Connect(function(p31) --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u30
                [3] = u26
                [4] = u5
                [5] = u19
                [6] = u25
                [7] = u18
            --]]
            if p31 == u13.LocalPlayer and u30.Enabled == true then
                if u26:GetAttribute("Enabled") == true then
                    u5:playSound(u19.UI_OPEN)
                    u25:disableui()
                    u25:enableui(u26)
                    return
                end
                u5:playSound(u19.DEPOSIT_BEE)
                local v32 = {
                    ["cauldron"] = u26
                }
                u18.Client:WaitFor("RepairCauldron"):expect():SendToServer(v32)
            end
        end)
        u26:GetAttributeChangedSignal("Enabled"):Connect(function() --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u30
            --]]
            if u26:GetAttribute("Enabled") == true then
                u30.ActionText = "Open"
            else
                u30.ActionText = "Repair (8 diamonds)"
            end
        end)
    end)
    u12:GetInstanceRemovedSignal("cauldron"):Connect(function(p33) --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        local v34 = u25.cauldronToMaid[p33]
        if v34 ~= nil then
            v34:DoCleaning()
        end
        u25.cauldronToMaid[p33] = nil
    end)
    task.spawn(function() --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u13
        --]]
        while true do
            local v35 = task.wait(0.2)
            if v35 == 0 or (v35 ~= v35 or not v35) then
                break
            end
            task.spawn(function() --[[ Line: 112 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u13
                --]]
                if u25.active and u13.LocalPlayer:DistanceFromCharacter(u25.active.cauldron:GetPrimaryPartCFrame().Position) > u25.active.cauldron.ProximityPrompt.MaxActivationDistance then
                    u25:disableui()
                end
            end)
        end
    end)
end
function u21.enableui(p36, p37) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u20
    --]]
    p37.ProximityPrompt.Enabled = false
    local v38 = {
        ["tree"] = u16("cauldron", u20, {
            ["cauldron"] = p37
        }),
        ["cauldron"] = p37
    }
    p36.active = v38
end
function u21.disableui(p39) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p39.active then
        p39.active.cauldron.ProximityPrompt.Enabled = true
        u10.unmount(p39.active.tree)
        p39.active = nil
    end
end
v7.CreateController(u21.new())
return nil