local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local u6 = v3.SpriteSheetPlayer
local u7 = v3.WatchCollectionTag
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u23 = v1.import(script, script.Parent, "glitched-match-announcement").GlitchedMatchAnnouncement
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "GlitchedLuckyBlockController"
    end,
    ["__index"] = u16
})
u24.__index = u24
function u24.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p27)
    p27.Name = "GlitchedLuckyBlockController"
    p27.firstAnnouncement = true
end
function u24.KnitStart(u28) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
        [3] = u18
        [4] = u20
        [5] = u22
        [6] = u19
        [7] = u10
        [8] = u23
        [9] = u12
        [10] = u17
        [11] = u5
        [12] = u7
        [13] = u15
    --]]
    u16.KnitStart(u28)
    u8.Controllers.PreloadController:preloadForItemType(u18.GLITCHED_LUCKY_BLOCK, {
        ["sounds"] = {
            u20.TV_STATIC,
            u20.GLITCHED_LUCKY_BLOCK_DAMAGE,
            u20.GLITCHED_LUCKY_BLOCK_TELEPORT,
            u20.GLITCH_OVERLAY,
            u20.GLITCH_OVERLAY_2
        }
    })
    if u22.isGameServer() then
        u19.Client:OnEvent("EnableGlitchedMatch", function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u23
                [3] = u28
                [4] = u12
                [5] = u17
                [6] = u5
                [7] = u20
            --]]
            local u29 = u10.mount(u10.createElement("ScreenGui", {}, { u10.createElement(u23, {
                    ["tonedDownEffects"] = not u28.firstAnnouncement
                }) }), u12.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
            task.delay(u17.GLITCH_LB_ANNOUNCEMENT_DURATION, function() --[[ Line: 56 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u20
                    [3] = u10
                    [4] = u29
                --]]
                u5:playSound(u20.GLITCH_OVERLAY_2, {
                    ["volumeMultiplier"] = 0.7
                })
                u10.unmount(u29)
            end)
            u28.firstAnnouncement = false
        end)
    end
    u7("GlitchedLuckyBlock", function(p30) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28:playGlitchOverlayEffect(p30)
        u28:loopGlitchParticlesOnBlock(p30)
    end)
    u15.PlaceBlock:connect(function(p31) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u28
            [3] = u5
            [4] = u20
        --]]
        if p31.blockType ~= u18.GLITCHED_LUCKY_BLOCK then
            return nil
        end
        u28:playGlitchParticlesOnBlock(p31.blockPosition)
        u5:playSound(u20.TV_STATIC, {
            ["volumeMultiplier"] = 0.05,
            ["playbackSpeedMultiplier"] = math.random(0.5, 1.5)
        })
    end)
    u15.DamageBlock:connect(function(p32) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u5
            [3] = u20
            [4] = u28
        --]]
        if p32.blockType ~= u18.GLITCHED_LUCKY_BLOCK then
            return nil
        end
        u5:playSound(u20.TV_STATIC, {
            ["volumeMultiplier"] = 0.05,
            ["playbackSpeedMultiplier"] = math.random(0.5, 1.5)
        })
        u5:playSound(u20.GLITCHED_LUCKY_BLOCK_DAMAGE)
        u28:playGlitchParticlesOnBlock(p32.blockPosition)
    end)
