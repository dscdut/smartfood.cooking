import { adminApp } from '../../../config';

class OAuthServiceImpl {
    verify = async token => {
        const ticket = await adminApp.auth().verifyIdToken({
            idToken: token,
        });
        return ticket.getPayload();
    }
}

export const OAuthService = new OAuthServiceImpl();
