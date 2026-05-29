local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "LobbyGadgetController"
    end,
    ["__index"] = u4
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
    --]]
    u4.constructor(p11)
    p11.Name = "LobbyGadgetController"
    p11.lockerNamespace = u7.Client:GetNamespace("Locker")
    p11.refillSet = {}
end
function u8.KnitStart(u12) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
    --]]
    u4.KnitStart(u12)
    local u13 = u3.LocalPlayer
    if u13:GetAttribute("LobbyGadgetType") ~= nil then
        local v14 = u13:GetAttribute("LobbyGadgetType")
        u12.lockerNamespace:Get("GiveLobbyGadget"):CallServer({
            ["lobbyGadget"] = v14
        })
        u12:setupGadgetRefill(u13, v14)
    end
    u13:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u12
        --]]
        u12:setupGadgetRefill(u13, (u13:GetAttribute("LobbyGadgetType")))
    end)
end
function u8.setupGadgetRefill(p15, p16, p17) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v18 = {}
    local v19 = u6[p17].items
    if v19 ~= nil then
        for v20, v21 in v19 do
            local _ = v20 - 1
            if v21.refillable then
                table.insert(v18, v21)
            end
        end
    end
    local v22 = #v18 ~= 0
    if v22 then
        local v23 = p15.refillSet[p17] ~= nil
        v22 = not v23
    end
    if v22 then
        p15.refillSet[p17] = true
        for v24, v25 in v18 do
            local _ = v24 - 1
            p15:refillItemLoop(p16, v25, p17)
        end
    end
end
function u8.refillItemLoop(u26, u27, u28, u29) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v30 = u28.refillCooldown
    local u31 = v30 == nil and 4 or v30
    task.defer(function() --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u27
            [3] = u29
            [4] = u26
            [5] = u5
            [6] = u28
        --]]
        while true do
            local v32 = task.wait(u31)
            if v32 == 0 or (v32 ~= v32 or not v32) then
                return
            end
            if u27:GetAttribute("LobbyGadgetType") ~= u29 then
                u26.refillSet[u29] = nil
                return nil
            end
            local v33 = nil
            for v34, v35 in u5.getInventory(u27).items do
                local _ = v34 - 1
                if v35.itemType == u28.itemType == true then
                    v33 = v35
                    break
                end
            end
            local v36 = not v33
            if not v36 then
                local v37 = v33.amount
                local v38 = u28.amount
                v36 = v37 < (v38 == nil and 1 or v38)
            end
            if v36 then
                local v39 = {
                    ["lobbyGadgetItem"] = u28
                }
                u26.lockerNamespace:Get("RefillLobbyGadgetItem"):CallServer(v39)
            end
        end
    end)
end
v2.CreateController(u8.new())
return nil