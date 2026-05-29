local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.TweenService
local u13 = v9.Workspace
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = u1.import(script, script.Parent, "ui", "pirate-flag-stash").PirateFlagStash
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "PirateFlagController"
    end,
    ["__index"] = u14
})
u22.__index = u22
function u22.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p25)
    p25.Name = "PirateFlagController"
    p25.ownedFlags = {}
    p25.flagCollectedMap = {}
    p25.flagToTree = {}
end
function u22.KnitStart(u26) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u1
        [3] = u19
        [4] = u2
        [5] = u3
        [6] = u11
        [7] = u15
        [8] = u5
        [9] = u20
    --]]
    u14.KnitStart(u26)
    u1.Promise.defer(function() --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u26
        --]]
        while true do
            local v27 = task.wait(3)
            if v27 == 0 or (v27 ~= v27 or not v27) then
                break
            end
            u1.Promise.defer(function() --[[ Line: 53 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26:checkForPickUp()
            end)
        end
    end)
    u19.Client:Get("PirateFlagPlaced"):Connect(function(u28) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
            [3] = u11
            [4] = u26
            [5] = u15
            [6] = u5
            [7] = u20
        --]]
        if not u28.flagPosition then
            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                ["message"] = "There is another pirate flag nearby!"
            })
            return nil
        end
        local u29 = nil
        local v30 = u3:getWorldPosition(u28.flagPosition)
        local v31 = u3:getStore():getBlockAt(u28.flagPosition)
        if u28.placer == u11.LocalPlayer then
            if v31 then
                u29 = u26:createBuffCircleIndicator(v31:GetPivot().Position, u15.PIRATE_FLAG_RANGE, {
                    ["fadeOutAfterSec"] = 1.25,
                    ["parent"] = v31
                })
            end
            local v32 = u26.ownedFlags
            table.insert(v32, v30)
        end
        local u33 = nil
        if v31 ~= nil then
            v31 = v31.Destroying:Connect(function() --[[ Line: 84 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u28
                    [3] = u26
                    [4] = u33
                --]]
                local v34 = u29
                if v34 ~= nil then
                    v34:Destroy()
                end
                if u28.flagPosition then
                    u26.flagCollectedMap[u28.flagPosition] = nil
                    u26.flagToTree[u28.flagPosition] = nil
                end
                local v35 = u33
                if v35 ~= nil then
                    v35:Disconnect()
                end
            end)
        end
        local v36 = u5
        local v37 = u20.FLAG_DROP
        local v38 = {}
        local v39
        if u28.placer == u11.LocalPlayer then
            v39 = nil
        else
            v39 = u28.flagPosition
        end
        v38.position = v39
        v36:playSound(v37, v38)
    end)
end
function u22.checkForPickUp(p40) --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
        [3] = u15
        [4] = u13
        [5] = u18
        [6] = u17
        [7] = u11
        [8] = u19
        [9] = u4
    --]]
    local v41 = false
    local v42 = 0
    while true do
        ::l64::
        if v41 then
            v42 = v42 + 1
        else
            v41 = true
        end
        if v42 >= #p40.ownedFlags then
            return
        end
        local v43 = p40.ownedFlags[v42 + 1]
        local v44 = u3:getBlockPosition(v43)
        if u3:getStore():getBlockAt(v44) then
            break
        end
        local v45 = p40.ownedFlags
        table.remove(v45, v42 + 1)
    end
    local v46 = 0
    local v47 = {}
    for v48, v49 in u10:GetTagged("ItemDrop") do
        local _ = v48 - 1
        if (v43 - v49.Position).Magnitude <= u15.PIRATE_FLAG_RANGE == true then
            v46 = v46 + 1
            v47[v46] = v49
        end
    end
    local v50 = 0
    local v51 = {}
    for v52, v53 in v47 do
        local _ = v52 - 1
        if u13:GetServerTimeNow() > v53:GetAttribute("PickupReadyTime") == true then
            v50 = v50 + 1
            v51[v50] = v53
        end
    end
    local v54 = 0
    local v55 = {}
    for v56, v57 in v51 do
        local _ = v56 - 1
        local v58 = v57:GetAttribute("ClientPickupAttemptTime")
        if (v58 == nil and true or tick() - v58 > 5) == true then
            v54 = v54 + 1
            v55[v54] = v57
        end
    end
    local v59 = 0
    local v60 = {}
    for v61, v62 in v55 do
        local _ = v61 - 1
        local v63 = v62:GetAttribute("ClientDropTime")
        if ((v63 == 0 or (v63 ~= v63 or (v63 == "" or not v63))) and true or false) == true then
            v59 = v59 + 1
            v60[v59] = v62
        end
    end
    local v64 = 0
    local v65 = {}
    for v66, v67 in v60 do
        local _ = v66 - 1
        local v68 = u18(v67.Name)
        local v69
        if v68 == nil then
            v69 = v68
        else
            v69 = v68.maxStackSize
        end
        local v70
        if v69 == nil then
            v70 = true
        else
            local v71 = u17.getToolFromInventory(u11.LocalPlayer, v67.Name)
            local v72
            if v71 == nil then
                v72 = v71
            else
                v72 = v71.amount
            end
            v70 = v72 == nil or v71.amount < v68.maxStackSize.amount
        end
        if v70 == true then
            v64 = v64 + 1
            v65[v64] = v67
        end
    end
    local v73 = false
    local v74 = 0
    while true do
        if true then
            if v73 then
                v74 = v74 + 1
            else
                v73 = true
            end
        end
        local v75 = #v65
        if v74 >= math.min(5, v75) then
            break
        end
        local v76 = v65[v74 + 1]
        v76:SetAttribute("ClientPickupAttemptTime", tick())
        u19.Client:Get("PirateFlagPickUpItem"):CallServerAsync({
            ["itemDrop"] = v76,
            ["flagPosition"] = v43
        })
        local v77 = u4
        local v78 = p40.flagCollectedMap
        local v79 = {
            [v76.Name] = v76:GetAttribute("Amount")
        }
        local v80 = v77.getOrCreate(v78, v43, v79)
        local v81 = v76.Name
        local v82 = v80[v76.Name]
        v80[v81] = (v82 == nil and 0 or v82) + v76:GetAttribute("Amount")
    end
    p40:updateBillboard(v43)
    goto l64
