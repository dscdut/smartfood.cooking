const tableName = 'recipes_ingredients';

exports.up = async knex => {
  await knex.schema.createTable(tableName, table => {
    table
      .integer('recipe_id')
      .unsigned()
      .references('id')
      .inTable('recipes')
      .onDelete('CASCADE')
      .notNullable();
    table
      .integer('ingredient_id')
      .unsigned()
      .references('id')
      .inTable('ingredients')
      .notNullable();
    table.double('value');
    table.string('unit');
    table.dateTime('deleted_at').defaultTo(null);
    table.timestamps(false, true);

    table.primary(['recipe_id', 'ingredient_id']);
  });

  await knex.raw(`
   CREATE TRIGGER update_timestamp
   BEFORE UPDATE
   ON ${tableName}
   FOR EACH ROW
   EXECUTE PROCEDURE update_timestamp();
 `);
};

exports.down = knex => knex.schema.dropTable(tableName);
