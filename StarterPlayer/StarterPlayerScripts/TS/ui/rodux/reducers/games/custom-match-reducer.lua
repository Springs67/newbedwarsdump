local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = {}
for v4, v5 in v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").starterHostPanelSettings do
    u3[v4] = v5
end
u3.mapSaves = nil
u3.mapSaveData = nil
u3.hostPanelAuditLog = {}
u3.serverName = ""
u3.serverThumbnail = ""
return {
    ["CustomMatchReducer"] = function(p6, p7) --[[ Name: CustomMatchReducer, Line 15 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        if p6 == nil then
            p6 = u3
        end
        if p7.type == "CustomMatchSetHostPanelAuditLog" then
            if p7.updateType == "set" then
                p6.hostPanelAuditLog = p7.hostPanelAuditLog
                return p6
            end
            local v8 = {}
            local v9 = #v8
            local v10 = p6.hostPanelAuditLog
            local v11 = #v10
            table.move(v10, 1, v11, v9 + 1, v8)
            local v12 = v9 + v11
            local v13 = p7.hostPanelAuditLog
            table.move(v13, 1, #v13, v12 + 1, v8)
            p6.hostPanelAuditLog = v8
            return p6
        end
        if p7.type == "CustomMatchSetMapSaves" then
            p6.mapSaves = p7.mapSaves
            return p6
        end
        if p7.type == "CustomMatchUpdateKit" then
            p6.disabledKits[p7.kit] = p7.value
            return p6
        end
        if p7.type == "CustomMatchUpdateAllKits" then
            p6.disabledKits = p7.disabledKits
            return p6
        end
        if p7.type == "CustomMatchSetSettings" then
            local v14 = {}
            for v15, v16 in p6 do
                v14[v15] = v16
            end
            for v17, v18 in p7.settings do
                v14[v17] = v18
            end
            return v14
        end
        if p7.type == "CustomMatchUpdateSome" then
            local v19 = u2.deepCopy(p6)
            for _, v20 in u2.keys(p7.settings) do
                v19[v20] = p7.settings[v20]
            end
            return v19
        end
        if p7.type == "CustomMatchUpdateItem" then
            p6.disabledItems[p7.item] = p7.value
            return p6
        end
        if p7.type == "CustomMatchUpdateAllItems" then
            p6.disabledItems = p7.disabledItems
            return p6
        end
        if p7.type == "CustomMatchUpdateGlobalOreGen" then
            p6.globalGenerators[p7.itemType] = p7.speedMultiplier
            return p6
        end
        if p7.type == "CustomMatchUpdateTeamOreGen" then
            p6.teamGenerators[p7.teamId] = p7.speedMultiplier
            return p6
        end
        if p7.type == "CustomMatchUpdateGeneralToggle" then
            p6.generalToggles[p7.toggle] = p7.value
            return p6
        end
        if p7.type == "CustomMatchSetMapSaveInfo" then
            p6.mapSaveData = p7.mapSaveData
            return p6
        end
        if p7.type ~= "CustomMatchUpdateDropdown" then
            return p6
        end
        p6.dropdowns[p7.dropdown] = p7.value
        return p6
    end
}