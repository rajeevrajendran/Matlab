load('Z:\InVivo\Databases\11.12_rr_101_pretty\tptestdb_olympus_11.12_rr_101_pretty.mat')
No = zeros(1,length(db));
Lost = zeros(1,length(db));
Gained = zeros(1,length(db));
Persisted = zeros(1,length(db));
for i =1:17
    for k = 2:11
    NC = length(db(i).measures);
    for j = 1:NC
        if db(i).measures(1,j).bouton == 1 && isfield(db(i).measures(1,j),'mito_was_close')==1
            if db(i).measures(1,j).mito_was_close+db(i).measures(1,j).mito_close+db(i).measures(1,j).lost == 0
                No(i,j) = 1;
            elseif db(i).measures(1,j).mito_was_close==1 && (db(i).measures(1,j).mito_close+db(i).measures(1,j).lost == 0)
                Lost(i,j) = 1;
            elseif (db(i).measures(1,j).mito_was_close+db(i).measures(1,j).lost == 0) && db(i).measures(1,j).mito_close == 1
                Gained(i,j) = 1;
            elseif (db(i).measures(1,j).mito_was_close+db(i).measures(1,j).mito_close==2) && db(i).measures(1,j).lost == 0
                Persisted(i,j) = 1;
            end
        end
    end
    end
end

