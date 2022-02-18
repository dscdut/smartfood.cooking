const tableName = 'ingredients_images';

exports.up = async knex => {
  await knex.schema.createTable(tableName, table => {
    table
      .integer('ingredient_id')
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

    table.primary(['ingredient_id', 'image_id']);
  });
};

exports.down = knex => knex.schema.dropTable(tableName);
