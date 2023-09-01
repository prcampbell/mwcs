import "mwcslib.ash"
print('Entering HP: ', 'purple');


cli_execute('familiar melodramedary; make box of familiar jacks; use box of familiar jacks; equip drinking helm');
//buff up


/*Mana-less stat buffs*/

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
ensure_effect($effect[You Learned Something Maybe!]); //'

if (have_effect($effect[That's Just Cloud-Talk, Man]) == 0) { //'
    visit_url('place.php?whichplace=campaway&action=campaway_sky');
}

if (!get_property('_lyleFavored').to_boolean()) {
    ensure_effect($effect[Favored by Lyle]);
}
ensure_effect($effect[Triple-Sized]);

ensure_effect($effect[Confidence of the Votive]);
ensure_effect($effect[Broad-Spectrum Vaccine]);
ensure_effect($effect[Feeling Excited]);

cli_execute('maximize mp; eat 1 magic sausage;');

//Myst Buffs
ensure_effect($effect[Song of Bravado]);
ensure_effect($effect[Big]);
ensure_song($effect[The Magical Mojomuscular Melody]);
ensure_song($effect[Stevedave's Shanty of Superiority]); //'

ensure_effect($effect[Drescher's Annoying Noise]);  //'
ensure_effect($effect[Pride of the Puffin]);
ensure_effect($effect[Inscrutable Gaze]);
ensure_effect($effect[Carol of the Thrills]);
ensure_effect($effect[Blood Bond]);
ensure_effect($effect[Empathy]);
ensure_effect($effect[Leash of Linguini]);
ensure_effect($effect[Antiphon of Aptitude]);
ensure_effect($effect[Ur-Kel's Aria of Annoyance]);
cli_execute('witchess');

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



// Get dressed to beat things up
equip($item[Daylight Shavings Helmet]);
equip($slot[back], $item[unwrapped knock-off retro superhero cape]);
equip($slot[shirt], $item[Jurassic Parka]);
cli_execute('parka ml');
equip($item[Fourth of May Cosplay Saber]);
equip($slot[off-hand], $item[unbreakable umbrella]);
equip($item[designer sweatpants]);
equip($slot[acc1],  $item[backup camera]);
cli_execute('backupcamera ml');
equip($slot[acc2], $item[hewn moon-rune spoon]);
equip($slot[acc3], $item[Retrospecs]);
equip($slot[familiar], $item[dromedary drinking helmet]);


//summon librams to burn mp

//string macro = 'use curse of weaksauce;use micrometeorite;use detect weakness;use time-spinner;use entangling noodles;';


//adv1($location[The Tunnel of L.O.V.E.], -1, macro);
cli_execute('autoattack MerryCS');
visit_url("place.php?whichplace=town_wrong&action=townwrong_tunnel");
//Fight Enforcer
run_choice(1);
run_combat();
//Grab epaulettes
run_choice(2);
//Fight Engineer
run_choice(1);
run_combat();
//Fam weight
run_choice(2);
//Fight Equivocator
run_choice(1);
run_combat();
//Chocolate
run_choice(3);

equip($slot[back], $item[LOV Epaulettes]);
cli_execute('autoattack 0');

abort('unfinished');
//map a goblin flapper in
//Oliver's Place combat (Envy)

//Oliver's Place x2 (portscan government agents)

//Shadow Rifts -> Lodestone -> Fountain

//Evoke Horror
//GodLobster x2 (prep for -combat)
//equip makeshift shirt
cli_execute('fold makeshift shirt; equip makeshift shirt; equip familiar scrapbook');
//buff famweight, equip makeshift shirt
// use entangling noodles; use saucy salve; use lecture on relativity; use saucegeyser; repeat;
//kramco chain

//equip +exp
//10% bonus, Bastille, free rests

//back-up to your last enemy; bowl sideways; pride; confetti; saucegeyser;
//Backup in NEP

//NEP + 3 Chest X-Ray bowl sideways pride

//Witchess King
//Witchess Witch
//Witchess Queen

//Machine Tunnels for Certainty and Joy

print('Exiting HP: ', 'purple');