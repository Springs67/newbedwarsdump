-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = {};

for i, v in RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").starterHostPanelSettings do
    u2[i] = v;
end;

u2.mapSaves = nil;
u2.mapSaveData = nil;
u2.hostPanelAuditLog = {};
u2.serverName = "";
u2.serverThumbnail = "";

return {
    CustomMatchReducer = function(p3, p4) -- Line: 15, Name: CustomMatchReducer
        -- upvalues: u2 (copy), u1 (copy)
        if p3 == nil then
            p3 = u2;
        end;

        if p4.type == "CustomMatchSetHostPanelAuditLog" then
            if p4.updateType == "set" then
                p3.hostPanelAuditLog = p4.hostPanelAuditLog;

                return p3;
            end;

            local v5 = {};
            local v6 = #v5;
            local hostPanelAuditLog = p3.hostPanelAuditLog;
            local v7 = #hostPanelAuditLog;
            table.move(hostPanelAuditLog, 1, v7, v6 + 1, v5);
            local hostPanelAuditLog2 = p4.hostPanelAuditLog;
            table.move(hostPanelAuditLog2, 1, #hostPanelAuditLog2, v6 + v7 + 1, v5);
            p3.hostPanelAuditLog = v5;

            return p3;
        end;

        if p4.type == "CustomMatchSetMapSaves" then
            p3.mapSaves = p4.mapSaves;

            return p3;
        end;

        if p4.type == "CustomMatchUpdateKit" then
            p3.disabledKits[p4.kit] = p4.value;

            return p3;
        end;

        if p4.type == "CustomMatchUpdateAllKits" then
            p3.disabledKits = p4.disabledKits;

            return p3;
        end;

        if p4.type == "CustomMatchSetSettings" then
            local v8 = {};

            for i, v in p3 do
                v8[i] = v;
            end;

            for i, v in p4.settings do
                v8[i] = v;
            end;

            return v8;
        end;

        if p4.type == "CustomMatchUpdateSome" then
            local v9 = u1.deepCopy(p3);

            for _, v in u1.keys(p4.settings) do
                v9[v] = p4.settings[v];
            end;

            return v9;
        end;

        if p4.type == "CustomMatchUpdateItem" then
            p3.disabledItems[p4.item] = p4.value;

            return p3;
        end;

        if p4.type == "CustomMatchUpdateAllItems" then
            p3.disabledItems = p4.disabledItems;

            return p3;
        end;

        if p4.type == "CustomMatchUpdateGlobalOreGen" then
            p3.globalGenerators[p4.itemType] = p4.speedMultiplier;

            return p3;
        end;

        if p4.type == "CustomMatchUpdateTeamOreGen" then
            p3.teamGenerators[p4.teamId] = p4.speedMultiplier;

            return p3;
        end;

        if p4.type == "CustomMatchUpdateGeneralToggle" then
            p3.generalToggles[p4.toggle] = p4.value;

            return p3;
        end;

        if p4.type == "CustomMatchSetMapSaveInfo" then
            p3.mapSaveData = p4.mapSaveData;

            return p3;
        end;

        if p4.type ~= "CustomMatchUpdateDropdown" then
            return p3;
        end;

        p3.dropdowns[p4.dropdown] = p4.value;

        return p3;
    end
};