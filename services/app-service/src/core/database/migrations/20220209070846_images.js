const tableName = 'images';

exports.up = async knex => {
  await knex.schema.createTable(tableName, table => {
    table.increments('id').unsigned().primary();
    table.string('url');
    table.float('width', 5, 1);
    table.float('height', 5, 1);
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
