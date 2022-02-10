const tableName = 'recipes_images';

exports.up = async knex => {
  await knex.schema.createTable(tableName, table => {
    table
      .integer('step_id')
      .unsigned()
      .references('id')
      .inTable('recipes_steps')
      .onDelete('CASCADE')
      .notNullable();
    table
      .integer('image_id')
      .unsigned()
      .references('id')
      .inTable('images')
      .notNullable();
    table.dateTime('deleted_at').defaultTo(null);
    table.timestamps(false, true);

    table.primary(['step_id', 'image_id']);
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
