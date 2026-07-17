-- Decompiled with Potassium's decompiler.

local Parent = script.Parent.Parent;
local Components = Parent.Components;
local Packages = require(Parent.Modules.Packages);
local PacketSizeCounter = require(Packages.Directory.PacketSizeCounter);
local StudioSettings = require(Components.StudioSettings);
local u1 = {
    ["\7"] = "\\a",
    ["\8"] = "\\b",
    ["\f"] = "\\f",
    ["\n"] = "\\n",
    ["\r"] = "\\r",
    ["\t"] = "\\t",
    ["\11"] = "\\v",
    ["\0"] = "\\0"
};
local u2 = {
    ["and"] = true,
    ["break"] = true,
    ["do"] = true,
    ["else"] = true,
    ["elseif"] = true,
    ["end"] = true,
    ["false"] = true,
    ["for"] = true,
    ["function"] = true,
    ["if"] = true,
    ["in"] = true,
    ["local"] = true,
    ["nil"] = true,
    ["not"] = true,
    ["or"] = true,
    ["repeat"] = true,
    ["return"] = true,
    ["then"] = true,
    ["true"] = true,
    ["until"] = true,
    ["while"] = true,
    continue = true
};
local u3 = {
    ["&"] = "&amp;",
    ["<"] = "&lt;",
    [">"] = "&gt;",
    ["\""] = "&quot;",
    ["\'"] = "&apos;"
};

local function GetByteSize(p4) -- Line: 18
    -- upvalues: PacketSizeCounter (copy)
    local v5 = PacketSizeCounter.GetDataByteSize(p4);

    if v5 < 1000 then
        return `{v5} bytes`;
    end;

    return string.format("%.3f kilobytes", v5 / 1000);
end;

local u6 = {
    string = "ScriptString",
    number = "ScriptNumber",
    operator = "ScriptOperator",
    keyword = "ScriptKeyword",
    boolean = "ScriptKeyword",
    builtin = "ScriptBuiltInFunction",
    funcname = "ScriptFunctionName",
    text = "ScriptText",
    ["nil"] = "ScriptKeyword",
    bytesize = "ScriptComment",
    bracket = "ScriptBracket"
};
local u7 = {};

local function UpdateStyleGuideColors() -- Line: 42
    -- upvalues: StudioSettings (copy), u6 (copy), u7 (copy)
    local Theme = StudioSettings.Theme;

    for i, v in u6 do
        u7[i] = `#{Theme:GetColor(v):ToHex()}`;
    end;
end;

UpdateStyleGuideColors();
StudioSettings.ThemeChanged:Connect(UpdateStyleGuideColors);

local function Syntax(p8, p9) -- Line: 52
    -- upvalues: u7 (copy)
    return string.format("<font color=\"%s\">%s</font>", u7[p9] or u7.text, p8);
end;

local u10 = {
    ["."] = string.format("<font color=\"%s\">%s</font>", u7.operator or u7.text, "."),
    [","] = string.format("<font color=\"%s\">%s</font>", u7.text, ","),
    ["="] = string.format("<font color=\"%s\">%s</font>", u7.operator or u7.text, "="),
    ["("] = string.format("<font color=\"%s\">%s</font>", u7.bracket or u7.text, "("),
    [")"] = string.format("<font color=\"%s\">%s</font>", u7.bracket or u7.text, ")"),
    ["{"] = string.format("<font color=\"%s\">%s</font>", u7.bracket or u7.text, "{"),
    ["}"] = string.format("<font color=\"%s\">%s</font>", u7.bracket or u7.text, "}"),
    ["["] = string.format("<font color=\"%s\">%s</font>", u7.bracket or u7.text, "["),
    ["]"] = string.format("<font color=\"%s\">%s</font>", u7.bracket or u7.text, "]")
};

local function CleanupString(p11) -- Line: 68
    -- upvalues: u1 (copy), u3 (copy)
    local v12 = string.gsub(p11, "[%c%z]", u1);

    return string.gsub(v12, "[%&%<%>%\"%\']", u3);
end;

local function GetHierarchy(p13) -- Line: 74
    -- upvalues: u1 (copy), u3 (copy), u2 (copy), u10 (copy), u7 (copy)
    local v14 = true;
    local v15 = "";

    while v14 do
        local Parent2 = p13.Parent;
        v14 = Parent2 and Parent2.Parent and Parent2 ~= game;
        local v16 = string.gsub(p13.Name, "[%c%z]", u1);
        local v17 = string.gsub(v16, "[%&%<%>%\"%\']", u3);
        local v18;

        if u2[v17] or not string.match(v17, "^[_%a][_%w]*$") then
            local v19 = u10["["];
            local v20 = `&quot;{v17}&quot;`;
            v18 = `{v19}{string.format("<font color=\"%s\">%s</font>", u7.string or u7.text, v20)}{u10["]"]}`;
        else
            v18 = `{v14 and u10["."] or ""}{string.format("<font color=\"%s\">%s</font>", u7.text or u7.text, v17)}`;
        end;

        v15 = v18 .. v15;
        p13 = Parent2;
    end;

    return v15;
end;

