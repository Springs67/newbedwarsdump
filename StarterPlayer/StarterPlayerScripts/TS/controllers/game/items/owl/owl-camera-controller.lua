local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.RunService
local u13 = v9.TweenService
local u14 = v9.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = v1.import(script, script.Parent, "owl-util").OwlUtil
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "OwlCameraController"
    end,
    ["__index"] = u16
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
        [3] = u14
    --]]
    u16.constructor(p30)
    p30.Name = "OwlCameraController"
    p30.maid = u7.new()
    p30.isActive = false
    p30.camera = u14.CurrentCamera
end
function u27.KnitStart(u31) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u24
        [3] = u10
        [4] = u15
        [5] = u18
    --]]
    u16.KnitStart(u31)
    u24.Client:Get("OwlSummoned"):Connect(function(p32, p33) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u10
        --]]
        u31:SummonOwl(p32, p33)
        if p32 == u10.LocalPlayer then
            u31.isActive = true
        end
    end)
    u15.AbilityUsed:connect(function(p34) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u18
            [3] = u31
            [4] = u24
        --]]
        if p34.userCharacter == u10.LocalPlayer.Character and p34.ability == u18.DEACTIVE_OWL then
            u31:deactiveOwl()
            u24.Client:Get("RemoveOwl"):SendToServer()
        end
    end)
    u15.NewHandItem:connect(function(p35) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        if u31.isActive then
            p35:setCancelled(true)
        end
    end)
    u24.Client:Get("OwlDeattached"):Connect(function(p36) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u31
        --]]
        if p36 == u10.LocalPlayer then
            u31:deactiveOwl()
        end
    end)
end
function u27.activeOwl(p37, p38, p39) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u15
        [3] = u10
        [4] = u2
        [5] = u18
        [6] = u23
    --]]
    if not p38.Character then
        return nil
    end
    local v40 = u26:getOwlClientModelByUser(p39)
    if not v40 then
        return nil
    end
    local v41 = v40.PrimaryPart
    if not v41 then
        return nil
    end
    p37.camera.CameraSubject = v41
    u15.OwlNewTarget:fire(p38)
    p37.owl = u26:getOwlClientModelByUser(u10.LocalPlayer)
    p37:enableFirstPersonController()
    task.wait(0.5)
    local v42 = p37.maid
    local v43 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v44 = u18.DEACTIVE_OWL
    local v45 = {
        ["abilityType"] = "KitTertiary",
        ["abilityButton"] = {
            ["icon"] = u23.OWL_IMAGE
        }
    }
    v42:GiveTask(v43:enableAbility(v44, v45):expect())
end
function u27.SummonOwl(u46, u47, u48) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u10
        [4] = u8
        [5] = u4
        [6] = u20
        [7] = u19
        [8] = u5
        [9] = u25
        [10] = u13
    --]]
    local v49 = u46:getKitSkinData(u47.Character)
    local v50
    if v49 == nil then
        v50 = v49
    else
        v50 = v49.owlModel
    end
    local v51
    if v49 == nil then
        v51 = v49
    else
        v51 = v49.owlModel
    end
    local u52
    if v51 then
        u52 = v49.owlModel:Clone()
    else
        u52 = u11.Assets.Effects.OwlShooter:Clone()
    end
    u52.Name = "TweenOwl"
    u52.Archivable = true
    u52.Parent = u14
    local v53 = u52.PrimaryPart
    if u47 == u10.LocalPlayer then
        local v54 = u8
        local v55 = {
            ["Name"] = "owlForce"
        }
        local v56 = u14.Gravity * v53.Mass
        v55.Force = Vector3.new(0, v56, 0)
        v55.Parent = v53
        v54("BodyForce", v55)
        u46.camera.CameraSubject = v53
        u10.LocalPlayer.CameraMinZoomDistance = 5
        u10.LocalPlayer.CameraMinZoomDistance = 0.5
    end
    u4:playAnimation(u52, u20:getAssetId(u19.OWL_FLY))
    local v57 = u47.Character
    if v57 ~= nil then
        v57 = v57.PrimaryPart
    end
    local v58 = u48.Character
    if v58 ~= nil then
        v58 = v58.PrimaryPart
    end
    if not (v53 and (v57 and v58)) then
        return nil
    end
    v53.Position = v57.Position
    u5:playSound(u25.OWL_HOOT, {
        ["rollOffMaxDistance"] = 220,
        ["position"] = v53.Position
    })
    local v59 = v53.Position
    local v60 = v58.Position
    v53.CFrame = CFrame.new(v59, v60 + Vector3.new(1, 3, 1))
    local v61 = TweenInfo.new(0.5)
    local v62 = u48.Character
    if v62 ~= nil then
        v62 = v62:FindFirstChild("LeftUpperArm")
        if v62 ~= nil then
            v62 = v62:FindFirstChild("LeftShoulderAttachment")
        end
    end
    local v63 = v62.WorldPosition + Vector3.new(0, 0.5, 0)
    local v64 = u48.Character
    if v64 ~= nil then
        v64 = v64:GetPrimaryPartCFrame().LookVector.Unit
    end
    local v65 = u13
    local v66 = {}
    local v67 = v64 * 6
    v66.CFrame = CFrame.new(v63, v63 + v67)
    local v68 = v65:Create(v53, v61, v66)
    v68:Play()
    v68.Completed:Connect(function() --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u47
            [3] = u10
            [4] = u46
            [5] = u48
        --]]
        u52:Destroy()
        if u47 == u10.LocalPlayer then
            u46:activeOwl(u48, u47)
        end
    end)
