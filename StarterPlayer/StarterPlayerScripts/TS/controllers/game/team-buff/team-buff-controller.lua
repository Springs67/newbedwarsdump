local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v7.ReplicatedStorage
local u11 = v7.RunService
local u12 = v7.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-meta").teamBuffMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "TeamBuffController"
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
    --]]
    u14.constructor(p24)
    p24.Name = "TeamBuffController"
end
function u21.KnitStart(u25) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u18
        [3] = u13
        [4] = u6
        [5] = u9
        [6] = u16
        [7] = u4
        [8] = u20
        [9] = u2
        [10] = u17
        [11] = u15
        [12] = u5
        [13] = u19
    --]]
    u14.KnitStart(u25)
    u18.Client:Get("TeamBuffApplied"):Connect(function(p26) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u6
            [3] = u9
            [4] = u16
            [5] = u4
            [6] = u20
            [7] = u2
            [8] = u17
            [9] = u15
            [10] = u25
            [11] = u5
            [12] = u19
        --]]
        u13.TeamBuffApplied:fire(p26.teamId, p26.teamBuff)
        local v27 = u6.Controllers.TeamController:getPlayerTeam(u9.LocalPlayer)
        local v28 = u16[p26.teamBuff]
        if v27 and v27.id == p26.teamId then
            local v29 = not p26.user and "" or "<font color=\"" .. u4.richTextColor(u20.mcAqua) .. "\"><b>" .. p26.user.DisplayName .. "</b></font> prayed to the Snake Shrine for <font color=\"" .. u4.richTextColor(Color3.fromRGB(137, 246, 146)) .. "\"><b>" .. v28.displayName .. "</b></font>!"
            local v30 = v28.description
            if v30 ~= "" and v30 then
                local v31 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                local v32 = {}
                local v33 = v28.image
                if v33 == nil then
                    v33 = u17.SNAKE_ICON
                end
                v32.image = v33
                v32.message = v29
                v31:sendInfoNotification(v32)
            end
            local v34 = u15:getLocalPlayerEntity()
            if v28.applyVisualEffect and v34 then
                u25:playBlessEffect(v34)
                u5:playSound(u19.SNAKE_BUFF)
            end
        end
    end)
end
function u21.playBlessEffect(_, u35) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
        [3] = u12
        [4] = u11
    --]]
    local u36 = u10.Assets.Effects.SnakeBless:Clone()
    u8:AddTag(u36, "FirstPersonHidden")
    u36:PivotTo(u35:getInstance():GetPrimaryPartCFrame())
    task.delay(0.2, function() --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u12
            [3] = u11
            [4] = u35
        --]]
        u36.Parent = u12
        for v37, v38 in u36:GetDescendants() do
            local _ = v37 - 1
            if v38:IsA("Beam") then
                v38.Enabled = true
            end
        end
        local u39 = tick() + 1
        local u40 = nil
        u40 = u11.Heartbeat:Connect(function() --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u36
                [3] = u40
                [4] = u35
            --]]
            if u39 < tick() then
                u36:Destroy()
                u40:Disconnect()
            end
            if tick() < u39 then
                u36:PivotTo(u35:getInstance():GetPrimaryPartCFrame())
            end
        end)
    end)
end
u6.CreateController(u21.new())
return nil