const tableName = 'ingredients_categories';

exports.up = async knex => {
  await knex.schema.createTable(tableName, table => {
    table
      .integer('ingredient_id')
      .unsigned()
      .references('id')
      .inTable('ingredients')
      .onDelete('CASCADE')
      .notNullable();
    table
      .integer('category_id')
      .unsigned()
      .references('id')
      .inTable('categories')
      .notNullable();

    table.primary(['ingredient_id', 'category_id']);
  });
};

exports.down = knex => knex.schema.dropTable(tableName);
