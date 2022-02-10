const tableName = 'recipes_steps';

exports.up = async knex => {
  await knex.schema.createTable(tableName, table => {
    table.increments('id').unsigned().primary();
    table.string('content');
    table.integer('order').unsigned();
  });
};

exports.down = knex => knex.schema.dropTable(tableName);
