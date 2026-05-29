local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v3.UIUtil
local u8 = v3.WatchCollectionTag
local u9 = v3.WatchPlayer
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u11 = v10.KnitClient
local u12 = v10.KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.CollectionService
local u17 = v15.Players
local u18 = v15.ReplicatedStorage
local u19 = v15.RunService
local u20 = v15.Workspace
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u27 = v1.import(script, script.Parent, "golden-goose-behavior").GoldenGooseBehavior
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "GoldenGooseController"
    end,
    ["__index"] = u21
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.constructor(p31)
    p31.Name = "GoldenGooseController"
end
function u28.KnitStart(u32) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u8
        [3] = u13
        [4] = u19
        [5] = u11
        [6] = u17
        [7] = u22
        [8] = u24
        [9] = u18
        [10] = u12
        [11] = u6
        [12] = u25
        [13] = u16
        [14] = u20
        [15] = u9
        [16] = u2
        [17] = u14
        [18] = u26
        [19] = u7
        [20] = u4
    --]]
    u21.KnitStart(u32)
    u32:setupHonkLogic()
    u8("GoosePickup", function(u33) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u19
            [3] = u11
            [4] = u17
            [5] = u22
        --]]
        local u34 = u13.new()
        u34:GiveTask(u19.Heartbeat:Connect(function() --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u17
                [3] = u22
                [4] = u33
            --]]
            local v35 = u11.Controllers.TeamController:getPlayerTeam(u17.LocalPlayer)
            if v35 ~= nil then
                v35 = v35.id
            end
            local v36 = u22:getState().Game.gooseOwnerTeam
            local v37
            if v35 == nil then
                v37 = false
            else
                v37 = v35 ~= v36
            end
            u33.Enabled = v37
        end))
        u34:GiveTask(u33.AncestryChanged:Connect(function() --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u34
            --]]
            if not u33.Parent then
                u34:DoCleaning()
            end
        end))
    end)
    u24.Client:Get("ActiveGooseUpdate"):Connect(function(p38, p39) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u32
        --]]
        u22:dispatch({
            ["type"] = "RegisterActiveGoose",
            ["despawnTime"] = p38
        })
        local v40 = p39.ownerTeamId
        if v40 == "" or not v40 then
            u22:dispatch({
                ["type"] = "DeleteGooseOwnerTeam"
            })
        else
            u22:dispatch({
                ["type"] = "SetGooseOwnerTeam",
                ["ownerTeam"] = p39.ownerTeamId
            })
        end
        if p39.nested then
            u32:playNestEffect(p39.nested.cframe)
        end
    end)
    u24.Client:Get("RequestActiveGooseUpdate"):SendToServer()
    u24.Client:Get("ReceiveGoldenEgg"):Connect(function(p41) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u18
            [3] = u12
            [4] = u6
            [5] = u25
        --]]
        local u42 = 0
        local v43 = false
        while true do
            if v43 then
                u42 = u42 + 1
            else
                v43 = true
            end
            if u42 >= p41 then
                return
            end
            local v44 = u17.LocalPlayer.Character
            if v44 ~= nil then
                v44 = v44.PrimaryPart
                if v44 ~= nil then
                    v44 = v44.CFrame
                end
            end
            if not v44 then
                return nil
            end
            local v45 = u18.Assets.Effects.GoldenEgg:Clone()
            u12.Controllers.ReceiveItemEffectController:playEffect(v45, (v44 + Vector3.new(0, 6, 0)).Position, function() --[[ Line: 121 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                local v46 = u17.LocalPlayer.Character
                if v46 ~= nil then
                    v46 = v46.PrimaryPart
                    if v46 ~= nil then
                        v46 = v46.CFrame
                    end
                end
                return v46
            end, 0.5 + math.random() * 0.2):andThen(function(p47) --[[ Line: 131 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u25
                    [3] = u42
                --]]
                if p47 then
                    u6:playSound(u25.PICKUP_ITEM_DROP, {
                        ["volumeMultiplier"] = 0.8,
                        ["playbackSpeedMultiplier"] = u42 / 10 + 1
                    })
                end
            end)
        end
    end)
    u24.Client:Get("PickupGoldenGoose"):Connect(function(p48) --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u20
            [3] = u32
        --]]
        local v49 = p48.source.fromCFrame
        if p48.source.fromBoss then
            task.wait(6.166666666666666)
            local v50 = u16:GetTagged("VisualGooseBoss")
            if #v50 ~= 0 then
                v49 = v50[1]:FindFirstChild("cage_mesh")
                if v49 ~= nil then
                    v49 = v49:FindFirstChild("GoosePosition")
                end
                if v49 ~= nil then
                    v49 = v49.CFrame
                end
                local v51 = u20:FindFirstChild("GoldenGoose")
                if v51 ~= nil then
                    v51:Destroy()
                end
            end
        end
        if not v49 then
            v49 = p48.player.Character
            if v49 ~= nil then
                v49 = v49:GetPivot()
            end
            if v49 == nil then
                v49 = CFrame.new()
            end
        end
        u32:spawnGooseBehavior(p48.player, v49)
    end)
    u9(function(u52, p53) --[[ Line: 193 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u22
            [3] = u17
            [4] = u2
            [5] = u14
            [6] = u26
            [7] = u7
            [8] = u4
        --]]
        local v54 = u52:GetAttribute("HoldingGoose")
        if v54 ~= 0 and (v54 == v54 and (v54 ~= "" and v54)) then
            u32.gooseHolder = u52
        end
        p53:GiveTask(u52:GetAttributeChangedSignal("HoldingGoose"):Connect(function() --[[ Line: 198 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u32
                [3] = u22
                [4] = u17
                [5] = u2
                [6] = u14
                [7] = u26
                [8] = u7
                [9] = u4
            --]]
            local v55 = u52:GetAttribute("HoldingGoose")
            if v55 == 0 or (v55 ~= v55 or (v55 == "" or not v55)) then
                if u32.gooseHolder == u52 then
                    u32.gooseHolder = nil
                    u22:dispatch({
                        ["type"] = "DeleteGooseHolder"
                    })
                    if u52 == u17.LocalPlayer then
                        local v56 = u32.gooseHint
                        if v56 ~= nil then
                            v56:DoCleaning()
                        end
                    end
                end
            else
                u32.gooseHolder = u52
                u22:dispatch({
                    ["type"] = "SetGooseHolder",
                    ["gooseHolder"] = u52
                })
                if u52 == u17.LocalPlayer then
                    u32.gooseHint = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u14.createElement("TextLabel", {
                        ["Text"] = "BRING THE GOOSE TO BASE!",
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["AnchorPoint"] = Vector2.new(0.5, 1),
                        ["LayoutOrder"] = u26.abilityActionBarPriority,
                        ["Position"] = u7:getActionBarPosition(),
                        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.ExtraBold),
                        ["TextColor3"] = u4.WHITE,
                        ["Size"] = u26.actionBarButtonSize
                    }, { u14.createElement("UIStroke", {
                            ["Thickness"] = 1,
                            ["Transparency"] = 0.3
                        }) }))
                    return
                end
            end
        end))
    end)
