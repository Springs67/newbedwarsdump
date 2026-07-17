-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local deepCopy = v1.deepCopy;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-types");
local MapBrowserQueryFields = v4.MapBrowserQueryFields;
local MapBrowserSortFields = v4.MapBrowserSortFields;
local SortPreference = v4.SortPreference;
local ServerBrowserConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-constants").ServerBrowserConstants;
local _ = {
    {
        text = "ALL",
        value = "all"
    },
    {
        text = "MAP TITLE",
        value = MapBrowserQueryFields["0" + 1]
    },
    {
        text = "MAP DESCRIPTION",
        value = MapBrowserQueryFields["1" + 1]
    },
    {
        text = "CREATOR",
        value = MapBrowserQueryFields["2" + 1]
    },
    {
        text = "MAP CODE",
        value = MapBrowserQueryFields["3" + 1]
    }
};
local u5 = { "dislikes" };

local function _(p6) -- Line: 33
    -- upvalues: u5 (copy)
    return table.find(u5, p6) == nil;
end;

local v7 = 0;
local v8 = {};

for i, v in deepCopy(MapBrowserSortFields) do
    local _ = i - 1;

    if table.find(u5, v) == nil == true then
        v7 = v7 + 1;
        v8[v7] = v;
    end;
end;

local function _(p9) -- Line: 48
    return {
        text = "SORT: " .. string.upper(p9),
        value = p9
    };
end;

local v10 = table.create(#v8);

for i, v in v8 do
    local _ = i - 1;
    v10[i] = {
        text = "SORT: " .. string.upper(v),
        value = v
    };
end;

local v11 = v1.entries(SortPreference);

local function _(p12) -- Line: 62
    local v13 = p12[2];

    return {
        text = "SORT: " .. string.upper(p12[1]),
        value = tostring(v13)
    };
end;

local v14 = table.create(#v11);

for i, v in v11 do
    local _ = i - 1;
    local v15 = v[2];
    v14[i] = {
        text = "SORT: " .. string.upper(v[1]),
        value = tostring(v15)
    };
end;

return {
    ServerBrowserSearch = v3.new(u2)(function(u16, p17) -- Line: 77
        -- upvalues: SortPreference (copy), KnitClient (copy), DeviceUtil (copy), ServerBrowserConstants (copy), u2 (copy)
        local useState = p17.useState;
        local useBinding = p17.useBinding;
        local useEffect = p17.useEffect;
        local _, _ = useState(SortPreference.DESCENDING);
        local u18, u19 = useState("");
        local u20, u21 = useBinding(0);

        local function u28(p22, p23, p24) -- Line: 84
            -- upvalues: u19 (copy), u16 (copy), KnitClient (ref)
            u19(p22);
            u16.SetLoading(true);
            local u25 = {};

            if p24 ~= nil then
                p24 = p24.skip;
            end;

            u25.skip = p24 == nil and 0 or p24;
            local LiveGamesBrowserController = KnitClient.Controllers.LiveGamesBrowserController;
            local v26 = {};

            for i, v in u25 do
                v26[i] = v;
            end;

            LiveGamesBrowserController:searchServers(v26):andThen(function(p27) -- Line: 105
                -- upvalues: u16 (ref), u25 (copy)
                u16.onSearchComplete(u25, p27);
                u16.SetLoading(false);
            end);
        end;

        useEffect(function() -- Line: 111
            -- upvalues: u20 (copy), u16 (copy), DeviceUtil (ref), u28 (copy), u18 (copy), ServerBrowserConstants (ref), u21 (copy)
            if u20:getValue() == u16.Page then
                return nil;
            end;

            if not DeviceUtil.isHoarceKat() then
                u28(u18, false, {
                    skip = (u16.Page - 1) * ServerBrowserConstants.GAMES_PER_PAGE
                });
            end;

            u21(u16.Page);
        end, { u16.Page });

        return u2.createFragment();
    end)
};