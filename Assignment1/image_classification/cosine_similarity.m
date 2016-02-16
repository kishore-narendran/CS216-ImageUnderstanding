% Finds the cosine similarity between the vectors X, and Y
% Here an output of 1 signifies maximum similarity

function [ similarity ] = cosine_similarity( X, Y )
    dot_product = dot(X,Y);
    similarity = dot_product/(norm(X) * norm(Y));
end

