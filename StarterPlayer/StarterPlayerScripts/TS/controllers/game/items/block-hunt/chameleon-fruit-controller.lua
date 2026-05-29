local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "ChameleonFruitController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p18)
    p18.Name = "ChameleonFruitController"
end
function u15.KnitStart(u19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u13
        [4] = u1
        [5] = u11
        [6] = u8
        [7] = u5
        [8] = u12
        [9] = u4
    --]]
    u10.KnitStart(u19)
    u9.ItemConsumed:connect(function(p20) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u1
            [3] = u11
            [4] = u8
            [5] = u5
            [6] = u12
            [7] = u19
            [8] = u4
        --]]
        if p20.itemType ~= u13.BLOCK_HUNT_CHAMELEON_FRUIT then
            return nil
        end
        if not u1.instanceof(p20.entity, u11) then
            return nil
        end
        local v21 = p20.entity:getPlayer()
        local v22 = {}
        for _, v23 in u8:GetPlayers() do
            local v24 = u5.Controllers.TeamController:getPlayerTeam(v23)
            local v25 = u5.Controllers.TeamController:getPlayerTeam(v21)
            if v24 ~= nil then
                v24 = v24.id
            end
            if v25 ~= nil then
                v25 = v25.id
            end
            if v24 ~= v25 then
                local v26 = u12:getEntity(v23)
                local v27
                if v26 == nil then
                    v27 = v26
                else
                    v27 = v26:getInstance()
                end
                if v27 and v26:isAlive() then
                    v22[v23] = true
                end
            end
        end
        local v28 = u19
        local v29 = u4
        local v30 = 0
        local v31 = {}
        for v32 in v22 do
            v30 = v30 + 1
            v31[v30] = v32
        end
        v28:disguiseAsPlayer(v21, v29.fromList(unpack(v31)))
    end)
end
function u15.disguiseAsPlayer(_, p33, p34) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u7
        [4] = u3
        [5] = u14
    --]]
    local v35 = p34.Character
    if not v35 then
        return nil
    end
    local v36 = p33.Character
    if not v36 then
        return nil
    end
    u5.Controllers.BlockDisguiseController:undisguisePlayer(p33)
    local v37 = u6.new()
    local v38 = u7("Folder", {
        ["Name"] = "ExtraCharacterParts",
        ["Parent"] = v36
    })
    v37:GiveTask(v38)
    local u39 = u7("Model", {})
    local v40 = v35:GetChildren()
    local function v48(p41) --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        if p41:IsA("Humanoid") then
            return nil
        end
        local v42 = p41:Clone()
        local v43 = v42:GetDescendants()
        local function v45(p44) --[[ Line: 108 ]]
            if p44:FindFirstAncestorWhichIsA("Accessory") then
                return nil
            end
            if p44:IsA("Motor6D") then
                p44:Destroy()
            end
            if p44:IsA("WeldConstraint") then
                p44:Destroy()
            end
            if p44:IsA("Weld") then
                p44:Destroy()
            end
        end
        for v46, v47 in v43 do
            v45(v47, v46 - 1, v43)
        end
        v42.Parent = u39
    end
    for v49, v50 in v40 do
        v48(v50, v49 - 1, v40)
    end
    u39.PrimaryPart = u39:FindFirstChild("HumanoidRootPart")
    u39:PivotTo(v36:GetPrimaryPartCFrame())
    local v51 = u39:FindFirstChildOfClass("Humanoid")
    if v51 ~= nil then
        v51:Destroy()
    end
    local v52 = u39:FindFirstChild("HumanoidRootPart")
    if v52 ~= nil then
        v52:Destroy()
    end
    local v53 = u39:FindFirstChild("Animate")
    if v53 ~= nil then
        v53:Destroy()
    end
    local v54 = u39:FindFirstAncestorOfClass("BodyColors")
    if v54 ~= nil then
        v54:Destroy()
    end
    for _, v55 in u39:GetDescendants() do
        if v55:IsA("BasePart") then
            v55.Massless = true
            v55.CanCollide = false
            u3:setQueryIgnored(v55, true)
        end
    end
    u39.Parent = v38
    for _, v56 in v36:GetChildren() do
        if v56:IsA("BasePart") and v56.Name ~= "HumanoidRootPart" then
            local v57 = u39:FindFirstChild(v56.Name)
            if v57 and v57:IsA("BasePart") then
                for _, v58 in v57:GetDescendants() do
                    if v58:IsA("Motor6D") and not v58:FindFirstChildWhichIsA("Accessory") then
                        v58:Destroy()
                    end
                end
                v57.Parent = v38
                u7("Weld", {
                    ["Part0"] = v57,
                    ["Part1"] = v56,
                    ["Parent"] = v57
                })
            end
        end
    end
    for _, v59 in u39:GetChildren() do
        v59.Parent = v38
    end
    u14:weldCharacterAccessories(v36, v38)
end
u5.CreateController(u15.new())
return nil