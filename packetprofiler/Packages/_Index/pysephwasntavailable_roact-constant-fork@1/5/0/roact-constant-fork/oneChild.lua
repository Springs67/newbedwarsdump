-- Decompiled with Potassium's decompiler.

return function(p1) -- Line: 8, Name: oneChild
    if not p1 then
        return nil;
    end;

    local v2, v3 = next(p1);

    if not v3 then
        return nil;
    end;

    if next(p1, v2) then
        error("Expected at most child, had more than one child.", 2);
    end;

    return v3;
end;