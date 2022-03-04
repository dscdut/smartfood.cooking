import { adminApp } from '../../../config';

class OAuthServiceImpl {
    verify = async token => {
        const ticket = await adminApp.auth().verifyIdToken(token);
        return ticket;
    }
}

export const OAuthService = new OAuthServiceImpl();
