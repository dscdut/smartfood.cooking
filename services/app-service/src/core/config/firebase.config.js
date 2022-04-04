import { SERVICE_KEY_PATH } from 'core/env';
import admin from 'firebase-admin';
import fs from 'fs';
import { logger } from 'packages/logger';
import path from 'path';

let PATH = SERVICE_KEY_PATH;
try {
    fs.accessSync(SERVICE_KEY_PATH, fs.constants.R_OK);
} catch (error) {
    logger.error(`${SERVICE_KEY_PATH} is not accessible`);
    PATH = path.join(__dirname, './serviceAccount.json');
}

const serviceAccount = JSON.parse(fs.readFileSync(PATH, 'utf8'));

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
});

export const adminApp = admin;
