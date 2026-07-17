-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local createSpy = require(script.Parent.createSpy);
    describe("createSpy", function() -- Line: 4
        -- upvalues: createSpy (copy)
        it("should create spies", function() -- Line: 5
            -- upvalues: createSpy (ref)
            local v1 = createSpy(function() -- Line: 6
            end);
            expect(v1).to.be.ok();
        end);
        it("should throw if spies are indexed by an invalid key", function() -- Line: 11
            -- upvalues: createSpy (ref)
            local u2 = createSpy(function() -- Line: 12
            end);
            expect(function() -- Line: 14
                -- upvalues: u2 (copy)
                return u2.test;
            end).to.throw();
        end);
    end);
    describe("value", function() -- Line: 20
        -- upvalues: createSpy (copy)
        it("should increment callCount when called", function() -- Line: 21
            -- upvalues: createSpy (ref)
            local v3 = createSpy(function() -- Line: 22
            end);
            v3.value();
            expect(v3.callCount).to.equal(1);
        end);
        it("should store all values passed", function() -- Line: 28
            -- upvalues: createSpy (ref)
            local v4 = createSpy(function() -- Line: 29
            end);
            v4.value(1, true, "3");
            expect(v4.valuesLength).to.equal(3);
            expect(v4.values[1]).to.equal(1);
            expect(v4.values[2]).to.equal(true);
            expect(v4.values[3]).to.equal("3");
        end);
        it("should return the value of the inner function", function() -- Line: 38
            -- upvalues: createSpy (ref)
            local v5 = createSpy(function() -- Line: 39
                return true;
            end);
            expect(v5.value()).to.equal(true);
        end);
    end);
    describe("assertCalledWith", function() -- Line: 47
        -- upvalues: createSpy (copy)
        it("should throw if the number of values differs", function() -- Line: 48
            -- upvalues: createSpy (ref)
            local u6 = createSpy(function() -- Line: 49
            end);
            u6.value(1, 2);
            expect(function() -- Line: 52
                -- upvalues: u6 (copy)
                u6:assertCalledWith(1);
            end).to.throw();
        end);
        it("should throw if any value differs", function() -- Line: 57
            -- upvalues: createSpy (ref)
            local u7 = createSpy(function() -- Line: 58
            end);
            u7.value(1, 2);
            expect(function() -- Line: 61
                -- upvalues: u7 (copy)
                u7:assertCalledWith(1, 3);
            end).to.throw();
            expect(function() -- Line: 65
                -- upvalues: u7 (copy)
                u7:assertCalledWith(2, 3);
            end).to.throw();
        end);
    end);
    describe("captureValues", function() -- Line: 71
        -- upvalues: createSpy (copy)
        it("should throw if the number of values differs", function() -- Line: 72
            -- upvalues: createSpy (ref)
            local u8 = createSpy(function() -- Line: 73
            end);
            u8.value(1, 2);
            expect(function() -- Line: 76
                -- upvalues: u8 (copy)
                u8:captureValues("a");
            end).to.throw();
        end);
        it("should capture all values in a table", function() -- Line: 81
            -- upvalues: createSpy (ref)
            local v9 = createSpy(function() -- Line: 82
            end);
            v9.value(1, 2);
            local v10 = v9:captureValues("a", "b");
            expect(v10.a).to.equal(1);
            expect(v10.b).to.equal(2);
        end);
    end);
end;