end
function u27.deactiveOwl(p69) --[[ Line: 181 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u17
    --]]
    p69.maid:DoCleaning()
    u15.OwlNewTarget:fire(nil)
    local v70 = u10.LocalPlayer.Character
    if v70 then
        p69.camera.CameraSubject = v70.Humanoid
        p69.isActive = false
        p69:disableFirstPersonController()
        u17:dispatch({
            ["type"] = "UnequipItemInHand",
            ["equip"] = true
        })
    end
end
function u27.enableFirstPersonController(u71) --[[ Line: 195 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u10
        [3] = u21
        [4] = u12
    --]]
    local u72 = u71.owl
    if u72 ~= nil then
        local v73 = 0
        u72 = {}
        for v74, v75 in u72:GetDescendants() do
            local _ = v74 - 1
            if (v75:IsA("MeshPart") or (v75:IsA("Decal") or v75:IsA("ParticleEmitter"))) == true then
                v73 = v73 + 1
                u72[v73] = v75
            end
        end
    end
    local v76 = u26:getOwlTarget(u10.LocalPlayer)
    if not v76 then
        return nil
    end
    local u77 = u21:getEntity(v76)
    u71.FirstPersonController = u12.Heartbeat:Connect(function() --[[ Line: 220 ]]
        --[[
        Upvalues:
            [1] = u71
            [2] = u72
            [3] = u77
        --]]
        local v78 = u71.owl
        if v78 ~= nil then
            v78 = v78:GetAttribute("TransparencyOverride")
        end
        if v78 == 0 or (v78 ~= v78 or (v78 == "" or not v78)) then
            local v79 = u71.camera
            if v79 ~= nil then
                v79 = (v79.Focus.Position - u71.camera.CFrame.Position).Magnitude
            end
            if v79 == 0 or (v79 ~= v79 or not (v79 and (u71.owl and u72))) then
                return nil
            elseif v79 < 0.6 then
                for v80, v81 in u72 do
                    local _ = v80 - 1
                    if v81:IsA("MeshPart") or v81:IsA("Decal") then
                        v81.Transparency = 1
                    end
                end
                local v82 = u77
                if v82 ~= nil then
                    v82:hideNametag()
                end
                u71.owl:SetAttribute("FirstPerson", true)
                local v83 = CFrame.new(u71.owl.PrimaryPart.Position)
                local v84 = u71.camera.CFrame.Rotation
                u71.owl.PrimaryPart.CFrame = v83 * v84
                return
            elseif v79 < 3 then
                for v85, v86 in u72 do
                    local _ = v85 - 1
                    if v86:IsA("MeshPart") or v86:IsA("Decal") then
                        v86.Transparency = 0.7
                    end
                end
                u71.owl:SetAttribute("FirstPerson", false)
            else
                u71.owl:SetAttribute("FirstPerson", false)
                for v87, v88 in u72 do
                    local _ = v87 - 1
                    if v88:IsA("MeshPart") or v88:IsA("Decal") then
                        v88.Transparency = 0
                    end
                    if v88:IsA("ParticleEmitter") then
                        v88.Enabled = false
                    end
                end
                if u77 then
                    u77:showNametag()
                end
            end
        else
            return nil
        end
    end)
end
function u27.disableFirstPersonController(p89) --[[ Line: 284 ]]
    local v90 = p89.FirstPersonController
    if v90 ~= nil then
        v90:Disconnect()
    end
end
function u27.getKitSkinData(_, p91) --[[ Line: 290 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u22
    --]]
    if not p91 then
        return nil
    end
    local v92 = u22[u6.Controllers.KitSkinController:getKitSkin(p91)]
    if v92.owl then
        return v92.owl
    end
end
u6.CreateController(u27.new())
return nil