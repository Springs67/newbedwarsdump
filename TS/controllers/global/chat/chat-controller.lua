-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local TextChatService = v3.TextChatService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ChatTagMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "chat", "chat-tag-meta").ChatTagMeta;
local ChatTagType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "chat", "chat-tag-type").ChatTagType;
local ChatUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "chat", "chat-util").ChatUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "ChatController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "ChatController";
    p6.defaultChatChannel = "RBXGeneral";
    p6.playerChatGradients = {};
end;

function u4.KnitStart(u7) -- Line: 34
    -- upvalues: KnitController (copy), Players (copy), ColorUtil (copy), u2 (copy), ChatTagType (copy)
    KnitController.KnitStart(u7);
    local TextChatService2 = game:GetService("TextChatService");
    task.spawn(function() -- Line: 37
        -- upvalues: u7 (copy), TextChatService2 (copy)
        u7.windowConfig = TextChatService2:WaitForChild("ChatWindowConfiguration");
        u7.windowConfig.HeightScale = 0.85;
        u7.windowConfig.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
        u7.windowConfig.TextStrokeTransparency = 0.5;
        u7.windowConfig.FontFace = Font.new(Font.fromEnum(Enum.Font.Gotham).Family, Enum.FontWeight.Bold);
    end);
    task.spawn(function() -- Line: 44
        -- upvalues: TextChatService2 (copy)
        TextChatService2:WaitForChild("BubbleChatConfiguration").LocalPlayerStudsOffset = Vector3.new(0, 1.5, 0);
    end);
    task.spawn(function() -- Line: 48
        -- upvalues: u7 (copy)
        u7:enableChannelTabs();
    end);

    function TextChatService2.OnChatWindowAdded(p8) -- Line: 51
        -- upvalues: u7 (copy), Players (ref), ColorUtil (ref), u2 (ref), ChatTagType (ref)
        local v9 = u7.windowConfig:DeriveNewMessageProperties();
        local TextSource = p8.TextSource;

        if TextSource ~= nil then
            TextSource = TextSource.UserId;
        end;

        local v10;

        if TextSource == 0 or (TextSource ~= TextSource or not TextSource) then
            v10 = nil;
        else
            v10 = Players:GetPlayerByUserId(TextSource);
        end;

        if v10 then
            local v11 = v10:GetAttribute("ChatNameColor");

            if v11 then
                local v12 = ColorUtil.richTextColor(v11);
                local PrefixText = p8.PrefixText;
                p8.PrefixText = "<font color=\'" .. v12 .. "\'>" .. (PrefixText == nil and "" or PrefixText) .. "</font>";
            end;

            if u7.playerChatGradients[v10.UserId] == nil then
                local v13 = u7:getPrefixTagsGradient(v10);
                local v14;

                if v13 then
                    v14 = u2("UIGradient", {
                        Color = v13
                    });
                else
                    v14 = nil;
                end;

                u7.playerChatGradients[v10.UserId] = v14;
            end;

            local v15 = u7.playerChatGradients[v10.UserId];

            if v15 then
                local v16 = u7:getPrefixTagsByType(v10);
                local v17 = v16[ChatTagType.RANK] == nil and "" or tostring(v16[ChatTagType.RANK]) .. " ";
                local v18 = v16[ChatTagType.CLAN];
                v9.PrefixText = v18 == nil and "" or v18;
                v9.Text = v17 .. p8.PrefixText .. " " .. p8.Text;
                v9.PrefixTextProperties = u7.windowConfig:DeriveNewMessageProperties();
                v15:Clone().Parent = v9.PrefixTextProperties;

                return v9;
            end;

            local v19 = u7:getPrefixTags(v10);
            local PrefixText = p8.PrefixText;
            v9.PrefixText = v19 .. (PrefixText == nil and "" or PrefixText);
            v9.Text = p8.Text;
        end;

        return v9;
    end;
end;

function u4.displayMessage(p20, p21, p22) -- Line: 119
    if p22 == nil then
        p22 = p20.defaultChatChannel;
    end;

    local v23 = p20:getTextChannel(p22);

    if not v23 then
        return nil;
    end;

    v23:DisplaySystemMessage(p21);
end;

function u4.enableChannelTabs(p24) -- Line: 131
    -- upvalues: ChatUtil (copy), TextChatService (copy)
    if ChatUtil.LEGACY_TEXT_CHAT_ENABLED or not ChatUtil.TEXT_CHANNELS_ENABLED then
        return nil;
    end;

    TextChatService:WaitForChild("ChannelTabsConfiguration", 3.5).Enabled = true;
