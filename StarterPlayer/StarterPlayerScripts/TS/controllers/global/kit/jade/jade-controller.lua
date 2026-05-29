local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacterAnimation
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Debris
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "jade-balance").JadeBalance
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "JadeController"
    end,
    ["__index"] = u10
})
u16.__index = u16
function u16.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19, ...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p19, ...)
    p19.Name = "JadeController"
end
function u16.KnitStart(_) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u15
        [3] = u11
        [4] = u3
        [5] = u12
        [6] = u13
        [7] = u9
        [8] = u14
        [9] = u2
        [10] = u5
        [11] = u8
        [12] = u7
    --]]
    u4.Controllers.PreloadController:preloadForItemType(u15.JADE_HAMMER, {
        ["animations"] = { u11.JADE_HAMMER_IDLE, u11.JADE_HAMMER_SLAM }
    })
    local u20 = {}
    u3({ u12:getAssetId(u11.JADE_HAMMER_SLAM) }, function(p21, p22) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u9
            [3] = u20
            [4] = u14
            [5] = u15
            [6] = u2
            [7] = u5
            [8] = u8
            [9] = u7
        --]]
        local u23 = p21.Character
        if not u23 then
            return nil
        end
        local v24 = os.clock()
        local v25 = u13.HAMMER_COOLDOWN
        local v26 = u9.ItemCooldownModifierCheck:fire(v25).cooldown
        local v27 = u20[u23]
        if v24 - (v27 == nil and 0 or v27) < v26 * 0.95 then
            return nil
        end
        local u28 = u14:getEntity(p21)
        if u28 ~= nil then
            u28 = u28:getHandItemInstanceFromCharacter()
        end
        if u28 == nil or u28.Name ~= u15.JADE_HAMMER then
            return nil
        end
        u20[u23] = v24
        for _, v29 in u28:GetDescendants() do
            if v29:IsA("Trail") then
                v29.Enabled = true
            end
        end
        for _, v30 in u23:GetDescendants() do
            if v30:IsA("Trail") then
                v30.Enabled = true
            end
        end
        task.delay(p22.Length, function() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u28
                [3] = u2
                [4] = u5
                [5] = u8
                [6] = u7
            --]]
            if not u23.Parent then
                return nil
            end
            for _, v31 in u28:GetDescendants() do
                if v31:IsA("Trail") then
                    v31.Enabled = false
                end
            end
            for _, v32 in u23:GetDescendants() do
                if v32:IsA("Trail") then
                    v32.Enabled = false
                end
            end
            local v33 = u28:FindFirstChild("Handle")
            if not v33 then
                return nil
            end
            local v34 = v33:FindFirstChild("StrikePosition")
            if not v34 then
                return nil
            end
            local v35 = false
            local v36 = 0
            while true do
                if v35 then
                    v36 = v36 + 1
                else
                    v35 = true
                end
                if v36 >= 3 then
                    return
                end
                local v37 = false
                local v38 = 0
                while true do
                    if true then
                        if v37 then
                            v38 = v38 + 1
                        else
                            v37 = true
                        end
                    end
                    if v38 >= 3 then
                        break
                    end
                    local v39 = u2
                    local v40 = v34.WorldPosition
                    local v41 = v36 * 3
                    local v42 = v38 * 3
                    local v43 = Vector3.new(v41, 0, v42)
                    local v44 = v39:getBlockPosition(v40 - Vector3.new(3, 3, 3) + v43)
                    local v45 = u2:getStore():getBlockAt(v44)
                    if v45 then
                        local v46 = v45.Name
                        local v47 = u2:getHandlerRegistry():getHandler(v46)
                        if v47 then
                            local v48 = v47:place(v44 + Vector3.new(0, 1, 0), 0)
                            v48.CanCollide = false
                            v48.Anchored = false
                            for _, v49 in v48:GetChildren() do
                                if v49:IsA("BasePart") then
                                    v49.CanCollide = false
                                    v49.Anchored = false
                                    u5("WeldConstraint", {
                                        ["Part0"] = v49,
                                        ["Part1"] = v48,
                                        ["Parent"] = v49
                                    })
                                end
                            end
                            local v50 = (v34.WorldPosition - v48.Position).Unit
                            local v51 = v50.X
                            local v52 = v50.Y
                            local v53 = Vector3.new(v51, 0.8, v52)
                            v48.Parent = u8
                            v48.AssemblyLinearVelocity = v53 * 100
                            u7:AddItem(v48, 3)
                        end
                    end
                end
            end
        end)
    end)
end
u4.CreateController(u16.new())
return nil