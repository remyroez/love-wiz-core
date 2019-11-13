local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

describe('util', function ()
    local util = require 'util'
    local class = require 'middleclass'

    local DummyClass = class 'DummyClass'
    local instance = DummyClass()

    describe('isClass', function ()
        it('DummyClass is class', function ()
            expect(util.isClass(DummyClass)).to.be.truthy()
        end)

        it('empty table is not class', function ()
            expect(util.isClass({})).to_not.be.truthy()
        end)

        it('not-table is not class', function ()
            expect(util.isClass(123)).to_not.be.truthy()
            expect(util.isClass('foo')).to_not.be.truthy()
            expect(util.isClass(true)).to_not.be.truthy()
        end)
    end)

    describe('isClassInstance', function ()
        it('DummyClass instance is class instance', function ()
            expect(util.isClassInstance(instance)).to.be.truthy()
        end)

        it('empty table is not class instance', function ()
            expect(util.isClassInstance({})).to_not.be.truthy()
        end)

        it('not-table is not class instance', function ()
            expect(util.isClassInstance(123)).to_not.be.truthy()
            expect(util.isClassInstance('foo')).to_not.be.truthy()
            expect(util.isClassInstance(true)).to_not.be.truthy()
        end)
    end)

    describe('isInstance', function ()
        it('DummyClass instance is DummyClass instance', function ()
            expect(util.isInstance(DummyClass, instance)).to.be.truthy()
        end)

        it('DummyClass instance is not other Class instance', function ()
            local OtherClass = class 'OtherClass'
            expect(util.isInstance(OtherClass, instance)).to_not.be.truthy()
        end)

        it('empty-table is not DummyClass instance', function ()
            expect(util.isInstance(DummyClass, {})).to_not.be.truthy()
        end)

        it('not-table is not DummyClass instance', function ()
            expect(util.isInstance(DummyClass, 123)).to_not.be.truthy()
            expect(util.isInstance(DummyClass, 'foo')).to_not.be.truthy()
            expect(util.isInstance(DummyClass, true)).to_not.be.truthy()
        end)

        it('DummyClass instance is not empty-table instance', function ()
            expect(util.isInstance({}, instance)).to_not.be.truthy()
        end)

        it('DummyClass instance is not not-table instance', function ()
            expect(util.isInstance(123, instance)).to_not.be.truthy()
            expect(util.isInstance('foo', instance)).to_not.be.truthy()
            expect(util.isInstance(true, instance)).to_not.be.truthy()
        end)
    end)

    describe('freeze', function ()
        local t = { a = 123, b = 'foo', c = true }
        local ft = nil

        it('freeze table', function ()
            ft = util.freeze(t)
            expect(ft).to.be.a('table')
        end)

        it('can access members', function ()
            expect(ft.a).to.be.a('number')
            expect(ft.b).to.be.a('string')
            expect(ft.c).to.be.a('boolean')
            expect(ft.a).to.be(123)
            expect(ft.b).to.be('foo')
            expect(ft.c).to.be(true)
        end)

        it('immutable', function ()
            expect(function () ft.a = 456 end).to.fail()
            expect(function () ft.b = 'bar' end).to.fail()
            expect(function () ft.c = false end).to.fail()
        end)
    end)

    describe('randomizer', function ()
        it('default is love.math.random', function ()
            local randomizer = util.randomizer(nil)
            expect(randomizer).to.be(love.math.random)
        end)

        it('select randomizer', function ()
            local randomizer = util.randomizer(love.math.newRandomGenerator())
            expect(randomizer:typeOf('RandomGenerator')).to.be.truthy()
        end)
    end)

    describe('currentpath', function ()
        it('"test" -> "test."', function ()
            expect(util.currentpath('test')).to.be('test.')
        end)

        it('"test.init" -> "test."', function ()
            expect(util.currentpath('test.init')).to.be('test.')
        end)
    end)

    describe('equaltable', function ()
        local t1 = { a = 123, b = 'foo', c = true }
        local t2 = { a = 123, b = 'bar', c = true }
        local t3 = { a = 123, b = 'foo', c = true }
        local keys = { 'a', 'b', 'c' }

        it('equal same table', function ()
            expect(util.equaltable(t1, t1, keys)).to.be.truthy()
        end)

        it('not equal different table', function ()
            expect(util.equaltable(t1, t2, keys)).to_not.be.truthy()
        end)

        it('equal other same table', function ()
            expect(util.equaltable(t1, t3, keys)).to.be.truthy()
        end)

        it('not equal not-table', function ()
            expect(util.equaltable(t1, 123, keys)).to_not.be.truthy()
        end)
    end)

    describe('equalarray', function ()
        local a1 = { 123, 'foo', true }
        local a2 = { 123, 'bar', true }
        local a3 = { 123, 'foo', true }

        it('equal same array', function ()
            expect(util.equaltable(a1, a1)).to.be.truthy()
        end)

        it('not equal different array', function ()
            expect(util.equaltable(a1, a2)).to_not.be.truthy()
        end)

        it('equal other same array', function ()
            expect(util.equaltable(a1, a3)).to.be.truthy()
        end)

        it('not equal not-array', function ()
            expect(util.equaltable(a1, 123)).to_not.be.truthy()
        end)
    end)

    describe('contains', function ()
        local t = { a = 123, b = 'foo', c = true }
        local a = { 123, 'foo', true }

        it('found in table', function ()
            expect(util.contains(t, 123)).to.be.truthy()
        end)

        it('found in array', function ()
            expect(util.contains(a, 123)).to.be.truthy()
        end)
    end)
end)
