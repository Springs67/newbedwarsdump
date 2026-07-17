-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ButtonComponent = v1.ButtonComponent;
local CircularSpinner = v1.CircularSpinner;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local MaxPriorityQueue = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "datastructures", "out").MaxPriorityQueue;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanProfilePageLayout = RuntimeLib.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
local ClanAuditLogRow = RuntimeLib.import(script, script.Parent, "clan-audit-log-row").ClanAuditLogRow;
local u4 = { {
        text = "Performed By",
        width = 0.15
    }, {
        text = "Action",
        width = 0.15
    }, {
        text = "Time",
        width = 0.25
    }, {
        text = "Description",
        width = 0.45
    } };
local u5 = (#u4 - 1) * 0.05 / #u4;

local function getAuditLogList(p6) -- Line: 34
    local v7 = {};

    for i, v in p6:ReverseIterate() do
        table.insert(v7, ({ i, v })[2].Value);
    end;

    return v7;
end;

return {
    ClanAuditLogTab = v3.new(u2)(function(u8, p9) -- Line: 43
        -- upvalues: MaxPriorityQueue (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), u2 (copy), u5 (copy), ColorUtil (copy), u4 (copy), Empty (copy), CircularSpinner (copy), getAuditLogList (copy), ClanAuditLogRow (copy), ButtonComponent (copy), Theme (copy), AutoCanvasScrollingFrame (copy), ClanProfilePageLayout (copy)
        local useState = p9.useState;
        local useEffect = p9.useEffect;
        local v10, u11 = useState(false);
        local v12, u13 = useState(MaxPriorityQueue.new());

        local function u15() -- Line: 48
            -- upvalues: SoundManager (ref), GameSound (ref), u8 (copy), u11 (copy), KnitClient (ref), u13 (copy)
            SoundManager:playSound(GameSound.UI_CLICK);
            local myClanId = u8.store.Clans.myClanId;

            if myClanId == "" or not myClanId then
                return nil;
            end;

            u11(true);
            KnitClient.Controllers.ClanController:loadAuditLogs(u8.store.Clans.myClanId):andThen(function(p14) -- Line: 55
                -- upvalues: u13 (ref), u11 (ref)
                u13(p14);
                u11(false);
            end);
        end;

        useEffect(function() -- Line: 60
            -- upvalues: u15 (copy)
            return u15();
        end, {});
        local v16 = {};
        local v17 = {
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v18 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }) };
        local v19 = {
            LayoutOrder = 1,
            Size = UDim2.new(0.95, 0, 0, 20)
        };
        local v20 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 12)
            }), u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.03, 0),
                PaddingRight = UDim.new(0.03, 0)
            }) };

        local function v22(p21) -- Line: 97
            -- upvalues: u2 (ref), u5 (ref), ColorUtil (ref)
            return u2.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Bottom",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(p21.width - u5, 0, 1, 0),
                Text = "<b>" .. p21.text .. "</b>",
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) });
        end;

        local v23 = table.create(#u4);
        local v24 = {
            Title = "AUDIT LOG"
        };

        for i, v in u4 do
            v23[i] = v22(v, i - 1, u4);
        end;

        local v25 = {
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v26 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Bottom",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v27 = #v26;

        for i, v in v23 do
            v26[v27 + i] = v;
        end;

        v20[#v20 + 1] = u2.createElement(Empty, v25, v26);
        v18.TableColumnHeaders = u2.createElement(Empty, v19, v20);
        local v28;

        if v10 then
            v28 = u2.createElement(Empty, {
                LayoutOrder = 2,
                ZIndex = 1,
                Size = UDim2.new(1, 0, 0.88, 0)
            }, { u2.createElement(CircularSpinner, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.15, 0.15),
                    Position = UDim2.new(0.5, 0, 0.375, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }) });
        elseif v12:IsEmpty() then
            v28 = u2.createFragment({
                NoResultsFoundContainer = u2.createElement(Empty, {
                    LayoutOrder = 2,
                    ZIndex = 1,
                    Size = UDim2.new(1, 0, 0.88, 0)
                }, { u2.createElement("TextLabel", {
                        Text = "Audit Logs currently disabled. Logs are still being recorded, but temporarily will not be viewable.",
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.75, 0.1),
                        Position = UDim2.new(0.5, 0, 0.375, 0),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    }) })
            });
        else
            local v29 = {};
            local v30 = getAuditLogList(v12);

            local function _(p31, p32) -- Line: 183
                -- upvalues: u2 (ref), ClanAuditLogRow (ref), u4 (ref), u8 (copy)
                return u2.createElement(ClanAuditLogRow, {
                    AuditLog = p31,
                    ColumnData = u4,
                    Index = 3 + p32,
                    store = u8.store
                });
            end;

            local v33 = table.create(#v30);

            for i, v in v30 do
                v33[i] = u2.createElement(ClanAuditLogRow, {
                    AuditLog = v,
                    ColumnData = u4,
                    Index = 3 + (i - 1),
                    store = u8.store
                });
            end;

            local v34 = {
                ScrollingFrameProps = {
                    LayoutOrder = 2,
                    ZIndex = 1,
                    Size = UDim2.new(1, 0, 0.81, 0)
                }
            };
            local v35 = { u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 2),
                    PaddingLeft = UDim.new(0, 2)
                }), u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Left",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 4)
                }) };
            local v36 = #v35;

            for i, v in v33 do
                v35[v36 + i] = v;
            end;

            v35[#v35 + 1] = u2.createElement(ButtonComponent, {
                Text = "<b>Load More</b>",
                Size = UDim2.new(0.25, 0, 0, 30),
                BackgroundColor3 = Theme.buttonPrimary,
                OnClick = v10 and function() -- Line: 225
                end or u15,
                Loading = v10,
                LayoutOrder = 4 + v12.Length
            });
            v29[#v29 + 1] = u2.createElement(AutoCanvasScrollingFrame, v34, v35);
            v28 = u2.createFragment(v29);
        end;

        v18[#v18 + 1] = v28;
        v16[#v16 + 1] = u2.createElement(Empty, v17, v18);

        return u2.createElement(ClanProfilePageLayout, v24, v16);
    end)
};