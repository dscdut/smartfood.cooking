const tableName = 'recipes_steps';

exports.up = async knex => {
  await knex.schema.createTable(tableName, table => {
    table.increments('id').unsigned().primary();
    table
      .integer('recipe_id')
      .unsigned()
      .references('id')
      .inTable('recipes')
      .onDelete('CASCADE')
      .notNullable();
    table.string('content');
    table.integer('order').unsigned();
    table.dateTime('deleted_at').defaultTo(null);
    table.timestamps(false, true);
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
