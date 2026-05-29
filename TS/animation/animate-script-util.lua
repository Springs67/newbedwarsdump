local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = {}
local v5 = setmetatable({}, {
    ["__index"] = v4
})
v5.IdleAnimation = "idle"
v4.idle = "IdleAnimation"
v5.RunAnimation = "run"
v4.run = "RunAnimation"
v5.WalkAnimation = "walk"
v4.walk = "WalkAnimation"
v5.JumpAnimation = "jump"
v4.jump = "JumpAnimation"
v5.FallAnimation = "fall"
v4.fall = "FallAnimation"
v5.ClimbAnimation = "climb"
v4.climb = "ClimbAnimation"
v5.SwimAnimation = "swim"
v4.swim = "SwimAnimation"
v5.SwimIdleAnimation = "swimidle"
v4.swimidle = "SwimIdleAnimation"
v5.SitAnimation = "sit"
v4.sit = "SitAnimation"
v5.WaveAnimation = "wave"
v4.wave = "WaveAnimation"
v5.PointAnimation = "point"
v4.point = "PointAnimation"
v5.DanceAnimation = "dance"
v4.dance = "DanceAnimation"
v5.Dance2Animation = "dance2"
v4.dance2 = "Dance2Animation"
v5.Dance3Animation = "dance3"
v4.dance3 = "Dance3Animation"
v5.LaughAnimation = "laugh"
v4.laugh = "LaughAnimation"
v5.CheerAnimation = "cheer"
v4.cheer = "CheerAnimation"
local v6 = {}
local v7 = setmetatable({}, {
    ["__index"] = v6
})
v7.ADDIDAS_SPORTS_FALL = 18538164337
v6[18538164337] = "ADDIDAS_SPORTS_FALL"
v7.ADDIDAS_SPOTRS_FALL_2 = 18537367238
v6[18537367238] = "ADDIDAS_SPOTRS_FALL_2"
v7.POPULAR_JUMP = 104325245285198
v6[104325245285198] = "POPULAR_JUMP"
v7.CATWALK_JUMP = 116936326516985
v6[116936326516985] = "CATWALK_JUMP"
v7.CATWALK_FALL = 92294537340807
v6[92294537340807] = "CATWALK_FALL"
v7.ADDIDAS_COMMUNITY_FALL = 98600215928904
v6[98600215928904] = "ADDIDAS_COMMUNITY_FALL"
v7.ADDIDAS_AURA_JUMP = 109996626521204
v6[109996626521204] = "ADDIDAS_AURA_JUMP"
v7.ADDIDAS_AURA_CLIMB = 97824616490448
v6[97824616490448] = "ADDIDAS_AURA_CLIMB"
v7.ADDIDAS_AURA_FALL = 95603166884636
v6[95603166884636] = "ADDIDAS_AURA_FALL"
v7.ADDIDAS_SPORTS_CLIMB = 18537363391
v6[18537363391] = "ADDIDAS_SPORTS_CLIMB"
local u8 = {
    [v5.IdleAnimation] = {},
    [v5.RunAnimation] = {},
    [v5.WalkAnimation] = {},
    [v5.JumpAnimation] = { v7.POPULAR_JUMP, v7.CATWALK_JUMP, v7.ADDIDAS_AURA_JUMP },
    [v5.FallAnimation] = {
        v7.ADDIDAS_SPORTS_FALL,
        v7.ADDIDAS_SPOTRS_FALL_2,
        v7.CATWALK_FALL,
        v7.ADDIDAS_COMMUNITY_FALL,
        v7.ADDIDAS_AURA_FALL
    },
    [v5.ClimbAnimation] = { v7.ADDIDAS_AURA_CLIMB, v7.ADDIDAS_SPORTS_CLIMB },
    [v5.SwimAnimation] = {},
    [v5.SwimIdleAnimation] = {},
    [v5.SitAnimation] = {},
    [v5.WaveAnimation] = {},
    [v5.PointAnimation] = {},
    [v5.DanceAnimation] = {},
    [v5.Dance2Animation] = {},
    [v5.Dance3Animation] = {},
    [v5.LaughAnimation] = {},
    [v5.CheerAnimation] = {}
}
local u9 = {
    [v5.IdleAnimation] = { 507766666, 507766951, 507766388 },
    [v5.RunAnimation] = { 507767714, 913376220 },
    [v5.WalkAnimation] = { 507777826, 913402848 },
    [v5.JumpAnimation] = { 507765000 },
    [v5.FallAnimation] = { 507767968, 10921262864 },
    [v5.ClimbAnimation] = { 507765644 },
    [v5.SwimAnimation] = { 507784897, 913384386 },
    [v5.SwimIdleAnimation] = { 507785072 },
    [v5.SitAnimation] = { 2506281703, 507768133 },
    [v5.WaveAnimation] = { 507770239 },
    [v5.PointAnimation] = { 507770453 },
    [v5.DanceAnimation] = { 507771019, 507771955, 507772104 },
    [v5.Dance2Animation] = { 507776043, 507776720, 507776879 },
    [v5.Dance3Animation] = { 507777268, 507777451, 507777623 },
    [v5.LaughAnimation] = { 507770818 },
    [v5.CheerAnimation] = { 507770677 }
}
local v10 = {}
local u11 = nil
function v10.validateAnimations(p12) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u2
        [3] = u8
        [4] = u9
    --]]
    u11(p12):andThen(function(u13) --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
            [3] = u9
        --]]
        local v14 = u2.entries(u8)
        local function v30(p15) --[[ Line: 127 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u9
            --]]
            local u16 = p15[1]
            local u17 = p15[2]
            local v18 = u13:WaitForChild(u16)
            if v18 ~= nil then
                local v19 = 0
                v18 = {}
                for v20, v21 in v18:GetChildren() do
                    local _ = v20 - 1
                    if v21:IsA("Animation") == true then
                        v19 = v19 + 1
                        v18[v19] = v21
                    end
                end
            end
            if #v18 == 0 then
                return nil
            end
            local function v27(p22) --[[ Line: 154 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u9
                    [3] = u16
                --]]
                local v23 = string.split(p22.AnimationId, "http://www.roblox.com/asset/?id=")[2]
                local v24 = tonumber(v23)
                if v24 == nil then
                    local v25 = string.split(p22.AnimationId, "rbxassetid://")[2]
                    v24 = tonumber(v25)
                end
                if v24 == nil then
                    return nil
                end
                if table.find(u17, v24) ~= nil then
                    local v26 = u9[u16][1]
                    p22.AnimationId = "http://www.roblox.com/asset/?id=" .. tostring(v26)
                end
            end
            for v28, v29 in v18 do
                v27(v29, v28 - 1, v18)
            end
        end
        for v31, v32 in v14 do
            v30(v32, v31 - 1, v14)
        end
    end):catch(function() --[[ Line: 178 ]] end)
