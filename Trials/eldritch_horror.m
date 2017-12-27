% Created by Rajeev Rajendran
% 3rd August 2015
% Modified 22 May 2016

function eldritch_horror (n) % n=number of players
rng('shuffle')
ao=randperm(11,1); % select ancient one

rng('shuffle')
ply=randperm(36,3*n); % select players

rng('shuffle')
prl=randperm(22,1); % select prelude card


AO={'Abhoth The source of Uncleanliness',...
    'Azathoth The Daemon Sultan',...
    'Cthulhu The madness from the sea',...
    'Ithaqua The Wind-Walker',...
    'Nephren-Ka The Dark Pharaoh',...
    'Rise of the Elder Things The Once-Dominant species',...
    'Shub-Niggurath The Black Goat of the woods',...
    'Shudde Mell The cataclysm from below',...
    'Syzygy The Cosmic alignment',...
    'Yig The father of Serpents',...
    'Yog-Sothoth The lurker at the threshold'};

AOsetup={'Set aside 8 Cultist monsters and special encounter cards'... % Abhoth
    'Place one eldritch token on the green space of the omen track',... % Azatoth
    'Set aside 1 Deep One, 1 Star Spawn monsters and special encounter cards',... % Cthulhu
    'Set aside 1 Gnoph-keh, 1 Wendigo monsters and special encounter cards',... % Ithaqua
    'Set aside special encounter cards and Egypt sideboard'... % Nephren-Ka
    'Set aside special encounter cards and Antarctica sideboard',... % Rise of the Elder Things
    'Set aside 2 Ghoul, 2 Goat Spawn and 1 Dark Young monsters',... % Shub-Niggurath
    'Rome is devastated. Place eldritch tokens on the places 2, 5, 8, and 11 of the doom track and special encounter cards',... % Shudde Mell
    'Set aside special encounter cards and Mystic Ruins deck',... % Syzygy
    'Set aside 6 Cultists, 1 Serpent People monsters and special encounter cards',... % Yig
    'Set aside special encounter cards'}; % Yog-Sothoth

Investigators={'Agnes Baker The Waitress','Akachi Onyele The Shaman',...
    'Ascan Pete The Drifter','Bob Jenkins The Salesman',...
    'Charlie Kane The Politician','Daisy Walker The Librarian',...
    'Diana Stanley The Redeemed Cultist','Finn Edwards The Bootlegger',...
    'George Barnaby The Lawyer','Hank Samson The farmhand',...
    'Harvey Walters The Professor','Jacqueline Fine The Psychic',...
    'Jim Culver The Musician','Joe Diamond The Private eye',...
    'Leo Anderson The Expedition leader','Lily Chen The Martial artist',...
    'Lola Hayes The Actress','Mandy Thompson The Researcher',...
    'Marie Lambeau The Entertainer','Mark Harrigan The Soldier',...
    'Minh Thi Phan The Secretary','Monterey jack The Archaeologist',...
    'Norman Withers The Astronomer','Patrice Hathaway The Violinist',...
    'Rex Murphy The Reporter','Rita Young The Athlete'...
    'Roland Banks The Fed','Silas Marsh The Sailor',...
    'Sister Mary The Nun','Skids OToole The Ex-Convict',...
    'Tommy Muldoon The Rookie Cop','Tony Morgan The Bounty Hunter',...
    'Trish Scarborough The Spy','Ursula Downs The Explorer',...
    'Wilson Richards The Handyman','Zoey Samaras The Chef'};

