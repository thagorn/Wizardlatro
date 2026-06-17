return {
    descriptions = {
        Back = {
            b_wlt_mana = {
                name = "Mana Deck",
                text = {
                    "Starts with 5 mana droplets",
                },
            },
            b_wlt_test = {
                name = "Test Deck",
                text = {
                    "Starts with ??? whatever I'm testing",
                },
            },
        },
        Joker = {
            j_wlt_alchemy = {
                name = "Alchemy",
                text = {
                    "Earn {C:money}$#1#{} for each",
                    "unspent {V:1}Mana{} at",
                    "the end of the round"
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
            j_wlt_empty = {
                name = "No Spell",
                text = {},
            },
            j_wlt_fireball = {
                name = "Fireball",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "{C:red,s:0.85}this card is destroyed{}",
                    "{C:red,s:0.85}after a hand is played{}"
                },
            },
            j_wlt_fountain_of_mana = {
                name = "Fountain of Mana",
                text = {
                    "Gain {V:1}+#1#{} Mana",
                    "at start of round",
                    "{C:green,s:0.85}Additional summonings will{}",
                    "{C:green,s:0.85}grow your current fountain{}",
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
            j_wlt_mana_droplet = {
                name = "Mana Droplet",
                text = {
                    "Gain {V:1}+#1#{} Mana",
                    "when you play a hand"
                },
            },
            j_wlt_mana_potion = {
                name = "Mana Potion",
                text = {
                    "Gain {V:1}+#1#{} Mana",
                    "at start of round",
                    "{V:1}-#2#{} Mana per",
                    "round played",
                },
            },
            j_wlt_mana_spring = {
                name = "Mana Spring",
                text = {
                    "Gain {V:1}+#1#{} Mana per",
                    "hand at start of round",
                },
            },
            j_wlt_scroll_iceforge = {
                name = "Scroll of Ice Forge",
                text = {
                    "This Scroll allows you",
                    "to {C:attention}cast Ice Forge{}",
                    "once for {V:1}#1#{} mana",
                },
            },
            j_wlt_wand_fireball = {
                name = "Wand of Fireball",
                text = {
                    "This Wand allows you to",
                    "{C:attention}cast Fireball{} once per",
                    "round for {V:1}#1#{} mana",
                },
            },
            j_wlt_wizard_staff = {
                name = "Wizard Staff",
                text = {
                    "This Joker stores the last",
                    "spell you've cast and allows",
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
            o_wlt_cast_keyword={
                name="Cast",
                text={
                    "Spend {V:1}#1#{} mana",
                    "to create a joker"
                },
            },

        },
    },
    misc = {
        dictionary = {
            k_wlt_spell="Spell",
            k_wlt_summon="Summon",
            wlt_cast="CAST",
            wlt_cast_ex="Cast!",
            wlt_drank_ex="Drank!",
        },
        labels = {
            k_wlt_spell="Spell",
            k_wlt_summon="Summon",
        },
        v_dictionary = {
            wlt_hand_minus="-#1# Hand",
            wlt_mana_minus="-#1# Mana",
            wlt_mana_cost="#1# Mana",
            wlt_mana_text="#1#/#2# Mana",
            wlt_soul_warning="Warning! This hand will cost some of your Soul",
        },
        v_text = {
        },
    }
}
