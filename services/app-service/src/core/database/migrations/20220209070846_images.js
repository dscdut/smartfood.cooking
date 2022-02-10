const tableName = 'images';

exports.up = async knex => {
  await knex.schema.createTable(tableName, table => {
    table.increments('id').unsigned().primary();
    table.string('url');
    table.float('width', 5, 1);
    table.float('height', 5, 1);
  });
};

exports.down = knex => knex.schema.dropTable(tableName);
