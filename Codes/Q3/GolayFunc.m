function GolayFunc = GolayFunc(k,n)

    G.m = [1 0 0 1 1 1 0 0 0 1 1 1;1 0 1 0 1 1 0 1 1 0 0 1;1 0 1 1 0 1 1 0 1 0 1 0; 
        1 0 1 1 1 0 1 1 0 1 0 0;1 1 0 0 1 1 1 0 1 1 0 0;1 1 0 1 0 1 1 1 0 0 0 1;
        1 1 0 1 1 0 0 1 1 0 1 0;1 1 1 0 0 1 0 1 0 1 1 0;1 1 1 0 1 0 1 0 0 0 1 1;
        1 1 1 1 0 0 0 0 1 1 0 1;0 1 1 1 1 1 1 1 1 1 1 1];

    G.P = G.m';
    G.G = [eye(size(G.P ,1)) G.P]; 
    G.H = [G.m eye(size(G.m ,1))];
    G.e_hat = syndtable(G.H);

    for i=1:length(G.e_hat) 
        s(i,:) = mod((G.e_hat(i,:) * G.H'),2); % Síndrome em binário   
    end

    G.u = de2bi(0:4095, k);
    G.c = mod(G.u * G.G, 2);
    G.lut = struct('s', s, 'e_hat', G.e_hat);
    GolayFunc = G;
end