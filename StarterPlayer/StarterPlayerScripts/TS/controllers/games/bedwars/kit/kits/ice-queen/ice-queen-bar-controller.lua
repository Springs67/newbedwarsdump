local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v10.ReplicatedStorage
local u14 = v10.RunService
local u15 = v10.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u18 = v1.import(script, script.Parent, "ui", "ice-queen-passive-bar").IceQueenPassiveBarWrapper
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "IceQueenBarController"
    end,
    ["__index"] = u16
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
        [1] = u16
        [2] = u6
        [3] = u15
    --]]
    u16.constructor(p22)
    p22.Name = "IceQueenBarController"
    p22.log = u6.ForContext(script)
    p22.camera = u15.CurrentCamera
    p22.passiveMap = {}
    p22.stackUIMap = {}
end
function u19.KnitStart(u23) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u2
    --]]
    u16.KnitStart(u23)
    u2("entity", function(u24) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v25 = u24:GetAttribute("IceQueenStacks")
        if v25 ~= nil and v25 > 0 then
            u23:updateStacks(u24, v25)
        end
        u24:GetAttributeChangedSignal("IceQueenStacks"):Connect(function() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u23
            --]]
            local v26 = u24:GetAttribute("IceQueenStacks")
            if v26 ~= nil then
                u23:updateStacks(u24, v26)
            end
        end)
    end)
end
function u19.updateStacks(u27, u28, p29) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u18
        [4] = u12
        [5] = u13
        [6] = u5
        [7] = u17
        [8] = u8
        [9] = u11
        [10] = u14
    --]]
    local v30 = u27.passiveMap[u28]
    if p29 == 0 then
        if v30 then
            u27:cleanupStacks(u28)
            return
        end
    else
        if v30 then
            u27.log:Debug("Update ice queen bar to {bar}", p29)
            v30.setBar(p29)
            v30.particles:FindFirstChild("Snow"):SetAttribute("EmitCount", p29)
            u27.passiveMap[u28] = {
                ["bar"] = v30.bar,
                ["setBar"] = v30.setBar,
                ["maid"] = v30.maid,
                ["particles"] = v30.particles
            }
            return
        end
        local v31, v32 = u9.createBinding(p29)
        local v33 = u7.new()
        local v34 = u28:GetAttribute("IceQueenAttackerId")
        local v35 = u27.stackUIMap[u28]
        if v35 then
            u9.update(v35, u9.createElement(u18, {
                ["adornee"] = u28.Head,
                ["bar"] = v31,
                ["lastAttackerUserId"] = v34
            }))
        else
            local v36 = u9.mount(u9.createElement(u18, {
                ["adornee"] = u28.Head,
                ["bar"] = v31,
                ["lastAttackerUserId"] = v34
            }), u12.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
            u27.stackUIMap[u28] = v36
        end
        u28.AncestryChanged:Connect(function(_, p37) --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u28
            --]]
            if p37 == nil then
                u27:cleanupStacks(u28)
            end
        end)
        local v38 = u13.Assets.Effects.FrostBiteParticles
        local v39 = u5.Controllers.IceQueenEffectsController:getAttackerKitSkin(u28)
        if v39 then
            local v40 = u17[v39].freiya
            local v41
            if v40 == nil then
                v41 = v40
            else
                v41 = v40.effects
                if v41 ~= nil then
                    v41 = v41.idle
                end
            end
            if v41 then
                v38 = v40
                if v38 ~= nil then
                    v38 = v38.effects
                    if v38 ~= nil then
                        v38 = v38.idle
                    end
                end
            end
        end
        local v42 = v38:Clone()
        v42.Parent = u28
        v42.Position = u28.PrimaryPart.Position
        u8("WeldConstraint", {
            ["Part0"] = v42,
            ["Part1"] = u28.PrimaryPart,
            ["Parent"] = v42
        })
        local u43 = v42:FindFirstChild("Snow")
        u11:AddTag(u43, "FirstPersonHidden")
        u43.Enabled = false
        local u44 = 0
        v33:GiveTask(u14.Heartbeat:Connect(function(p45) --[[ Line: 144 ]]
            --[[
            Upvalues:
                [1] = u44
                [2] = u27
                [3] = u28
                [4] = u12
                [5] = u43
            --]]
            u44 = u44 + p45
            if u44 >= 1 then
                local v46 = u27.camera
                if v46 ~= nil then
                    v46 = (v46.Focus.Position - u27.camera.CFrame.Position).Magnitude
                end
                if v46 ~= 0 and (v46 == v46 and v46) then
                    if u28 == u12.LocalPlayer.Character then
                        v46 = v46 < 0.6
                    else
                        v46 = false
                    end
                end
                if v46 ~= 0 and (v46 == v46 and v46) then
                    return nil
                end
                u43:Emit(u43:GetAttribute("EmitCount") * 3)
                u44 = 0
            end
        end))
        u27.passiveMap[u28] = {
            ["bar"] = v31,
            ["setBar"] = v32,
            ["maid"] = v33,
            ["particles"] = v42
        }
    end
end
function u19.cleanupStacks(p47, p48) --[[ Line: 178 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v49 = p47.passiveMap[p48]
    if v49 ~= nil then
        v49.maid:DoCleaning()
    end
    if v49 ~= nil then
        v49.particles:Destroy()
    end
    p47.passiveMap[p48] = nil
    local v50 = p47.stackUIMap[p48]
    if v50 then
        u9.unmount(v50)
    end
    p47.stackUIMap[p48] = nil
end
v4.CreateController(u19.new())
return nil