Plsetup={'London UK, Profane Tome asset, 1 Storm of Spirits spell',... % Agnes Baker
    'South Africa (space 15), Mists of Releh spell, 1 Clue',... % Akachi Onyele
    'Scandinavia (space 14), 1 Duke Unique Asset, 1 Clue',...
    'London UK, 1 Winchester Rifle Asset, 1 clue',...
    'San Francisco USA, Personal Assistant asset',... % Charlie Kane
    'Istanbul Turkey, Old Journal unique asset, 1 Arcane Insight spell',... % Daisy Walker
    'Central America (space 7), Arcane Manuscripts asset, 1 Wither spell',... % Diana Stanley
    'American Metropolis (space 5), Cat Burgler asset, Whiskey asset, Courier Run unique asset',... % Finn Edwards
    'Urban India (space 17), Investment asset, Pocket Watch asset',... % George Barnaby
    'Dallas USA (space 6), Sledgehammer asset',... % Hank Samson
    'Arkham USA, Ancient Tome asset',... % Harvey Walters
    'American Heartland (space 5), Flesh Ward spell, 1 Clue',... % Jacqueline Fine
    'Deep South (space 6), Shriveling spell, 1 Clue',... % Jim Culver
    'San Francisco USA, .32 Colt Pocket asset',... % Joe Diamond
    'Buenos Aires Argentina, Hired Muscle asset',... % Leo Anderson
    'Shanghai China, Protective Amulet asset, Lucky Rabbit''s foot asset',... % Lily Chen
    'Tokyo Japan, .18 Derringer asset, Improve 1 skill',... % Lola Hayes
    'Shanghai China, Magnifying glass asset, Know Thy Enemy unique asset',... % Mandy Thompson
    'South East Asia (space 20), Ritual Dagger asset, Voice of Ra spell',... % Marie Lambeau
    'Northern Europe (space 14), .38 Revolver asset, Kerosene asset',... % Mark Harrigan
    'Tokyo Japan, Cryptic text unique asset, 1 Clue',... % Minh Thi Phan
    'The Pyramids, Bullwhip asset, Treasure Map unique asset',... % Monterey Jack
    'Arkham USA, Feed the Mind spell',... % Norman Withers
    'Sydney Australia, Banishment spell, 1 Clue',... % Patrice Hathaway
    'Juneau Alaska (space 1), Lucky Talisman asset, 1 Cursed condition, Improve 1 skill',... % Rex Murphy
    'Shanghai China, 1 Rugged Condition, 1 Clue',... % Rita Young
    'San Francisco USA, 1 Mauser C96 Asset, 1 Agency Secrets Unique Asset',... % Roland Banks
    'Sydney Australia, Fishing Net asset',... % Silas Marsh
    'South Africa (space 15), Holy water asset, 1 Ship ticket, 1 Clue',... % Sister Mary
    'Buenos Aires Argentina, Axe asset',... % Skids OToole
    'Alaskan coast (space 1), Carbine Rifle asset, Improve Will',... % Tommy Muldoon
    'Bogota Columbia (space 7), Handcuffs asset, Mists of Releh spell, 1 Clue',... % Tony Morgan
    'Central Russia (space 16), .45 Automatic asset',... % Trish Scarborough
    'The Heart of Africa, Mineralogy asset, Improve 1 skill',... % Ursula Downs
    'Arkham USA, Blunderbuss asset',... % Wilson Richards
    'Rome Italy, Holy Cross asset'}; % Zoey Samaras

Prelude={'Apocalypse Nigh','Beginning of the end','Blank','Blank with Antarctica','Blank with Egypt','Call of Cthulhu','Dark blessings',...
    'Drastic measures','Doomsayer from Antarctica','Epidemic','Fall of Man','Ghost from the past','In Cosmic alignment','Key to salvation'...
    'Litany of secrets','Rumors from the North','The coming storm','The Dunwitch horror','The Price of Prestige',...
    'Ultimate Sacrifice','Under the Pyramids','Unwilling Sacrifice','You Know What You Must Do'};

Ap_Ni = ['Anxiously, you study the walls of your apartment. Hundreds of newspaper clippings surround a' char(10)...
    'heavily marked calendar, multicolored threads connecting each article to a corresponding' char(10)...
    'date. Twenty-two years have passed since the last "occurence." Twenty-two years and nine' char(10)...
    'months. This is going to be the Big One, you can feel it in your gut. The world is not' char(10)...
    'prepared.' char(10)...
    'After resolving setup, if Shudde Mell is not the Ancient One, place 1 Eldritch Token each' char(10)...
    'on space 2, 5, 8, and 11 of the Doom track. If Shudde Mell is the Ancient one, place 1' char (10)...
    'Eldritch token on space 14 of the Doom track. Then the Lead investigator discards 1 Gate' char (10)...
    'on a space of his choice, or each investigator gains 1 Talent Condition. During this' char(10)...
    'game if Shudde Mell is not the Ancient One, when Doom advances to a space containing' char(10)...
    'an Eldritch Token, draw an resolve a Disaster. Then, discard that Eldritch token.']; % Apocalypse Nigh
