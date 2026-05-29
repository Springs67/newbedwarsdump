local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent, "ui", "bed-health-bar-ui").BedHealthBarUi
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "BedHealthDisplayController"
    end,
    ["__index"] = u9
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
        [1] = u9
    --]]
    u9.constructor(p19)
    p19.Name = "BedHealthDisplayController"
    p19.bedHealthBillboardsDisabled = false
end
function u16.KnitStart(u20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u14
        [4] = u3
        [5] = u2
        [6] = u11
        [7] = u12
        [8] = u10
        [9] = u8
        [10] = u13
    --]]
    u9.KnitStart(u20)
    if u20.bedHealthBillboardsDisabled then
        return nil
    end
    u4.Controllers.PreloadController:runPreload({
        ["sounds"] = { u14.BED_DAMAGED_ALERT_OVERLAY, u14.BED_DAMAGED_ALERT_OVERLAY }
    })
    u3("bed", function(u21) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u2
            [3] = u11
            [4] = u12
            [5] = u10
            [6] = u8
        --]]
        u20:mountBedHealthBarDisplay(u21)
        local u22 = u2:getStore():getBlockData(u2:getBlockPosition(u21.Position))
        local u23 = u21:GetAttribute("TeamId")
        if not u22 then
            return nil
        end
        local u24 = u22:GetAttribute("Health")
        if u24 == nil then
            u24 = u21:GetAttribute("MaxHealth")
            if u24 == nil then
                local v25 = u11(u12.BED).block
                if v25 ~= nil then
                    v25 = v25.health
                end
                u24 = v25 == nil and 24 or v25
            end
        end
        u10:dispatch({
            ["type"] = "SetBedHealth",
            ["teamId"] = u23,
            ["bedHealth"] = u24,
            ["maxBedHealth"] = u24
        })
        local v26 = u21:GetAttribute("BedPlatingAmount")
        local u27 = v26 == nil and 0 or v26
        local u28 = u27
        u22:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u24
                [3] = u8
                [4] = u23
                [5] = u28
                [6] = u10
                [7] = u24
            --]]
            local v29 = u22:GetAttribute("Health")
            local v30
            if v29 == 0 or (v29 ~= v29 or not v29) then
                v30 = v29
            else
                v30 = v29 < u24
            end
            if v30 ~= 0 and (v30 == v30 and v30) then
                u24 = v29
                u8.BedDamaged:fire(u23, u24, u28, false)
                u10:dispatch({
                    ["type"] = "SetBedHealth",
                    ["teamId"] = u23,
                    ["bedHealth"] = u24,
                    ["maxBedHealth"] = u24
                })
            end
        end)
        u21:GetAttributeChangedSignal("BedPlatingAmount"):Connect(function() --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u27
                [3] = u28
                [4] = u8
                [5] = u23
                [6] = u24
                [7] = u10
            --]]
            local v31 = u21:GetAttribute("BedPlatingAmount")
            local v32 = v31 == nil and 0 or v31
            if u27 < v32 then
                u27 = v32
            end
            local v33
            if v32 == 0 or (v32 ~= v32 or not v32) then
                v33 = v32
            else
                v33 = v32 < u28
            end
            if v33 ~= 0 and (v33 == v33 and v33) then
                u28 = v32
                u8.BedDamaged:fire(u23, u24, u28, true)
                u10:dispatch({
                    ["type"] = "SetBedPlatingHealth",
                    ["teamId"] = u23,
                    ["platingHealth"] = u28,
                    ["maxPlatingHealth"] = u27
                })
            end
        end)
    end)
    u13.Client:Get("AddBedPlating"):Connect(function(p34) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        local v35 = p34:GetAttribute("TeamId")
        local v36 = p34:GetAttribute("BedPlatingAmount")
        local v37 = v36 == nil and 0 or v36
        u10:dispatch({
            ["type"] = "SetBedPlatingHealth",
            ["teamId"] = v35,
            ["platingHealth"] = v37,
            ["maxPlatingHealth"] = v37
        })
    end)
end
function u16.mountBedHealthBarDisplay(p38, u39) --[[ Line: 139 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u15
        [4] = u7
    --]]
    if p38.bedHealthBillboardsDisabled then
        return nil
    end
    local u40 = u5.new()
    local u41 = u6.mount(u6.createElement(u15, {
        ["BedBlock"] = u39,
        ["PlatingExpireTime"] = u39:GetAttribute("BedPlatingExpireTime"),
        ["ShieldExpireTime"] = u39:GetAttribute("BedShieldEndTime")
    }), u7.LocalPlayer:WaitForChild("PlayerGui"), "BedHealthBarDisplay")
    local function u42() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u6
            [3] = u15
            [4] = u39
        --]]
        u41 = u6.update(u41, u6.createElement(u15, {
            ["BedBlock"] = u39,
            ["PlatingExpireTime"] = u39:GetAttribute("BedPlatingExpireTime"),
            ["ShieldExpireTime"] = u39:GetAttribute("BedShieldEndTime")
        }))
    end
    u40:GiveTask(u39:GetAttributeChangedSignal("BedPlatingExpireTime"):Connect(function() --[[ Line: 157 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42()
    end))
    u40:GiveTask(u39:GetAttributeChangedSignal("BedShieldEndTime"):Connect(function() --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42()
    end))
    u39.Destroying:Connect(function() --[[ Line: 163 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u41
            [3] = u40
        --]]
        u6.unmount(u41)
        u40:DoCleaning()
    end)
end
function u16.removeBedHealthBillboards(_) --[[ Line: 168 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    for v43, v44 in u7.LocalPlayer:WaitForChild("PlayerGui"):GetChildren() do
        local _ = v43 - 1
        if v44.Name == "BedHealthBillboard" then
            v44:Destroy()
        end
    end
end
function u16.disableBedHealthBillboards(p45) --[[ Line: 179 ]]
    p45.bedHealthBillboardsDisabled = true
end
u4.CreateController(u16.new())
return nil