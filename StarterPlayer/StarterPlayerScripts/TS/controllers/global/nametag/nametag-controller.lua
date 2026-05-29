local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.HttpService
local u13 = v10.Players
local u14 = v10.Workspace
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u23 = u1.import(script, script.Parent.Parent, "entity", "game-player-nametag").GamePlayerNametag
local u24 = u1.import(script, script.Parent, "ui", "nametag").NameTag
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "NametagController"
    end,
    ["__index"] = u15
})
u25.__index = u25
function u25.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p28)
    p28.Name = "NametagController"
    p28.forceRescaleMaid = {}
    p28.nametagUUID = {}
    p28.nametagChangedConnectionMaid = {}
    p28.nametagDataCache = {}
end
function u25.KnitStart(u29) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u16
        [3] = u1
        [4] = u13
        [5] = u18
        [6] = u3
        [7] = u14
        [8] = u9
        [9] = u24
        [10] = u11
        [11] = u7
        [12] = u17
        [13] = u6
    --]]
    if u22.isLobbyServer() then
        u16.changed:connect(function(p30, p31) --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u13
                [3] = u18
                [4] = u29
            --]]
            if p30.Party.members ~= p31.Party.members or p30.Party.leader ~= p31.Party.leader then
                local v32 = { p31.Party.leader }
                local v33 = #v32
                local v34 = p31.Party.members
                table.move(v34, 1, #v34, v33 + 1, v32)
                local v35 = 0
                local v36 = {}
                for v37, v38 in v32 do
                    local _ = v37 - 1
                    local v39 = p30.Party.members
                    if table.find(v39, v38) == nil == true then
                        v35 = v35 + 1
                        v36[v35] = v38
                    end
                end
                local u40 = table.create(#v36)
                for v41, v42 in v36 do
                    local _ = v41 - 1
                    u40[v41] = v42.userId
                end
                local v43 = { p30.Party.leader }
                local v44 = #v43
                local v45 = p30.Party.members
                table.move(v45, 1, #v45, v44 + 1, v43)
                local u46 = table.create(#v43)
                for v47, v48 in v43 do
                    local _ = v47 - 1
                    u46[v47] = v48.userId
                end
                u1.Promise.defer(function() --[[ Line: 96 ]]
                    --[[
                    Upvalues:
                        [1] = u40
                        [2] = u13
                        [3] = u18
                        [4] = u29
                        [5] = u46
                    --]]
                    for _, v49 in u40 do
                        local v50 = u13:GetPlayerByUserId(v49)
                        if v50 then
                            local v51 = u18:getEntity(v50)
                            if v51 ~= nil then
                                v51:setNametag(u29:getNewNametagTextForPlayer(v50))
                            end
                        end
                    end
                    for _, v52 in u46 do
                        local v53 = u13:GetPlayerByUserId(v52)
                        if v53 then
                            local v54 = u18:getEntity(v53)
                            if v54 ~= nil then
                                v54:setNametag(u29:getNewNametagTextForPlayer(v53), Color3.fromRGB(85, 255, 85))
                            end
                        end
                    end
                end)
            end
        end)
        u13.PlayerRemoving:Connect(function(p55) --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            u29.nametagDataCache[p55] = nil
        end)
        u3(function(u56, u57) --[[ Line: 125 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u9
                [3] = u24
                [4] = u16
                [5] = u18
                [6] = u29
            --]]
            task.spawn(function() --[[ Line: 126 ]]
                --[[
                Upvalues:
                    [1] = u57
                    [2] = u14
                    [3] = u9
                    [4] = u24
                    [5] = u16
                    [6] = u56
                    [7] = u18
                    [8] = u29
                --]]
                local v58 = u57:WaitForChild("Head")
                if not u57:IsDescendantOf(u14) then
                    u57.AncestryChanged:Wait()
                end
                local v59 = u57:FindFirstChildWhichIsA("Humanoid")
                if v59 then
                    v59.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                end
                local v60 = {
                    ["EntityInstance"] = u57
                }
                u9.mount(u9.createElement(u24, v60), v58, "Nametag")
                local v61 = { u16:getState().Party.leader }
                local v62 = #v61
                local v63 = u16:getState().Party.members
                table.move(v63, 1, #v63, v62 + 1, v61)
                local v64 = table.create(#v61)
                for v65, v66 in v61 do
                    local _ = v65 - 1
                    v64[v65] = v66.userId
                end
                local v67 = u56.UserId
                local v68 = table.find(v64, v67) ~= nil and u18:getEntity(u56)
                if v68 then
                    v68:getInstance():WaitForChild("Humanoid").NameDisplayDistance = 0
                    if v68 ~= nil then
                        v68:setNametag(u29:getNewNametagTextForPlayer(u56), Color3.fromRGB(85, 255, 85))
                    end
                end
            end)
        end)
    end
    if u22.isGameServer() then
        u11:GetInstanceAddedSignal("entity"):Connect(function(p69) --[[ Line: 169 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u18
                [3] = u1
                [4] = u17
                [5] = u29
            --]]
            local v70 = u7.new()
            local u71 = u18:getEntity(p69)
            if not u71 then
                return nil
            end
            if u1.instanceof(u71, u17) then
                return nil
            end
            u29:addGameNametag(u71:getInstance())
            v70:GiveTask((u71:getInstance():GetAttributeChangedSignal("NoNametag"):Connect(function() --[[ Line: 179 ]]
                --[[
                Upvalues:
                    [1] = u71
                    [2] = u29
                --]]
                if u71:shouldShowNametag() then
                    u29:addGameNametag(u71:getInstance())
                else
                    u29:removeGameNametag(u71:getInstance())
                end
            end)))
            u29.nametagChangedConnectionMaid[p69] = v70
        end)
        u11:GetInstanceRemovedSignal("entity"):Connect(function(p72) --[[ Line: 191 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u29
            --]]
            if not u18:getEntity(p72) then
                return nil
            end
            local v73 = u29.nametagChangedConnectionMaid[p72]
            if v73 ~= nil then
                v73:Destroy()
            end
            u29.nametagChangedConnectionMaid[p72] = nil
        end)
        u3(function(_, p74, p75) --[[ Line: 207 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u29
            --]]
            local v76 = p74:WaitForChild("Humanoid")
            v76.NameDisplayDistance = 0
            v76.HealthDisplayDistance = 0
            v76.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            v76.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
            local u77 = u18:getEntity(p74)
            if not u77 then
                return nil
            end
            local u78 = u77:getInstance()
            u29:addGameNametag(u78)
            p75:GiveTask((u78:GetAttributeChangedSignal("NoNametag"):Connect(function() --[[ Line: 221 ]]
                --[[
                Upvalues:
                    [1] = u77
                    [2] = u29
                    [3] = u78
                --]]
                if u77:shouldShowNametag() then
                    u29:addGameNametag(u78)
                else
                    u29:removeGameNametag(u78)
                end
            end)))
        end)
        u6.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p79) --[[ Line: 231 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u29
            --]]
            local v80 = u18:getLocalPlayerEntity()
            if v80 ~= nil then
                v80 = v80:getInstance()
            end
            if v80 then
                if p79 == 0 then
                    u29:removeGameNametag(v80)
                else
                    u29:addGameNametag(v80)
                end
            else
                return nil
            end
        end)
    end
end
function u25.hideNametag(_, p81) --[[ Line: 248 ]]
    local v82 = p81:FindFirstChild("Nametag", true)
    if v82 then
        v82.Enabled = false
    end
end
function u25.requestNametagData(p83, p84) --[[ Line: 254 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u20
    --]]
    local u85 = p83.nametagDataCache[p84]
    if u85 then
        return u1.Promise.new(function(p86) --[[ Line: 259 ]]
            --[[
            Upvalues:
                [1] = u85
            --]]
            return p86(u85)
        end)
    else
        return u20.Client:Get("NametagDataRequest"):CallServerAsync(p84.UserId)
    end
end
function u25.addGameNametag(p87, u88) --[[ Line: 266 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u6
        [3] = u12
        [4] = u14
        [5] = u2
        [6] = u23
    --]]
    local v89 = u88:GetAttribute("NoNametag")
    if v89 ~= 0 and (v89 == v89 and (v89 ~= "" and v89)) then
        return nil
    end
    local v90 = u18:getLocalPlayerEntity()
    if v90 ~= nil then
        v90 = v90:getInstance()
    end
    if u88 == v90 and u6.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        return nil
    end
    local v91 = u18:getEntity(u88)
    if v91 ~= nil then
        v91 = v91:shouldShowNametag()
    end
    if not v91 then
        return nil
    end
    local v92 = p87.nametagUUID[u88]
    if v92 == "" or not v92 then
        v92 = u12:GenerateGUID()
        p87.nametagUUID[u88] = v92
    end
    local u93 = "GameNametag_" .. u88.Name .. v92
    task.spawn(function() --[[ Line: 301 ]]
        --[[
        Upvalues:
            [1] = u88
            [2] = u14
            [3] = u2
            [4] = u93
            [5] = u18
            [6] = u23
        --]]
        if not u88:IsDescendantOf(u14) then
            u88.AncestryChanged:Wait()
        end
        local v94 = u88:WaitForChild("Head")
        if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u93) then
            return nil
        end
        local v95 = u18:getEntity(u88)
        if v95 ~= nil then
            v95 = v95:shouldShowNametag()
        end
        if not v95 then
            return nil
        end
        local v96 = {
            ["app"] = u23,
            ["appId"] = u93
        }
        local v97 = {
            ["EntityInstance"] = u88
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v96, v97, nil, v94)
    end)
end
function u25.removeGameNametag(p98, p99) --[[ Line: 324 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v100 = p98.nametagUUID[p99]
    local v101 = v100 == nil and "" or v100
    local v102 = "GameNametag_" .. p99.Name .. v101
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(v102)
end
function u25.updateTeam(u103, u104, u105) --[[ Line: 335 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u16
        [3] = u22
        [4] = u18
        [5] = u21
    --]]
    task.spawn(function() --[[ Line: 336 ]]
        --[[
        Upvalues:
            [1] = u105
            [2] = u103
            [3] = u104
            [4] = u13
            [5] = u16
            [6] = u22
            [7] = u18
            [8] = u21
        --]]
        local v106 = u105:WaitForChild("Head", 5)
        if v106 ~= nil then
            v106 = v106:WaitForChild("Nametag", 5)
        end
        if v106 ~= nil then
            local v107 = v106:WaitForChild("DisplayNameContainer", 5)
            if v107 ~= nil then
                v107:WaitForChild("DisplayName", 5)
            end
        end
        if not v106 then
            return nil
        end
        u103:rescaleNametag(v106)
        if u104 == u13.LocalPlayer then
            for _, v108 in u13:GetPlayers() do
                if v108.Character and v108 ~= u13.LocalPlayer then
                    u103:updateTeam(v108, v108.Character)
                end
            end
        end
        local v109 = u105:GetAttribute("Team")
        local v110 = u13.LocalPlayer.Character
        if v110 ~= nil then
            v110 = v110:GetAttribute("Team")
        end
        local v111
        if v109 == "" or not v109 then
            v111 = nil
        else
            v111 = nil
            for v112, v113 in u16:getState().Game.teams do
                local _ = v112 - 1
                if v113.id == v109 == true then
                    v111 = v113
                    break
                end
            end
        end
        if u104 == u13.LocalPlayer then
            if u22.isLobbyServer() then
                local v114 = u18:getEntity(u104)
                if v114 ~= nil then
                    v114:hideLobbyDisplayName()
                end
                if v114 ~= nil then
                    v114:centerLobbyNameTag()
                end
            else
                u105:WaitForChild("Head"):WaitForChild("Nametag").PlayerToHideFrom = u13.LocalPlayer
            end
        end
        if u22.isGameServer() and v111 then
            local v115 = u105:WaitForChild("Head"):WaitForChild("Nametag"):WaitForChild("TeamIndicator")
            v115.Visible = true
            v115.BackgroundColor3 = v111.color
        end
        local v116 = u22.isGameServer() and u18:getEntity(u104)
        if v116 then
            local v117
            if v109 == v110 then
                v117 = u21.mcGreen
            else
                v117 = Color3.fromRGB(240, 26, 26)
            end
            v116:setNametag(u103:getNewNametagTextForPlayer(u104), v117)
            v116:setNametagBorderColor(v117)
        end
    end)
end
function u25.rescaleNametag(u118, u119) --[[ Line: 423 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u7
    --]]
    local v120 = u119:FindFirstChild("DisplayNameContainer")
    if not v120 then
        return nil
    end
    local v121 = u8("ScreenGui", {})
    v120.Parent = u8("Frame", {
        ["Parent"] = v121,
        ["Size"] = UDim2.fromOffset(600, 65)
    })
    local v122 = v120:FindFirstChildOfClass("UIListLayout") or u8("UIListLayout", {
        ["Parent"] = v120,
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["Padding"] = UDim.new(0.01, 0)
    })
    for _, v123 in v120:GetChildren() do
        if v123:IsA("TextLabel") then
            v123.AutomaticSize = Enum.AutomaticSize.X
            v123.RichText = false
        end
    end
    v121.Parent = u13.LocalPlayer:FindFirstChild("PlayerGui")
    local v124 = {}
    local v125 = {}
    for _, u126 in v120:GetChildren() do
        if u126:IsA("TextLabel") then
            v124[u126] = UDim2.fromScale(u126.AbsoluteSize.X / v120.AbsoluteSize.X, u126.AbsoluteSize.Y / v120.AbsoluteSize.Y)
            if u118.forceRescaleMaid[u126] == nil then
                local u127 = u7.new()
                u127:GiveTask(u126.AncestryChanged:Connect(function() --[[ Line: 466 ]]
                    --[[
                    Upvalues:
                        [1] = u126
                        [2] = u127
                        [3] = u118
                    --]]
                    if u126.Parent then
                        return nil
                    end
                    u127:DoCleaning()
                    u118.forceRescaleMaid[u126] = nil
                end))
                u127:GiveTask(u126:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 473 ]]
                    --[[
                    Upvalues:
                        [1] = u118
                        [2] = u119
                    --]]
                    u118:rescaleNametag(u119)
                end))
                u118.forceRescaleMaid[u126] = u127
            end
        end
        if u126:IsA("GuiObject") then
            local v128 = u126.AbsolutePosition - v120.AbsolutePosition
            v125[u126] = UDim2.fromScale(v128.X / v120.AbsoluteSize.X, v128.Y / v120.AbsoluteSize.Y)
        end
    end
    if v122 ~= nil then
        v122:Destroy()
    end
    for v129, v130 in v125 do
        v129.Position = v130
        local _ = v129.Position
    end
    for v131, v132 in v124 do
        v131.AutomaticSize = Enum.AutomaticSize.None
        v131.RichText = false
        v131.Size = v132
    end
    v120.Parent = u119
    v121:Destroy()
end
function u25.getNewNametagTextForPlayer(_, p133) --[[ Line: 509 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u22
    --]]
    local v134 = u19.getGamePlayer(p133):getClanTag()
    local v135 = v134 ~= ""
    local v136 = u19.getGamePlayer(p133):getDisplayName()
    if v135 and u22.isLobbyServer() then
        return "<font color=\"rgb(219,219,219)\">[" .. v134 .. "]</font> <b>" .. v136 .. "</b>"
    else
        return v136
    end
end
return {
    ["NametagController"] = v5.CreateController(u25.new())
}