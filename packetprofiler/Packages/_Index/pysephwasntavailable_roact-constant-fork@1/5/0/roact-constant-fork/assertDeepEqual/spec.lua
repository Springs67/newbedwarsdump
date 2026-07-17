-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.assertDeepEqual);
    it("should fail with a message when args are not equal", function() -- Line: 4
        -- upvalues: assertDeepEqual (copy)
        local success, result = pcall(assertDeepEqual, 1, 2);
        expect(success).to.equal(false);
        expect(result:find("first ~= second")).to.be.ok();
        local success2, result2 = pcall(assertDeepEqual, {
            foo = 1
        }, {
            foo = 2
        });
        expect(success2).to.equal(false);
        expect(result2:find("first%[foo%] ~= second%[foo%]")).to.be.ok();
    end);
    it("should compare non-table values using standard \'==\' equality", function() -- Line: 20
        -- upvalues: assertDeepEqual (copy)
        assertDeepEqual(1, 1);
        assertDeepEqual("hello", "hello");
        assertDeepEqual(nil, nil);

        local function v1() -- Line: 25
        end;

        assertDeepEqual(v1, v1);
        assertDeepEqual({
            foo = v1
        }, {
            foo = v1
        });
    end);
    it("should fail when types differ", function() -- Line: 40
        -- upvalues: assertDeepEqual (copy)
        local success, result = pcall(assertDeepEqual, 1, "1");
        expect(success).to.equal(false);
        expect(result:find("first is of type number, but second is of type string")).to.be.ok();
    end);
    it("should compare (and report about) nested tables", function() -- Line: 47
        -- upvalues: assertDeepEqual (copy)
        local v2 = {
            foo = "bar",
            nested = {
                foo = 1,
                bar = 2
            }
        };
        assertDeepEqual(v2, {
            foo = "bar",
            nested = {
                foo = 1,
                bar = 2
            }
        });
        local success, result = pcall(assertDeepEqual, v2, {
            foo = "bar",
            nested = {
                foo = 1,
                bar = 3
            }
        });
        expect(success).to.equal(false);
        expect(result:find("first%[nested%]%[bar%] ~= second%[nested%]%[bar%]")).to.be.ok();
    end);
    it("should be commutative", function() -- Line: 79
        -- upvalues: assertDeepEqual (copy)
        local u3 = {
            foo = "bar",
            hello = "world"
        };
        local v4 = {
            foo = "bar",
            hello = "world"
        };
        assertDeepEqual(u3, v4);
        assertDeepEqual(v4, u3);
        local u5 = {
            foo = "bar"
        };
        expect(function() -- Line: 96
            -- upvalues: assertDeepEqual (ref), u3 (copy), u5 (copy)
            assertDeepEqual(u3, u5);
        end).to.throw();
        expect(function() -- Line: 99
            -- upvalues: assertDeepEqual (ref), u5 (copy), u3 (copy)
            assertDeepEqual(u5, u3);
        end).to.throw();
    end);
end;