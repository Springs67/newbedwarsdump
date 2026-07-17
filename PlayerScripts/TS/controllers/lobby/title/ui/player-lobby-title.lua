-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TitleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta;
local LobbyTitle = RuntimeLib.import(script, script.Parent, "lobby-title").LobbyTitle;

return {
    PlayerLobbyTitle = v2.new(u1)(function(u3, p4) -- Line: 7
        -- upvalues: TitleMeta (copy), u1 (copy), LobbyTitle (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;
        local v5, u6 = useState(nil);
        local v7, u8 = useState(nil);
        useEffect(function() -- Line: 12
            -- upvalues: u3 (copy), u6 (copy), TitleMeta (ref), u8 (copy)
            local v9 = u3.Player:GetAttribute("TitleType");

            if v9 then
                u6(v9);

                if TitleMeta[v9].statsTracking then
                    local v10 = u3.Player:GetAttribute("TitleSuffix");

                    if v10 ~= "" and v10 then
                        u8(v10);
                    end;
                end;
            end;

            local u13 = u3.Player:GetAttributeChangedSignal("TitleType"):Connect(function() -- Line: 24
                -- upvalues: u3 (ref), u6 (ref), TitleMeta (ref), u8 (ref)
                local v11 = u3.Player:GetAttribute("TitleType");
                u6(v11);

                if v11 then
                    if TitleMeta[v11].statsTracking then
                        local v12 = u3.Player:GetAttribute("TitleSuffix");

                        if v12 ~= "" and v12 then
                            u8(v12);
                        end;
                    else
                        u8(nil);
                    end;
                end;
            end);

            return function() -- Line: 39
                -- upvalues: u13 (copy)
                u13:Disconnect();
            end;
        end, {});

        if v5 then
            return u1.createElement(LobbyTitle, {
                TitleType = v5,
                TextLabelProps = u3.TextLabelProps,
                suffix = v7
            });
        end;

        return u1.createFragment();
    end)
};