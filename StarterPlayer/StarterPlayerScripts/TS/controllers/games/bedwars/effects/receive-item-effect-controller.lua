local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v3.registerConstants(script, {
    ["P1XRange"] = NumberRange.new(-30, 30),
    ["P1YRange"] = NumberRange.new(-15, 15),
    ["P1ZRange"] = NumberRange.new(-15, 15)
})
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "ReceiveItemEffectController"
    end,
    ["__index"] = u12
})
u17.__index = u17
function u17.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20, ...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p20, ...)
    p20.Name = "ReceiveItemEffectController"
    p20.random = Random.new()
end
function u17.KnitStart(p21) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.KnitStart(p21)
end
u17.playEffect = v1.async(function(p22, p23, u24, u25, p26, p27) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u16
        [3] = u4
        [4] = u11
        [5] = u7
    --]]
    local v28 = u10:GetServerTimeNow()
    if p27 == 0 or (p27 ~= p27 or not p27) then
        p27 = v28
    end
    local v29 = v28 - p27
    local v30 = u25()
    if not v30 then
        return false
    end
    local u31 = (v30 * CFrame.new(p22.random:NextNumber(u16.P1XRange.Min, u16.P1XRange.Max), p22.random:NextNumber(u16.P1YRange.Min, u16.P1YRange.Max), p22.random:NextNumber(u16.P1ZRange.Min, u16.P1ZRange.Max))):Lerp(v30, 0.5).Position
    local u32 = p23:Clone()
    for v33, v34 in u32:GetDescendants() do
        local _ = v33 - 1
        u4:setQueryIgnored(v34, true)
    end
    u32.Parent = u10
    u11(p26 - v29, u7, function(p35) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u24
            [3] = u31
            [4] = u32
        --]]
        local v36 = u25()
        if v36 ~= nil then
            v36 = v36.Position
        end
        if not v36 then
            return nil
        end
        local v37 = u24:Lerp(u31, p35):Lerp(u31:Lerp(v36, p35), p35)
        u32:PivotTo(CFrame.new(v37) * CFrame.Angles(0, 6.283185307179586 * p35, 0))
    end, v29, 1):Wait()
    u32:Destroy()
    return true
end)
function u17.playEffectForItems(u38, p39, u40, u41, u42, p43) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u14
        [3] = u5
        [4] = u15
        [5] = u13
    --]]
    local v44 = p43 == nil and 5 or p43
    local u45 = 0
    for _, u46 in p39 do
        local v47 = u46.amount
        local v48 = math.min(v47, v44)
        if v44 < u46.amount then
            local v49 = u46.amount - v44 + 1
            v48 = v48 + math.log(v49, 2)
        end
        local v50 = u9:WaitForChild("Items"):WaitForChild(u46.itemType)
        local u51 = u14.cloneItemIntoModel(v50)
        local v52 = false
        local v53 = 0
        while true do
            if true then
                if v52 then
                    v53 = v53 + 1
                else
                    v52 = true
                end
            end
            if v53 >= math.ceil(v48) then
                break
            end
            task.spawn(function() --[[ Line: 110 ]]
                --[[
                Upvalues:
                    [1] = u38
                    [2] = u51
                    [3] = u40
                    [4] = u41
                    [5] = u5
                    [6] = u15
                    [7] = u42
                    [8] = u45
                    [9] = u13
                    [10] = u46
                --]]
                task.wait(math.random() * 0.2)
                u38:playEffect(u51, u40, u41, 0.5 + math.random() * 0.2):andThen(function(p54) --[[ Line: 113 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u15
                        [3] = u42
                        [4] = u41
                        [5] = u45
                        [6] = u13
                        [7] = u46
                    --]]
                    if p54 then
                        local v55 = u5
                        local v56 = u15.PICKUP_ITEM_DROP
                        local v57 = {}
                        local v58
                        if u42 == "PlayLocally" then
                            v58 = nil
                        else
                            v58 = u41()
                            if v58 ~= nil then
                                v58 = v58.Position
                            end
                        end
                        v57.position = v58
                        v57.volumeMultiplier = 0.8
                        local v59 = u45
                        u45 = u45 + 1
                        v57.playbackSpeedMultiplier = v59 / 50 + 1
                        v55:playSound(v56, v57)
                        local v60 = u13(u46.itemType).pickUpOverlaySound
                        if v60 ~= "" and v60 then
                            local v61 = u5
                            local v62 = {}
                            local v63
                            if u42 == "PlayLocally" then
                                v63 = nil
                            else
                                v63 = u41()
                                if v63 ~= nil then
                                    v63 = v63.Position
                                end
                            end
                            v62.position = v63
                            v62.volumeMultiplier = 0.9
                            local v64 = u45
                            u45 = u45 + 1
                            v62.playbackSpeedMultiplier = v64 / 50 + 1
                            v61:playSound(v60, v62)
                        end
                    end
                end)
            end)
        end
    end
end
v6.CreateController(u17.new())
return nil