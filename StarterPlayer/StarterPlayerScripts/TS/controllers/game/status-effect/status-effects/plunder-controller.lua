local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "PlunderController"
    end,
    ["__index"] = u9
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p17)
    p17.Name = "PlunderController"
end
function u14.KnitStart(p18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
        [3] = u7
        [4] = u2
        [5] = u13
        [6] = u8
        [7] = u11
        [8] = u5
        [9] = u10
    --]]
    u9.KnitStart(p18)
    u12.Client:OnEvent("PlunderProc", function(p19, p20, p21, p22) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u13
            [4] = u8
            [5] = u11
            [6] = u5
            [7] = u10
        --]]
        local u23 = p19.PrimaryPart
        if not u23 then
            return nil
        end
        local u24 = p19 == u7.LocalPlayer.Character
        if u24 and not p22 then
            u2:playSound(u13.CONFETTI)
        end
        local u25 = 0
        local u26 = u23.Position
        local v27
        if p21 == nil then
            v27 = p21
        else
            v27 = p21.PrimaryPart
        end
        if v27 then
            u26 = p21.PrimaryPart.Position
        end
        u7:GetPlayerFromCharacter(p19)
        for _, u28 in p20 do
            local v29 = u28.amount
            local v30 = math.min(v29, 5)
            local v31 = u8:WaitForChild("Items"):WaitForChild(u28.itemType)
            local u32 = u11.cloneItemIntoModel(v31)
            local v33 = false
            local v34 = 0
            while true do
                if true then
                    if v33 then
                        v34 = v34 + 1
                    else
                        v33 = true
                    end
                end
                if v34 >= math.ceil(v30) then
                    break
                end
                task.spawn(function() --[[ Line: 70 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u32
                        [3] = u26
                        [4] = u23
                        [5] = u2
                        [6] = u13
                        [7] = u24
                        [8] = u25
                        [9] = u10
                        [10] = u28
                    --]]
                    task.wait(math.random() * 0.2)
                    u5.Controllers.ReceiveItemEffectController:playEffect(u32, u26, function() --[[ Line: 72 ]]
                        --[[
                        Upvalues:
                            [1] = u23
                        --]]
                        return u23.CFrame
                    end, 0.5 + math.random() * 0.2):andThen(function(p35) --[[ Line: 75 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u13
                            [3] = u24
                            [4] = u23
                            [5] = u25
                            [6] = u10
                            [7] = u28
                        --]]
                        if p35 then
                            local v36 = u2
                            local v37 = u13.PICKUP_ITEM_DROP
                            local v38 = {
                                ["volumeMultiplier"] = 0.8
                            }
                            local v39
                            if u24 then
                                v39 = nil
                            else
                                v39 = u23.Position
                            end
                            v38.position = v39
                            local v40 = u25
                            u25 = u25 + 1
                            v38.playbackSpeedMultiplier = v40 / 50 + 1
                            v36:playSound(v37, v38)
                            local v41 = u10(u28.itemType).pickUpOverlaySound
                            if v41 ~= "" and v41 then
                                local v42 = u2
                                local v43 = {
                                    ["volumeMultiplier"] = 0.9
                                }
                                local v44
                                if u24 then
                                    v44 = nil
                                else
                                    v44 = u23.Position
                                end
                                v43.position = v44
                                local v45 = u25
                                u25 = u25 + 1
                                v43.playbackSpeedMultiplier = v45 / 50 + 1
                                v42:playSound(v41, v43)
                            end
                        end
                    end)
                end)
            end
        end
    end)
end
function u14.attachGlitchEffect(_, p46) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v47 = p46.PrimaryPart
    if v47 then
        u4.Controllers.GlitchEffectsController:playGlitchExplosion(v47.Position, {
            ["parent"] = v47
        })
    end
end
u4.CreateController(u14.new())
return nil