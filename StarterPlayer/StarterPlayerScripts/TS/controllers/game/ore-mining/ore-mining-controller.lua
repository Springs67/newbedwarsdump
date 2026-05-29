local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v3.WatchCollectionTag
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.Workspace
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = u1.import(script, script.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
local v19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u21 = u17.IRON_ORE_MESH_BLOCK
local u22 = { v19.ORE_HIT_1, v19.ORE_HIT_2, v19.ORE_HIT_3 }
local u23 = {
    Vector2.new(0, 2),
    Vector2.new(1, 2),
    Vector2.new(2, 2),
    Vector2.new(2, 1),
    Vector2.new(2, 0)
}
local u24 = Color3.fromRGB(1, 255, 158)
local u25 = Color3.fromRGB(105, 237, 250)
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "OreMiningController"
    end,
    ["__index"] = u16
})
u26.__index = u26
function u26.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u18
    --]]
    u16.constructor(p29)
    p29.Name = "OreMiningController"
    p29.screenShakeCounter = 0
    p29.logger = u18.getLogger("OreMiningController")
end
function u26.KnitStart(u30) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
        [3] = u21
        [4] = u14
    --]]
    u16.KnitStart(u30)
    u7(u21, function(u31) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        local u32 = nil
        u32 = u31.Destroying:Connect(function() --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u31
                [3] = u32
            --]]
            u30:playOreDestructionEffects(u31)
            u32:Disconnect()
        end)
        task.defer(function() --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u31
            --]]
            u30:showBonusLoot(u31)
        end)
    end)
    u14.DamageBlock:connect(function(p33) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u30
        --]]
        if p33.blockType == u21 then
            u30:playOreHitSound()
            u30:playOreHitEffects()
        end
    end)
end
function u26.showBonusLoot(_, p34) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u25
        [3] = u24
    --]]
    local v35 = p34:GetAttribute("IronCount")
    local v36 = v35 == nil and 0 or v35
    local v37 = p34:GetAttribute("DiamondCount")
    local v38 = v37 == nil and 0 or v37
    local v39 = p34:GetAttribute("EmeraldCount")
    local v40 = v39 == nil and 0 or v39
    local v41 = v36 + v38 + v40
    local _ = v36 / v41
    local v42 = v38 / v41
    local v43 = v40 / v41
    if v42 > 0 or v43 > 0 then
        local v44 = 0
        local v45 = {}
        for v46, v47 in p34:GetDescendants() do
            local _ = v46 - 1
            local v48 = v47:IsA("Folder")
            if v48 then
                v48 = (v42 == 1 or v43 == 1) and true or v47.Name ~= "Bottom"
            end
            if v48 == true then
                v44 = v44 + 1
                v45[v44] = v47
            end
        end
        local function v53(p49, p50, _, _) --[[ Line: 114 ]]
            for v51, v52 in p50:GetChildren() do
                local _ = v51 - 1
                table.insert(p49, v52)
            end
            return p49
        end
        local v54 = {}
        for v55 = 1, #v45 do
            v54 = v53(v54, v45[v55], v55 - 1, v45)
        end
        local v56
        if v38 == 0 or (v38 ~= v38 or not v38) then
            v56 = v54
        else
            v56 = v54
            local v57 = false
            local v58 = 0
            while true do
                if true then
                    if v57 then
                        v58 = v58 + 1
                    else
                        v57 = true
                    end
                end
                local v59 = v42 * #v54
                local v60 = math.floor(v59)
                if v58 >= math.max(1, v60) then
                    break
                end
                local v61 = u5.fromList(unpack(v56))
                local v62 = 0
                v56 = {}
                for v63, v64 in v56 do
                    local _ = v63 - 1
                    if v64 ~= v61 == true then
                        v62 = v62 + 1
                        v56[v62] = v64
                    end
                end
                if v61 ~= nil then
                    v61.TextureID = ""
                    v61.Color = u25
                end
            end
        end
        if v40 ~= 0 and (v40 == v40 and v40) then
            local v65 = false
            local v66 = 0
            while true do
                if true then
                    if v65 then
                        v66 = v66 + 1
                    else
                        v65 = true
                    end
                end
                local v67 = v43 * #v54
                local v68 = math.floor(v67)
                if v66 >= math.max(1, v68) then
                    break
                end
                local v69 = u5.fromList(unpack(v56))
                local v70 = 0
                v56 = {}
                for v71, v72 in v56 do
                    local _ = v71 - 1
                    if v72 ~= v69 == true then
                        v70 = v70 + 1
                        v56[v70] = v72
                    end
                end
                if v69 ~= nil then
                    v69.TextureID = ""
                    v69.Color = u24
                end
            end
        end
    end
end
function u26.playOreHitSound(_) --[[ Line: 216 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u22
        [3] = u6
    --]]
    local v73 = u22
    u6:playSound((u5.fromList(unpack(v73))))
