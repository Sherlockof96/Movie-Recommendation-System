%Baseline Model

%Finding the average rating of all the known ratings
AvgRating = mean(table_rating);
disp(AvgRating)

%Finding bu of user18 because it's count is just 2 but then did it for
%user1

for j = 1:length(A(:,1,1))
    count = 0;
    rating_user = 0;
    for i = 1:length(A(j,:,1))
        if A(j,i,1) == 0
            count = count + 1;
            count = count - 1;
        else
            rating_user = rating_user + A(j,i,1);
            %disp(A(j,i,1))
            count = count + 1;
        end
    end
    bu(j) = AvgRating - rating_user/count;
    %disp(bu)
    %disp(count)
    %disp(rating_user)
end


%Finding bi of movies

for j = 1:length(A(1,:,1))
    count = 0;
    rating_movie = 0;
    for i = 1:length(A(:,j,1))
        if A(i,j,1) == 0
            count = count + 1;
            count = count - 1;
        else
            rating_movie = rating_movie + A(i,j,1);
            %disp(A(i,j,1))
            count = count + 1;
        end
    end
    bi(j) = AvgRating - rating_movie/count;
    %disp(bi)
    %disp(count)
    %disp(rating_movie)
end


%Rui = mean + bu + bi
%Rui = AvgRating + bu + bi

%Finding Rui for everything including the ones that are already been found
%out

for i = 1:length(A(:,1,1))
    for j = 1:length(A(1,:,1))
        Rui(i,j) = AvgRating + bu(i) + bi(j);
    end
end



