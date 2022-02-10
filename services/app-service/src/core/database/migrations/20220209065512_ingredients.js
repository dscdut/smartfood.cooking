const tableName = 'ingredients';

exports.up = async knex => {
  await knex.schema.createTable(tableName, table => {
    table.increments('id').unsigned().primary();
    table.string('name');
  });
};

exports.down = knex => knex.schema.dropTable(tableName);
