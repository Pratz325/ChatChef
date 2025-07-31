-- INGREDIENTS (example entries)
INSERT INTO Ingredients VALUES (1, 'Eggs', 'Y');
INSERT INTO Ingredients VALUES (2, 'Milk', 'Y');
INSERT INTO Ingredients VALUES (3, 'Flour', 'N');
INSERT INTO Ingredients VALUES (4, 'Sugar', 'N');
INSERT INTO Ingredients VALUES (5, 'Peanuts', 'Y');
INSERT INTO Ingredients VALUES (6, 'Banana', 'N');

-- RECIPES (example entries)
INSERT INTO Recipes VALUES (100, 'Chocolate Cake', 60);
INSERT INTO Recipes VALUES (101, 'Garden Salad', 15);

-- RECIPE INGREDIENTS (example)
INSERT INTO RecipeIngredients VALUES (100, 1, '2 units', 'Y');
INSERT INTO RecipeIngredients VALUES (100, 2, '200 ml', 'N');
INSERT INTO RecipeIngredients VALUES (100, 3, '500g', 'Y');
INSERT INTO RecipeIngredients VALUES (100, 4, '100g', 'Y');
INSERT INTO RecipeIngredients VALUES (101, 6, '1 unit', 'N');

-- RECIPE STEPS (example)
INSERT INTO RecipeSteps VALUES (100, 1, 'Beat eggs and sugar.');
INSERT INTO RecipeSteps VALUES (100, 2, 'Mix in flour and milk.');
INSERT INTO RecipeSteps VALUES (100, 3, 'Bake at 180C for 30 minutes.');
INSERT INTO RecipeSteps VALUES (101, 1, 'Slice banana.');
INSERT INTO RecipeSteps VALUES (101, 2, 'Serve on a plate.');

-- INGREDIENT SUBSTITUTES (example)
INSERT INTO IngredientSubstitutes VALUES (1, 6); -- Substitute Eggs with Banana

-- USER QUERY (example)
INSERT INTO user_query VALUES (1, 2001, 'Alice', 'Chocolate Cake', 'Eggs');