end
function u26.playOreHitEffects(p74) --[[ Line: 220 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u15
        [3] = u11
        [4] = u13
        [5] = u4
        [6] = u21
        [7] = u12
        [8] = u20
    --]]
    local v75 = u23[p74.screenShakeCounter % #u23 + 1]
    u15.shakeScreenDirection(v75, {
        ["magnitude"] = 0.01,
        ["duration"] = 0.1
    })
    p74.screenShakeCounter = p74.screenShakeCounter + 1
    local v76 = u11.LocalPlayer.Character
    if not v76 then
        return nil
    end
    local v77 = u13.CurrentCamera
    if not v77 then
        return nil
    end
    local v78 = RaycastParams.new()
    v78.FilterType = Enum.RaycastFilterType.Blacklist
    v78.FilterDescendantsInstances = { v76 }
    local v79 = u11.LocalPlayer:GetMouse().UnitRay
    local v80 = u4:raycast(v79.Origin, v79.Direction * 50, v78)
    local v81
    if v80 == nil then
        v81 = v80
    else
        v81 = v80.Instance
    end
    if v81 then
        v81 = v80.Instance.Name == u21
    end
    if v81 then
        local v82 = u12.Assets.Effects.MiningDebris:Clone()
        v82.CFrame = CFrame.lookAt(v80.Position, v77.CFrame.Position)
        v82.Parent = u13
        u20:playEffects({ v82 }, nil, {
            ["sizeMultiplier"] = 1,
            ["destroyAfterSec"] = 1
        })
    end
end
function u26.playOreDestructionEffects(u83, u84) --[[ Line: 264 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u1
        [3] = u2
        [4] = u17
        [5] = u13
        [6] = u8
        [7] = u21
        [8] = u11
        [9] = u4
    --]]
    local u85 = u9.new()
    local v109, v110 = u1.try(function() --[[ Line: 266 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u17
            [3] = u85
            [4] = u1
            [5] = u84
            [6] = u13
            [7] = u8
            [8] = u21
            [9] = u11
            [10] = u4
        --]]
        local v86 = u2:getHandlerRegistry():getHandler(u17.IRON_ORE_MESH_BLOCK)
        if not v86 then
            u85:DoCleaning()
            return u1.TRY_RETURN, {}
        end
        local u87 = u2:getBlockPosition(u84.Position)
        local u88 = v86:place(u87, 0)
        u85:GiveTask(function() --[[ Line: 275 ]]
            --[[
            Upvalues:
                [1] = u88
            --]]
            u88:Destroy()
        end)
        task.delay(0.25, function() --[[ Line: 278 ]]
            --[[
            Upvalues:
                [1] = u85
            --]]
            u85:DoCleaning()
        end)
        u88.CanCollide = false
        u88.CanQuery = false
        u88.CastShadow = false
        u88.Parent = u13
        local u89 = nil
        task.delay(0.25, function() --[[ Line: 288 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u88
                [3] = u21
                [4] = u87
                [5] = u89
            --]]
            local v90 = false
            local v91 = 0
            while true do
                if v90 then
                    v91 = v91 + 1
                else
                    v90 = true
                end
                if v91 >= 12 then
                    return
                end
                u8.Controllers.BlockDebrisController:convertBlockToDebris(u88, u21, u87, u89, v91)
            end
        end)
        local v92 = u11.LocalPlayer.Character
        if v92 ~= nil then
            v92 = v92:GetPivot().LookVector
        end
        u89 = v92 == nil and Vector3.new(5, 5, 5) or v92
        local v93 = u88:GetDescendants()
        local function v105(u94, p95) --[[ Line: 317 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u89
            --]]
            if u94:IsA("BasePart") then
                u94.Anchored = false
                u94.CanCollide = true
                u94.CollisionGroup = "Players"
                u4:setQueryIgnored(u94, true)
                local v96 = math.random() * 3.141592653589793 * 2
                local v97 = math.random() * 10 + 5
                local v98 = u89.Unit
                local v99 = 5 + math.random() * 5
                local v100 = v97 * math.cos(v96)
                local v101 = 5 + 5 * math.random()
                local v102 = v97 * math.sin(v96)
                local v103 = Vector3.new(v100, v101, v102)
                local v104 = u94.Mass
                u94:ApplyImpulse(v98 * v99 + v103 * v104)
                task.delay(0.01 * p95, function() --[[ Line: 331 ]]
                    --[[
                    Upvalues:
                        [1] = u94
                    --]]
                    return u94:Destroy()
                end)
            end
        end
        for v106, v107 in v93 do
            v105(v107, v106 - 1, v93)
        end
    end, function(p108) --[[ Line: 339 ]]
        --[[
        Upvalues:
            [1] = u85
            [2] = u83
        --]]
        u85:DoCleaning()
        u83.logger:Error("Error in ore mining controller {}", p108)
    end)
    if v109 then
        return unpack(v110)
    end
end
u8.CreateController(u26.new())
return nil