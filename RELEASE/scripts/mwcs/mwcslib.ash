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