end
local u33 = nil
function v10.setAnimation(p34, p35, p36) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u33
    --]]
    local v37 = u3.new()
    local u38 = u33(p34, p35)
    if u38 then
        local u39 = u38.AnimationId
        v37:GiveTask(function() --[[ Line: 189 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u39
            --]]
            u38.AnimationId = u39
        end)
        if type(p36) == "string" then
            u38.AnimationId = p36
            return v37
        else
            u38.AnimationId = "http://www.roblox.com/asset/?id=" .. tostring(p36)
            return v37
        end
    else
        return v37
    end
end
u33 = function(p40, p41) --[[ Line: 201 ]]
    local v42 = p40:FindFirstChild("Animate")
    if v42 ~= nil then
        v42 = v42:FindFirstChild(p41)
        if v42 ~= nil then
            v42 = v42:FindFirstChildWhichIsA("Animation")
        end
    end
    return v42
end
v10.getAnimation = u33
function v10.getAllAnimations(p43) --[[ Line: 212 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v44 = u11(p43):expect()
    if not v44 then
        return nil
    end
    local v45 = {}
    for v46, v47 in v44:GetDescendants() do
        local _ = v46 - 1
        if v47:IsA("Animation") then
            table.insert(v45, v47)
        end
    end
    return v45
end
u11 = function(u48) --[[ Line: 231 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.Promise.new(function(p49, p50) --[[ Line: 232 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        local v51 = u48:WaitForChild("Animate", 1)
        if v51 then
            p49(v51)
        end
        p50()
    end)
end
v10.getAnimateScript = u11
return {
    ["bannedHumanoidAnimations"] = u8,
    ["defaultHumanoidAnimations"] = u9,
    ["AnimateScriptUtil"] = v10
}