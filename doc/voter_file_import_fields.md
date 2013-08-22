In the voter_file_importer, you have access to these relations:

* `availability`
* `born_at` - birthdate
* `church`
* `religion`
* `city_district`
* `county_district`
* `federal_district`
* `fire_district`
* `judicial_district`
* `village_district`
* `school_district`
* `school_sub_district`
* `state_lower_district`
* `state_upper_district`
* `civicrm_id`
* `county_file_id`
* `demo` - demographic
* `do_not_call` - does not want to be called by the nation (Y/N)
* `do_not_contact` - does not want to be contacted by the nation (Y/N)
* `email` - email address
* `email_opt_in` - Y/N
* `employer`
* `ethnicity`
* `external_id` - ID for this person in the external system of your choice
* `facebook_uid`
* `facebook_username`
* `fax_number`
* `federal_donotcall` - whether the person is on the [National Do Not Call Registry](https://www.donotcall.gov/)
* `household_size` - Size of household, numerical value
* `id` - NationBuilder ID
* `inferred_party` - see the [party codes](http://nationbuilder.com/support_for_international_parties)
* `party` - see the [party codes](http://nationbuilder.com/support_for_international_parties)
* `previous_party` - see the [party codes](http://nationbuilder.com/support_for_international_parties)
* `is_deceased` - Y/N
* `is_mobile_bad` - whether the mobile can receive text messages (Y/N)
* `is_volunteer` - whether the person volunteered
* `language` - codes available [here](http://nationbuilder.com/what_are_the_codes_for_languages)
* `prefix`
* `first_name`
* `middle_name`
* `last_name`
* `suffix`
* `legal_name` - legal first name - i.e. William instead of Bill
* `marital_status` - C/D/M/P/S/W -(civil union, divorced, married, domestic partner, single, widowed)
* `meetup_id`
* `salesforce_id`
* `phone_number`
* `work_phone_number`
* `mobile_number`
* `mobile_opt_in` - willing to receive text messages from nation (Y/N)
* `nbec_guid` - [NationBuilder Election Center](http://elections.nationbuilder.com/) ID
* `ngp_id` - the [NGP](http://en.wikipedia.org/wiki/NGP_VAN) id of the person
* `van_id` - the [VAN](http://en.wikipedia.org/wiki/NGP_VAN) id of the person
* `note` - notation field for the person
* `occupation`
* `priority_level` - value of 1 through 5, with 1 being low priorty and 5 being high priority
* `support_level` - 1(very strong inferred support) to 5 (very weak inferred support)
* `inferred_support_level` - 1(very strong inferred support) to 5 (very weak inferred support)
* `registered_at` - date the person was registered to vote
* `sex` - M/F/O
* `state_file_id` - Voter ID of the person according to his/her state
* `tag_list` - Tags separated by commas which will be added to person's profile.
* `twitter_id`
* `twitter_login`
* `website` - the person's website
* `precinct.code`
* `precinct.name`

There are also addresses available to edit:
1. `address`
2. `work_address`
3. `mailing_address`
4. `registered_address`

Each address has the following attributes:
* `address1`
* `address2`
* `address3`
* `city`
* `state`
* `county`
* `zip`
* `fips` - [FIPS county code](http://en.wikipedia.org/wiki/FIPS_county_code)
* `country`
* `country_code`
