const tableName = 'users';

const DEFAULT_PASSWORD =
  '$2b$10$4WxWKojNnKfDAicVsveh7.ogkWOBMV1cvRUSPCXwxA05NRX18F0QW';

exports.up = async knex => {
  await knex.schema.createTable(tableName, table => {
    table.increments('id').unsigned().primary();
    table.string('username');
    table.string('email').unique().notNullable();
    table.string('password').defaultTo(DEFAULT_PASSWORD);
    table.dateTime('deleted_at').defaultTo(null);
    table.timestamps(false, true);
  });
};

exports.down = knex => knex.schema.dropTable(tableName);
