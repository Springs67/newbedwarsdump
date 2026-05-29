local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.SoundManager
local u5 = v2.WatchCollectionTag
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v11.UserInputService
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "dodo-bird", "dodo-bird").DodoAction
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v3.registerConstants(script, {
    ["MaxDodoJumps"] = 2
})
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "DodoBirdController"
    end,
    ["__index"] = u16
})
u24.__index = u24
function u24.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27, ...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u21
    --]]
    u16.constructor(p27, ...)
    p27.Name = "DodoBirdController"
    p27.requestMountDodoBirdRemote = u21.Client:Get("InteractDodoBird")
    p27.playerToDodoBird = {}
end
function u24.KnitStart(u28) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u5
        [3] = u8
        [4] = u19
        [5] = u15
        [6] = u20
        [7] = u13
        [8] = u9
    --]]
    u16.KnitStart(u28)
    u5("dodo-bird", function(u29) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u28
            [3] = u19
        --]]
        u29:SetAttribute("NextSquawk", -1)
        local v30 = {
            ["Name"] = "DodoMountPrompt",
            ["ActionText"] = "Mount",
            ["ObjectText"] = "Dodo Bird",
            ["HoldDuration"] = 1.1,
            ["RequiresLineOfSight"] = false,
            ["Triggered"] = function() --[[ Name: Triggered, Line 57 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u19
                    [3] = u29
                --]]
                u28.requestMountDodoBirdRemote:SendToServer({
                    ["action"] = u19.Mount,
                    ["dodoBird"] = u29
                })
            end,
            ["Parent"] = u29
        }
        u8.Controllers.ProximityPromptController:createProximityPrompt(v30)
    end)
    u15.GenericMountMounted:connect(function(p31) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u13
            [3] = u28
            [4] = u9
        --]]
        if p31.mountType ~= u20.DODO_BIRD then
            return nil
        end
        if p31.player == u13.LocalPlayer then
            u28:toggleDodoProximityPrompts(false)
            if u28.dodoBirdMaid then
                u28.dodoBirdMaid:DoCleaning()
            end
            u28.dodoBirdMaid = u9.new()
            u28.dodoBirdMaid:GiveTask(function() --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:toggleDodoProximityPrompts(true)
            end)
            u28.dodoBirdMaid:GiveTask(u28:enableDoubleJump(p31.player.Character))
        end
        if p31.player.Character ~= nil then
            u28.playerToDodoBird[p31.player] = u28:mountPlayerOnDodoBird(p31.player.Character, p31.model)
        end
    end)
    u15.GenericMountDismounted:connect(function(p32) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u28
        --]]
        if p32.mountType ~= u20.DODO_BIRD then
            return nil
        end
        u28:unmountPlayerFromDodoBird(p32.player)
    end)
    for _, u33 in u13:GetPlayers() do
        u33.CharacterRemoving:Connect(function() --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u33
            --]]
            u28:unmountPlayerFromDodoBird(u33)
        end)
    end
    u13.PlayerAdded:Connect(function(u34) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u34.CharacterRemoving:Connect(function() --[[ Line: 100 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u34
            --]]
            u28:unmountPlayerFromDodoBird(u34)
        end)
    end)
end
function u24.mountPlayerOnDodoBird(_, p35, p36) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u22
        [3] = u10
        [4] = u12
        [5] = u18
        [6] = u17
    --]]
    u4:playSound(u22.DODO_BIRD_MOUNT, {
        ["position"] = p35:GetPrimaryPartCFrame().Position
    })
    p36:SetAttribute("NextSquawk", -1)
    p36:PivotTo(p35:GetPrimaryPartCFrame() * CFrame.new(0, -p36.RootPart.Size.Y, 0))
    local v37 = p35.Humanoid
    v37.HipHeight = v37.HipHeight + (p36.RootPart.Size.Y / 2 - 0.1)
    u10("WeldConstraint", {
        ["Part0"] = p35.HumanoidRootPart,
        ["Part1"] = p36.RootPart,
        ["Parent"] = p36.RootPart
    })
    p36.Parent = p35
    u12:AddTag(p36, "dodo-bird-mount")
    local v38 = p35.Humanoid.Animator:LoadAnimation(u18:getAnimation(u17.SIT_ON_DODO_BIRD))
    v38.Priority = Enum.AnimationPriority.Action
    v38:Play()
    return {
        ["model"] = p36,
        ["sitTrack"] = v38
    }
end
function u24.unmountPlayerFromDodoBird(p39, p40) --[[ Line: 131 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u4
        [3] = u22
    --]]
    if p40 == u13.LocalPlayer then
        local v41 = p39.dodoBirdMaid
        if v41 ~= nil then
            v41:DoCleaning()
        end
    end
    local v42 = p39.playerToDodoBird[p40]
    if v42 and v42.model.PrimaryPart then
        if p40.Character then
            if p40.Character.PrimaryPart then
                u4:playSound(u22.DODO_BIRD_DISMOUNT, {
                    ["position"] = p40.Character.PrimaryPart.Position
                })
            end
            local v43 = p40.Character:FindFirstChildOfClass("Humanoid")
            if v43 then
                v43.HipHeight = v43.HipHeight - (v42.model.PrimaryPart.Size.Y / 2 - 0.1)
            end
        end
        v42.sitTrack:Stop()
        v42.sitTrack:Destroy()
    end
    p39.playerToDodoBird[p40] = nil
end
function u24.enableDoubleJump(_, u44) --[[ Line: 161 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u14
        [4] = u23
    --]]
    local u45 = false
    local u46 = 0
    local u47 = -1
    local v48 = u9.new()
    v48:GiveTask(u8.Controllers.JumpHeightController:getJumpModifier():addModifier({
        ["jumpHeightMultiplier"] = 1.2
    }))
    v48:GiveTask(u8.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = 1.7,
        ["blockSprint"] = true
    }))
    v48:GiveTask(u44.Humanoid.StateChanged:Connect(function(_, p49) --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u46
        --]]
        if p49 == Enum.HumanoidStateType.Landed then
            u45 = false
            u46 = 0
        elseif p49 == Enum.HumanoidStateType.Jumping or p49 == Enum.HumanoidStateType.Freefall then
            u45 = true
        end
    end))
    v48:GiveTask(u14.JumpRequest:Connect(function() --[[ Line: 181 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u46
            [3] = u23
            [4] = u47
            [5] = u44
        --]]
        if u45 and (u46 < u23.MaxDodoJumps and u47 < time()) then
            u47 = time() + 0.25
            u46 = u46 + 1
            u44.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end))
    return v48
end
function u24.toggleDodoProximityPrompts(_, p50) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    for _, v51 in u12:GetTagged("dodo-bird") do
        local v52 = v51:FindFirstChild("DodoMountPrompt")
        if v52 ~= nil then
            v52.Enabled = p50
        end
    end
end
v7.CreateController(u24.new())
return nil