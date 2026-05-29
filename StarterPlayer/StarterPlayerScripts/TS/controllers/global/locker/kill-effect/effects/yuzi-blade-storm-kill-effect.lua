local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u5 = v4.Linear
local u6 = v4.OutExpo
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ReplicatedStorage
local u11 = v9.TweenService
local u12 = v9.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "YuziBladeStormKillEffect"
    end,
    ["__index"] = u15
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
function u16.constructor(p19, p20) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u7
    --]]
    u15.constructor(p19, p20)
    p19.maid = u7.new()
    u15.setPlayDefaultKillEffect(p19, false)
end
function u16.onKill(u21, _, p22, u23) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u14
    --]]
    u21:scheduleKillEffectCleanUp(5)
    local u24 = u21:createClone(p22, u23)
    u21:hideNametag(u24)
    u21:turnCharacterIntoJadeStatue(u24)
    local u25 = u21:createDaoModels()
    local u26 = u21:getPositionAboveClone(u24, 5)
    local u27 = u21:getCircularPositionAroundCenter(u21:getPositionBehindClone(u24, 4), #u25)
    local v29 = task.spawn(function() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u27
            [3] = u25
            [4] = u26
            [5] = u2
            [6] = u14
            [7] = u23
            [8] = u24
        --]]
        u21:stabDaosBehindPlayer(u27, u25, 0.3, 0.4)
        task.wait(0.7)
        local v28 = u21:createDaoParentModel(u25)
        u21:moveDaosUp(v28, 5, 0.5)
        task.wait(0.5)
        u21:moveDaosAbovePlayerHead(v28, u26, 0.5)
        task.wait(0.5)
        u21:turnDaosInward(u25, 0.5)
        task.wait(0.5)
        u2:playSound(u14.KILL_EFFECT_SLASH, {
            ["volumeMultiplier"] = 0.9,
            ["position"] = u23.Position
        })
        u21:stabPlayerWithDaos(u25, u24, 0.3)
        task.wait(0.3)
        u2:playSound(u14.SHATTER_STRIKE_BREAK_1, {
            ["volumeMultiplier"] = 0.9,
            ["position"] = u23.Position
        })
        u21:shatterCharacter(u23)
        u21:tossCharacter(u24, Vector3.new(1, 0, 0))
        u21:fadeOutDaos(u25)
        task.wait(0.5)
        u21.maid:DoCleaning()
    end)
    u21.maid:GiveTask(v29)
    return u21.maid
end
function u16.fadeOutDaos(_, p30) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
    --]]
    local function v35(p31) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u6
        --]]
        for v32, u33 in p31:GetDescendants() do
            local _ = v32 - 1
            if u33:IsA("BasePart") then
                u13(0.5, u6, function(p34) --[[ Line: 86 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                    --]]
                    u33.Transparency = p34
                end, 0, 1):Play()
            end
        end
    end
    for v36, v37 in p30 do
        v35(v37, v36 - 1, p30)
    end
end
function u16.shatterCharacter(_, p38) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v39 = false
    local v40 = 0
    while true do
        if v39 then
            v40 = v40 + 1
        else
            v39 = true
        end
        if v40 >= 8 then
            return
        end
        local v41 = u3.Controllers.BlockDebrisController
        local v42 = p38.Position
        local v43 = Color3.fromRGB(56, 199, 153)
        local v44 = math.random() * 0.5
        local v45 = math.random() * 0.5
        local v46 = Vector3.new(v44, 1, v45)
        local v47 = {
            ["burnDebris"] = false,
            ["transparency"] = 0.35,
            ["material"] = Enum.Material.Glass
        }
        local v48 = 0.75 + math.random() * 0.4
        local v49 = 0.5 + math.random() * 0.4
        v47.size = Vector3.new(0.5, v48, v49)
        v41:createDebris(v42, v43, v46, v47)
    end
end
function u16.turnCharacterIntoJadeStatue(_, p50) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u8
    --]]
    for _, v51 in p50:GetDescendants() do
        if v51:IsA("BasePart") then
            v51.Material = Enum.Material.Glass
            u11:Create(v51, TweenInfo.new(0.55), {
                ["LocalTransparencyModifier"] = 0.35,
                ["Color"] = Color3.fromRGB(56, 199, 153)
            }):Play()
            if v51:IsA("MeshPart") then
                v51.TextureID = ""
            end
        elseif v51:IsA("Texture") or (v51:IsA("Shirt") or (v51:IsA("Clothing") or v51:IsA("Highlight"))) then
            v51:Destroy()
        end
    end
    u8("PointLight", {
        ["Brightness"] = 0.3,
        ["Range"] = 5,
        ["Shadows"] = false,
        ["Enabled"] = true,
        ["Color"] = Color3.fromRGB(59, 214, 156),
        ["Parent"] = p50
    })
