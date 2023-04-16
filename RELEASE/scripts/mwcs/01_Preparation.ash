print('Entering Preparation: ', 'purple');

//Declarations

item votedSticker = to_item("&quot;I Voted!&quot; sticker");

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

use(1, $item[bird-a-day calendar]);
visit_url('place.php?whichplace=chateau&action=chateau_desk2');
print('Done Juice Bar', 'green');

cli_execute('fallguy send the sleazy back alley');

if (!have_skill($skill[Psychogeologist]))
{
    use(1,$item[S.I.T. Course Completion Certificate]);
    run_choice(1);
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
equip($item[Cargo Cultist Shorts]);
equip($slot[acc1], $item[kremlin's greatest briefcase]); //'
equip($slot[acc2], $item[Powerful Glove]);
equip($slot[acc3], $item[Retrospecs]);

cli_execute('familiar exotic parrot; equip familiar tiny stillsuit; familiar obtuse angel; equip familiar miniature crystal ball;');

// Buy toy accordion
buy(1, $item[toy accordion]);

cli_execute('terminal educate digitize.edu');



//Guzzlr

//terminal educate digitize
//terminal educate turbo
//terminal enquiry familiar

//fight sausage goblin (noodles, romantic arrow, digitize, wham)
//bust icewoman

//map an amateur ninja and freekill (sets digitize and romantic arrow)

//coil wire

    //Digitize and Arrow a Witchess Bishop

/*
    visit_url("campground.php?action=witchess");
    run_choice(1);
    visit_url("choice.php?option=1&pwd="+my_hash()+"&whichchoice=1182&piece=1942", false);
    run_combat();
    visit_url('place.php?whichplace=chateau&action=chateau_restbox');
    use_familiar(DefaultFamiliar());
    equip($item[Kramco Sausage-o-Matic&trade;]);
    adv1($location[The Haunted Pantry], -1, "");
    equip($item[latte lovers member's mug]); //'
    location ghostLocation = to_location(get_property("ghostLocation"));
    adv1(ghostLocation, -1, "skill Entangling Noodles; while hasskill Shoot Ghost; skill Shoot Ghost; if hasskill Trap Ghost; skill Trap Ghost; endif; endwhile;");
    
    use(3, $item[psychokinetic energy blob]);
    c2t_cartographyHunt($location[The Haiku Dungeon], $monster[amateur ninja]);
    
    if(get_property("_voteFreeFights") < 3 && (total_turns_played() % 11) == 1 && get_property("lastVoteMonsterTurn") < total_turns_played())
    {
        equip($slot[acc3], votedSticker);
		adv1($location[The Haunted Kitchen], -1, "skill saucegeyser;");
    }
    



    // QUEST - Coil Wire
    do_test(TEST_COIL_WIRE);
    if (my_turncount() < 60) error('Something went wrong coiling wire.');

    if(get_property("questM25Armorer") == "unstarted") 
    {
        visit_url("shop.php?whichshop=armory&action=talk");
        run_choice(1);
    }
    use_familiar(DefaultFamiliar());
    adv1($location[The Haunted Pantry], -1, "");

    cli_execute('terminal educate extract.edu');
    cli_execute('terminal educate duplicate.edu');

    ghostLocation = to_location(get_property("ghostLocation"));
    use_familiar(DefaultFamiliar());
    adv1(ghostLocation, -1, "skill Entangling Noodles; while hasskill Shoot Ghost; skill Shoot Ghost; if hasskill Trap Ghost; skill Trap Ghost; endif; endwhile;");
    use_familiar(DefaultFamiliar());
    adv1($location[The Haunted Pantry], -1, "");

    //if(available_amount($item[burning newspaper]) > 0)
    

    if(get_property("_voteFreeFights") < 3 && (total_turns_played() % 11) == 1 && get_property("lastVoteMonsterTurn") < total_turns_played())
    {
        use_familiar(DefaultFamiliar());
        equip($slot[acc3], votedSticker);
		adv1($location[The Haunted Pantry], -1, "skill saucegeyser;");
    }

    equip($slot[acc3], $item[backup camera]);
    use_familiar($familiar[Shorter-Order Cook]);
    while(get_property('_backUpUses').to_int() < 5)
    {
        if(available_amount($item[short stack of pancakes]) > 0)
            use_familiar(DefaultFamiliar());
        adv1($location[The Dire Warren], -1, "skill Back-Up to your Last Enemy; skill candyblast; attack with weapon;");
    }
    while(get_property('_backUpUses').to_int() < 11)
    {
        if(available_amount($item[short stack of pancakes]) > 0)
            use_familiar(DefaultFamiliar());
        adv1($location[The Haunted Kitchen], -1, "skill Back-Up to your Last Enemy; skill candyblast; attack with weapon;");
    }
*/

print('Exiting Preparation: ', 'purple');