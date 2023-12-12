/*Constants*/

int TEST_HP = 1;
int TEST_MUS = 2;
int TEST_MYS = 3;
int TEST_MOX = 4;
int TEST_FAMILIAR = 5;
int TEST_WEAPON = 6;
int TEST_SPELL = 7;
int TEST_NONCOMBAT = 8;
int TEST_ITEM = 9;
int TEST_HOT_RES = 10;
int TEST_COIL_WIRE = 11;

/*Helper Functions*/

void error(string message) {
    // Clean up saved properties.
    //set_property('autoSatisfyWithNPCs', get_property('_saved_autoSatisfyWithNPCs'));
    //set_property('autoSatisfyWithCoinmasters', get_property('_saved_autoSatisfyWithCoinmasters'));
    abort(message);
}

boolean test_done(int test_num) 
{
    print('Checking test ' + test_num + '...');
    string text = visit_url('council.php');
    return !text.contains_text('<input type=hidden name=option value=' + test_num + '>');
}

void do_test(int test_num) 
{
    if (!test_done(test_num)) 
    {
        visit_url('choice.php?whichchoice=1089&option=' + test_num);
        if (!test_done(test_num)) 
        {
            print('Failed to do test ' + test_num + '. Maybe we are out of turns.', 'red');
        }
    } 
    else 
    {
        print('Test ' + test_num + ' already completed.');
    }
}

boolean mwcs_cartographyHunt(location loc,monster mon) 
{
    if (have_skill($skill[Map the Monsters]) && get_property('mappingMonsters') == 'false' && get_property('_monstersMapped').to_int() < 3)
        use_skill(1,$skill[Map the Monsters]);
    
    if (get_property('mappingMonsters') == 'true') {
        buffer buf;
        buf = visit_url(loc.to_url(),false,true);
        if (!buf.contains_text("Leading Yourself Right to Them"))
            abort("Wrong thing came up when using Map the Monsters at "+loc+" with "+mon);
        buf = visit_url("choice.php?pwd&whichchoice=1435&option=1&heyscriptswhatsupwinkwink="+mon.to_int(),true,true);
        if (!buf.contains_text("<b>Combat"))
            abort("Didn't enter combat using Map the Monsters at "+loc+" with "+mon);
        run_turn();
        return true;
    }
    return false;
}

void ensure_effect(effect ef, int turns) {
    if (have_effect(ef) < turns) {
        if (!cli_execute(ef.default) || have_effect(ef) == 0) {
            error('Failed to get effect ' + ef.name + '.');
        }
    } else {
        print('Already have effect ' + ef.name + '.');
    }
}

void ensure_effect(effect ef) {
    ensure_effect(ef, 1);
}

boolean[effect] song_slot_3 = $effects[Power Ballad of the Arrowsmith, The Magical Mojomuscular Melody, The Moxious Madrigal, Ode to Booze, Jackasses' Symphony of Destruction];
boolean[effect] song_slot_4 = $effects[Carlweather's Cantata of Confrontation, The Sonata of Sneakiness, Polka of Plenty];
void open_song_slot(effect song) 
{
    if(have_effect(song) == 0)
    {
        boolean[effect] song_slot;
        if (song_slot_3 contains song) song_slot = song_slot_3;
        else if (song_slot_4 contains song) song_slot = song_slot_4;
        foreach shruggable in song_slot {
            cli_execute("shrug "+ shruggable.to_string());
        }
    }
    
}

void ensure_song(effect ef) {
    if (have_effect(ef) == 0) {
        open_song_slot(ef);
        if (!cli_execute(ef.default) || have_effect(ef) == 0) {
            error('Failed to get effect ' + ef.name + '.');
        }
    } else {
        print('Already have effect ' + ef.name + '.');
    }
}

familiar chooseFamiliar()
{
    if(available_amount($item[burning newspaper]) == 0 && !test_done(TEST_FAMILIAR))
    {
        return $familiar[garbage fire];
    }
    if(get_property('camelSpit').to_int() < 100)
        return $familiar[Melodramedary];
    if(available_amount($item[short stack of pancakes]) == 0 && !test_done(TEST_FAMILIAR))
        return $familiar[Shorter-Order Cook];
    if(available_amount($item[tiny bottle of absinthe]) == 0 && !test_done(TEST_FAMILIAR))
    {
        return $familiar[green pixie];
    }
    return $familiar[cookbookbat];
}