end
function u28.setupHonkLogic(u57) --[[ Line: 239 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u20
    --]]
    task.spawn(function() --[[ Line: 240 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u20
            [3] = u57
        --]]
        local u58 = os.clock()
        u24.Client:Get("HonkChatMessage"):Connect(function(p59) --[[ Line: 242 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u58
                [3] = u57
            --]]
            local v60 = p59.Character
            if v60 ~= nil then
                v60 = v60:GetPivot().Position
            end
            if not v60 then
                return nil
            end
            local u61 = u20:FindFirstChild("GoldenGoose")
            if u61 ~= nil then
                u61 = u61:GetPivot().Position
            end
            if not u61 then
                return nil
            end
            if (u61 - v60).Magnitude > 60 then
                return nil
            end
            if os.clock() - u58 < 0.5 then
                return nil
            end
            u58 = os.clock()
            task.delay(0.3, function() --[[ Line: 267 ]]
                --[[
                Upvalues:
                    [1] = u57
                    [2] = u61
                --]]
                u57:playHonk(u61)
            end)
        end)
        local v62 = u58
        while true do
            local v63 = task.wait(15 + math.random() * 15)
            if v63 == 0 or (v63 ~= v63 or not v63) then
                break
            end
            local v64 = u20:FindFirstChild("GoldenGoose")
            if v64 ~= nil then
                v64 = v64:GetPivot().Position
            end
            if v64 then
                if os.clock() - v62 < 0.5 then
                    return nil
                end
                u58 = os.clock()
                u57:playHonk(v64)
                v62 = u58
            end
        end
    end)
end
function u28.playHonk(_, p65) --[[ Line: 293 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u25
        [3] = u6
    --]]
    u6:playSound(u5.fromList(u25.GOLDEN_GOOSE_HONK_1, u25.GOLDEN_GOOSE_HONK_2, u25.GOLDEN_GOOSE_HONK_3, u25.GOLDEN_GOOSE_HONK_4), {
        ["position"] = p65
    })
end
function u28.playNestEffect(_, p66) --[[ Line: 299 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u23
    --]]
    u11.Controllers.FireworkController:playFireworkEffect(p66.Position, u23.GOOSE)
end
function u28.spawnGooseBehavior(p67, u68, p69) --[[ Line: 302 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u13
    --]]
    if p67.gooseBehavior then
        p67.gooseBehavior:Destroy()
    end
    p67.gooseBehavior = u27.new(p69)
    p67.gooseBehavior:updateOwner(u68)
    local u70 = u13.new()
    u70:GiveTask(p67.gooseBehavior)
    u70:GiveTask(u68:GetAttributeChangedSignal("HoldingGoose"):Connect(function() --[[ Line: 310 ]]
        --[[
        Upvalues:
            [1] = u68
            [2] = u70
        --]]
        local v71 = u68:GetAttribute("HoldingGoose")
        if v71 ~= 0 and (v71 == v71 and (v71 ~= "" and v71)) then
            return nil
        end
        u70:DoCleaning()
    end))
    u70:GiveTask(u68.AncestryChanged:Connect(function() --[[ Line: 317 ]]
        --[[
        Upvalues:
            [1] = u68
            [2] = u70
        --]]
        if u68.Parent then
            return nil
        end
        u70:DoCleaning()
    end))
end
u11.CreateController(u28.new())
return nil