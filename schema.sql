-- Ingredients Table
CREATE TABLE Ingredients (
    IngredientID NUMBER CONSTRAINT PK_INGREDIENTS PRIMARY KEY,
    Name VARCHAR2(255) UNIQUE NOT NULL,
    IsCommonAllergen CHAR(1) CHECK (IsCommonAllergen IN ('Y', 'N'))
);

-- Recipes Table
CREATE TABLE Recipes (
    RecipeID NUMBER CONSTRAINT PK_RECIPES PRIMARY KEY,
    RecipeName VARCHAR2(255) UNIQUE NOT NULL,
    CookTime NUMBER
);

-- RecipeIngredients Table
CREATE TABLE RecipeIngredients (
    RecipeID NUMBER,
    IngredientID NUMBER,
    Quantity VARCHAR2(50),
    IsEssential CHAR(1) CHECK (IsEssential IN ('Y', 'N')),
    CONSTRAINT PK_RECIPEINGREDIENTS PRIMARY KEY (RecipeID, IngredientID),
    CONSTRAINT FK_REIN_RE FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
    CONSTRAINT FK_REIN_IN FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID)
);

-- RecipeSteps Table
CREATE TABLE RecipeSteps (
    RecipeID NUMBER,
    StepNumber NUMBER,
    StepText CLOB,
    CONSTRAINT PK_RECIPESTEPS PRIMARY KEY (RecipeID, StepNumber),
    CONSTRAINT FK_REST_RE FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID) ON DELETE CASCADE
);

-- IngredientSubstitutes Table
CREATE TABLE IngredientSubstitutes (
    OriginalID NUMBER,
    SubstituteID NUMBER,
    CONSTRAINT PK_INGREDIENTSUBSTITUTES PRIMARY KEY (OriginalID, SubstituteID),
    CONSTRAINT FK_INSU_IN_OID FOREIGN KEY (OriginalID) REFERENCES Ingredients(IngredientID),
    CONSTRAINT FK_REST_IN_SID FOREIGN KEY (SubstituteID) REFERENCES Ingredients(IngredientID),
    CONSTRAINT VALID_SUB CHECK (OriginalID <> SubstituteID)
);

-- User_Query Table
CREATE TABLE user_query (
    QueryID NUMBER CONSTRAINT PK_USER_QUERY PRIMARY KEY,
    USERID NUMBER,
    USERNAME VARCHAR2(255),
    RecipeName VARCHAR2(255) NOT NULL,
    Allergies VARCHAR2(1000),
    CONSTRAINT FK_USQU_RE FOREIGN KEY (RecipeName) REFERENCES Recipes(RecipeName)
);