end
function u22.updateBillboard(p83, p84) --[[ Line: 278 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u21
    --]]
    local v85 = p83.flagToTree[p84]
    local v86 = p83.flagCollectedMap[p84]
    if v86 then
        local v87 = u3:getStore():getBlockAt(u3:getBlockPosition(p84))
        if v87 then
            if v85 then
                u8.update(v85, u8.createElement(u21, {
                    ["ItemsCollected"] = v86,
                    ["Flag"] = v87
                }))
            else
                local v88 = u8.mount(u8.createElement(u21, {
                    ["ItemsCollected"] = v86,
                    ["Flag"] = v87
                }), v87)
                p83.flagToTree[p84] = v88
            end
        else
            return nil
        end
    else
        return nil
    end
end
function u22.createBuffCircleIndicator(_, p89, u90, p91) --[[ Line: 307 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u16
        [3] = u7
        [4] = u12
    --]]
    local v92 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
    local u93 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
    local v94 = {
        ["Name"] = "BuffCircle"
    }
    local v95
    if p91 == nil then
        v95 = p91
    else
        v95 = p91.parent
    end
    if v95 == nil then
        v95 = u13
    end
    v94.Parent = v95
    v94.Size = Vector3.new(0.15, 0, 0)
    local v96 = CFrame.new(p89)
    local v97 = u16 / 2
    v94.CFrame = v96 - Vector3.new(0, v97, 0)
    v94.Orientation = Vector3.new(0, 0, 90)
    v94.Shape = Enum.PartType.Cylinder
    local v98
    if p91 == nil then
        v98 = p91
    else
        v98 = p91.color
    end
    if v98 == nil then
        v98 = Color3.fromRGB(255, 255, 255)
    end
    v94.Color = v98
    local v99
    if p91 == nil then
        v99 = p91
    else
        v99 = p91.transparency
    end
    v94.Transparency = v99 == nil and 0 or v99
    v94.CastShadow = false
    v94.Material = Enum.Material.ForceField
    v94.Reflectance = 0
    v94.Anchored = true
    v94.CanCollide = false
    v94.CanTouch = false
    v94.CanQuery = false
    local u100 = u7("Part", v94)
    local v101 = u12
    local v102 = {}
    local v103 = u90 * 2
    local v104 = u90 * 2
    v102.Size = Vector3.new(0, v103, v104)
    local v105 = v101:Create(u100, v92, v102)
    v105:Play()
    local u106 = nil
    u106 = v105.Completed:Connect(function() --[[ Line: 371 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u100
            [3] = u93
            [4] = u90
            [5] = u106
        --]]
        local v107 = u12
        local v108 = u100
        local v109 = u93
        local v110 = {}
        local v111 = u90 * 2
        local v112 = u90 * 2
        v110.Size = Vector3.new(0.25, v111, v112)
        local v113 = u100.Position.X
        local v114 = u100.Position.Y + 0.125 + 0.1
        local v115 = u100.Position.Z
        v110.Position = Vector3.new(v113, v114, v115)
        v107:Create(v108, v109, v110):Play()
        u106:Disconnect()
    end)
    local v116
    if p91 == nil then
        v116 = p91
    else
        v116 = p91.fadeOutAfterSec
    end
    if v116 ~= nil then
        local v117 = task
        if p91 ~= nil then
            p91 = p91.fadeOutAfterSec
        end
        v117.delay(p91, function() --[[ Line: 388 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u100
            --]]
            local v118 = u12:Create(u100, TweenInfo.new(1), {
                ["Transparency"] = 1
            })
            v118:Play()
            local u119 = nil
            u119 = v118.Completed:Connect(function() --[[ Line: 395 ]]
                --[[
                Upvalues:
                    [1] = u100
                    [2] = u119
                --]]
                u100:Destroy()
                u119:Disconnect()
            end)
        end)
    end
    return u100
end
v6.CreateController(u22.new())
return nil