local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local CharacterRequirement = require 'valueobjects.CharacterRequirement'

describe('CharacterRequirement', function ()
    it('instantiate', function ()
        expect(CharacterRequirement()).to.be.a('table')
    end)

    local data = {
        alignments = {
            'neutral',
            'evil'
        },
        classes = {
            'bishop',
            'samurai',
            'lord',
            'ninja',
        },
        races = {
            'elf',
            'dwarf',
            'gnome',
        }
    }
    local instance

    it('instantiate from number', function ()
        instance = CharacterRequirement(data)
        expect(instance).to.be.a('table')
    end)

    it('__eq', function ()
        expect(instance == CharacterRequirement {
            alignments = {
                'neutral',
                'evil'
            },
            classes = {
                'bishop',
                'samurai',
                'lord',
                'ninja',
            },
            races = {
                'elf',
                'dwarf',
                'gnome',
            }
        }).to.be.truthy()

        expect(instance == CharacterRequirement {
            alignments = {
                'neutral',
            },
            classes = {
                'bishop',
                'samurai',
                'lord',
                'ninja',
            },
            races = {
                'elf',
                'dwarf',
                'gnome',
            }
        }).to_not.be.truthy()

        expect(instance == CharacterRequirement {
            alignments = {
                'neutral',
                'evil'
            },
            classes = {
                'bishop',
                'lord',
                'ninja',
            },
            races = {
                'elf',
                'dwarf',
                'gnome',
            }
        }).to_not.be.truthy()

        expect(instance == CharacterRequirement {
            alignments = {
                'neutral',
                'evil'
            },
            classes = {
                'bishop',
                'samurai',
                'lord',
                'ninja',
            },
            races = {
                'elf',
                'gnome',
            }
        }).to_not.be.truthy()
    end)

    it('allow', function ()
        expect(instance:allow {
            alignment = 'neutral',
            class = 'bishop',
            race = 'elf',
        }).to.be.truthy()

        expect(instance:allow {
            alignment = 'neutral',
            class = 'samurai',
            race = 'elf',
        }).to.be.truthy()

        expect(instance:allow {
            alignment = 'neutral',
            class = 'bishop',
            race = 'gnome',
        }).to.be.truthy()

        expect(instance:allow {
            alignment = 'good',
            class = 'bishop',
            race = 'elf',
        }).to_not.be.truthy()

        expect(instance:allow {
            alignment = 'neutral',
            class = 'thief',
            race = 'elf',
        }).to_not.be.truthy()

        expect(instance:allow {
            alignment = 'neutral',
            class = 'bishop',
            race = 'hobbit',
        }).to_not.be.truthy()
    end)

    it('__call == allow', function ()
        expect(instance:allow {
            alignment = 'neutral',
            class = 'bishop',
            race = 'elf',
        } == instance {
            alignment = 'neutral',
            class = 'bishop',
            race = 'elf',
        }).to.be.truthy()
    end)
end)
