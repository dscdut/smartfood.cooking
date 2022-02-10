const tableName = 'recipes';

exports.up = async knex => {
  await knex.schema.createTable(tableName, table => {
    table.increments('id').unsigned().primary();
    table.string('name');
    table.string('description');
  });
};

exports.down = knex => knex.schema.dropTable(tableName);