end
function u16.tossCharacter(_, p52, u53) --[[ Line: 146 ]]
    p52:BreakJoints()
    local v54 = p52:GetDescendants()
    local function v60(p55) --[[ Line: 149 ]]
        --[[
        Upvalues:
            [1] = u53
        --]]
        if p55:IsA("BasePart") then
            p55.CanCollide = false
            local v56 = (u53 + Vector3.new(0, 1, 0)).Unit
            local v57 = math.random(10, 20)
            local v58 = math.random(30, 40)
            local v59 = math.random
            p55.AssemblyLinearVelocity = v56 * Vector3.new(v57, v58, v59(10, 20))
        end
    end
    for v61, v62 in v54 do
        v60(v62, v61 - 1, v54)
    end
end
function u16.turnDaosInward(_, p63, u64) --[[ Line: 163 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u5
    --]]
    for v65, u66 in p63 do
        local _ = v65 - 1
        task.spawn(function() --[[ Line: 166 ]]
            --[[
            Upvalues:
                [1] = u66
                [2] = u13
                [3] = u64
                [4] = u5
            --]]
            local u67 = u66:GetPivot()
            local u68 = u67 * CFrame.Angles(-1.0471975511965976, 0, 0)
            u13(u64, u5, function(p69) --[[ Line: 170 ]]
                --[[
                Upvalues:
                    [1] = u66
                    [2] = u67
                    [3] = u68
                --]]
                u66:PivotTo(u67:Lerp(u68, p69) * CFrame.Angles(0, p69 * 2 * 3.141592653589793, 0))
            end, 0, 1):Play()
        end)
    end
end
function u16.stabPlayerWithDaos(_, p70, u71, u72) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
    --]]
    for v73, u74 in p70 do
        local u75 = v73 - 1
        task.spawn(function() --[[ Line: 185 ]]
            --[[
            Upvalues:
                [1] = u75
                [2] = u74
                [3] = u71
                [4] = u13
                [5] = u72
                [6] = u6
            --]]
            task.wait(0.075 * u75)
            local u76 = u74:GetPivot()
            local u77 = CFrame.new(u71:GetPivot().Position) * u74:GetPivot().Rotation
            u13(u72, u6, function(p78) --[[ Line: 191 ]]
                --[[
                Upvalues:
                    [1] = u74
                    [2] = u76
                    [3] = u77
                --]]
                u74:PivotTo(u76:Lerp(u77, p78))
            end, 0, 1):Play()
        end)
    end
end
function u16.moveDaosAbovePlayerHead(_, u79, u80, p81) --[[ Line: 200 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u5
    --]]
    local u82 = u79:GetPivot()
    u13(p81, u5, function(p83) --[[ Line: 202 ]]
        --[[
        Upvalues:
            [1] = u79
            [2] = u82
            [3] = u80
        --]]
        u79:PivotTo(u82:Lerp(u80, p83) * CFrame.Angles(0, 0, p83 * 3.141592653589793))
    end, 0, 1):Play()
end
function u16.moveDaosUp(_, u84, p85, p86) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u5
    --]]
    local u87 = u84:GetPivot()
    local u88 = u87 + Vector3.new(0, p85, 0)
    u13(p86, u5, function(p89) --[[ Line: 214 ]]
        --[[
        Upvalues:
            [1] = u84
            [2] = u87
            [3] = u88
        --]]
        u84:PivotTo(u87:Lerp(u88, p89) * CFrame.Angles(0, 0, p89 * 3.141592653589793))
    end, 0, 1):Play()