end;

function u4.disableChannelTabs(p25) -- Line: 138
    -- upvalues: TextChatService (copy)
    TextChatService:WaitForChild("ChannelTabsConfiguration", 3.5).Enabled = false;
end;

function u4.getTextChannel(p26, p27) -- Line: 142
    -- upvalues: ChatUtil (copy), TextChatService (copy)
    if ChatUtil.LEGACY_TEXT_CHAT_ENABLED or not ChatUtil.TEXT_CHANNELS_ENABLED then
        return nil;
    end;

    return TextChatService:WaitForChild("TextChannels"):WaitForChild(p27);
end;

function u4.getPrefixTags(p28, p29) -- Line: 149
    -- upvalues: u1 (copy), ChatTagType (copy), ChatTagMeta (copy)
    local Tags = p29:FindFirstChild("Tags");

    if not Tags then
        return "";
    end;

    local v30 = u1.values(ChatTagType);
    table.sort(v30, function(p31, p32) -- Line: 156
        -- upvalues: ChatTagMeta (ref)
        return ChatTagMeta[p31].displayOrder < ChatTagMeta[p32].displayOrder;
    end);
    local v33 = "";

    for _, v in v30 do
        local v34 = nil;

        for _, child in Tags:GetChildren() do
            if child.Name == tostring(v) and child:IsA("StringValue") then
                local v35 = not v34;

                if not v35 then
                    local v36 = v34:GetAttribute("TagPriority");
                    local v37 = child:GetAttribute("TagPriority");
                    v35 = (v36 == nil and 0 or v36) < (v37 == nil and 0 or v37);
                end;

                if v35 then
                    v34 = child;
                end;
            end;
        end;

        if v34 then
            v33 = v33 .. v34.Value .. " ";
        end;
    end;

    return v33;
end;

function u4.getPrefixTagsByType(p38, p39) -- Line: 193
    -- upvalues: u1 (copy), ChatTagType (copy)
    local Tags = p39:FindFirstChild("Tags");

    if not Tags then
        return {};
    end;

    local v40 = {};

    for _, v in u1.values(ChatTagType) do
        local v41 = nil;

        for _, child in Tags:GetChildren() do
            if child.Name == tostring(v) and child:IsA("StringValue") then
                local v42 = not v41;

                if not v42 then
                    local v43 = v41:GetAttribute("TagPriority");
                    local v44 = child:GetAttribute("TagPriority");
                    v42 = (v43 == nil and 0 or v43) < (v44 == nil and 0 or v44);
                end;

                if v42 then
                    v41 = child;
                end;
            end;
        end;

        if v41 then
            v40[v] = v41.Value;
        end;
    end;

    return v40;
end;

function u4.getPrefixTagsGradient(p45, p46) -- Line: 232
    -- upvalues: u1 (copy), ChatTagType (copy), ChatTagMeta (copy)
    local Tags = p46:FindFirstChild("Tags");

    if not Tags then
        return nil;
    end;

    local v47 = u1.values(ChatTagType);
    table.sort(v47, function(p48, p49) -- Line: 238
        -- upvalues: ChatTagMeta (ref)
        return ChatTagMeta[p48].displayOrder < ChatTagMeta[p49].displayOrder;
    end);

    local function _(p50) -- Line: 242
        -- upvalues: Tags (copy)
        local v51 = Tags:FindFirstChild(p50);
        local v52;

        if v51 == nil then
            v52 = v51;
        else
            v52 = v51:IsA("StringValue");
        end;

        if v52 then
            return v51:GetAttribute("Gradient");
        end;

        return nil;
    end;

    local v53 = 0;
    local v54 = {};

    for i, v in v47 do
        local _ = i - 1;
        local v55 = Tags:FindFirstChild(v);
        local v56;

        if v55 == nil then
            v56 = v55;
        else
            v56 = v55:IsA("StringValue");
        end;

        local v57;

        if v56 then
            v57 = v55:GetAttribute("Gradient");
        else
            v57 = nil;
        end;

        if v57 ~= nil then
            v53 = v53 + 1;
            v54[v53] = v57;
        end;
    end;

    if #v54 == 0 then
        return nil;
    end;

    return v54[1];
end;

KnitClient.CreateController(u4.new());

return nil;