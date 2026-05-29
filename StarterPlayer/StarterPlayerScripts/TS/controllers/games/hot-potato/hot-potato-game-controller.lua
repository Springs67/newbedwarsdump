local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ImageId
local u4 = v2.SoundManager
local u5 = v2.WatchCharacter
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.RunService
local u14 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "hot-potato", "hot-potato-config").HotPotatoConfig
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "hot-potato", "hot-potato-team-id").HotPotatoTeamId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "HotPotatoGameController"
    end,
    ["__index"] = u14
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u16
    --]]
    u14.constructor(p24, { u16.HOT_POTATO })
    p24.Name = "HotPotatoGameController"
    p24.potatoHeads = {}
    p24.roundEndTime = (1 / 0)
    p24.startTime = nil
    p24.effectMap = {}
end
function u21.onGameInit(u25) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u20
        [3] = u5
        [4] = u11
        [5] = u15
        [6] = u9
        [7] = u19
        [8] = u8
        [9] = u12
        [10] = u3
        [11] = u13
        [12] = u17
        [13] = u18
        [14] = u7
        [15] = u4
    --]]
    u6.Controllers.PreloadController:runPreload({
        ["sounds"] = { u20.SPEED_BOOST }
    })
    u5(function(u26, u27) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u11
            [3] = u6
        --]]
        u27:GetAttributeChangedSignal("ItemSpeedBoost"):Connect(function() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u25
                [3] = u26
                [4] = u11
                [5] = u6
            --]]
            if u27:GetAttribute("ItemSpeedBoost") ~= nil then
                u25:createSpeedBoostEffect(u26)
                if u11.LocalPlayer == u26 then
                    u25.speedMaid = u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
                        ["blockSprint"] = false,
                        ["moveSpeedMultiplier"] = u27:GetAttribute("ItemSpeedBoost")
                    })
                    return
                end
            else
                u25:removeSpeedBoostEffect(u26)
                if u11.LocalPlayer == u26 then
                    local v28 = u25.speedMaid
                    if v28 ~= nil then
                        v28:Destroy()
                    end
                    u25.speedMaid = nil
                end
            end
        end)
    end)
    u5(function(p29, _) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u9
        --]]
        local v30 = u15:getEntity(p29)
        if not v30 then
            return nil
        end
        v30:hideNametag()
        u9("Highlight", {
            ["Name"] = "HotPotatoHighlight",
            ["FillTransparency"] = 1,
            ["OutlineTransparency"] = 1,
            ["Parent"] = p29.Character,
            ["OutlineColor"] = Color3.fromRGB(71, 217, 255)
        })
    end)
    u19.Client:OnEvent("HotPotatoHead", function(p31) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u12
            [3] = u9
            [4] = u3
            [5] = u25
        --]]
        local v32 = p31.player.Character
        if v32 ~= nil then
            v32 = v32:FindFirstChild("HotPotatoHighlight")
        end
        if p31.giveHotPotato then
            local v33 = u8.new()
            local v34 = u12.Assets.Misc.HotPotatoHead:Clone()
            v34.Parent = p31.player.Character
            v33:GiveTask(v34)
            for _, v35 in Enum.NormalId:GetEnumItems() do
                u9("Decal", {
                    ["Transparency"] = 1,
                    ["Parent"] = v34.Handle,
                    ["Texture"] = u3.PIXEL,
                    ["Face"] = v35,
                    ["Color3"] = Color3.fromRGB(255, 66, 66)
                })
            end
            u25.potatoHeads[p31.player.UserId] = v33
            if v32 then
                v32.OutlineColor = Color3.fromRGB(255, 66, 66)
                v32.OutlineTransparency = 1
                return
            end
        else
            local v36 = u25.potatoHeads[p31.player.UserId]
            if v36 ~= nil then
                v36:DoCleaning()
            end
            u25.potatoHeads[p31.player.UserId] = nil
            if v32 then
                v32.OutlineColor = Color3.fromRGB(71, 217, 255)
                v32.OutlineTransparency = 1
            end
        end
    end)
    u19.Client:OnEvent("HotPotatoSetRoundEnd", function(p37) --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        local v38 = u25.startTime
        if v38 == 0 or (v38 ~= v38 or not v38) then
            u25.startTime = os.time()
        end
        u25.roundEndTime = u25.startTime + p37.roundEndTime
    end)
    local u39 = 0
    local u40 = 0
    u13.Heartbeat:Connect(function(p41) --[[ Line: 137 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u17
            [3] = u39
            [4] = u40
            [5] = u6
            [6] = u18
            [7] = u11
            [8] = u7
            [9] = u12
            [10] = u4
            [11] = u20
        --]]
        local v42 = u25.roundEndTime - os.time()
        if v42 < u17.TRIGGER__EXPLOSION_WARNING_THRESOLD_SECONDS then
            local v43 = v42 / u17.TRIGGER__EXPLOSION_WARNING_THRESOLD_SECONDS
            if v43 <= u17.MAX_FLASHING_RATE_SECONDS then
                v43 = u17.MAX_FLASHING_RATE_SECONDS
            end
            u39 = v43
            u40 = u40 + p41
            if u40 <= u39 then
                return nil
            end
            u40 = 0
            local v44 = u6.Controllers.TeamController:getTeamById(u18.COLD)
            if v44 ~= nil then
                for _, v45 in v44.members do
                    local v46 = u11:GetPlayerByUserId(v45.userId)
                    if v46 ~= nil then
                        v46 = v46.Character
                        if v46 ~= nil then
                            v46 = v46:FindFirstChildWhichIsA("Highlight")
                        end
                    end
                    if v46 then
                        v46.OutlineTransparency = u39
                    end
                end
            end
            for _, v47 in u7.keys(u25.potatoHeads) do
                local v48 = u11:GetPlayerByUserId(v47)
                if v48 then
                    local v49 = v48.Character
                    if v49 then
                        local v50 = v49:WaitForChild(u12.Assets.Misc.HotPotatoHead.Name)
                        if v50 then
                            local v51 = v50:GetAttribute("toggle")
                            local v52 = "toggle"
                            local v53
                            if v51 == 0 or v51 ~= v51 then
                                v53 = false
                            elseif v51 == "" then
                                v53 = false
                            else
                                v53 = v51
                            end
                            v50:SetAttribute(v52, not v53)
                            if v51 ~= 0 and (v51 == v51 and (v51 ~= "" and v51)) then
                                local v54 = u4
                                local v55 = u20.BEEPING
                                local v56 = {
                                    ["volumeMultiplier"] = 0.3,
                                    ["position"] = v50.Handle.Position
                                }
                                local v57 = 1 / u39
                                v56.playbackSpeedMultiplier = math.log(v57) + 0.5
                                v54:playSound(v55, v56)
                            end
                            for _, v58 in v50.Handle:GetChildren() do
                                if v58:IsA("Decal") then
                                    v58.Transparency = (v51 == 0 or (v51 ~= v51 or (v51 == "" or not v51))) and 1 or 0
                                end
                            end
                            local v59 = v49:FindFirstChild("HotPotatoHighlight")
                            if v59 then
                                v59.OutlineTransparency = (v51 == 0 or (v51 ~= v51 or (v51 == "" or not v51))) and 1 or 0
                            end
                        end
                    end
                end
            end
        else
            u39 = 0
            u40 = 0
        end
    end)
end
function u21.createSpeedBoostEffect(p60, p61) --[[ Line: 206 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
    --]]
    local v62 = p61.Character
    if not (v62 and v62.PrimaryPart) then
        return nil
    end
    local v63 = u12.Assets.Effects.SpeedBoostEffect:Clone()
    v63.Position = v62.PrimaryPart.Position
    v63.Parent = v62
    u9("WeldConstraint", {
        ["Part0"] = v63,
        ["Part1"] = v62.PrimaryPart,
        ["Parent"] = v63
    })
    p60.effectMap[p61] = v63
end
function u21.removeSpeedBoostEffect(p64, p65) --[[ Line: 223 ]]
    local v66 = p64.effectMap[p65]
    if v66 ~= nil then
        v66:Destroy()
    end
    p64.effectMap[p65] = nil
end
u6.CreateController(u21.new())
return nil