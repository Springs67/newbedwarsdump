-- Decompiled with Potassium's decompiler.

local u1 = {
    profileData = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-profile-utils").AfkProfileUtil.makeStarterAfkData()
};

return {
    AfkReducer = function(p2, p3) -- Line: 7, Name: AfkReducer
        -- upvalues: u1 (copy)
        if p2 == nil then
            p2 = u1;
        end;

        if p3.type == "SetAfkDataAll" then
            local v4 = {};

            for i, v in p2 do
                v4[i] = v;
            end;

            v4.profileData = p3.afkData;

            return v4;
        end;

        if p3.type ~= "SetAfkDataSome" then
            if p3.type ~= "SetAfkPartial" then
                return p2;
            end;

            local v5 = {};

            for i, v in p2 do
                v5[i] = v;
            end;

            for i, v in p3.afkdata do
                v5[i] = v;
            end;

            return v5;
        end;

        local v6 = {};

        for i, v in p2 do
            v6[i] = v;
        end;

        local v7 = {};

        for i, v in p2.profileData do
            v7[i] = v;
        end;

        for i, v in p3.afkData do
            v7[i] = v;
        end;

        v6.profileData = v7;

        return v6;
    end
};