end
function u16.stabDaosBehindPlayer(_, u90, u91, u92, u93) --[[ Line: 221 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
    --]]
    for v94, u95 in u91 do
        local u96 = v94 - 1
        task.spawn(function() --[[ Line: 224 ]]
            --[[
            Upvalues:
                [1] = u90
                [2] = u96
                [3] = u92
                [4] = u91
                [5] = u95
                [6] = u13
                [7] = u93
                [8] = u6
            --]]
            local v97 = u90[u96 + 1]
            local u98 = v97[1]
            local u99 = v97[2]
            task.wait(u96 * (u92 / #u91))
            u95:PivotTo(u98)
            u13(u93, u6, function(p100) --[[ Line: 230 ]]
                --[[
                Upvalues:
                    [1] = u95
                    [2] = u98
                    [3] = u99
                --]]
                u95:PivotTo(u98:Lerp(u99 * CFrame.Angles(0, p100 * 3.141592653589793, 0), p100))
            end, 0, 1):Play()
        end)
    end
end
function u16.getCircularPositionAroundCenter(_, p101, p102) --[[ Line: 242 ]]
    local v103 = select(2, p101:ToOrientation())
    local v104 = false
    local v105 = 0
    local v106 = {}
    while true do
        if v104 then
            v105 = v105 + 1
        else
            v104 = true
        end
        if v105 >= p102 then
            return v106
        end
        local v107 = v105 % p102 / p102 * 6.283185307179586 - v103
        local v108 = math.cos(v107) * 4
        local v109 = math.sin(v107) * 4
        local v110 = p101 + Vector3.new(v108, v109, 0)
        local v111 = CFrame.lookAt(v110.Position, p101.Position, Vector3.new(0, 0, 1)) * CFrame.Angles(-1.5707963267948966, 0, 0)
        local v112 = math.cos(v107) * 12
        local v113 = math.sin(v107) * 12
        local v114 = p101 + Vector3.new(v112, v113, 0)
        local v115 = { CFrame.lookAt(v114.Position, p101.Position, Vector3.new(0, 0, 1)) * CFrame.Angles(-1.5707963267948966, 0, 0), v111 }
        table.insert(v106, v115)
    end
end
function u16.getPositionBehindClone(_, p116, p117) --[[ Line: 279 ]]
    local v118 = (p116:GetPivot().LookVector * -1).Unit
    return p116:GetPivot() + v118 * p117
end
function u16.getPositionAboveClone(_, p119, p120) --[[ Line: 287 ]]
    local v121 = CFrame.Angles(-1.5707963267948966, 0, 0)
    return (p119:GetPivot() + Vector3.new(0, p120, 0)) * v121
end
function u16.createDaoParentModel(p122, p123) --[[ Line: 294 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
    --]]
    local v124 = u8("Model", {
        ["Name"] = "DaoParentModel",
        ["Parent"] = u12
    })
    for v125, v126 in p123 do
        local _ = v125 - 1
        v126.Parent = v124
        p122.maid:GiveTask(v126)
    end
    p122.maid:GiveTask(v124)
    return v124
end
function u16.createDaoModels(p127) --[[ Line: 310 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
    --]]
    local v128 = u10.Assets.Effects.DaoBladeStorm:Clone():GetChildren()
    for v129, v130 in v128 do
        local _ = v129 - 1
        v130.Parent = u12
        p127.maid:GiveTask(v130)
    end
    return v128
end
function u16.createClone(p131, p132, p133) --[[ Line: 321 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u15
    --]]
    p132.Archivable = true
    local v134 = p132:Clone()
    v134.Name = "KillEffectCloneBladeStorm"
    v134.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    v134.HumanoidRootPart.Anchored = true
    v134:PivotTo(p133)
    v134.Parent = u12
    u15.hideCharacter(p131, p132)
    p131.maid:GiveTask(v134)
    return v134
end
function u16.hideNametag(_, p135) --[[ Line: 333 ]]
    for v136, v137 in p135:GetDescendants() do
        local _ = v136 - 1
        if v137:IsA("BillboardGui") and v137.Name == "Nametag" then
            v137:Destroy()
        end
    end
end
function u16.scheduleKillEffectCleanUp(u138, p139) --[[ Line: 344 ]]
    task.delay(p139, function() --[[ Line: 345 ]]
        --[[
        Upvalues:
            [1] = u138
        --]]
        u138.maid:DoCleaning()
    end)
end
function u16.createDebugPart(p140, p141, p142) --[[ Line: 349 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
    --]]
    local v143 = u8("Part", {
        ["Size"] = Vector3.new(1, 1, 1),
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["Parent"] = u12,
        ["CFrame"] = p141,
        ["Color"] = p142
    })
    p140.maid:GiveTask(v143)
    return v143
end
return u16