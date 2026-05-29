local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ContentProvider
local u9 = v7.MaterialService
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "PreloadController"
    end,
    ["__index"] = u12
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u5
        [3] = u16
    --]]
    u12.constructor(p20)
    p20.Name = "PreloadController"
    p20.itemPreloads = {}
    for _, v21 in u5.values(u16) do
        p20.itemPreloads[v21] = {}
    end
end
function u17.KnitStart(u22) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
        [3] = u11
        [4] = u15
    --]]
    u12.KnitStart(u22)
    u9.ChildAdded:Connect(function(p23) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        if p23:IsA("MaterialVariant") then
            u22:preloadMaterialVariant(p23)
        end
    end)
    for _, v24 in u9:GetChildren() do
        if v24:IsA("MaterialVariant") then
            u22:preloadMaterialVariant(v24)
        end
    end
    u11.ItemAdded:connect(function(p25) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u15
        --]]
        local u26 = u22.itemPreloads[p25.item.Name]
        local v27 = u15(p25.item.Name)
        local v28 = v27.block
        if v28 ~= nil then
            v28 = v28.greedyMesh
        end
        if v28 then
            local v29 = {
                ["imageIds"] = v27.block.greedyMesh.textures
            }
            table.insert(u26, v29)
        end
        if #u26 == 0 then
            return nil
        end
        task.spawn(function() --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u22
            --]]
            for _, v30 in u26 do
                u22:runPreload(v30)
            end
        end)
    end)
end
function u17.preloadMaterialVariant(_, p31) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
    --]]
    local u32 = u6("Part", {
        ["Name"] = "PreloadMaterial",
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["Anchored"] = true,
        ["Size"] = Vector3.new(0, 0, 0),
        ["Material"] = Enum.Material.Fabric,
        ["MaterialVariant"] = p31.Name
    })
    local v33 = u10.CurrentCamera
    if v33 ~= nil then
        v33 = v33.CFrame * Vector3.new(0, 0, -80)
    end
    u32.Position = v33 == nil and Vector3.new(0, 0, 0) or v33
    u32.Parent = u10
    task.delay(5, function() --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:Destroy()
    end)
end
function u17.preloadForItemType(p34, p35, p36) --[[ Line: 105 ]]
    local v37 = p34.itemPreloads[p35]
    table.insert(v37, p36)
end
function u17.runPreload(_, u38) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u8
        [4] = u6
        [5] = u13
    --]]
    if u38.loadOnGameTypes then
        local v39, v40 = u4.Controllers.MatchController:getQueueTypeAsync():await()
        if v39 then
            local v41 = u14(v40)
            local v42 = u38.loadOnGameTypes
            if v42 ~= nil then
                local v43 = v41.game
                v42 = table.find(v42, v43) ~= nil
            end
            if not v42 then
                return nil
            end
        end
    end
    if u38.instances ~= nil then
        task.spawn(function() --[[ Line: 128 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u38
            --]]
            u8:PreloadAsync(u38.instances)
        end)
    end
    if u38.callback ~= nil then
        local u44 = u38.callback
        task.spawn(function() --[[ Line: 134 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            u44()
        end)
    end
    if u38.sounds ~= nil then
        task.spawn(function() --[[ Line: 139 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u38
                [3] = u6
            --]]
            local v45 = u8
            local v46 = u38.sounds
            local v47 = table.create(#v46)
            for v48, v49 in v46 do
                local _ = v48 - 1
                v47[v48] = u6("Sound", {
                    ["SoundId"] = v49
                })
            end
            v45:PreloadAsync(v47)
        end)
    end
    if u38.animations ~= nil then
        task.spawn(function() --[[ Line: 157 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u38
                [3] = u13
            --]]
            local v50 = u8
            local v51 = u38.animations
            local v52 = table.create(#v51)
            for v53, v54 in v51 do
                local _ = v53 - 1
                v52[v53] = u13:getAnimation(v54)
            end
            v50:PreloadAsync(v52)
        end)
    end
    if u38.imageIds ~= nil then
        task.spawn(function() --[[ Line: 173 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u38
                [3] = u6
            --]]
            local v55 = u8
            local v56 = u38.imageIds
            local v57 = table.create(#v56)
            for v58, v59 in v56 do
                local _ = v58 - 1
                v57[v58] = u6("ImageLabel", {
                    ["Image"] = v59
                })
            end
            v55:PreloadAsync(v57)
        end)
    end
end
v3.CreateController(u17.new())
return nil