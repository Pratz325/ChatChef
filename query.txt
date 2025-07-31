-- 1. Retrieve all recipes containing a specific ingredient
SELECT r.RecipeName
FROM Recipes r
JOIN RecipeIngredients ri ON r.RecipeID = ri.RecipeID
JOIN Ingredients i ON ri.IngredientID = i.IngredientID
WHERE i.Name = 'Sugar';

-- 2. List recipes that do NOT contain common allergens
SELECT DISTINCT r.RecipeName
FROM Recipes r
WHERE r.RecipeID NOT IN (
    SELECT ri.RecipeID
    FROM RecipeIngredients ri
    JOIN Ingredients i ON ri.IngredientID = i.IngredientID
    WHERE i.IsCommonAllergen = 'Y'
);

-- 3. Find all ingredients and their quantities for a given recipe
SELECT i.Name, ri.Quantity
FROM RecipeIngredients ri
JOIN Ingredients i ON ri.IngredientID = i.IngredientID
WHERE ri.RecipeID = (
    SELECT RecipeID FROM Recipes WHERE RecipeName = 'Chocolate Cake'
);

-- 4. Get all steps to prepare a given recipe
SELECT StepNumber, StepText
FROM RecipeSteps
WHERE RecipeID = (
    SELECT RecipeID FROM Recipes WHERE RecipeName = 'Garden Salad'
)
ORDER BY StepNumber;

-- 5. Get substitute ingredient suggestions for an allergen
SELECT i1.Name AS Original, i2.Name AS Substitute
FROM IngredientSubstitutes s
JOIN Ingredients i1 ON s.OriginalID = i1.IngredientID
JOIN Ingredients i2 ON s.SubstituteID = i2.IngredientID;
