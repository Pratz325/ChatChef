CREATE OR REPLACE PROCEDURE Generate_Safe_Recipe(
    p_recipe_name   IN VARCHAR2,
    p_allergy       IN VARCHAR2,
    p_ingredients   OUT SYS_REFCURSOR,
    p_steps         OUT SYS_REFCURSOR,
    p_subs          OUT SYS_REFCURSOR
) AS
    v_recipe_id        Recipes.RecipeID%TYPE;
BEGIN
    -- Get Recipe ID
    SELECT RecipeID INTO v_recipe_id
    FROM Recipes
    WHERE UPPER(RecipeName) = UPPER(TRIM(p_recipe_name)) AND ROWNUM = 1;

    -- 1. Return Ingredients
    OPEN p_ingredients FOR
    SELECT i.Name AS Ingredient, ri.Quantity
    FROM RecipeIngredients ri
    JOIN Ingredients i ON ri.IngredientID = i.IngredientID
    WHERE ri.RecipeID = v_recipe_id;

    -- 2. Return Steps
    OPEN p_steps FOR
    SELECT StepNumber, StepText
    FROM RecipeSteps
    WHERE RecipeID = v_recipe_id
    ORDER BY StepNumber;

    -- 3. Return substitution name (if allergen is used and substitute exists)
    OPEN p_subs FOR
    SELECT Name AS Substitute
    FROM Ingredients
    WHERE IngredientID = (
        SELECT s.SubstituteID
        FROM IngredientSubstitutes s
        JOIN Ingredients a ON s.OriginalID = a.IngredientID
        JOIN RecipeIngredients ri ON ri.IngredientID = a.IngredientID
        WHERE ri.RecipeID = v_recipe_id
          AND UPPER(a.Name) = UPPER(p_allergy)
          AND ROWNUM = 1
    );
END;
/
