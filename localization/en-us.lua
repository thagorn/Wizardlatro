return {
    descriptions = {
        Back = {
            b_wlt_archmage = {
                name = "Archmage's Deck",
                text = {
                    "Start the run with",
                    "{C:attention}2{} copies of {C:tarot,T:c_wlt_foresight}#1#{}",
                    "The deck starts with {C:wlt_octarine}Octarine{}",
                    "suit but no {C:attention}Aces{}, {C:attention}2{}s or {C:attention}3{}s",
                    "{C:red}X#2#{} base Blind size",
                },
            },
            b_wlt_mana = {
                name = "Mana Deck",
                text = {
                    "Start the run with",
                    "5 copies of {C:common}#1#{}",
                },
            },
            b_wlt_test = {
                name = "Test Deck",
                text = {
                    "Starts with ??? whatever I'm testing",
                },
            },
        },
        Edition = {
            e_wlt_aethereal = {
                name = "Aethereal",
                text = {
                    "Grants {C:wlt_mana}mana{} instead of costing it"
                }
            },
            e_wlt_burned = {
                name = "Burned",
                text = {
                    "Does not score",
                    "Destroyed when burned again"
                }
            },
        },
        Enhanced = {
            m_wlt_crystal = {
                name = "Crystal Card",
                text = {
                    "{C:wlt_mana}+#1# Mana{} when discarded",
                    "no rank or suit",
                },
            },
        },
        Joker = {
            j_wlt_alchemy = {
                name = "Alchemy",
                text = {
                    "Earn {C:money}$#1#{} for each",
                    "unspent {C:wlt_mana}Mana{} at",
                    "the end of the round"
                },
            },
            j_wlt_amnesia_potion = {
                name = "Potion of Amnesia",
                text = {
                    "Reset costs of {C:green}Rerolls{}",
                    "in the current shop",
                    "when used",
                    "{C:inactive}({C:attention}#1#{C:inactive} remaining uses){}",
                },
            },
            j_wlt_archmage = {
                name = "Archmage",
                text = {
                    "{X:wlt_spell,C:red}Spell{} Jokers",
                    "each give {X:mult,C:white} X#1# {} Mult",
                },
            },
            j_wlt_astromancer = {
                name = "Astromancer",
                text = {
                    "Upgrade level of played",
                    "{C:attention}poker hand{} if matching",
                    "{C:planet}Planet{} card is in",
                    "your {C:attention}consumeable{} area",
                },
            },
            j_wlt_bonfire = {
                name = "Bonfire",
                text = {
                    "{C:attention}Every{} card",
                    "held in hand",
                    "gives {X:mult,C:white} X#1# {} Mult",
                    "and is then {C:dark_edition}burned{}",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_conflagration = {
                name = "Conflagration",
                text = {
                    "Played cards",
                    "each give {X:mult,C:white} X#1# {} Mult",
                    "and then are {C:dark_edition}burned{}",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_chain_lightning = {
                name = "Chain Lightning",
                text = {
                    "Retrigger a random",
                    "played card",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_hedge_wizard = {
                name = "Hedge Wizard",
                text = {
                    "{C:red}+#1#{} Mult per {X:wlt_spell,C:red}spell{}",
                    "cast this run",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive})"
                },
            },
            j_wlt_coven_of_the_meek = {
                name = "Coven of the Meek",
                text = {
                    "This Joker casts",
                    "{C:attention}Power of Many{} when",
                    "each played {C:attention}3{} is scored"
                },
            },
            j_wlt_crossbow = {
                name = "Crossbow",
                text = {
                    "This Wand allows you to",
                    "{C:attention}cast Ray of Wood{}",
                    "once per hand for {C:wlt_mana}#1#{} mana",
                },
            },
            j_wlt_crystal_gorger = {
                name = "Crystal Gorger",
                text = {
                    "If every card in your played",
                    "hand is a {C:attention}Crystal{} card",
                    "then destroy each one and",
                    "increase your {C:wlt_mana}Mana Pool{} by",
                    "#1# for each card destroyed",
                },
            },
            j_wlt_crystal_growth = {
                name = "Crystal Growth",
                text = {
                    "{C:attention}+#1#{} hand size",
                    "The first #2# cards",
                    "drawn each round that",
                    "are not {C:attention}Crystal{} cards",
                    "transform into {C:attention}Crystal{} cards",
                },
            },
            j_wlt_crystal_wizard = {
                name = "Crystal Wizard",
                text = {
                    "Gain {C:wlt_mana}+#1#{} Mana",
                    "at start of round for each",
                    "{C:attention}Crystal Card{} in",
                    "your {C:attention}full deck{}",
                    "{C:inactive}(Currently {C:wlt_mana}+#2#{C:inactive} Mana)",
                },
            },
            j_wlt_djinn = {
                name = "Djinn",
                text = {
                    "Grants {C:attention}#1#{} increasingly rare wishes",
                    "{C:inactive}(Must have room){}",
                    "{C:inactive}Wish is currently {}{V:1}#2#{}",
                    "wish changes every round",
                    "{C:inactive}({C:attention}#3#{C:inactive} remaining wishes){}",


                },
            },
            j_wlt_drain = {
                name = "Drain",
                text = {
                    "Increases rank of",
                    "all scored cards by {C:attention}#1#{}",
                    "and decreases rank",
                    "of all cards held",
                    "in hand by {C:attention}#1#{}",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_empty = {
                name = "No Spell",
                text = {},
            },
            j_wlt_faerie_circle = {
                name = "Faerie Circle",
                text = {
                    "Create a {C:spectral}Spectral{} card",
                    "when {C:attention}Blind{} is selected",
                    "{C:green}#1# of #2#{} cards get",
                    "drawn face down"
                },
            },
            j_wlt_fireball = {
                name = "Fireball",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_fountain_of_mana = {
                name = "Fountain of Mana",
                text = {
                    "Gain {C:wlt_mana}+#1#{} Mana",
                    "at start of round",
                    "{C:green,s:0.85}Additional summonings will{}",
                    "{C:green,s:0.85}grow your current fountain{}",
                },
            },
            j_wlt_golemancer = {
                name = "Golemancer",
                text = {
                    "Each {C:attention}Stone Card{}",
                    "held in hand gives",
                    "{C:mult}+#1#{} Mult for each",
                    "{C:attention}Stone Card{} in",
                    "your {C:attention}full deck{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                },
            },
            j_wlt_graduation = {
                name = "Graduation",
                text = {
                    "If {C:attention}first discard{} of round",
                    "has exactly {C:attention}2{} cards,",
                    "convert the rank of the {C:attention}left{} card",
                    "into the rank of the {C:attention}right{} card",
                },
            },
            j_wlt_haste_potion = {
                name = "Haste Potion",
                text = {
                    "Retrigger all",
                    "cards played",
                    "{C:blue}-#1#{} hands each round",
                    "Increases by {C:attention}#2#{}",
                    "each round",
                },
            },
            j_wlt_health_potion = {
                name = "Health Potion",
                text = {
                    "Sell this card to",
                    "gain {C:wlt_soul}#1# Soul{}",
                },
            },
            j_wlt_iceforge = {
                name = "Ice Forge",
                text = {
                    "Consumes all of your remaining",
                    "mana after playing a hand",
                    "to summon a {C:attention}Fountain of Mana{}",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_invisibility = {
                name = "Invisibility",
                text = {
                    "Cards played this hand",
                    "do not cost mana",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_lightning_bolt = {
                name = "Lightning Bolt",
                text = {
                    "Retrigger all",
                    "played cards",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_lightning_storm = {
                name = "Lightning Storm",
                text = {
                    "Retrigger all",
                    "played cards twice",
                    "then {C:dark_edition}burn{} them",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_mana_droplet = {
                name = "Mana Droplet",
                text = {
                    "Gain {C:wlt_mana}+#1#{} Mana",
                    "when you play a hand"
                },
            },
            j_wlt_mana_potion = {
                name = "Mana Potion",
                text = {
                    "Gain {C:wlt_mana}+#1#{} Mana",
                    "when used",
                    "{C:inactive}({C:attention}#2#{C:inactive} remaining uses){}",
                },
            },
            j_wlt_mana_spring = {
                name = "Mana Spring",
                text = {
                    "Gain {C:wlt_mana}+#1#{} Mana per",
                    "hand at start of round",
                },
            },
            j_wlt_miracle = {
                name = "Miracle",
                text = {
                    "Sell this card to",
                    "open a free {C:attention}Aethereal Pack{}",
                    "and add the result to hand",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_polymorph = {
                name = "Polymorph",
                text = {
                    "When you play a hand",
                    "destroy all scoring cards",
                    "and add that many",
                    "random {C:attention}enhanced{} cards",
                    "to your hand",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_ponder = {
                name = "Ponder",
                text = {
                    "Always draw {C:attention}#1#{} cards",
                    "after playing a hand",
                },
            },
            j_wlt_pot_of_gold = {
                name = "Pot of Gold",
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "Payout increases by {C:money}$#2#{}",
                    "when hand contains a {C:attention}#3#{}",
                },
            },
            j_wlt_power_of_many = {
                name = "Power of Many",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_power_of_three = {
                name = "Power of Three",
                text = {
                    "Gain {C:wlt_mana}+#1#{} Mana",
                    "at start of round",
                    "Increases by {C:wlt_mana}#2#{} Mana",
                    "if played hand contains a ",
                    "{C:attention}Three of a Kind #3#s{}",
                    "rank changes every round"
                },
            },
            j_wlt_power_word_death = {
                name = "Power Word: Death",
                text = {
                    "At the end of the round",
                    "if your final hand",
                    "contained only 1 card",
                    "create a {C:tarot}Death{} card",
                    "{C:inactive}(Must have room){}"
                },
            },
            j_wlt_ray_of_wood = {
                name = "Ray of Wood",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_recycling = {
                name = "Recycling",
                text = {
                    "Whenever an {C:attention}enhanced{}",
                    "playing card is destroyed",
                    "create a matching {C:tarot}Tarot{} card",
                    "{C:inactive}(Must have room){}"
                },
            },
            j_wlt_revolution = {
                name = "Revolution",
                text = {
                    "{C:attention}Face{} cards are no longer",
                    "considered {C:attention}face{} cards",
                    "and {C:attention}non-face{} cards",
                    "are now considerd {C:attention}face{} cards{}"
                },
            },
            j_wlt_ritual_1 = {
                name = "Summoning Ritual Step 1",
                text = {
                    "Begin the ritual...",
                },
            },
            j_wlt_ritual_2 = {
                name = "Summoning Ritual Step 2",
                text = {
                    "Progress the ritual...",
                },
            },
            j_wlt_ritual_3 = {
                name = "Summoning Ritual Step 3",
                text = {
                    "Summons a Djinn",
                },
            },
            j_wlt_satchel = {
                name = "Satchel",
                text = {
                    "{C:attention}+#1#{} consumable slots",
                },
            },
            j_wlt_scroll_iceforge = {
                name = "Scroll of Ice Forge",
                text = {
                    "This Scroll allows you",
                    "to {C:attention}cast Ice Forge{}",
                    "once for {C:wlt_mana}#1#{} mana",
                },
            },
            j_wlt_scroll_miracle = {
                name = "Scroll of Miracle",
                text = {
                    "This Scroll allows you",
                    "to {C:attention}cast Miracle{}",
                    "once for {C:wlt_mana}#1#{} mana",
                },
            },
            j_wlt_scroll_polymorph = {
                name = "Scroll of Polymorph",
                text = {
                    "This Scroll allows you",
                    "to {C:attention}cast Polymorph{}",
                    "once for {C:wlt_mana}#1#{} mana",
                },
            },
            j_wlt_scroll_ritual_1 = {
                name = "Scroll of Summoning Ritual Step 1",
                text = {
                    "Win {C:attention}#1#{} rounds where",
                    "no discards are used",
                    "to {C:attention}cast Summoning Ritual Step 1{}",
                    "once for {C:wlt_mana}#2#{} mana",
                    "{C:inactive}(Currently {C:attention}#3#{C:inactive} of {C:attention}#1#{C:inactive}){}",
                },
            },
            j_wlt_scroll_ritual_2 = {
                name = "Scroll of Summoning Ritual Step 2",
                text = {
                    "Play a hand containing the",
                    "{C:attention}#1#{} of {V:1}#2#{} and",
                    "the {C:attention}#3#{} of {V:2}#4#{}",
                    "{C:attention}#7#{} times to {C:attention}cast Summoning Ritual Step 2{}",
                    "once for {C:wlt_mana}#5#{} mana",
                    "{s:0.8}Cards change every round",
                    "{C:inactive}(Currently {C:attention}#6#{C:inactive} of {C:attention}#7#{C:inactive}){}",
                },
            },
            j_wlt_scroll_ritual_3 = {
                name = "Scroll of Summoning Ritual Step 3",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy {C:attention}ALL{} Jokers to the right.",
                    "Destroy a {C:common}Common{}, an {C:uncommon}Uncommon{}, and a {C:rare}Rare{}",
                    "to {C:attention}cast Summoning Ritual Step 2{}",
                    "once for {C:wlt_mana}#1#{} mana",
                    "{C:inactive}(Still need: #2#){}",
                },
            },
            j_wlt_sparking_wand = {
                name = "Sparking Wand",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "{C:green}#1# in #2#{} chance to",
                    "cast a random {X:wlt_spell,C:red}Spell{}",
                },
            },
            j_wlt_spellbook = {
                name = "Spellbook",
                text = {
                    "All {C:attention}Scroll Jokers{} in the",
                    "shop and booster packs",
                    "are {C:attention}free{} and {C:dark_edition}Negative{}",
                },
            },
            j_wlt_spirit_of_air = {
                name = "Spirit of Air",
                text = {
                    "Played cards with {C:diamonds}Diamond{} suit",
                    "attempt to spend {C:wlt_mana}#1#{} mana",
                    "when scored to add a retrigger",
                    "to the next played card",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive} retriggers){}"
                },
            },
            j_wlt_spirit_of_earth = {
                name = "Spirit of Earth",
                text = {
                    "Played cards with {C:spades}Spade{} suit",
                    "attempt to spend {C:wlt_mana}#1#{} mana",
                    "to permanently gain {C:chips}+#2#{} Chips",
                },
            },
            j_wlt_spirit_of_fire = {
                name = "Spirit of Fire",
                text = {
                    "Played cards with {C:hearts}Heart{} suit",
                    "attempt to spend {C:wlt_mana}#1#{} mana",
                    "to give {X:mult,C:white}X#2#{} Mult when scored",
                },
            },
            j_wlt_spirit_of_magic = {
                name = "Spirit of Magic",
                text = {
                    "Played cards with {C:wlt_octarine}Octarine{} suit",
                    "attempt to spend {C:wlt_mana}#1#{} mana",
                    "to give {C:wlt_mana}+#2#{} mana when scored",
                },
            },
            j_wlt_spirit_of_water = {
                name = "Spirit of Water",
                text = {
                    "Played cards with {C:clubs}Club{} suit",
                    "attempt to spend {C:wlt_mana}#1#{} mana",
                    "to conjure a consumeable",
                    "{C:inactive}(Must have room){}",
                },
            },
            j_wlt_succession_crisis = {
                name = "Succession Crisis",
                text = {
                    "Played {C:attention}Face{} cards give {X:mult,C:white}X#1#{} Mult",
                    "Played {C:attention}Face{} cards of the",
                    "same rank debuff each other",
                },
            },
            j_wlt_time_stretch = {
                name = "Time Stretch",
                text = {
                    "Gain {C:blue}+#1#{} Hand",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_tower_shield = {
                name = "Tower Shield",
                text = {
                    "When multiple {C:attention}Stone{} cards",
                    "are played merge all the",
                    "chips into the first one",
                    "and destroy the rest"
                },
            },
            j_wlt_wand_bonfire = {
                name = "Wand of Bonfire",
                text = {
                    "This Wand allows you to",
                    "{C:attention}cast Bonfire{} once per",
                    "round for {C:wlt_mana}#1#{} mana",
                },
            },
            j_wlt_wand_conflagration = {
                name = "Wand of Conflagration",
                text = {
                    "This Wand allows you to",
                    "{C:attention}cast Conflagration{} once per",
                    "round for {C:wlt_mana}#1#{} mana",
                },
            },
            j_wlt_wand_chain_lightning = {
                name = "Wand of Chain Lightning",
                text = {
                    "This Wand allows you to",
                    "{C:attention}cast Chain Lightning{} for {C:wlt_mana}#1#{} mana",
                    "{s:0.85}Additional casts in a round{}",
                    "{s:0.85}double the {C:wlt_mana}mana{} cost{}",
                },
            },
            j_wlt_wand_draining = {
                name = "Wand of Draining",
                text = {
                    "This Wand allows you to",
                    "{C:attention}cast Drain{} once per",
                    "round for {C:wlt_mana}#1#{} mana",
                },
            },
            j_wlt_wand_fireball = {
                name = "Wand of Fireball",
                text = {
                    "This Wand allows you to",
                    "{C:attention}cast Fireball{} once per",
                    "round for {C:wlt_mana}#1#{} mana",
                },
            },
            j_wlt_wand_invisibility = {
                name = "Wand of Invisibility",
                text = {
                    "This Wand allows you to",
                    "{C:attention}cast Invisibility{} once per",
                    "round for {C:wlt_mana}#1#{} mana",
                },
            },
            j_wlt_wand_lightning_bolt = {
                name = "Wand of Lightning Bolt",
                text = {
                    "This Wand allows you to",
                    "{C:attention}cast Lightning Bolt{} once per",
                    "round for {C:wlt_mana}#1#{} mana",
                },
            },
            j_wlt_wand_lightning_storm = {
                name = "Wand of Lightning Storm",
                text = {
                    "This Wand allows you to",
                    "{C:attention}cast Lightning Storm{} once per",
                    "round for {C:wlt_mana}#1#{} mana",
                },
            },
            j_wlt_wand_time_stretch = {
                name = "Wand of Time Stretch",
                text = {
                    "This Wand allows you to",
                    "{C:attention}cast Time Stretch{} for {C:wlt_mana}#1#{} mana",
                    "{s:0.85}Additional casts in a round{}",
                    "{s:0.85}double the {C:wlt_mana}mana{} cost{}",
                },
            },
            j_wlt_wizard_staff = {
                name = "Wizard Staff",
                text = {
                    "This Joker stores the last",
                    "{X:wlt_spell,C:red}Spell{} you've cast and allows",
                    "you to cast it once",
                    "{C:inactive}(Currently {C:attention}#1#{C:inactive}){}",
                },
            },
            j_wlt_wizard_tower = {
                name = "Wizard Tower",
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "per mana spent",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips){}",
                },
            },
        },
        Other =  {
            o_wlt_cast_keyword = {
                name = "Cast",
                text = {
                    "Spend {C:wlt_mana}#1#{} mana",
                    "to create a joker"
                },
            },
            o_wlt_mana_pool_keyword = {
                name = "Mana Pool",
                text = {
                    "The amount of mana you",
                    "start every round with"
                },
            },
            o_wlt_octarine = {
                name = "Octarine",
                text = {
                    "{C:wlt_octarine}Octarine{} cards cost",
                    "+1 {C:wlt_mana}mana{} to play",
                    "and grant {C:mult}mult{} instead",
                    "of {C:chips}chips{} equal to their rank"
                }
            },
            p_wlt_aethereal_normal_1 = {
                name = "Aethereal Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:edition}Aethereal {C:attention}Playing{} cards to",
                    "add to your deck",
                },
            },
            wlt_card_mana = {
                text={
                    "{C:wlt_mana}#1#{} Mana",
                },
            },
            wlt_card_mult = {
                text={
                    "{C:mult}+#1#{} Mult",
                },
            },
        },
        Planet = {
            c_wlt_atlas = {
                name = "Atlas",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_wlt_pan = {
                name = "Pan",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_wlt_pandora = {
                name = "Pandora",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_wlt_prometheus = {
                name = "Prometheus",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
        },
        Tarot = {
            c_wlt_foresight = {
                name = "Foresight",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a ",
                    "{C:attention}#2#{}"
                },
            },
            c_wlt_magic = {
                name = "Magic",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}",
                },
            },
        },
    },
    misc = {
        dictionary = {
            k_wlt_aethereal_pack="Aethereal Pack",
            k_wlt_spell="Spell",
            k_wlt_summon="Summon",
			k_wlt_moon="Moon",
            wlt_cast="CAST",
            wlt_cast_ex="Cast!",
            wlt_drink="DRINK",
            wlt_draws_nearer="It Draws Nearer",
            wlt_chant_ex="Chant!",
            wlt_drained_ex="Drained!",
            wlt_drank_ex="Drank!",
            wlt_huh_q="huh?",
            wlt_mulch_ex="Mulch!",
            wlt_munch_ex="Munch!",
            wlt_no_mana_ex="No Mana!",
            wlt_poof_ex="Poof!",
            wlt_summon_ex="Summon!",
            wlt_wish="WISH",
            wlt_zzzt="Zzzt",
        },
        labels = {
            k_wlt_spell="Spell",
            k_wlt_summon="Summon",
            wlt_aethereal="Aethereal",
            wlt_burned="Burned",
        },
        poker_hands = {
            ['wlt_Pride'] = 'Pride',
            ['wlt_Rainbow'] = 'Rainbow',
            ['wlt_Rainbow Five'] = 'Rainbow Five',
            ['wlt_Rainbow House'] = 'Rainbow House',
            ['wlt_Rainbow Straight'] = 'Rainbow Straight',
        },
        poker_hand_descriptions = {
            ['wlt_Pride'] = {
                '5 cards in a row (consecutive ranks) with',
                'each card having a different suit',
            },
            ['wlt_Rainbow'] = {
                '5 cards with different suits',
            },
            ['wlt_Rainbow Five'] = {
                'A Five of a Kind with each',
                'card having a different suit',
            },
            ['wlt_Rainbow House'] = {
                'A Three of a Kind and a Pair with',
                'each card having a different suit',
            },
            ['wlt_Rainbow Straight'] = {
                '5 cards in a row (consecutive ranks) with',
                'each card having a different suit',
            },
        },
        suits_singular = {
            wlt_Octarine="Octarine",
        },
        suits_plural = {
            wlt_Octarine="Octarine",
        },
        v_dictionary = {
            wlt_hand_minus="-#1# Hand",
            wlt_mana_minus="-#1# Mana",
            wlt_mana_plus="+#1# Mana",
            wlt_mana_cost="#1# Mana",
            wlt_mana_text="#1#/#2# Mana",
            wlt_soul_warning="Warning! This hand will cost some of your Soul",
        },
        v_text = {
        },
    }
}
