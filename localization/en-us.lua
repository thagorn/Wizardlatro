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
            j_wlt_fireball = {
                name = "Fireball",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "this card is destroyed",
                    "after a hand is played"
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
            j_wlt_wand_fireball = {
                name = "Wand of Fireball",
                text = {
                    "This Wand casts Fireball",
                },
            },
            j_wlt_wizard_tower = {
                name = "Wizard Tower",
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "per mana spent",
                    "{C:inactive}(Currently {C:Chips}+#2#{C:inactive} Chips){}",
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
            wlt_cast="CAST",
            wlt_cast_ex="Cast!",
            wlt_drank_ex="Drank!",
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
