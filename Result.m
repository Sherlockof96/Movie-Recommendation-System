%Getting the results out from the matrix 

%Read in CSV

test_file = 'test.csv';
Ma = readtable(test_file);

test_movie_id = Ma.Var1;
test_user_id = Ma.Var2;
test_date = Ma.Var4;

for i = 1:length(test_movie_id)
    
    %finding the row where the actual customer is 
    test_user = test_user_id(i);
    row_user = find(u_customer_id == test_user);
    
    %finding the row where the actual movie_id is
    test_movie = test_movie_id(i);
    row_movie = find(u_movie_id == test_movie);
    
    if row_movie ~= null || row_user ~= null 
    
    if i == 186
        disp(row_user)
        disp(row_movie)
    end
    
    test_rating_baseline(i) = Rui(row_user,row_movie);
end