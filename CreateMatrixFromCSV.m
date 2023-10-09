%Read in CSV
train_file = 'train.csv';
M = readtable(train_file);

%Putting all the data in variables
table_movie_id = M.movie_id;
table_customer_id = M.customer_id;
table_rating = M.rating;
table_date = M.date;

%displaying the first line to check if the variables have been taken
%correctly
%disp(movie_id(1));
%disp(customer_id(1));
%disp(raitng(1));
%disp(date(1));

%Getting unique id's and its ocuurences
[u_movie_id, ia, ic] = unique(table_movie_id);
a_counts_movie_id = accumarray(ic,1);
occurrence_movie_id = [u_movie_id , a_counts_movie_id];

[u_customer_id, ib, id] = unique(table_customer_id);
a_counts_customer_id = accumarray(id,1);
occurrence_customer_id = [u_customer_id,a_counts_customer_id];

%movie_id = (1:length(u_movie_id))';
%customer_id = (1:length(u_customer_id))';

%Hashing the movie id and customer id
%movie_id = [new_movie_id u_movie_id];
%customer_id = [new_customer_id u_customer_id];

A = zeros(5905,16142,2);


for i = 1:length(table_movie_id)
    %finding the row where the actual customer_id is
    user = table_customer_id(i);
    row_user = find(u_customer_id == user);
    %disp(row_user)


    %finding the row where the actual movie_id is
    movie = table_movie_id(i);
    row_movie = find(u_movie_id == movie);
    %disp(row_movie)
    
    rating = table_rating(i);
    date = table_date(i);
    A(row_user,row_movie,1) = rating;
    A(row_user,row_movie,2) = datenum(date);
end

%The above code will give the matrix of the CSV file and the hashed value
%of users and movies. 







