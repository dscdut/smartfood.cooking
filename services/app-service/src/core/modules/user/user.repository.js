import { DataRepository } from 'packages/restBuilder/core/dataHandler/data.repository';

class Repository extends DataRepository {
    findByEmail(email) {
        return this.query()
            .whereNull('users.deleted_at')
            .where('users.email', '=', email)
            .select(
                'users.id',
                'users.username',
                'users.email',
                'users.password',
                { createdAt: 'users.created_at' },
                { updatedAt: 'users.updated_at' },
                { deletedAt: 'users.deleted_at' },
            )
            .first();
    }

    findById(id) {
        return this.query()
            .whereNull('users.deleted_at')
            .where('users.id', '=', id)
            .select(
                'users.id',
                'users.username',
                'users.email',
                { createdAt: 'users.created_at' },
                { updatedAt: 'users.updated_at' },
                { deletedAt: 'users.deleted_at' },
            );
    }
}

export const UserRepository = new Repository('users');
