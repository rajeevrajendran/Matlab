% Created by Rajeev Rajendran
% 3rd August 2015
% Modified 22 May 2016

function eldritch_horror (n) % n=number of players
rng('shuffle')
ao=randperm(10,1); % select ancient one

rng('shuffle')
ply=randperm(32,3*n); % select players

rng('shuffle')
prl=randperm(18,1); % select prelude card


AO={'Abhoth The source of Uncleanliness',...
    'Azathoth The Daemon Sultan',...
    'Cthulhu The madness from the sea',...
    'Ithaqua The Wind-Walker',...
    'Nephren-Ka The Dark Pharaoh',...
    'Rise of the Elder Things The Once-Dominant species',...
    'Shub-Niggurath The Black Goat of the woods',...
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
    'Set aside special encounter cards and Mystic Ruins deck',... % Syzygy
    'Set aside 6 Cultists, 1 Serpent People monsters and special encounter cards',... % Yig
    'Set aside special encounter cards'}; % Yog-Sothoth

Investigators={'Agnes Baker The Waitress','Akachi Onyele The Shaman',...
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
    'Rex Murphy The Reporter','Silas Marsh The Sailor',...
    'Sister Mary The Nun','Skids OToole The Ex-Convict',...
    'Tommy Muldoon The Rookie Cop','Tony Morgan The Bounty Hunter',...
    'Trish Scarborough The Spy','Ursula Downs The Explorer',...
    'Wilson Richards The Handyman','Zoey Samaras The Chef'};

Plsetup={'London UK, Profane Tome asset, 1 Storm of Spirits spell',... Agnes Baker
    'South Africa (space 15), Mists of Releh spell, 1 Clue',... % Akachi Onyele
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
    'Juneau, Alaska (space 1), Lucky Talisman asset, 1 Cursed condition, Improve 1 skill',... % Rex Murphy
    'Sydney Australia, Fishing Net asset',... % Silas Marsh
    'South Africa (space 15), Holy water asset, 1 Ship ticket, 1 Clue',... % Sister Mary
    'Buenos Aires Argentina, Axe asset',... % Skids OToole
    'Alaskan coast (space 1), Carbine Rifle asset, Improve Will',... % Tommy Muldoon
    'Bogota Columbia (space 7), Handcuffs asset, Mists of Releh spell, 1 Clue',... % Tony Morgan
    'Central Russia (space 16), .45 Automatic asset',... % Trish Scarborough
    'The Heart of Africa, Mineralogy asset, Improve 1 skill',... % Ursula Downs
    'Arkham USA, Blunderbuss asset',... % Wilson Richards
    'Rome Italy, Holy Cross asset'}; % Zoey Samaras

Prelude={'Beginning of the end','Blank','Blank with Antarctica','Call of Cthulhu','Dark blessings',...
    'Drastic measures','Doomsayer from Antarctica','Epidemic','Ghost from the past','In Cosmic alignment','Key to salvation'...
    'Litany of secrets','Rumors from the North','The coming storm','The Dunwitch horror',...
    'Ultimate Sacrifice','Under the Pyramids','Unwilling Sacrifice'};

% Pldconditions ={'',... % Beginning of the end
%     '',... % Blank
%     '',... % Blank with Antarctica
%     '',... % Dark blessings
%     '',... % Doomsayer from Antarctica
%     '',... % In Cosmic alignment
%     '',... % Key to salvation
%     '',... % Rumors from the North
%     'After resolving setup, advance omen by 1, Spawn gate and Monster surge' ...
%     'Then starting with lead investigator each player resolves two effects of his choice'...
%     '',...
%     '',... % The Dunwitch horror
%     '',... % Ultimate Sacrifice
%     ''}; % Unwilling Sacrifice


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
disp(['Select prelude card ',char(Prelude(prl))]);
% disp(char(Pldconditions(prl)));