local function ReadBuffer(p21) -- Line: 95
    local v22 = buffer.len(p21);
    local v23 = table.create(v22);

    for i = 0, v22 - 1 do
        local v24 = buffer.readu8(p21, i);
        table.insert(v23, v24);
    end;

    return table.concat(v23, " ");
end;

local function SerializeType(p25, p26) -- Line: 105
    -- upvalues: Syntax (copy), u1 (copy), u3 (copy), GetHierarchy (copy), u7 (copy), u10 (copy), ReadBuffer (copy)
    if p26 == "string" then
        local format = string.format;
        local v27 = string.gsub(p25, "[%c%z]", u1);

        return Syntax(format("&quot;%s&quot;", (string.gsub(v27, "[%&%<%>%\"%\']", u3))), "string");
    end;

    if p26 == "Instance" then
        return GetHierarchy(p25);
    end;

    if p26 == "buffer" then
        local v28 = string.format("<font color=\"%s\">%s</font>", u7.builtin or u7.text, "buffer");
        local v29 = u10["."];
        local v30 = string.format("<font color=\"%s\">%s</font>", u7.builtin or u7.text, "new");
        local v31 = u10["("];
        local v32 = ReadBuffer(p25);

        return `{v28}{v29}{v30}{v31}{string.format("<font color=\"%s\">%s</font>", u7.number or u7.text, v32)}{u10[")"]}`;
    end;

    if type(p25) == p26 then
        return Syntax(tostring(p25), p26);
    end;

    local v33 = string.format("<font color=\"%s\">%s</font>", u7.builtin or u7.text, p26);
    local v34 = u10["."];
    local v35 = string.format("<font color=\"%s\">%s</font>", u7.builtin or u7.text, "new");
    local v36 = u10["("];
    local v37 = tostring(p25);

    return `{v33}{v34}{v35}{v36}{string.format("<font color=\"%s\">%s</font>", u7.number or u7.text, v37)}{u10[")"]}`;
end;

local function TableToSyntaxString(p38, p39, p40, p41) -- Line: 119
    -- upvalues: Syntax (copy), u10 (copy), PacketSizeCounter (copy), u7 (copy), u1 (copy), u3 (copy), u2 (copy), TableToSyntaxString (copy), SerializeType (copy)
    local v42 = p40 or {};

    if v42[p38] then
        return Syntax("&quot;[Cyclic reference]&quot;", "string");
    end;

    v42[p38] = true;
    local v43 = (p41 or 0) + 1;
    local v44 = string.rep("    ", v43 - 1);
    local v45 = string.rep("    ", v43 - 2);
    local v46 = { v43 == 1 and "" or (u10["{"] or "") };
    local v47 = next(p38) == nil;
    local v48 = 1;
    local v49 = true;
    local v50 = not p39;

    for i, v in p38 do
        if v48 ~= i then
            v49 = false;
        end;

        local v51 = typeof(i);
        local v52 = typeof(v);
        local v53;

        if v51 == "table" or not v50 then
            v53 = "";
        else
            local v54 = PacketSizeCounter.GetDataByteSize(i);
            local v55;

            if v54 < 1000 then
                v55 = `{v54} bytes`;
            else
                v55 = string.format("%.3f kilobytes", v54 / 1000);
            end;

            v53 = `: {string.format("<font color=\"%s\">%s</font>", u7.bytesize or u7.text, v55)} `;
        end;

        local v56;

        if v52 == "table" or not v50 then
            v56 = "";
        else
            local v57 = PacketSizeCounter.GetDataByteSize(v);
            local v58;

            if v57 < 1000 then
                v58 = `{v57} bytes`;
            else
                v58 = string.format("%.3f kilobytes", v57 / 1000);
            end;

            v56 = `: {string.format("<font color=\"%s\">%s</font>", u7.bytesize or u7.text, v58)}`;
        end;

        local v59;

        if v51 == "string" then
            local v60 = string.gsub(i, "[%c%z]", u1);
            v59 = string.gsub(v60, "[%&%<%>%\"%\']", u3);

            if u2[v59] or not string.match(v59, "^[_%a][_%w]*$") then
                v59 = string.format(`{u10["["]}{string.format("<font color=\"%s\">%s</font>", u7.string or u7.text, "&quot;%s&quot;")}{u10["]"]}`, v59);
            end;
        else
            local v61;

            if v51 == "table" then
                v61 = TableToSyntaxString(i, p39, v42, 1);
            else
                v61 = SerializeType(i, v51);
            end;

            v59 = `{u10["["]}{v61}{u10["]"]}`;
        end;

        local v62;

        if v52 == "table" then
            v62 = TableToSyntaxString(v, p39, v42, v43);
        else
            v62 = SerializeType(v, v52);
        end;

        v46[v48] = `{v48 == 1 and v44 and v44 or `\n{v44}`}{v49 and v62 and v62 or `{v59}{v53} {u10["="]} {v62}`}{v56}{u10[","]}`;
        v48 = v48 + 1;
    end;

    if v43 == 1 then
        return v47 and "" or table.concat(v46, "");
    end;

    if v47 then
        return `{u10["{"]}{u10["}"]}`;
    end;

    return `{u10["{"]}\n{table.concat(v46, "")}\n{v45}{u10["}"]}`;
end;

return TableToSyntaxString;