local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.RandomUtil
local u7 = v3.SoundManager
local u8 = v3.WatchCollectionTag
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u10 = v9.KnitClient
local u11 = v9.KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.Players
local u17 = v15.ReplicatedStorage
local u18 = v15.Workspace
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "util", "get-team-for-block").default
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "piggy-bank", "piggy-bank-util").PiggyBankUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u30 = v1.import(script, script.Parent, "piggy-bank-title").PiggyBankTitle
local u31 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
        return "PiggyBankController"
    end,
    ["__index"] = u19
})
u31.__index = u31
function u31.new(...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    local v32 = u31
    local v33 = setmetatable({}, v32)
    return v33:constructor(...) or v33
end
function u31.constructor(p34) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.constructor(p34)
    p34.Name = "PiggyBankController"
end
function u31.KnitStart(p35) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u2
        [3] = u26
        [4] = u13
        [5] = u23
        [6] = u6
        [7] = u22
        [8] = u10
        [9] = u28
        [10] = u8
        [11] = u11
        [12] = u5
        [13] = u12
        [14] = u18
        [15] = u14
        [16] = u20
        [17] = u4
        [18] = u30
        [19] = u24
        [20] = u7
        [21] = u25
        [22] = u27
        [23] = u21
        [24] = u17
        [25] = u29
        [26] = u16
    --]]
    u19.KnitStart(p35)
    u2.DamageBlock:connect(function(u36) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u13
            [3] = u23
            [4] = u6
            [5] = u22
        --]]
        task.spawn(function() --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u26
                [3] = u13
                [4] = u23
                [5] = u6
                [6] = u22
            --]]
            if u36.blockType ~= u26.PINATA then
                return nil
            end
            local v37 = u36.blockInstance
            if v37 ~= nil then
                v37 = v37:FindFirstChild("Rig")
                if v37 ~= nil then
                    v37 = v37:FindFirstChild("AnimationController")
                end
            end
            if not v37 then
                return nil
            end
            local v38
            if v37 == nil then
                v38 = v37
            else
                v38 = v37:FindFirstChild("Animator")
            end
            u23:playAnimation(v38 or u13("Animator", {
                ["Parent"] = v37
            }), u6.fromList(u22.PINATA_HIT_1, u22.PINATA_HIT_2))
        end)
    end)
    u10.Controllers.PreloadController:preloadForItemType(u26.PINATA, {
        ["sounds"] = {
            u28.PINATA_POP_1,
            u28.PINATA_POP_2,
            u28.PINATA_POP_3,
            u28.PINATA_POP_4,
            u28.PINATA_HIT_1,
            u28.PINATA_HIT_2,
            u28.PINATA_HIT_3,
            u28.PINATA_STAGE_INCREASE
        }
    })
    u8("piggy-bank", function(u39) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u5
            [3] = u12
            [4] = u18
            [5] = u13
            [6] = u14
            [7] = u20
            [8] = u4
            [9] = u30
            [10] = u24
            [11] = u7
            [12] = u28
            [13] = u22
            [14] = u23
            [15] = u25
            [16] = u26
            [17] = u27
        --]]
        local v40 = u39:GetAttribute("Coin")
        local u41 = u11.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Add Candy",
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 6,
            ["Parent"] = u39,
            ["ObjectText"] = "Holding " .. tostring(v40) .. " Candy",
            ["ClickablePrompt"] = u5.isMobileControls()
        })
        local u42 = u12.new()
        u39.AncestryChanged:Connect(function() --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u42
            --]]
            if u39.Parent then
                return nil
            end
            u42:DoCleaning()
        end)
        local u43 = u13("Part", {
            ["Transparency"] = 1,
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["Anchored"] = true,
            ["Size"] = Vector3.new(1, 1, 1),
            ["Position"] = u39.Position + Vector3.new(0, 3.5, 0),
            ["Parent"] = u18,
            ["Name"] = "PiggyBankTitle"
        })
        u42:GiveTask(u43)
        local function u46() --[[ Line: 117 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u13
            --]]
            local v44 = u39
            if v44 ~= nil then
                v44 = v44:FindFirstChild("Rig")
                if v44 ~= nil then
                    v44 = v44:FindFirstChild("AnimationController")
                end
            end
            if not v44 then
                return nil
            end
            local v45
            if v44 == nil then
                v45 = v44
            else
                v45 = v44:FindFirstChild("Animator")
            end
            return v45 or u13("Animator", {
                ["Parent"] = v44
            })
        end
        local u47 = u12.new()
        u42:GiveTask(u47)
        local u48 = 0
        local function u72() --[[ Line: 144 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u41
                [3] = u47
                [4] = u14
                [5] = u20
                [6] = u4
                [7] = u30
                [8] = u43
                [9] = u24
                [10] = u48
                [11] = u7
                [12] = u28
                [13] = u46
                [14] = u22
                [15] = u23
            --]]
            local v49 = u39:GetAttribute("Coin")
            u41.ObjectText = "Holding " .. tostring(v49) .. " Candy"
            if v49 ~= nil then
                u47:DoCleaning()
                local v50 = u14
                local v51 = {
                    ["AlwaysOnTop"] = true,
                    ["MaxDistance"] = 40,
                    ["Size"] = UDim2.fromScale(5, 2.5)
                }
                local v52 = {}
                local v53 = #v52
                local v54 = {
                    ["coins"] = v49
                }
                local v55 = u20(u39)
                if v55 ~= nil then
                    v55 = v55.color
                end
                if v55 == nil then
                    v55 = u4.WHITE
                end
                v54.color = v55
                v52[v53 + 1] = u14.createElement(u30, v54)
                local u56 = v50.mount(u14.createElement("BillboardGui", v51, v52), u43, "PiggyBankTitle")
                u47:GiveTask(function() --[[ Line: 171 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u56
                    --]]
                    u14.unmount(u56)
                end)
            end
            local v57 = u24:getStageFromCoins(v49 == nil and 0 or v49)
            if u48 ~= v57 then
                u7:playSound(u28.PINATA_STAGE_INCREASE, {
                    ["position"] = u39.Position
                })
            end
            u48 = v57
            local v58 = u39:FindFirstChild("Rig")
            if v58 ~= nil then
                v58 = v58:FindFirstChild("RootPart")
            end
            local v59
            if v58 == nil then
                v59 = v58
            else
                v59 = v58:IsA("BasePart")
            end
            if v59 then
                local v60 = v58:FindFirstChild("IdleSound")
                if not v60 and v57 > 0 then
                    v60 = u7:playModifiableSound(u28.PINATA_AMBIENT_LOOP, {
                        ["looped"] = true,
                        ["parent"] = v58
                    })
                end
                if v60 then
                    v60.Name = "IdleSound"
                    v60.Volume = 0.2 + v57 * 0.15
                    v60.RollOffMaxDistance = v57 * 4 * 3
                    v60.RollOffMinDistance = 3
                end
            end
            local v61 = u39
            if v61 ~= nil then
                v61 = v61:FindFirstChild("Rig")
                if v61 ~= nil then
                    v61 = v61:FindFirstChild("torso_mesh")
                    if v61 ~= nil then
                        v61 = v61:FindFirstChild("Glow")
                    end
                end
            end
            if v61 and v57 > 0 then
                for _, v62 in v61:GetChildren() do
                    if v62:IsA("ParticleEmitter") then
                        v62.Enabled = true
                        v62.Rate = v57
                    end
                end
            end
            local v63 = u46()
            local v64 = { u22.PINATA_IDLE_1, u22.PINATA_IDLE_2, u22.PINATA_IDLE_3 }
            if v63 then
                local v65 = v64[v57]
                local v66 = true
                for _, v67 in v63:GetPlayingAnimationTracks() do
                    for _, v68 in { u22.PINATA_IDLE_1, u22.PINATA_IDLE_2, u22.PINATA_IDLE_3 } do
                        local v69 = u23:getAssetId(v68)
                        local v70 = v67.Animation
                        if v70 ~= nil then
                            v70 = v70.AnimationId
                        end
                        if v69 == v70 then
                            if v68 == v65 then
                                v66 = false
                            else
                                v67:Stop()
                            end
                        end
                    end
                end
                local v71 = v66 and v65
                if v71 ~= 0 and (v71 == v71 and v71) then
                    u23:playAnimation(v63, v65)
                end
            end
        end
        u39:GetAttributeChangedSignal("Coin"):Connect(function() --[[ Line: 267 ]]
            --[[
            Upvalues:
                [1] = u72
            --]]
            u72()
        end)
        u72()
        u41.Triggered:Connect(function(p73) --[[ Line: 271 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u26
                [3] = u46
                [4] = u23
                [5] = u22
                [6] = u7
                [7] = u28
                [8] = u27
                [9] = u39
            --]]
            if not u25.hasEnough(p73, u26.CANDY, 1) then
                return nil
            end
            local v74 = u46()
            if v74 then
                u23:playAnimation(v74, u22.PINATA_FEED)
            end
            u7:playSound(u28.PINATA_DEPOSIT_CANDY)
            u27.Client:Get("DepositCoins"):CallServer(u39)
        end)
    end)
    u27.Client:Get("PiggyBankIncrement"):Connect(function(p75) --[[ Line: 283 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        local v76 = u21
        local v77 = {
            ["type"] = "KitPigsyIncrementResource",
            ["progress"] = {
                ["coin"] = p75.coin
            }
        }
        v76:dispatch(v77)
    end)
    u27.Client:Get("PiggyBankPop"):Connect(function(u78) --[[ Line: 291 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u17
            [3] = u18
            [4] = u29
            [5] = u28
            [6] = u7
            [7] = u10
            [8] = u16
        --]]
        local v79 = u24:getStageFromCoins(u78.coins)
        local v80 = v79 - 1
        local v81 = math.clamp(v80, 0, 2)
        local v82 = u17.Assets.Effects.Pinata:FindFirstChild("PopStage" .. tostring(v81))
        if v82 ~= nil then
            v82 = v82:Clone()
        end
        local v83
        if v82 == nil then
            v83 = v82
        else
            v83 = v82:IsA("BasePart")
        end
        if v83 then
            v82.Position = u78.position
            v82.Parent = u18
            u29:playEffects({ v82 }, nil, {
                ["destroyAfterSec"] = 4
            })
        end
        u7:playSound(({
            u28.PINATA_POP_1,
            u28.PINATA_POP_2,
            u28.PINATA_POP_3,
            u28.PINATA_POP_4
        })[v79 + 1], {
            ["position"] = u78.position
        })
        local u84 = u78.awardedPlayer
        if u84 ~= nil then
            u84 = u84.Character
        end
        local v85 = u24:getRewardsFromCoins(u78.coins)
        u10.Controllers.ReceiveItemEffectController:playEffectForItems(v85, u78.position, function() --[[ Line: 320 ]]
            --[[
            Upvalues:
                [1] = u78
                [2] = u84
            --]]
            local v86 = u78.awardedPlayer
            if v86 ~= nil then
                v86 = v86.Character
            end
            if v86 ~= u84 then
                return nil
            end
            if v86 ~= nil then
                v86 = v86.PrimaryPart
                if v86 ~= nil then
                    v86 = v86.CFrame
                end
            end
            return v86
        end, u78.awardedPlayer == u16.LocalPlayer and "PlayLocally" or "PlayGlobally")
    end)
end
u10.CreateController(u31.new())
return nil