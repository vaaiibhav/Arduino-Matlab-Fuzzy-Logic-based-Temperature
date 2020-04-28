

Temp = ip;

[rows, columns] = size(image);

Nx = [-1, -1, 1, 0, 1, 1, -1,  0]; 
Ny = [-1, 0, -1, 1,  1, 0, 1, -1];

maximum = 0;
alpha = 0.1; 
W = 3; 
T = 0.1; %threshold
fuzzy_matrix = zeros(rows, columns);
for x = 2:(rows - 1)
	for y = 2:(columns - 1)
		for k = 1:((W^2) - 1)
			
			maximum = maximum + max(0, (1 - Temp(x + Nx(k), y + Ny(k))/alpha));
          
			
		end
		
		fuzzy_matrix(x, y) = (maximum - 1)/((W^2) - 1);
		
		if(fuzzy_matrix(x, y) > T)
			
			fuzzy_matrix(x, y) = 1;
			
		else
			
			fuzzy_matrix(x, y) = 0;
			
		end
		
		maximum = 0;
		
	end
end


