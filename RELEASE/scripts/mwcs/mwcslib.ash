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