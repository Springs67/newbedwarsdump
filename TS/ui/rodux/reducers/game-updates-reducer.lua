-- Decompiled with Potassium's decompiler.

local u1 = {
    newestKit = nil,
    updates = {}
};

return {
    GameUpdatesReducer = function(p2, p3) -- Line: 6, Name: GameUpdatesReducer
        -- upvalues: u1 (copy)
        if p2 == nil then
            p2 = u1;
        end;

        local v4 = {};

        for i, v in p2 do
            v4[i] = v;
        end;

        local type2 = p3.type;

        if type2 == "GameUpdatesSetAll" then
            v4.updates = p3.updates;
            v4.newestKit = p3.newestKit;
            v4.newestKitBG = p3.newestKitBG;

            return v4;
        end;

        if type2 ~= "AddUIAlerts" then
            if type2 == "ConfirmUIAlert" then
                local uiAlerts = v4.uiAlerts;

                if uiAlerts ~= nil then
                    uiAlerts = uiAlerts[p3.uiAlert];
                end;

                if uiAlerts then
                    local amount = p3.amount;

                    if amount == 0 or (amount ~= amount or not amount) then
                        uiAlerts.alerts = 0;

                        return v4;
                    end;

                    uiAlerts.alerts = math.max(uiAlerts.alerts - p3.amount, 0);

                    return v4;
                end;
            end;

            return v4;
        end;

        local v5 = {};
        local uiAlerts = p2.uiAlerts;

        if type(uiAlerts) == "table" then
            for i, v in uiAlerts do
                v5[i] = v;
            end;
        end;

        local uiAlerts2 = p3.uiAlerts;

        if type(uiAlerts2) == "table" then
            for i, v in uiAlerts2 do
                v5[i] = v;
            end;
        end;

        v4.uiAlerts = v5;

        return v4;
    end
};