end
function u24.playGlitchOverlayEffect(_, u33) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u4
    --]]
    local u34 = {
        {
            ["image"] = "rbxassetid://10844183211",
            ["imageWidth"] = 1024,
            ["imageHeight"] = 769,
            ["rows"] = 8,
            ["columns"] = 4,
            ["sprites"] = 31,
            ["config"] = {
                ["framesPerSecond"] = 30,
                ["loopDelay"] = 5
            }
        },
        {
            ["image"] = "rbxassetid://10844183471",
            ["imageWidth"] = 807,
            ["imageHeight"] = 1023,
            ["rows"] = 4,
            ["columns"] = 3,
            ["sprites"] = 12,
            ["config"] = {
                ["framesPerSecond"] = 30,
                ["loopDelay"] = 5
            }
        }
    }
    local u35 = Random.new()
    local v36 = Enum.NormalId:GetEnumItems()
    local function v41(p37) --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u33
            [3] = u6
            [4] = u4
            [5] = u34
            [6] = u35
        --]]
        local v38 = u9("SurfaceGui", {
            ["Brightness"] = 3,
            ["Name"] = "SpriteSheet_Player_" .. p37.Name,
            ["Face"] = p37,
            ["Parent"] = u33
        })
        local v39 = u9("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Parent"] = v38
        })
        local u40 = u6.new(v39, u4.randomArraySelectN(u34, 1)[1])
        task.delay(u35:NextNumber(0, 2), function() --[[ Line: 132 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            u40:play()
        end)
    end
    for v42, v43 in v36 do
        v41(v43, v42 - 1, v36)
    end
    local u44 = u9("Part", {
        ["Name"] = "Floating_Pixels_Layer",
        ["Size"] = Vector3.new(3.2, 3.2, 3.2),
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["Position"] = u33.Position,
        ["Parent"] = u33
    })
    local v45 = Enum.NormalId:GetEnumItems()
    local function v52(p46) --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u44
            [3] = u35
        --]]
        local v47 = u9("SurfaceGui", {
            ["PixelsPerStud"] = 3,
            ["Name"] = "Floating_Layer_" .. p46.Name,
            ["Face"] = p46,
            ["Parent"] = u44,
            ["SizingMode"] = Enum.SurfaceGuiSizingMode.PixelsPerStud
        })
        local v48 = {
            Color3.fromHex("#3ca7bf"),
            Color3.fromHex("#62197c"),
            Color3.fromHex("#163050"),
            Color3.fromHex("#1e546f"),
            Color3.fromHex("#44125d"),
            Color3.fromHex("#26073e"),
            Color3.fromHex("#f2f2fe")
        }
        local v49 = u35:NextInteger(2, 4)
        local v50 = false
        local v51 = 0
        while true do
            if v50 then
                v51 = v51 + 1
            else
                v50 = true
            end
            if v51 >= v49 then
                return
            end
            u9("ImageLabel", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(0, u35:NextInteger(1, 3), 0, 1),
                ["Position"] = UDim2.fromOffset(u35:NextInteger(0, 8), u35:NextInteger(0, 8)),
                ["BackgroundColor3"] = v48[u35:NextInteger(0, #v48 - 1) + 1],
                ["Parent"] = v47
            })
        end
    end
    for v53, v54 in v45 do
        v52(v54, v53 - 1, v45)
    end
end
function u24.playGlitchParticlesOnBlock(_, u55, u56, u57) --[[ Line: 189 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u2
        [4] = u21
    --]]
    task.spawn(function() --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u14
            [3] = u2
            [4] = u55
            [5] = u21
            [6] = u56
            [7] = u57
        --]]
        local v58 = u13.Assets.Effects.GlitchedLuckyBlockEffect:Clone()
        v58.Name = "GlitchedLuckyBlockEffect"
        v58.Parent = u14
        v58.Transparency = 1
        local v59 = u2:getWorldPosition(u55)
        v58.CFrame = CFrame.new(v59)
        local v60 = u21
        local v61 = {
            ["destroyAfterSec"] = 1.5
        }
        local v62 = u56
        v61.sizeMultiplier = v62 == nil and 1.3 or v62
        local v63 = u57
        v61.particleMultiplier = v63 == nil and 1.3 or v63
        v60:playEffects({ v58 }, nil, v61)
    end)
end
function u24.loopGlitchParticlesOnBlock(u64, u65) --[[ Line: 217 ]]
    task.spawn(function() --[[ Line: 218 ]]
        --[[
        Upvalues:
            [1] = u65
            [2] = u64
        --]]
        while true do
            local v66 = task.wait(math.random(8, 17))
            if v66 ~= 0 and (v66 == v66 and v66) then
                v66 = u65.Parent ~= nil
            end
            if v66 == 0 or (v66 ~= v66 or not v66) then
                return
            end
            u64:playGlitchParticlesOnBlock(u65.Position)
        end
    end)
end
u8.CreateController(u24.new())
return nil