BotE = ['Over the past few months, the keystones of civilization have begun to crumble. Ancient' char(10)...
    'libraries have burned to the ground, and many intellectual experts have died under' char(10)...
    'suspicious circumstances. You have seen the clues and woven these events together to' char(10)...
    'see a grand conspiracy. Some hidden society or unimaginable power is surely behind' char(10)...
    'this, and you fear that the worst is yet to come.' char(10)...
    'After resolving setup, place 1 Eldritch token on the green space of the Omen track. Then,' char(10)...
    'the lead Investigator discards 1 Gate on a space of his choice or each Investigator gains' char(10)...
    '1 Clue and 1 Focus. During this game, if Azathoth is not the Ancient One, when the Omen' char(10)...
    'advances to the green space of the Omen track, advance Doom by 1.']; % Beginning of the end
Blnk = ['']; % Blank
BlwA = ['Use the Antarctica sideboard']; % Blank with Antarctica
BlwE = ['Use the Egypt sideboard']; % Blank with Egypt
CoC = ['You close your eyes, letting the soothing sounds of the tide wash over you. As you turn over the bizarre figurine in your hands, its damp, wooden edges bring your a strange sort of inexplicable comfort.

Other responsibilities call, and that saddens you, but your heart overflows with joy each time you read the inscription carved into the figure's base.

"Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn
Before step 9 of setup ("Resolve Starting Effects), each investigator moves to the nearest Sea space and loses 1 Sanity. If Cthulhu is the Ancient One, each investigator places 1 Eldritch token on the nearest Sea space that does not contain an Eldritch Token

If Cthulhu is not the Ancient One, set aside 1 Deep One Monster and spawn the Cthylla Epic Monster on space 3.

Then, each investigator may spend 1 Sanity to gain 1 Clue.
    ']; % Call of Cthulhu
    
D_Bl = ['Flavor Text
The world isn't the pristine, loving place that you once thought it to be. Every day the darkness encroaches upon the few truly good people who remain. The good and the righteous fall helpless to the darkness, powerless to stop it, yet the gamblers and the gluttons, the lazy and the wrathful, the proud, the jealous and the lustful, thrive.

You're no different from them; it's true, but you'll have the power to make things right. You've made sure of it.


Prelude Condition
After resolving setup, the Lead Investigator may gain a Dark Pact Condition to gain 1 Boon Condition.

If the Lead Investigator gains the Condition, another investigator may gain an Agreement Condition to gain 1 Boon Condition.

If that investigator gains the Condition, a third investigator may spend 2 Sanity and a gain a Debt Condition to gain 1 Boon Condition.
']; % Dark blessings

Dr_mrs = ['Flavor Text
The grinning alchemist hands you the potion, tenebrous liquid dripping down the sides of the crystal vial. The side effects, he said, could be crippling, but the power would be unlike anything you could imagine.

Steeling yourself against the unknown, you uncork the vial and bring it to your lips. For a moment, you reconsider, fearful of what the mixture might do to you, but alas, the need is too great.

You know that better than most.


Prelude Condition
After resolving setup, each investigator chooses two skills. Each investigator improves the skills he chose and impairs the other three.
']; % Drastic measures

DoA = ['Flavor Text
An expedition to Antarctica has unveiled a startling secret. Though only one man returned, he spoke of a lost city frozen in the mountains.

Most of his rantings were gibberish, but it is clear that he believed that something in this city would bring the downfall of mankind.

Given all the horrors you've seen, you hesitate to dismiss these fears outright. You find yourself preparing for a journey to the frozen south.


Prelude Conditions
During step 5 of setup ("Determine Ancient One"), set up the Antarctica side board.

After resolving setup, if Rise of the Elder Things is the Ancient One, spawn the Rampaging Shoggoth Epic Monster on Lake Camp. If Rise of the Elder Things is not the Ancient One, set aside all Antarctica Adventures and draw a random Antarctica I Adventure

Then the Lead Investigator may move to the space containing the Adventure token or to Miskatonic Outpost.
']; % Doomsayer from Antarctica

Epi = ['Flavor Text
Doubled over in pain, the infection wracks your body. You convulse, hacking up blood and phlegm, barely able to summon the strength to breathe.

The plague, spreading like wildfire, appeared at the same time as those disgusting creatures, and near as you can figure, they are the ones that brought it.

Shakily, you rise to your feet. The creatures will have to be dealt with, that much is certain.


Prelude Conditions
After resolving setup, if Abhoth is the Ancient One, each Investigator spawns 1 Cultist Monster on a Wilderness space that does not contain a Cultist Monster.

If Abhoth is not the Ancient One, the Lead Investigator spawn the Child of Abhoth Epic Monster on the nearest Wilderness space.

Then, each Investigator gains 1 Illness Condition and 1 Clue.
    ']; % Epidemic
    
FoM = ['Flavor Text
You emerge from the rubble of your home, the most recent casualty of the latest calamity. You do not feel how you think someone who just lost their home should feel. Should feel.

You survey the wreckage, hardly acknowledging the wailing sirens and screams of the injured drifting on the wind. There must be a reason for all of it. Punishment for humanity's misdeeds. Punishment for humanity's arrogance and pride.

You watch a young woman desperately digging at the remains of her home, and you wonder if there is anything even worth saving. The curtain is falling on the age of man, and you do not possess the means to stop it. Deep down, you are not even sure that you would.


Prelude Conditions
After resolving setup, place 1 Eldritch Token on the green space of the Omen track.

During this game, when Omen advances to the green space, draw and resolve a Disaster.
    ']; % Fall of Man
    
GftP = ['Flavor Text
You flip through the pages of the bloodstained journal. It is nothing you have not read ten times over already. Furious, you throw it against the wall.

Dead! Gone! For What!? To find answers to a question that should never have been asked. A question that even now you cannot expunge from your thoughts.

Last and alone, you make your way out of the coroner's office, a small box of the deceased's effects in hand.


Prelude Conditions
Before resolving step 3 of setup ("Choose and Place Investigators") draw 1 random Investigator sheet and return it to the game box.

During step 4 of setup ("Receive Starting Possessions, Health and Sanity") The Lead Investigator gains the starting possessions noted on the Investigator that was returned to the game box. Then he gains a Haunted Condition and advances Doom by 1.
    ']; % Ghost from the past
    
ICA = ['Flavor Text
"The Stars are Right."

The words chill you to the bone, not because they were written in blood by the black-robed man that now lies dead before you, but because of their implication.

They herald the end of existence, for you, for your friends, and for the Earth. The end of everything.


Prelude Condition
During step 5 or setup ("Determine Ancient One") Set up the Mystic Ruins Encounter deck.

After resolving setup, if Syzygy is the Ancient One, place 1 Eldritch token on the red space of the Omen track; then each investigator loses 1 Sanity and gains 1 Relic Unique Asset.

If Syzygy is not the Ancient One, set aside all Cosmic Alignment Adventures; then draw the Discovery of a Cosmic Syzygy Adventure and spawn 1 Gate.
    ']; % In Cosmic alignment
    
KtS = ['Flavor Text
Tonight, you dream of a desolate Earth, collapsing under the weight of the cosmos blaring down from above. Just when you feel as if you are about to be torn apart, you notice a faint light beneath your feet. Kneeling down to inspect it closer, you find a tiny glowing key. You try to pick it up, but the closer your hand gets, the more difficult it is to shrug off the pain.

In a final desperate push, the tip of your finger brushes the key, and the crushing pressure dissipates. Life blossoms around you with each step you take, pushing back the darkness. You realize with sudden clarity that you hold the key to the salvation of mankind. You know what you must do.


Prelude Conditions
After resolving setup, each investigator may spend 2 Sanity to gain 2 Task Unique Assets and then discard 1 of those cards.
    ']; % Key to salvation
    
LoS = ['Flavor Text
It is obvious now, the interconnectedness of all things. It lies in plain sight, in our most treasured texts, in our forgotten temples, in etchings on cavern walls. All that remains now is to connect the dots.


Prelude Conditions
During step 7 of setup ("Separate and Place Decks"), shuffle all Expedition Encounter cards together regardless of card back and split them into two decks.

Place an Active Expedition token on each space that corresponds to the illustration on the back of the top card of an Expedition Encounter deck. If the top card of either Expedition Encounter deck changes for any reason, move the Active Expedition tokens to the appropriate spaces.

During the Encounter Phase, an investigator on a space containing an Active Expedition token may encounter it by drawing and resolving the top card of the corresponding Expedition Encounter deck.

Any effect that refers to the Expedition Encounter deck affects both decks. Any effect that refers to the Active Expedition space affects both spaces that contain an Active Expedition token.
    ']; % Litany of secrets
    
RftN = ['Flavor Text
A chill wind makes its way down from the frozen, arctic tundra, and with it comes something much worse. Rumors of cannibalism and strange sightings on the edges of civilization are on the lips of every passerby, even as their breath turns to a frozen mist before them. The signs all point to one thing: Ithaqua, the harbinger of endless winter, is stirring.


Prelude Conditions
Before step 8 of setup ("Build Mythos Deck"), set aside the Wind-Walker Rumor Mythos card.

After resolving setup, if Ithaqua is the Ancient One, advance the Omen by 1. If Ithaqua is not the Ancient One, place The Wind-Walker Rumor Mythos card in play with 6 Eldritch Tokens on it.

Then each investigator may gain a Hypothermia Condition to gain 1 Clue and 1 Focus.
    ']; % Rumors from the North
    
TCS = ['Flavor Text
You have seen the signs that others could not. They called you paranoid, called your preparations illogical, even crazy, but you know the truth. The truth that when the time comes, you will be ready. You will weather that which is prophesied to come. You will survive.


Prelude Condition
After resolving setup, resolve these Mythos effects - advance omen, spawn gate and monster surge
Then, starting with the Lead Investigator, each investigator resolves two effects of his choice.

Move to an adjacent space and/or gain 1 travel ticket of your choice
Gain 1 Clue and 1 Focus
Gain 1 Asset with value equal to or less than your Influence from the reserve.
Gain 1 Glamour Spell, 1 Incantation Spell, or 1 Ritual Spell.
Improve 1 skill of your choice.
    ']; % The coming storm
    
TDH = ['Flavor Text
The union of the witch Lavinia Whateley and the Outer God Yog-Sothoth gave birth to a creature so hideous and deformed that it was hidden from sight for years in a barn on the Whately farm in Dunwich, Massachusetts.

Now, the Whateleys are dead or missing and the beast roams free, rampaging through the countryside, a dark testament to its father's will.


Prelude Condition
During step 9 of setup("Resolve Starting Effects"), if Yog-Sothoth is the Ancient One, search the Mystery deck for the Spawn of Yog-Sothoth Mystery instead of drawing a random Mystery.

After resolving setup, each investigator gains 1 Glamour Spell. Then, if Yog-Sothoth is not the Ancient One, spawn the Dunwich Horror Epic Monster on Arkham.

During the game, the Dunwich Horror Epic Monster has toughness equal to Number of Investigators Icon +4.
']; % The Dunwitch horror

TPoP = ['Flavor Text
Everywhere you go, smiling faces greet you - a wink here, raised eyebrows there. A brief handshake and an amorous embrace. Doors practically fly off their hinges as they open before you, golden light spilling forth from within.

The world is going to hell in a handbasket, and while a select few can match your limitless charisma, fewer still have the ability to muster the resources needed to combat the rising tide.

Money cannot buy friendship, perhaps, but it sure can open a lot of doors.


Prelude Conditions
During this game, if an Asset would be placed on a space of the reserve, the active investigator may place 1 random Task Unique Asset from the deck faceup on that space instead.

Task Unique Assets in the reserve can be gained as part of the Acquire Assets action. Each Task Unique Asset in the reserve has value 2
    ']; % The Price of Prestige
    
Ul_Sac = ['Flavor Text
People though them foolish, troubled, or mad. However, they persisted. For all their efforts, they were the first to fall before the coming threat, and they will not be the last. You must finish the work they started, the world depends on it.


Prelude Conditions
Before resolving step 3 of setup ("Choose and place Investigators") draw 2 random Investigator sheets.

Place the corresponding Investigator tokes on their starting spaces, respectively, as defeated investigators. Place a Health token on the first Investigator token, and a Sanity token on the second Investigator token,

Then place each defeated investigator's starting possessions and 1 random face down Artifact on his Investigator sheet.

After resolving setup, advance Doom by 2.
    ']; % Ultimate Sacrifice
    
UtP = ['Flavor Text
Bruised, dehydrated, and short of breath, you lean against the limestone pillar, gasping for air. Behind you, a black pit in the sand reveals the entrance to some lost passage beneath the pyramid.

Your skin is raw and bloodied where the ropes chafed you. By luck, you escaped, but soon your captors will notice your absence. The roar of some profane creature echoes forth from the pit, and you fear that your presence here has not gone unnoticed.


Prelude Conditions
During Setup 5 of setup ("Determine Ancient One") Set up the Egypt side board.

After resolving setup, if Nephren-Ka is the Ancient One, search the Gate stack for all Gates that correspond to spaces on the Egypt side board. Randomize the Gate Stack and place those Gates on top in a random order. Then, spawn 1 Monster on the Active Expedition space and 1 Monster on The Bent Pyramid.

If Nephren-Ka is not the Ancient One, set aside all Museum Heist Adventures; then draw the Framed for Theft Adventure.
']; % Under the Pyramid

Unw_Sac = ['Flavor Text
You didn't see the faces of the men who took you in the black of night, but you can see the face of another who shares your fate. Bound and gagged, the other victim lies helpless on the stone altar beside you. A black-robed figure prepares to to drive a jeweled dagger into the victim's heart.

With the cultist distracted, you think you could escape, but could you really do so in good conscience?

Nay! As the blade comes down, adrenadline surges through your body and you slip from your restraints. You throw yourself between the robed assailant and his victim. The blade sinks into the flesh of your shoulder, missing your heart by mere inches. You wrench the dagger free from your wounded shoulder, and after subduing the cultist, you free your grateful compnaion. Those who did this to you will pay in kind, that much in certain.


Prelude Conditions
After resolving setup, each investigator may spend 2 Health to gain 1 Character Unique Asset.
    ']; % Unwilling Sacrifice
    
Ykwymd = ['Flavor Text
You stand now upon the precipice of oblivion, the tides of chaos flowing about you in violent eddies. Screams of sorrow and anguish rise from each ripple, echoes of the forgotten past remembered anew as the tempest ebbs and flows.

A thundering pulse rips through your being the roar of the tide but a whisper before its majesty. Your breath catches as the claws of feat tighten around your throat.

Before you looms a threat, terrible and glorious, but at the same time hollow, like a marionette dancing upon silken strings. Only you can see beyond the veil. Only you can see the puppet's master.

Coughing and sputtering, you awaken in some damp, dark alley, sobbing uncontrollably.

He is coming.


Prelude Conditions
After resolving setup, advance Doom by 3. The Lead Investigator gains 1 For the Greater Good Unique Asset. Each other investigator gains 1 Clue.
']; % You Know What You Must Do

Pldconditions = {'Ap_Ni','BotE','Blnk','BlwA','BlwE','CoC','D_Bl','Dr_mrs','DoA','Epi','FoM',...
    'GftP','ICA','KtS','LoS','RftN','TCS','TDH','TPoP','Ul_Sac','UtP','Unw_Sac','Ykwymd'};

for i=1:3*n
    Players(i)= Investigators(ply(i));
end
for i=1:n
    Plasset(i)= Plsetup(ply(i));
end

disp(' ')
disp(['Ancient One is ',char(AO(ao))]);
disp(char(AOsetup(ao)));
disp(' ')
disp(['Lead investigator is ',char(Players(1))]);
disp(char(Plasset(1)));
disp(' ')
disp('Other investigators are ')
disp(' ')
 for j=2:n
     disp(char(Players(j)));
     disp(char(Plasset(j)));
     disp(' ')
 end
disp('Backup investigators are ')
disp(' ')
 for k=n+1:3*n
     disp(char(Players(k)));
 end
disp(' ')
disp(char(Prelude(prl)));
disp(eval(char(Pldconditions(prl))));

