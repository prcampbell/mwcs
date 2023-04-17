print('Entering Preparation: ', 'purple');

/*
string macro = "if monsterid 2009; attack; repeat; endif; if monsterid 2010; skill saucegeyser; repeat; endif; if monsterid 2011; attack; endif; abort;";
adv1($location[tunnel of L.O.V.E], -1, macro);
*/

//Declarations

item votedSticker = to_item("&quot;I Voted!&quot; sticker");
item kgbBriefcase = $item[kremlin's greatest briefcase]; //'
item kramco = $item[Kramco Sausage-o-Matic&trade;];


//Set up

// Don't buy stuff from NPC stores.
set_property('_saved_autoSatisfyWithNPCs', get_property('autoSatisfyWithNPCs'));
set_property('autoSatisfyWithNPCs', 'false');

// Do buy stuff from coinmasters (hermit).
set_property('_saved_autoSatisfyWithCoinmasters', get_property('autoSatisfyWithCoinmasters'));
set_property('autoSatisfyWithCoinmasters', 'true');

//saber to auto-drop
set_property('choiceAdventure1387', 3);

cli_execute('mood apathetic');

//set the backup camera reverser
cli_execute('backupcamera reverser on');

// Upgrade Saber to Familiar weight
visit_url('main.php?action=may4');
run_choice(4);

// Vote.
visit_url('place.php?whichplace=town_right&action=townright_vote');
visit_url('choice.php?option=1&whichchoice=1331&g=2&local%5B%5D=2&local%5B%5D=3');
cli_execute('retrocape heck thrill');

//Summon Borrowed Time
create(1, $item[borrowed time]);

use(1, $item[borrowed time]);

//Get some adventures
if (my_level() == 1 && my_spleen_use() == 0) {
    while (get_property('_universeCalculated').to_int() < get_property('skillLevel144').to_int()) 
    {
        cli_execute('numberology 69');
    }
}

if (get_property('_clanFortuneConsultUses').to_int() < 3) 
{
    cli_execute('/whitelist bonus adv');
    while (get_property('_clanFortuneConsultUses').to_int() < 3) 
    {
        cli_execute('fortune cheesefax');
        cli_execute('wait 5');
    }
}
print('Done Fortunes', 'green');

cli_execute('swim item');

if (get_property("_daycareGymScavenges") == "0") 
{
    visit_url('place.php?whichplace=town_wrong&action=townwrong_boxingdaycare');
    run_choice(3);
    run_choice(2);
}
//Daydream

use(1, $item[bird-a-day calendar]);
visit_url('place.php?whichplace=chateau&action=chateau_desk1');
print('Done Piggy Bank', 'green');

cli_execute('fallguy send the sleazy back alley');

if (!have_skill($skill[Psychogeologist]))
{
    cli_execute('set choiceAdventure1494 = 1');
    use(1,$item[S.I.T. Course Completion Certificate]);
    cli_execute('set choiceAdventure1494 = 0');
}

cli_execute('mcd 11');

visit_url('tutorial.php?action=toot');
use(1, $item[letter from King Ralph XI]);
use(1, $item[pork elf goodies sack]);
print('Done Tutorial.', 'green');

//Start the guild quest
visit_url("guild.php?place=challenge");

// Initialize council.
visit_url('council.php');

// Put on some regen gear
equip($item[Daylight Shavings Helmet]);
equip($slot[back], $item[protonic accelerator pack]);
equip($slot[shirt], $item[Jurassic Parka]);
equip($item[Fourth of May Cosplay Saber]);
equip($slot[off-hand], kramco);
equip($item[Cargo Cultist Shorts]);
equip($slot[acc1], kgbBriefcase); 
equip($slot[acc2], $item[Powerful Glove]);
equip($slot[acc3], $item[Retrospecs]);

cli_execute('familiar exotic parrot; equip familiar tiny stillsuit; familiar obtuse angel; equip familiar miniature crystal ball;');

// Buy toy accordion
buy(1, $item[toy accordion]);

cli_execute('terminal educate digitize.edu');
cli_execute('terminal educate turbo');
cli_execute('terminal enquiry familiar');

//fight sausage goblin (weaksauce, noodles, romantic arrow, digitize, micrometeorite, attack, repeat) in haunted pantry (1)
//equip familiar scrapbook
string macro = "skill curse of weaksauce; skill entangling noodles; skill 7108; skill digitize; skill micrometeorite; attack; repeat;";
adv1($location[the haunted pantry], -1, macro);

equip($slot[off-hand], $item[familiar scrapbook]);






//bust icewoman (noodles, shoot x3, trap)
//map an amateur ninja and freekill (sets digitize and romantic arrow)
//check for vote monster (weaksauce, noodles, micrometeorite, attack, repeat) in the Dire Warren
//coil wire
//check for vote monster (weaksauce, noodles, micrometeorite, attack, repeat) in the Dire Warren
//Summon Spaghetti Elemental
//digitized goblin (weaksauce, noodles, micrometeorite, attack, repeat) in haunted pantry (2)
//open the bakery
//bust bakery (noodles, shoot x3, trap)
//kramco golbin (weaksauce, noodles, micrometeorite, attack, repeat) in haunted pantry (3)





print('Exiting Preparation: ', 'purple');