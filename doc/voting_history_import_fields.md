Described on this page are the fields you can import in a voting history import

First of all, you must provide at least one piece of identifying information, through one of these fields:

* `id` - the nationbuilder id of the person
* `nbec_guid` - the election center id of the voter
* `pf_strat_id` - the pforce id for the voter
* `ngp_id` - the [NGP](http://en.wikipedia.org/wiki/NGP_VAN) id of the person
* `van_id` - the [VAN](http://en.wikipedia.org/wiki/NGP_VAN) id of the person
* `civicrm_id` - [CIVICRM](http://civicrm.org/) id of the person
* `external_id` - the id of this person in another system
* `state_file_id` - the id of this voter as originated by a state's voter file
* `county_file_id` - the id of this voter as originated by a county's voter file
* `dw_id` - the [Catalist](http://catalist.us/about) id of this person
* `email` - their email address
* `phone_number` - their home phone number
* `mobile_number` - their mobile phone number
* `work_phone_number` - their work phone number
* `twitter_login` - twitter handle
* `twitter_id` - twitter id
* `facebook_uid` - facebook id
* `meetup_id` - their [Meetup](http://www.meetup.com/find/) id
* `salesforce_id` - their id in [SalesForce](http://www.salesforce.com/)

Once you have done this, these are the values a voting history import can import
* `is_active_voter` - whether this person should be considered an 'active' voter
* `is_absentee_voter` - whether the person votes absentee
* `is_permanent_absentee_voter` - whether the person permanently votes absentee
* `is_early_voter` - whether the person votes early
* `voter_updated_at` - when the voter's data was last updated

* individual election history fields - `vh00g1`, `vh00p1`, `vh00pp1`, `vh00s1`, `vh01g1`, `vh01p1`, `vh01s1`, `vh02g1`, `vh02p1`, `vh02s1`, `vh03g1`, `vh03p1`, `vh03s1`, `vh04g1`, `vh04p1`, `vh04pp1`, `vh04s1`, `vh05g1`, `vh05p1`, `vh05s1`, `vh06g1`, `vh06p1`, `vh06s1`, `vh07g1`, `vh07p1`, `vh07s1`, `vh08g1`, `vh08p1`, `vh08pp1`, `vh08s1`, `vh09g1`, `vh09p1`, `vh09s1`, `vh10g1`, `vh10p1`, `vh10s1`, `vh11g1`, `vh11p1`, `vh11s1`, `vh12g1`, `vh12p1`, `vh12pp1`, `vh12s1`, `vh13g1`, `vh13p1`, `vh13s1`

Note: The individual election history field format is "vhdde1", where:
1. vh means 'voting history'
2. dd is the two-digit year of the election
3. e is the election type- choices are primary (p), presidential primary (pp), general (g), and special (s)

The values for the individual election history fields can be seen [here](http://nationbuilder.com/how_do_i_import_custom_voter_history).