import { OAuth2Client } from 'google-auth-library';
import { CLIENT_ID } from '../../../env';

class OAuthServiceImpl {
    client = new OAuth2Client(CLIENT_ID);

    verify = async token => {
        const ticket = await this.client.verifyIdToken({
            idToken: token,
            audience: CLIENT_ID,
        });
        return ticket.getPayload();
    }
}

export const OAuthService = new OAuthServiceImpl();
