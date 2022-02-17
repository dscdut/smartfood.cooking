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
    table.dateTime('deleted_at').defaultTo(null);
    table.timestamps(false, true);

    table.primary(['ingredient_id', 'category_id']);
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
