import "mwcslib.ash"
print('Entering HP: ', 'purple');


cli_execute('familiar melodramedary; make box of familiar jacks; use box of familiar jacks; equip drinking helm');
//buff up
cli_execute('equip powerful glove; cast triple size;');


// Boxing Daycare
ensure_effect($effect[Uncucumbered]);

// Cast inscrutable gaze
ensure_effect($effect[Inscrutable Gaze]);

// Shower lukewarm
ensure_effect($effect[Thaumodynamic]);

// Beach Comb
ensure_effect($effect[You Learned Something Maybe!]);

//Telescope
if (get_campground() contains $item[discount telescope warehouse gift certificate] && get_property("telescopeUpgrades").to_int() > 0 && 
get_property("telescopeLookedHigh") == "false") cli_execute("telescope high");

//Cross the streams
cli_execute("crossstreams");

ensure_effect($effect[We're All Made of Starfish]); //'

if (have_effect($effect[That's Just Cloud-Talk, Man]) == 0) { //'
    visit_url('place.php?whichplace=campaway&action=campaway_sky');
}

/*
Myst Buffs
    mono-rail

    votive of confidence
    spacegate vaccine 2
    feel excitement
    cast magical mojo muscular
    cast blessing of she who was
    cast manicotti meditation
    cast sauce contemplation
    cast Get Big
    cast Stevedave's Shanty of Superiority
    cast song of bravado
    eat magic sausage

Exp Buffs
    Drescher's Annoying Noise
    Pride of the Puffin
    Inscrutable Gaze
    Aria
    Beachhead Learned Something Maybe
    Witchess
    Shower Lukewarm
    Carol of the Thrills
    Antiphon
    Leash
    Empathy
    BloodBond
    Beachhead Familiar

*/

item love_potion = $item[Love Potion #XYZ];
    effect love_effect = $effect[Tainted Love Potion];
    if (have_effect(love_effect) == 0) {
        if (available_amount(love_potion) == 0) {
            use_skill(1, $skill[Love Mixology]);
        }
        visit_url('desc_effect.php?whicheffect=' + love_effect.descid);
        if (love_effect.numeric_modifier('mysticality') > 10
                && love_effect.numeric_modifier('muscle') > -30
                && love_effect.numeric_modifier('moxie') > -30
                && love_effect.numeric_modifier('maximum hp percent') > -0.001) {
            use(1, love_potion);
        }
    }

//LOV tunnel (mainstat +exp, open heart surgery, chocolate) 

//map a goblin flapper in
//Oliver's Place combat (Envy)

//Oliver's Place x2
//GodLobster x2 (prep for -combat)
//Shadow Rifts -> Lodestone -> Fountain

//Evoke Horror

//equip makeshift shirt
cli_execute('fold makeshift shirt; equip makeshift shirt;');

//buff famweight, equip makeshift shirt
//kramco chain

//equip +exp
//10% bonus, Bastille, free rests

//Backup in NEP

//NEP + 3 Chest X-Ray bowl sideways pride

//Witchess King
//Witchess Witch
//Witchess Queen

//Machine Tunnels for Certainty and Joy

print('Exiting HP: ', 'purple');