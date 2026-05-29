local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ActionButton
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.RunService
local u13 = v9.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountUsedActionType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "MountController"
    end,
    ["__index"] = u15
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p22)
    p22.Name = "MountController"
    local v23 = Enum.KeyCode:GetEnumItems()
    local v24 = table.create(#v23)
    for v25, v26 in v23 do
        local _ = v25 - 1
        v24[v25] = v26.Name
    end
    p22.keycodeNames = v24
    p22.activeMounts = {}
end
function u19.KnitStart(u27) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u12
        [3] = u13
        [4] = u18
        [5] = u16
        [6] = u17
        [7] = u6
        [8] = u10
        [9] = u2
        [10] = u8
        [11] = u3
        [12] = u14
    --]]
    u15.KnitStart(u27)
    u12.Heartbeat:Connect(function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u13
        --]]
        debug.profilebegin("mount-controller")
        for v28, v29 in u27:getActiveMounts() do
            if not v29.model:IsDescendantOf(u13) then
                u27:removeMount(v28, v29.mountType)
            end
        end
        debug.profileend()
    end)
    u18.Client:OnEvent("MountUsed", function(p30, p31, p32, p33) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u17
            [3] = u6
            [4] = u27
            [5] = u10
            [6] = u2
            [7] = u8
            [8] = u3
            [9] = u18
            [10] = u14
        --]]
        local v34 = u16[p31]
        local v35 = p32.Character
        if v35 == nil then
            return nil
        elseif p30 == u17.MOUNT then
            local v36 = u6.new()
            local v37 = u27:weldMountToCharacter(p31, v35)
            if not v37 then
                return nil
            end
            v36:GiveTask(v37)
            if p32 == u10.LocalPlayer and not p33 then
                local v38 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("Dismount")
                if v38 ~= nil then
                    local v39 = 0
                    v38 = {}
                    for v40, v41 in v38 do
                        local _ = v40 - 1
                        local v42 = u27.keycodeNames
                        local v43 = v41.Name
                        if table.find(v42, v43) ~= nil == true then
                            v39 = v39 + 1
                            v38[v39] = v41
                        end
                    end
                    if v38 ~= nil then
                        v38 = table.remove(v38, 1)
                    end
                end
                v36:GiveTask((u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u8.createElement(u3, {
                    ["actionName"] = "dismount-" .. p31,
                    ["interactionKey"] = v38,
                    ["onActivated"] = function() --[[ Name: onActivated, Line 103 ]]
                        --[[
                        Upvalues:
                            [1] = u18
                        --]]
                        u18.Client:Get("Dismount"):SendToServer()
                    end,
                    ["text"] = "Dismount " .. v34.displayName
                }))))
            end
            u27.activeMounts[p32] = {
                ["maid"] = v36,
                ["mountType"] = p31,
                ["model"] = v37
            }
            u14.GenericMountMounted:fire(p32, p31, v37, v35)
        elseif p30 == u17.DISMOUNT then
            u27:removeMount(p32, p31)
        end
    end)
end
function u19.removeMount(p44, p45, p46) --[[ Line: 125 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u14
    --]]
    local v47 = p44.activeMounts[p45]
    local v48 = p45.Character
    if v47 then
        if p46 and p46 ~= v47.mountType then
            return nil
        end
        local v49 = u16[v47.mountType]
        local v50 = u14.GenericMountDismounted
        local v51
        if v47 == nil then
            v51 = v47
        else
            v51 = v47.mountType
        end
        v50:fire(p45, v51)
        if v47.model and (v48 and v48.Humanoid) then
            local v52 = v49.mountHipYOffset
            if v52 == nil then
                v52 = v47.model.PrimaryPart.Size.Y / 2 - 0.1
            end
            local v53 = v48.Humanoid
            v53.HipHeight = v53.HipHeight - v52
        end
        if v47 ~= nil then
            v47.maid:DoCleaning()
        end
        if p46 then
            local v54 = p44.activeMounts[p45]
            if v54 ~= nil then
                v54 = v54.mountType
            end
            p46 = v54 ~= p46
        end
        if p46 then
            return nil
        end
        p44.activeMounts[p45] = nil
    end
end
function u19.getActiveMounts(p55) --[[ Line: 171 ]]
    return p55.activeMounts
end
function u19.getMountModelFromPlayer(p56, p57) --[[ Line: 174 ]]
    local v58 = p56.activeMounts[p57]
    if v58 ~= nil then
        v58 = v58.model
    end
    return v58
end
function u19.getMountTypeFromPlayer(p59, p60) --[[ Line: 184 ]]
    local v61 = p59.activeMounts[p60]
    if v61 ~= nil then
        v61 = v61.mountType
    end
    return v61
end
function u19.getMountModel(_, p62) --[[ Line: 194 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u11
    --]]
    local v63 = u16[p62]
    local v64 = v63.model
    if type(v64) ~= "string" then
        return v63.model()
    end
    local v65 = u11.Assets.Mounts:FindFirstChild(v63.model)
    if v65 ~= nil then
        v65 = v65:Clone()
    end
    return v65
end
function u19.weldMountToCharacter(p66, p67, p68) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u5
        [3] = u7
    --]]
    local v69 = u16[p67]
    local v70 = p66:getMountModel(p67)
    if v70 == nil or v70.PrimaryPart == nil then
        u5.Error("Error creating mount {mountType}. model not found", p67)
        return nil
    end
    v70:PivotTo(p68:GetPivot() * CFrame.new(0, -v70.PrimaryPart.Size.Y, 0))
    local v71 = v69.mountHipYOffset
    if v71 == nil then
        v71 = v70.PrimaryPart.Size.Y / 2 - 0.1
    end
    local v72 = p68.Humanoid
    v72.HipHeight = v72.HipHeight + v71
    u7("WeldConstraint", {
        ["Part0"] = p68.HumanoidRootPart,
        ["Part1"] = v70.PrimaryPart,
        ["Parent"] = v70.PrimaryPart
    })
    v70.Parent = p68
    return v70
end
v4.CreateController(u19.new())
return nil