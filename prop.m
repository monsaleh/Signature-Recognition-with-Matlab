function [sd,skew,kurtosis]=prop(s)
         [pixelCounts GLs] = imhist(s); 
		  numberOfPixels = sum(pixelCounts);
		  meanGL = sum(GLs .* pixelCounts) / numberOfPixels;
		  varianceGL = sum((GLs - meanGL) .^ 2 .* pixelCounts) / (numberOfPixels-1);
		  sd = sqrt(varianceGL);
		  skew = sum((GLs - meanGL) .^ 3 .* pixelCounts) / ((numberOfPixels - 1) * sd^3);
		  kurtosis = sum((GLs - meanGL) .^ 4 .* pixelCounts) / ((numberOfPixels - 1) * sd^4);
end
         
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    