const tableName = 'recipes_ingredients';

exports.up = async knex => {
    await knex.schema.createTable(tableName, table => {
        table.integer('recipe_id').unsigned().references('id').inTable('recipes')
            .onDelete('CASCADE')
            .notNullable();
        table.integer('ingredient_id').unsigned().references('id').inTable('ingredients')
            .notNullable();
        table.string('value', 1000).nullable();
        table.string('unit', 1000);

        table.primary(['recipe_id', 'ingredient_id']);
    });
};

exports.down = knex => knex.schema.dropTable(tableName);
